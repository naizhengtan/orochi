#include <stdio.h>
#include <assert.h>
#include <sqlite3.h>
#include "init_query.h"
#include <stdbool.h>
#include <string.h>
#include <vector>
#include <stdlib.h>
#include <boost/regex.hpp>
#include <sys/time.h>
#include <iostream>
#include <fstream>
#include <sstream>
#include <map>
#include <fcntl.h>
#include <unistd.h>
#include <errno.h>
#include <common.h>
#include <mysql.h>

#define UNDEFINED_MODE 0
#define NORMAL_MODE 1
#define DAEMON_MODE 2

#define MAX_BUF_SIZE 40960

struct table_info {
    std::string id;
    int max;
};
typedef struct table_info table_info;
std::map<std::string, table_info*> autoincrement;

static int get_table_content(void *args, int argc, char **argv, char **azColName);
static std::string rewrite_TTDB(std::string query, unsigned long long ts, unsigned long long trx_abort);

/**
 * Search a word in the given query, return pos. -1 returned if not found
 * Case insensitive if ignore_case is true
 */
static int search_word(std::string& query, const char* keyword, bool ignore_case) {

    char pattern[128];
    snprintf(pattern, 128, "(?<![a-zA-Z'\"])%s(?![a-zA-Z'\"])", keyword);
    boost::regex e(pattern, (ignore_case?boost::regex::icase:0));

    std::string::const_iterator start, end;
    start = query.begin();
    end = query.end();

    boost::match_results<std::string::const_iterator> what;
    boost::match_flag_type flags = boost::match_default;

    if(regex_search(start, end, what, e, flags)) {
        return what.position();
    }
    return -1;
}

// search_keyword return first pos the keyword occurs
static int search_keyword(std::string& query, const char* keyword) {
    return search_word(query, keyword, true);
}


static int get_select_value(void *args, int argc, char **argv, char **azColName){
    std::vector<std::string>* values = (std::vector<std::string>*)args;
    for (int i = 0; i < argc - 2; i++) {
        values->push_back(std::string(argv[i]?argv[i]:"NULL"));
    }
    return 0;
}

//std::string extract_table_name(const std::string& query);

bool is_insert_query(std::string& query) {
    const char* p = query.c_str();
    while (*p ==' ') p++;
    if (p[0] == 'i' || p[0] == 'I') {
        return true;
    } else {
        return false;
    }
}

bool is_insert_set(std::string& query) {
    const char* p = query.c_str();
    for (int i = 0; i < 3; i++) {
        while (*p ==' ') p++;
        while (*p != ' ') p++;
    }
    while (*p ==' ') p++;
    if (*p=='(') {
        return false;
    }
    char tmp[8];
    strncpy(tmp, p, 8);
    tmp[7] = '\0';
    std::string key = tmp;
    if (search_keyword(key, "set") == -1) {
        return false;
    } else {
        return true;
    }
}

/**
 * Transform a mysql write operation (update, insert, delete) to sqlite version
 * Parameters:
 *      db pointer to sqlite3
 * Return value:
 *      true on successful transformation
 *      false on failure
 */
bool rewrite_query(std::string& query, sqlite3* db, unsigned long long ts = -1, unsigned long long trx_abort = 0) {
    while (1) {
        std::size_t pos = query.find("\\'");
        if (pos == std::string::npos) {
            break;
        }
        query.replace(pos, 2, "''");
    }
    std::string new_query="";
    if (!is_insert_query(query)) { // update or delete
        new_query = query;
    } else {
        if (is_insert_set(query)) { // insert set
            boost::regex e("(.*?)set *(.*?)( on duplicate key update .*?)?;?", boost::regex::icase);
            boost::smatch what;
            if (!boost::regex_match(query, what, e)) {
                fprintf(stderr, "line %d preprocess: regex_match error!\n%s", __LINE__, query.c_str());
                return false;
            }
            std::string tail = what[3].str();
            std::string set = what[2].str();
            std::size_t last = 0;
            new_query = what[1].str();
            std::string cols = "(";
            std::string vals = "(";
            while (1) {
                std::size_t pos = set.find("=", last);
                std::string column = set.substr(last, pos-last);
                cols += column + ", ";
                bool is_str = false;
                pos++;
                last = pos;
                if (set[pos] == '\'') {
                    is_str = true;
                    pos++;
                }
                pos = set.find(",", pos);
                if (is_str) {
                    while (pos != std::string::npos && set[pos-1]!='\'') {
                        pos = set.find(",", pos + 1);
                    }
                }
                if (pos == std::string::npos) {
                    break;
                }
                std::string value = set.substr(last, pos - last);
                vals += value;
                vals += ", ";
                last = pos;
                while (set[++last] == ' ');
            }
            std::string value = set.substr(last);
            cols = cols.substr(0, cols.size()-2);
            vals+=value;
            new_query += cols+ ") values " + vals + ")" + tail+";";
            query = new_query;
            new_query = "";
        }
        if (search_keyword(query, "duplicate key") != -1) { // on duplicate key
          // JBL: What is the effect of this on the verification? Does it hurt
          // soundness or completeness?
          // LY: on duplicate key update is not deterministic (see mysql mannual)
          // I don't think soundness will be compromised, because to pass the orochi audit, mallicious provider can only change online db behavior in
          // a way that won't affect select query result
          // However, completeness may be compromised, because if the provider executes faithfully and we did not replay this non-det, chances are that
          // we reject the audit
          // BTW, the comments below is stale, current impl actually does this. Currently I select the first "conflict" row and change insert to an
          // update. But still, we never know which row was the "first" conflict row during the online phase.

            /* FIXME: this is just hard code here
             * The correct logic is complicated and currently seems not feasible using SQLite
             * Correct effect of 'on duplicate key update' would be the following:
             * First select all rows could be affected by the query into a tmptable
             * Then only update the first row of the tmptable and check constraints
             * If tmptable satisfies constraints, insert the new first row back into original table
             * If tmp table has conflicts, abort
             *
             * The key problem is MySQL affect at most one row or abort
             * But SQLite forces execution by deleting all conflicting rows and inserting the new one
             */
            boost::regex e("insert into (.*?) +\\((.*?)\\) *(values *((,? *\\(.*?\\))+)|(select .*?)) *on duplicate key update (.*);?", boost::regex::icase);
            boost::smatch what;
            if (!boost::regex_match(query, what, e)) {
                fprintf(stderr, "line %d: preprocess: regex_match error!\n%s\n",__LINE__, query.c_str());
                return false;
            }

            std::string table = what[1].str();
            std::string column = what[2].str();
            std::string value_list = what[4].str();
            std::string update = what[7].str();
            if (value_list == "") { // insert select on duplicate update
                std::vector<std::string> select_value;
                char *zErrMsg = 0;
                // rewrite sub select
                std::string sub_select = rewrite_TTDB(what[6].str(), ts, trx_abort);
                // exec select to geet insert values
                int rc = sqlite3_exec(db, sub_select.c_str(), get_table_content, (void*)&select_value, &zErrMsg);
                if(rc!=SQLITE_OK) {
                    fprintf(stderr, "SQL error: %s\n", zErrMsg);
                    fprintf(stderr, "%s\n", what[6].str().c_str());
                    sqlite3_free(zErrMsg);
                }
                value_list = select_value[0];
                for (unsigned k=1;k<select_value.size();k++) {
                    value_list+=", ";
                    value_list+=select_value[k];
                }
            }
            // extract column names
            std::vector<std::string> cols;
            std::size_t pos = column.find(",");
            std::size_t last = 0;
            while (pos!=std::string::npos) {
                cols.push_back(column.substr(last, pos-last));
                while (column[++pos] == ' ');
                last = pos;
                pos = column.find(",", last);
            }
            cols.push_back(column.substr(last));
            unsigned ncols = cols.size();
            // extract update options
            std::vector<std::string> upds;
            last = 0;
            pos = update.find(",");
            while (pos!=std::string::npos) {
                upds.push_back(update.substr(last, pos-last));
                while (update[++pos] == ' ');
                last = pos;
                pos = update.find(",", last);
            }
            upds.push_back(update.substr(last));

            std::vector<std::string> upd_list;
            unsigned i;
            for (i=0; i<upds.size(); i++) {
                if (search_keyword(upds[i], "values") != -1) {
                    pos = upds[i].find("=");
                    upd_list.push_back(upds[i].substr(0,pos));
                }
            }

            // convert query
            bool loop = true;
            while (loop) {
                boost::regex exp(" *\\((.*?)\\),", boost::regex::icase);
                boost::smatch result;
                std::string value;
                std::string::const_iterator start, end;
                start = value_list.begin();
                end = value_list.end();
                if (regex_search(start, end, result, exp, boost::match_default)) {
                    value = result[1].str();
                    value_list=value_list.substr(result[0].str().size());
                } else {
                    value = value_list.substr(value_list.find("(")+1);
                    pos = value.size();
                    while (value[--pos]!=')');
                    value = value.substr(0,pos);
                    loop = false;
                }

                // extract values
                std::vector<std::string> vals;
                last = 0;
                pos = value.find(",");
                while (pos!=std::string::npos) {
                    vals.push_back(value.substr(last, pos-last));
                    while (value[++pos] == ' ');
                    last = pos;
                    pos = value.find(",", last);
                }
                vals.push_back(value.substr(last));
                //assert(ncols == vals.size());
                if (ncols != vals.size()) {
                    printf("Expected # cols: %u\n", ncols);
                    for (unsigned k = 0;k<8;k++) {
                        printf("%s\n", what[k].str().c_str());
                    }
                    for (unsigned k = 0;k<cols.size();k++) {
                        printf("%s\n", cols[k].c_str());
                    }
                    for (unsigned k = 0;k<vals.size();k++) {
                        printf("%s\n", vals[k].c_str());
                    }
                    return false;
                }

                // create sub-select
                char tmp[512];
                sprintf(tmp, "select * from %s where %s=%s", table.c_str(), cols[0].c_str(), vals[0].c_str());
                // rewrite sub select
                std::string sub_select = rewrite_TTDB(std::string(tmp), ts, trx_abort);
                std::vector<std::string> select_value;
                char *zErrMsg = 0;
                // exec select to get insert values
                int rc = sqlite3_exec(db, sub_select.c_str(), get_select_value, (void*)&select_value, &zErrMsg);
                if(rc!=SQLITE_OK) {
                    fprintf(stderr, "SQL error: %s\n", zErrMsg);
                    fprintf(stderr, "%s\n", sub_select.c_str());
                    sqlite3_free(zErrMsg);
                }
                if (select_value.size() == 0) { // no such record, insert
                    new_query+="insert into ";
                    new_query+=table+" ("+column+") values ("+value+");";
                } else { // duplicate update
                    if (upd_list.size() > 0) { // need to update
                        new_query+="update ";
                        new_query+=table + " set ";
                        for (i = 0;i < upd_list.size(); i++) {
                            unsigned j;
                            for (j = 0; j < ncols; j++) {
                                if (upd_list[i] == cols[j]) {
                                    break;
                                }
                            }
                            assert(j!=ncols);
                            if (i>0) {
                                new_query+=", ";
                            }
                            new_query+=upd_list[i]+"="+vals[j];
                        }
                        new_query+=" where ";
                        new_query+=cols[0]+"="+vals[0]+";";
                    }
                }
            }
        } else {
            new_query = query;
        }
    }
    // rewrite to ttdb version
    query = rewrite_TTDB(new_query, ts, trx_abort);
#ifdef DUMP_REWRITE_LOG
    // log sqlite version
    FILE* fp = fopen("rewrite.log", "a");
    fprintf(fp, "%s\n", new_query.c_str());
    fprintf(fp, "%s\n", query.c_str());
    fclose(fp);
#endif
    return true;
}

/**
 * Callback function for retrieving all table names
 * args is a pointer to a vector of string, i.e. std::vector<std::string>
 */
static int get_table_name(void *args, int argc, char **argv, char **azColName){
    std::vector<std::string>* table = (std::vector<std::string>*)args;
    table->push_back(std::string(argv[0]));
    return 0;
}

/**
 * Callback function for retrieving all table contents
 * args is a pointer to a vector of string, i.e. std::vector<std::string>
 */
static int get_table_content(void *args, int argc, char **argv, char **azColName){
    int i;
    std::vector<std::string>* table = (std::vector<std::string>*)args;
    std::string content = "(";
    if (argv[0]) {
        content+="'";
        content+=argv[0];
        content+="'";
    } else {
        content += "NULL";
    }
    for(i=1; i<argc; i++){
        content+=", ";
        if (argv[i]) {
            content+="'";
            std::string value = argv[i];
            std::size_t pos = value.find("'");
            while (pos!=std::string::npos) {
                value.replace(pos,1,"\\'");
                pos = value.find("'", pos + 2);
            }
            content+=value+"'";
        } else {
            content += "NULL";
        }
    }
    table->push_back(content+")");
    return 0;
}

static std::string rewrite_select(std::string query, unsigned long long ts) {
    boost::regex e("(select (.*?) from (.*?))( where (.*?))?( limit .*?)?", boost::regex::icase);
    boost::smatch what;
    if (!boost::regex_match(query, what, e)) {
        printf("rewrite_select: regex_match error!\n%s\n", query.c_str());
        exit(-1);
    }
    char tmp[128];
    sprintf(tmp, "%llu", ts);
    std::string new_query = what[1].str()+" where ("+what[5].str()+") and start_ts < "+tmp+" and end_ts > "+tmp+what[6].str();
    return new_query;
}

char* itoa(int val){
    static char buf[32] = {0};
    int i = 30;
    for(; val && i ; --i, val /= 10)
        buf[i] = "0123456789"[val % 10];
    return &buf[i+1];
}

static std::string rewrite_insert(std::string query, unsigned long long ts, unsigned long long trx_abort) {
    char inf[32];
    if (trx_abort == 0) {
        sprintf(inf, "999999999900");
    } else {
        sprintf(inf, "%llu", trx_abort);
    }

    //boost::regex e1("(insert( ignore)? into (.*?))( \\((.*?)\\))?( values)((,? *\\((.*?)\\))*)( *; *)?", boost::regex::icase);
    boost::regex e1("(insert\\s+(ignore\\s+)?into\\s+`?(.*?)`?)(\\s+\\((.*?)\\))?(\\s+values\\s*)(.*?)(\\s*;\\s*)?", boost::regex::icase);
    boost::smatch what;
    if (!boost::regex_match(query, what, e1)) {
        printf("line %d: rewrite_insert: regex_match error!\n%s\n", __LINE__, query.c_str());
        exit(-1);
    }
    std::string table = what[3].str();
    std::string cols = what[4].str();
    std::string values = what[7].str();

    /*
    if (table[0] == '`') { // `table` remove `
        table = table.substr(1, table.length() - 2);
    }
    */

    bool autoinc = false;
    bool find_max_id = false;
    if (autoincrement.find(table) != autoincrement.end()) {
        autoinc = true;
        if (cols.size() > 0) {
            if (search_keyword(cols, autoincrement[table]->id.c_str()) != -1) {
                find_max_id = true;
            }
        } else {
            find_max_id = true;
        }
        /*
        if (find_max_id) {
            const char* p = values.c_str();
            int max = 0;
            while (p) {
                while (*p++ != '(');
                int local_max;
                sscanf(p, "%d", &local_max);
                if (max < local_max) {
                    max = local_max;
                }
                p = strstr(p, "),");
            }
            if (autoincrement[table]->max < max) {
                autoincrement[table]->max = max;
            }
        }
        */
    }
//    values = values.substr(1, values.length() - 2);

    // split on ),(
    boost::regex e2("\\)\\s*,\\s*\\(");
    boost::sregex_token_iterator i(values.begin()+1, values.end()-1, e2, -1);
    boost::sregex_token_iterator j;
    std::string new_values = "(";
    if (autoinc) {
        int max = autoincrement[table]->max;
        if (!find_max_id) { // manually calculate
            while (i!=j) {
                new_values += itoa(++max);
                new_values += ", ";
                new_values += *i++ + "###---###), (";
            }
        } else {
            int local_max;
            while (i!=j) {
                std::string val_tuple = *i++;
                sscanf(val_tuple.c_str(), "%d", &local_max);
                new_values += val_tuple + "###---###), (";
                if (max < local_max) {
                    max = local_max;
                }
            }
        }
        autoincrement[table]->max = max;
    } else {
        while (i!=j) {
            new_values += *i++;
            new_values += "###---###), (";
        }
    }
    char target[1024];
    snprintf(target, 1024, ", %llu, %s", ts, inf);
    values = boost::regex_replace(new_values.substr(0, new_values.length() - 3), boost::regex("###---###"), target);
    /*
    char target[1024];
    if (autoinc && !find_max_id) {
        snprintf(target, 1024, ",(#---#, $1, %llu, %s)", ts, inf);
    } else {
        snprintf(target, 1024, ",($1, %llu, %s)", ts, inf);
    }
    values = boost::regex_replace(values, e2, target);
    if (autoinc && !find_max_id) {
        int max = autoincrement[table]->max;
        std::size_t pos = values.find("#---#");
        while (pos!=std::string::npos) {
            values.replace(pos,5,itoa(++max));
            pos = values.find("#---#");
        }
        autoincrement[table]->max = max;
    }

    //unsigned i = values.size();
    values = values.substr(1);
    */
    std::string query_head = "insert ";
    if (what[2].str().length() > 0) {
        query_head += "or ignore ";
    }
    query_head+="into ";
    query_head+=table;
    std::string new_query;
    if (cols.size() > 0) {// insert into TABLENAME (cols) values ()
        if (autoinc && !find_max_id) {
            new_query = query_head + " (" + autoincrement[table]->id + ", "+ what[5].str()+", start_ts, end_ts)" + what[6].str() + values;
        } else {
            new_query = query_head + " (" + what[5].str()+", start_ts, end_ts)" + what[6].str() + values;
        }
    } else { // insert into TABLENAME values()
        new_query = query_head + what[6].str() + values;
    }
    return new_query;
}

static std::string rewrite_update(std::string query, unsigned long long ts, unsigned long long trx_abort) {
    const char* inf = "999999999900";
    boost::regex e("update(\\s)+(.*?)(\\s)+(set .*?)(\\s)+where(\\s)+(.*?)(\\s)*;*(\\s)*", boost::regex::icase);
    boost::smatch what;
    if (!boost::regex_match(query, what, e)) {
        printf("rewrite_update: regex_match error!\n");
        printf("%s\n", query.c_str());
        exit(-1);
    }
    char tmp[MAX_BUF_SIZE];
    std::string table = what[2].str();
    std::string set = what[4].str();
    std::string where = what[7].str();
    if (trx_abort != 0) { // aborted trx: never going to be true
        snprintf(tmp, MAX_BUF_SIZE, "create temporary table tmptab1 as "
                            "select * from %s where (%s) and start_ts<=%llu and end_ts>%llu;"
                            "create temporary table tmptab2 as "
                            "select * from tmptab1 where end_ts=%s;"
                            "update %s set end_ts=%llu where (%s) and start_ts <= %llu and end_ts>%llu;"
                            "update tmptab1 %s, start_ts=%llu, end_ts=%llu;"
                            "insert into %s select * from tmptab1;"
                            "update tmptab2 set start_ts=%llu, end_ts=%s;"
                            "insert into %s select * from tmptab2;"
                            "drop table tmptab1;"
                            "drop table tmptab2;"
                            , table.c_str(), where.c_str(), ts, ts, inf, table.c_str(), ts, where.c_str(), ts, ts,
                            set.c_str(), ts, trx_abort, table.c_str(), trx_abort, inf, table.c_str());
    } else {
        snprintf(tmp, MAX_BUF_SIZE, "create temporary table tmptab as "
                            "select * from %s where start_ts<=%llu and end_ts>%llu and (%s);"
                            "update %s set end_ts=%llu where start_ts<=%llu and end_ts>%llu and (%s);"
                            "update tmptab %s, start_ts=%llu, end_ts=%s;"
                            "insert into %s select * from tmptab;"
                            "drop table tmptab", table.c_str(), ts,ts, where.c_str(), table.c_str(), ts, ts,ts, where.c_str(), set.c_str(), ts, inf, table.c_str());
    }
    return std::string(tmp);
}

static std::string rewrite_delete(std::string query, unsigned long long ts, unsigned long long trx_abort) {
    const char* inf = "999999999900";
    boost::regex e("delete(\\s)+from(\\s)+(.*?)($|(\\s)+where(\\s)+(.*?)(\\s)*;*(\\s)*)", boost::regex::icase);
    boost::smatch what;
    if (!boost::regex_match(query, what, e)) {
        printf("rewrite_delete: regex_match error!\n%s\n", query.c_str());
        exit(-1);
    }
    std::string table = what[3].str();
    std::string where = what[7].str();
    if (where.length() == 0) {
        where = "1";
    }
    char tmp[MAX_BUF_SIZE];
    if (trx_abort != 0) { // this is never going to be true
        snprintf(tmp, MAX_BUF_SIZE, "create temporary table tmptab as "
                            "select * from %s where (%s) and start_ts<%llu and end_ts>%llu;"
                            "update %s set end_ts=%llu where (%s) and start_ts < %llu and end_ts>%llu;"
                            "update tmptab set start_ts=%llu, end_ts=%s;"
                            "insert into %s select * from tmptab1;"
                            , table.c_str(), where.c_str(), ts, ts, table.c_str(), ts, where.c_str(), ts, ts, trx_abort, inf, table.c_str());
    } else {
        snprintf(tmp, MAX_BUF_SIZE, "update %s set end_ts=%llu where start_ts<=%llu and end_ts>%llu and (%s)", table.c_str(), ts, ts, ts, where.c_str());
    }
    return std::string(tmp);
}

/*
 * rewrite a query to ttdb version
 */
static std::string rewrite_TTDB(std::string query, unsigned long long ts, unsigned long long trx_abort) {
    if (query == "" || ts == (unsigned long long)-1) {
        return query;
    }
    std::string new_query;
    bool loop = true;
    while (loop) {
        boost::regex e(";((select)|(insert)|(update)|(delete))\\s+",boost::regex::icase);

        std::string::const_iterator start, end;
        start = query.begin();
        end = query.end();

        boost::match_results<std::string::const_iterator> what;
        boost::match_flag_type flags = boost::match_default;
        int pos = -1;
        if(regex_search(start, end, what, e, flags)) {
            pos = what.position();
        }
        std::string first;
        if (pos!=-1) {
            first = query.substr(0, pos+1);
            query = query.substr(pos+1);
        } else {
            first = query;
            loop = false;
        }
        if (first[0] == 's' || first[0] == 'S') {
            new_query += rewrite_select(first, ts);
        } else if (first[0] == 'i' || first[0] == 'I') {
            new_query += rewrite_insert(first, ts, trx_abort);
        } else if (first[0] == 'u' || first[0] == 'U') {
            new_query += rewrite_update(first, ts, trx_abort);
        } else if (first[0] == 'd' || first[0] == 'D') {
            new_query += rewrite_delete(first, ts, trx_abort);
        } else {
            fprintf(stderr, "line %d: Unexpected query:\n%s\n", __LINE__,first.c_str());
            exit(-1);
        }
    }
    return new_query;
}

/*
 * for the use of autoinc thing
 * count log id
 */
//FIXME: [DONE] need to use some config file to let user config this.... hard code is horrible
void initialize(const char* config_file, const char* last_file, unsigned long long& ts, int& mode) {
    // read config file
    std::ifstream config(config_file);
    if (!config.is_open()) {
        fprintf(stderr, "cannot open config file: %s\n", config_file);
        exit(-1);
    }
    std::string line;
    while (std::getline(config, line)) {
        if (line[0] == '#') { // comments
            continue;
        }
        std::istringstream is_line(line);
        std::string key;
        if (std::getline(is_line, key, ':')) {
            std::string value;
            if (std::getline(is_line, value)) {
                if (key == "mode") {
                    if (mode == UNDEFINED_MODE) {
                        mode = (value == "daemon") ? DAEMON_MODE:NORMAL_MODE;
                    }
                } else {
                    table_info* t = new table_info;
                    t->id = value;
                    t->max = 0;
                    autoincrement[key] = t;
                }
            }
        }
    }
    
    if (mode != DAEMON_MODE) {
        return;
    }
    // resume from last time
    std::ifstream last(last_file);
    if (config.is_open()) {
        while (std::getline(last, line)) {
            std::istringstream is_line(line);
            std::string key;
            if (std::getline(is_line, key, '=')) {
                std::string value;
                if (std::getline(is_line, value)) {
                    std::istringstream is_val(value);
                    if (key == "last") {
                        is_val >> ts;
                    } else {
                        is_val >> autoincrement[key]->max;
                    }
                }
            }
        }
        printf("last ts = %llu\n", ts);
    }
}

/* this is code from stack overflow
 * basically copy a file
 */
int copy_create_table(const char *from, const char *to)
{
    int fd_to, fd_from;
    char buf[4096];
    ssize_t nread;
    int saved_errno;

    fd_from = open(from, O_RDONLY);
    if (fd_from < 0)
        return -1;

    fd_to = open(to, O_WRONLY | O_CREAT | O_EXCL, 0666);
    if (fd_to < 0)
        goto out_error;
    while (nread = read(fd_from, buf, sizeof buf), nread > 0)
    {
        char *out_ptr = buf;
        ssize_t nwritten;

        do {
            nwritten = write(fd_to, out_ptr, nread);
            if (nwritten >= 0)
            {
                nread -= nwritten;
                out_ptr += nwritten;
            }
            else if (errno != EINTR)
            {
                goto out_error;
            }
        } while (nread > 0);
    }

    if (nread == 0)
    {
        if (close(fd_to) < 0)
        {
            fd_to = -1;
            goto out_error;
        }
        close(fd_from);

        return 0;
    }
out_error:
    saved_errno = errno;
    close(fd_from);
    if (fd_to >= 0)
        close(fd_to);
    errno = saved_errno;
    return -1;
}

std::string extract_where(std::string& query) {
    int where = search_keyword(query, "where");
    if (where == -1) {
        return "";
    }
    int order = search_keyword(query, "order by");
    int limit = search_keyword(query, "limit");
    int where_end = (order != -1) ? order:limit;
    if (where_end == -1) {
        where_end = query.size() - 1;
        if (query[where_end] != ';') { // no ; at the end
            where_end++; // calculate length properly
        }
    }
    int start = where + 6; //strlen("where ");
    return query.substr(start, where_end - start);
}

//void split_query(char* buf, std::vector<std::string>& queries);
void getrelatedrows(sqlite3* db, const char* in_file, unsigned long long ts, const char* db_user, const char* db_pass, const char* db_name) {
    FILE* fp = fopen(in_file, "rb");
    std::vector<std::string> queries;
    unsigned size = 512;
    char* buf = (char*)malloc(sizeof(char) * size);
    std::map<std::string, std::set<std::string>*> map;
    std::vector<std::string> query_list;
    while (true) {
        if (!read_query(fp, buf, size)) {
            break;
        }
        split_query(buf, query_list);
        for (unsigned i = 0; i < query_list.size(); i++) {
            if (skip_query(query_list[i])) {
                continue;
            }
            std::string query = remove_comments(query_list[i]);
            if (query[0] == 'i' || query[0] == 'I') {
                if (search_keyword(query, "on duplicate key update") != -1) {
                    std::string table = extract_table_name(query);
                    map[table] = NULL;
                }
            } else {
                std::string table = extract_table_name(query);
                if (map.find(table) == map.end()) {
                    map[table] = new std::set<std::string>;
                }
                std::set<std::string>* where = map[table];
                std::string where_clause = extract_where(query);
                if (where_clause.length() > 0) {
                    where->insert(where_clause);
                }
            }
        }
    }
    free(buf);
    fclose(fp);

    // connect to mysql server

    MYSQL* mysql;
    mysql = mysql_init(NULL);
    if (!mysql_real_connect(mysql, "localhost",
                                  // vvvvv Is this meant to be hardcoded?
                                  // LY: no.... 
                db_user, db_pass, db_name, 0, "/tmp/mysql.sock", 0)) {
        printf("Error connecting MySQL\n");
        printf("%s\n",mysql_error(mysql));
        exit(-1);
    }

    // get mysql rows

    char timestamp[128];
    snprintf(timestamp, 128, "start_ts <= %llu and end_ts > %llu", ts, ts);
    for (std::map<std::string, std::set<std::string>*>::iterator iter = map.begin();
            iter != map.end();
            ++iter) {
        // construct query
        std::string query = "select * from ";
        query += iter->first;
        query += " where ";
        query += timestamp;
        if (iter->second != NULL) { // update delete
            if (iter->second->size() > 0) { // otherwise nothing in all where clauses..
                std::set<std::string>::iterator it = iter->second->begin();
                query += " and ((";
                query += *it;
                query += ")";
                it++;
                for (;it != iter->second->end(); it++) {
                    query += " or (";
                    query += *it;
                    query += ")";
                }
                query += ")";
            }
        }
        // send query
        int ret = mysql_real_query(mysql, query.c_str(), query.length());
        if (ret != 0) {
            fprintf(stderr, "%s\n",mysql_error(mysql));
            fprintf(stderr, "%s\n", query.c_str());
            exit(-1);
        }
        // fetch result and construct insert
        MYSQL_RES* res = mysql_use_result(mysql);
        MYSQL_ROW row;
        unsigned num_fields=mysql_num_fields(res);
        row = mysql_fetch_row(res);
        if (row == NULL) {
            continue;
        }
        std::string sqlite_query = "insert into ";
        sqlite_query += iter->first;
        sqlite_query += " values";
        char *zErrMsg = 0;
        int rc;
        while (true) {
            std::string content = " (";
            if (row[0]) {
                content+="'";
                content+=row[0];
                content+="'";
            } else {
                content += "NULL";
            }
            for(unsigned k = 1; k < num_fields; k++){
                content+=", ";
                if (row[k]) {
                    content+="'";
                    std::string value = row[k];
                    std::size_t pos = value.find("'");
                    while (pos!=std::string::npos) {
                        value.replace(pos,1,"\\'");
                        pos = value.find("'", pos + 2);
                    }
                    content+=value+"'";
                } else {
                    content += "NULL";
                }
            }
            std::size_t pos = content.find("\n");
            while (pos!=std::string::npos) {
                content.replace(pos,1,"\\n");
                pos = content.find("\n", pos + 2);
            }
            pos = content.find("\r");
            while (pos!=std::string::npos) {
                content.replace(pos,1,"\\r");
                pos = content.find("\r", pos + 2);
            }
            sqlite_query += content + "),";
            row = mysql_fetch_row(res);
            if (row == NULL) {
                break;
            }
        }
        mysql_free_result(res);
        sqlite_query[sqlite_query.size() - 1] = ';';

        // apply query to sqlite
        rc = sqlite3_exec(db, sqlite_query.c_str(), NULL, 0, &zErrMsg);
        if(rc!=SQLITE_OK) {
            fprintf(stderr, "init sqlite query fail: %s\n", zErrMsg);
            sqlite3_free(zErrMsg);
        }

    }
    mysql_close(mysql);
    return;
}

void store_state(const char* last_file, unsigned long long ts) {
    FILE* fp = fopen(last_file, "w");
    fprintf(fp, "last=%llu\n", ts);
    for (std::map<std::string, table_info*>::iterator iter = autoincrement.begin();
            iter!=autoincrement.end();
            iter++) {
        fprintf(fp, "%s=%d\n", iter->first.c_str(), iter->second->max);
    }
    fclose(fp);
}

void print_usage() {
    printf("./main [--input=INPUT][--output=OUTPUT][--config=CONFIG][--last=LAST][--mode=MODE][--create_table=TABLE][-h|--help]\n");
}

// this is a test function to locate error...........
// Hope I don't need it any more
int wiki_one_by_one_insert(sqlite3* db, std::string& query) { 
    // wiki bulk insert fail.... no idea why, just do it one by one to locate error
    const char* values = "values";
    int pos = search_keyword(query, values);
    int common = pos + strlen(values);
    std::string head = query.substr(0, common) + " ";
    query = query.substr(common);
    std::size_t start = 0;
    char* zErrMsg = 0;
    int rc;
    while (true) {
        bool flag = false;
        start = query.find("(", start);
        std::size_t end = query.find("),", start);
        if (end == std::string::npos) {
            end = query.length() - 1;
            flag = true;
        }
        std::string value = query.substr(start, end-start+1);
        std::string insert = head+value;
        rc = sqlite3_exec(db, insert.c_str(), NULL, 0, &zErrMsg);
        if(rc!=SQLITE_OK) {
            fprintf(stderr, "%s\n", insert.c_str());
            fprintf(stderr, "SQL error: %s\n", zErrMsg);
            sqlite3_free(zErrMsg);
            exit(-1);
        }

        if (flag) {
            break;
        } else {
            start = end+2;
        }
    }
    printf("all pass..... what the hell !!!!!!!");
    exit(0);
}

float time_elapse(struct timeval& start) {
    struct timeval stop;
    gettimeofday(&stop, NULL);
    return (stop.tv_sec - start.tv_sec)+(stop.tv_usec - start.tv_usec)/1000000.0;
}

int main(int argc, char** argv) {

    //FIXME: check the existence of dependent files!!!!!!!!!!!!!!

    char config_file[128] = "./config.txt";
    char last_file[128] = "./last.txt";
    char in_file[128] = "/tmp/sql.log";
    char out_file[128] = "./dump.sql";
    char create_table[128] = "./create_table.sql";
    char db_user[128] = "root";
    char db_pass[128] = "715715";
    char db_name[128] = "ttdb_hotcrp";
    int mode = UNDEFINED_MODE;

    for (int i = 1; i < argc; i++) {
        if (strcmp(argv[i], "-h") == 0 || strcmp(argv[i], "--help") == 0) {
            print_usage();
            exit(0);
        } else {
            std::istringstream is_line(argv[i]);
            std::string key;
            if (std::getline(is_line, key, '=')) {
                std::string value;
                if (std::getline(is_line, value)) {
                    if (key == "--mode") {
                        mode = (value == "daemon") ? DAEMON_MODE:NORMAL_MODE;
                    } else if (key == "--input") {
                        strcpy(in_file, value.c_str());
                    } else if (key == "--output") {
                        strcpy(out_file, value.c_str());
                    } else if (key == "--config") {
                        strcpy(config_file, value.c_str());
                    } else if (key == "--last") {
                        strcpy(last_file, value.c_str());
                    } else if (key == "--create_table") {
                        strcpy(create_table, value.c_str());
                    } else if (key == "--dbuser") {
                        strcpy(db_user, value.c_str());
                    } else if (key == "--dbname") {
                        strcpy(db_name, value.c_str());
                    } else if (key == "--dbpass") {
                        strcpy(db_pass, value.c_str());
                    } else {
                        printf("Error Usage: Unrecogized parameter\n");
                        print_usage();
                        exit(-1);
                    }
                } else {
                    printf("Error Usage: Missing value for key %s\n", key.c_str());
                    print_usage();
                    exit(-1);
                }
            }
        }
    }

    FILE* fp;
    sqlite3 *db;
    unsigned i;
    char *zErrMsg = 0;
    int rc;
    unsigned long long ts = 0;
    initialize(config_file, last_file, ts, mode);

    bool need_copy_create_table = (ts == 0);

    struct timeval start;
    gettimeofday(&start, NULL);

    /* initialization phase*/

    // init sqlite db
    rc = sqlite3_open(":memory:", &db);
    if (rc) {
        fprintf(stderr, "Can't open database: %s\n", sqlite3_errmsg(db));
        sqlite3_close(db);
        return(1);
    }

    // init database, using queries in the init.h where create table queries are stored
    std::map<std::string, std::vector<unsigned long long>*> update_ts;
    for (i=0; i<(sizeof(init)/sizeof(void*)); i++) {
        //[DONE] need to rewrite init_query.h
        // FIXME: why don't we have delete here? (even though in init files there are usually only inserts)
        if (init[i][0] == 'i' || init[i][0] == 'I' || init[i][0] == 'u' || init[i][0] == 'U') { // insert or update if in the init_query.h
            if (ts > 0) { // resuming from old, no need to init again
                continue;
            }
            /*
            if (strlen(init[i]) >= size) { // make sure size is large enough
                while (strlen(init[i]) >= size) {
                    size*=2;
                }
                free(query);
                query = (char*)malloc(sizeof(char)*size);
            }
            */
            std::string query = init[i];
            // rewrite query to ttdb version
            if (!rewrite_query(query, db, ts)) { // note assume all init at time 0, otherwise verify may fail
                fprintf(stderr, "%s\n", query.c_str());
                fprintf(stderr, "line %d : Unexpected query\n", __LINE__);
                exit(-1);
            }
            rc = sqlite3_exec(db, query.c_str(), NULL, 0, &zErrMsg);
        } else if (init[i][0] == 'c' || init[i][0] == 'C'){ // create table stmt
            std::string table_name = extract_table_name(std::string(init[i]));
            update_ts[table_name] = new std::vector<unsigned long long>;
            update_ts[table_name]->push_back(0);
            rc = sqlite3_exec(db, init[i], NULL, 0, &zErrMsg);
        } else { // ignore
            rc = SQLITE_OK;
        }
        if(rc!=SQLITE_OK) {
            fprintf(stderr, "SQL error: %s\n", zErrMsg);
            fprintf(stderr, "%s\n", init[i]);
            sqlite3_free(zErrMsg);
            exit(-1);
        }
    }
    printf("init phase: %f s\n", time_elapse(start));

    // get related rows from mysql server and insert into sqlite
    if (ts > 0) {
        getrelatedrows(db, in_file, ts*10000, db_user, db_pass, db_name);
    }

    /* rebuild ttdb phase */


    // malloc space
    // char* query is the buf used, default size 512
    // if size is not enough, automatically double it
    unsigned size = 512;
    char* query = (char*)malloc(sizeof(char) * size);

    // update db using update log
    fp = fopen(in_file, "rb");
    // size will dynamic increase (multiplied by 2)
    std::vector<std::string> query_list;
    float read_phase = 0;
    float parse_phase = 0;
    float exe_phase = 0;
    struct timeval start_tt;
    while (true) {
        // read one query
        gettimeofday(&start_tt, NULL);
        if (!read_query(fp, query, size)) {
            printf("All OK!\n"); // Is an unexpected EOF OK?
            break;
        }
        split_query(query, query_list);
        read_phase+=time_elapse(start_tt);
        for (unsigned i = 0; i < query_list.size(); i++) {
            if (skip_query(query_list[i])) {
                continue;
            }
            gettimeofday(&start_tt, NULL);
            std::string old_query = remove_comments(query_list[i]);
            std::string new_query = old_query;
            // transform mysql query to sqlite query
            if (!rewrite_query(new_query, db, ts*10000+i)) {
                fprintf(stderr, "%s\n", old_query.c_str());
                fprintf(stderr, "line %d : Unexpected query\n", __LINE__);
                exit(-1);
            }
            parse_phase+=time_elapse(start_tt);
            std::string table_name = extract_table_name(old_query);
            if (update_ts.find(table_name) == update_ts.end()) {
                fprintf(stderr, "encounter a table never created!!!!\n%s\n", old_query.c_str());
                exit(-1);
            }
            std::vector<unsigned long long>* table_ts = update_ts[table_name];
            if (ts*10000 + i > 0) {
                table_ts->push_back(ts*10000+i);
            }
            // exec
            gettimeofday(&start_tt, NULL);
            rc = sqlite3_exec(db, new_query.c_str(), NULL, 0, &zErrMsg);
            if(rc!=SQLITE_OK) {
                fprintf(stderr, "%s\n\n", old_query.c_str());
                fprintf(stderr, "%s\n", new_query.c_str());
//                fprintf(stderr, "line %d SQL error: %s\n", __LINE__, zErrMsg);
//                exit(-1);
                wiki_one_by_one_insert(db, new_query);
                sqlite3_free(zErrMsg);
                exit(-1);
            }
            exe_phase+=time_elapse(start_tt);
        }
        ts++;
    }
    fclose(fp);

    printf("read phase: %f s\n", read_phase);
    printf("parse phase: %f s\n", parse_phase);
    printf("execute phase: %f s\n", exe_phase);

    fp = fopen("/tmp/table_update.log", "w");
    for (std::map<std::string, std::vector<unsigned long long>*>::iterator iter = update_ts.begin();
            iter!=update_ts.end();
            iter++) {
        std::string table_name = iter->first;
        std::vector<unsigned long long>* table_ts = iter->second;
        fprintf(fp,"%s:%llu",table_name.c_str(), (*table_ts)[0]);
        for (unsigned i = 1; i<table_ts->size(); i++) {
            fprintf(fp, ",%llu", (*table_ts)[i]);
        }
        fprintf(fp, "|");
    }
    fclose(fp);

    /* dump sqlite tables phase*/

    gettimeofday(&start_tt, NULL);
    fp = fopen(out_file, "r");
    if (fp) {
        fclose(fp);
        remove(out_file);
    }
    const char* get_tables = "select name from sqlite_master where type='table'";
    std::vector<std::string> table;
    rc = sqlite3_exec(db, get_tables, get_table_name, (void*)&table, &zErrMsg);
    if(rc!=SQLITE_OK) {
        fprintf(stderr, "Get table name: SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
    }

    if (need_copy_create_table) {
        copy_create_table(create_table, out_file);
        fp = fopen(out_file, "a");
    } else {
        fp = fopen(out_file, "w");
    }

    for (i = 0; i<table.size();i++) {
        if (table[i]=="sqlite_sequence") {
            continue;
        }
        char tmp[128];
        sprintf(tmp, "select * from %s;", table[i].c_str());
        std::vector<std::string> content;

        rc = sqlite3_exec(db, tmp, get_table_content, (void*)&content, &zErrMsg);
        if(rc!=SQLITE_OK) {
            fprintf(stderr, "Get table content: SQL error: %s\n", zErrMsg);
            sqlite3_free(zErrMsg);
            break;
        }

        if (content.size()>0) {
            fprintf(fp, "LOCK TABLES `%s` WRITE;\n\n", table[i].c_str());
            fprintf(fp,"insert into %s values %s",table[i].c_str(), content[0].c_str());
            unsigned k;
            for (k=1;k<content.size();k++) {
                fprintf(fp,", %s", content[k].c_str());
            }
            fprintf(fp, " on duplicate key update end_ts=values(end_ts);\n\n");
            fprintf(fp, "UNLOCK TABLES;\n\n");
        }
    }
    fclose(fp);
    printf("dump phase: %f s\n", time_elapse(start_tt));

    free(query);
    sqlite3_close(db);
    printf("Finished in %f seconds. \n", time_elapse(start));
    if (mode == DAEMON_MODE) {
        store_state(last_file, ts);
    }
    return 0;
}
