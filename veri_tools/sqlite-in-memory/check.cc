#include <stdio.h>
#include <assert.h>
#include <mysql.h>
#include <stdlib.h>
#include <vector>
#include <string.h>
#include <string>
#include <algorithm>
#include <sstream>
#include "common.h"
/*
bool read_query(FILE* fp, char*& buf, unsigned& size) {
    char ch;
    unsigned i = 0;
    while (1) {
        if (i == size) {
            char* tmp = (char*)malloc(sizeof(char)*size*2);
            memcpy(tmp, buf, size);
            free(buf);
            buf = tmp;
            size *= 2;
        }
        ch = fgetc(fp);
        if (ch == EOF) {
            buf[i++] = '\0';
            // JBL1 see other JBL1, is returning false really the right thing to
            // do? Shouldn't you really exit with an error?
            fprintf(stderr, "Unexpected EOF encountered\n");
            return false;
        } else {
            buf[i++] = ch;
            if (ch == '|') {
                if (i>2 && buf[i-2]==']' && buf[i-3]=='|') {
                    buf[i-3] = '\0';
                    break;
                }
            }
        }
    }
    if (strcmp(buf, "END") == 0) {
        return false;
    } else {
        const char* p = buf;
        for (int i = 0; i < 2; i++) {
            p = strstr(p+1, "#&#");
            assert(p);
        }
        char* q = buf;
        p+=3;
        // Why not use strcpy? Is it because they might overlap?
        while ((*q++=*p++));
    }
    return true;
}*/
/*
bool skip_query(std::string& query) {
    if (query.length() == 0) { // either failed queries or read
        return true;
    }
    char op[7];
    strncpy(op, query.c_str(), 6);
    for (char* p = op; p < op+6; p++) {
        if (*p <= 'Z') {
            *p+='a'-'A';
        }
    }
    // You can omit the above (which is questionable, given the condition *p <=
    // 'Z') by using strncasecmp
    //
    // Stylistically you can simplify as:
    // 
    // return !(strncasecmp(op, "update", 6) || strncasecmp(...) ... )
    if (strncmp(op, "update", 6) == 0 || strncmp(op, "insert", 6) == 0 || strncmp(op, "delete", 6) == 0) {
        return false;
    } else { // other writes like begin, commit, rollback, and set
        return true;
    }
}
*/

/*
std::string extract_table_name(const std::string& query) {
    const char* str = query.c_str();
    char a[16], b[32], c[32];
    // This assumes table names less than 32 characters? You should document the
    // assumption.
    sscanf(str,"%s %s %s", a,b,c);
    if (a[0]=='u' || a[0] =='U') {
        return std::string(b);
    } else {
        return std::string(c);
    }
}
*/

bool compare(std::vector<std::string>& a, std::vector<std::string>& b) {
    bool equal = true;
    if (a.size() == b.size()) {
        std::sort(a.begin(), a.end());
        std::sort(b.begin(), b.end());
        for (unsigned i = 0;i<a.size();i++) {
            if (a[i]!=b[i]) {
                equal = false;
                break;
            }
        }
    } else {
        equal = false;
    }
    if (!equal) {
        // It might make more sense to use mktmp, or document why you expect
        // these at a particular path.
        // LY: agree
        char fileA[32] = "/tmp/aaaXXXXXX";
        char fileB[32] = "/tmp/bbbXXXXXX";
        int fd = mkstemp(fileA);
        FILE* fp = fdopen(fd, "w");
        for (unsigned i = 0;i<a.size();i++) {
            fprintf(fp, "%s\n",a[i].c_str());
        }
        fclose(fp);
        fd = mkstemp(fileB);
        fp = fdopen(fd, "w");
        for (unsigned i = 0;i<b.size();i++) {
            fprintf(fp, "%s\n",b[i].c_str());
        }
        fclose(fp);
    }
    return equal;
}

std::vector<std::string> get_mysql_results(MYSQL* mysql, char* query, std::string table, bool ttdb) {
    int ret = mysql_real_query(mysql, query, strlen(query));
    if (ret != 0) {
        printf("%s\n",mysql_error(mysql));
        printf("%s\n", query);
        // Is it safe to continue here? Do you need to return/exit/throw an
        // exception?
        // LY: agree
        exit(-1);
    }
    MYSQL_RES* res = mysql_use_result(mysql);
    MYSQL_ROW row;
    std::vector<std::string> a;
    // Why are you skipping the third column of this table?
    // LY: hotcrp ActionLog third column is a timestamp, but this check.cc is just for unit test, 
    // orochi (Cheng's side) will compare output
    bool skip = (table == "ActionLog");
    unsigned num_fields=mysql_num_fields(res);
    while ((row = mysql_fetch_row(res)) != NULL) {
        std::string content;
        for (unsigned k = 0;k<num_fields - (ttdb?2:0);k++) {
            if (skip && k == 3) {
                continue;
            }
            content+=(row[k]?row[k]:"NULL");
            content+=" ";
        }
        /*
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
        */
        a.push_back(content);
    }
    mysql_free_result(res);
    return a;
}
/*
void split_query(char* buf, std::vector<std::string>& queries) {
    queries.clear();
    char* p = strstr(buf, "#&#");
    char type[16];
    strncpy(type, buf, p-buf);
    type[p-buf] = '\0';
    p+=3;
    char* q = strstr(p, "#&#");
    char ret[16];
    strncpy(ret, p, q-p);
    ret[q-p] = '\0';
    // HMMM, does this mean that a provider could fail a query (denying
    // service)?
    // LY: possible reasons are:
    //      - sql syntax error
    //      - constraint fail
    //      - db lock
    //      - file system fail
    //      - and so on
    // But it's true that provider may be lying. Maybe provider did not actually execute the query or 
    // it executed but no error happened. And provider faked the log. We need to think about how this
    // affect orochi's correctness
    if (strcmp(ret, "false") == 0) { // failed query, no need to replay
        return;
    }
    if (strcmp(type, "txn") == 0) { // transaction
        while (q) {
            q +=3;
            p = strstr(q, "#&#");
            strncpy(type, q, p-q);
            type[p-q]='\0';
            p+=3;
            q = strstr(p, "#&#");
            strncpy(ret, p, q-p);
            ret[q-p]='\0';
            p = q+3;
            q = strstr(p, "#&#");
            if (strcmp(type, "read") == 0 || strcmp(ret, "false") == 0) {
                queries.push_back("");
            } else {
                if (q) {
                    *q = '\0';
                }
                queries.push_back(std::string(p));
            }
        }
    } else if (strcmp(type, "read") == 0){
        queries.push_back("");
    } else {
        queries.push_back(std::string(q+3));
    }
}
*/
void print_usage() {
    printf("./check --input=INPUT --dbuser=USER --dbpass=PASSWD --origindb=ORIGIN --ttdb=TTDB\n");
}

int main(int argc, char** argv) {
    char in_file[128];
    char db_user[128];
    char db_passwd[128];
    char origin_db_name[128];
    char ttdb_name[128];
    strcpy(in_file, "/tmp/sql.log");
    strcpy(db_user, "root");
    strcpy(db_passwd, "715715");
    strcpy(origin_db_name, "webapp");
    strcpy(ttdb_name, "tt_webapp");

    // there are some great argument parsing libraries out there :)
    // LY: I will check later
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
                    if (key == "--input") {
                        strcpy(in_file, value.c_str());
                    } else if (key == "--dbuser") {
                        strcpy(db_user, value.c_str());
                    } else if (key == "--dbpass") {
                        strcpy(db_passwd, value.c_str());
                    } else if (key == "--origindb") {
                        strcpy(origin_db_name, value.c_str());
                    } else if (key == "--ttdb") {
                        strcpy(ttdb_name, value.c_str());
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

    unsigned size = 512;
    // Nit: Per C99 standard sizeof(char) will always be 1
    char* query = (char*)malloc(sizeof(char) * size);
    MYSQL* mysql;
    mysql = mysql_init(NULL);
    if (!mysql_real_connect(mysql, "localhost",
                db_user, db_passwd, origin_db_name, 0, "/tmp/mysql.sock", 0)) {
        printf("Error connecting MySQL\n");
        printf("%s\n",mysql_error(mysql));
        exit(-1);
    }
    MYSQL* mysql_ttdb;
    mysql_ttdb = mysql_init(NULL);
    if (!mysql_real_connect(mysql_ttdb, "localhost",
                db_user, db_passwd, ttdb_name, 0, "/tmp/mysql.sock", 0)) {
        printf("Error connecting MySQL\n");
        printf("%s\n",mysql_error(mysql));
        exit(-1);
    }
    unsigned long long ts = 0;
    FILE* fp = fopen(in_file, "rb");
    std::vector<std::string> query_list;
    while (true) {
        // read one query
        if (!read_query(fp, query, size)) {
          // JBL1
          // Wait this condition can be hit if there is an unexpected EOF,
          // is that really all OK?
          // LY: fixed, exit(-1) in read_query in common.cc
            printf("All OK!\n");
            break;
        }
        split_query(query, query_list);
        for (unsigned i = 0; i < query_list.size(); i++) {
            if (skip_query(query_list[i])) {
                continue;
            }
            std::string old = remove_comments(query_list[i]);
            // update mysql
            int ret = mysql_real_query(mysql, old.c_str(), old.length());
            if (ret != 0) {
                printf("%s\n",mysql_error(mysql));
                printf("%s\n", old.c_str());
                // Is it safe to continue here?
                // LY: fixed
                exit(-1);
            }
            MYSQL_RES *res = mysql_use_result(mysql);
            mysql_free_result(res);

            std::string table = extract_table_name(old);
            if (table == "") {
                fprintf(stderr, "Unable to extract table name!\n%s\n", query);
                exit(-1);
            }
            // get original mysql result
            char tmp[128];
            // General question: can this technique not handle very large
            // tables?
            // LY: Yes. Again, check.cc is merely a unit test file, it does not affect any state. (It does affect the database which
            // is just for unit test purpose)
            // main.cc is the real ttdb in memory db.
            // It can resume from certain state. I am assuming that the mysql log is split into parts of reasonable size (by Cheng) 
            // that in-memory db can handle
            sprintf(tmp,"select * from %s;", table.c_str());
            std::vector<std::string> a = get_mysql_results(mysql, tmp, table, false);
            // get ttdb result
            sprintf(tmp, "select * from %s where start_ts <= %llu and end_ts > %llu;", table.c_str(), ts*10000+i, ts*10000+i);
            std::vector<std::string> b = get_mysql_results(mysql_ttdb, tmp, table, true);
            bool cmp = compare(a,b);
            if (!cmp) {
                printf("ts = %llu:%u\n\n", ts, i);
                printf("query:\n%s\n\n", old.c_str());
                exit(-1);
            }
        }
        ts++;
    }

    fclose(fp);
    mysql_close(mysql);
    mysql_close(mysql_ttdb);
    free(query);
    return 0;
}
