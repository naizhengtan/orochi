#include "common.h"
#include <boost/regex.hpp>
#include <assert.h>

/**
 * Read one sql query from file to buffer, if the buffer size is not enough,
 * then it will be lengthened by factor of two
 * Query is separated by delimilter "|]|" and the last query is END marking end of file
 * Param:
 *      fp the file point to mysql write log
 *      buf the buffer to store query
 *      size the size of the buffer
 * Return:
 *      true if successful
 *      false if end of file
 */
// JBL: Wait, this is the same function as is in check.cc, right?
// LY: Yes, I will move all shared functions out
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
        /*
        // cheng: can be broken if the pdf has EOF
        if (ch == EOF) {
            buf[i++] = '\0';
            // JBL1 see other JBL1, is returning false really the right thing to
            // do? Shouldn't you really exit with an error?
            
            // LY: You are right! I was assuming this will never happen because the input 
            // is generate from our pipeline, but mutual suspicion is better!

            fprintf(stderr, "Unexpected EOF encountered\n");
            exit(-1);
//            return false;
        } else {
        */
            buf[i++] = ch;
            if (ch == '|') {
                if (i>2 && buf[i-2]==']' && buf[i-3]=='|') {
                    buf[i-3] = '\0';
                    break;
                }
            }
        //}
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
        // JBL: Why not use strcpy? Is it because they might overlap?
        // LY: Yes. I did try memcpy, strcpy before, but something unexpected happened.
        while ((*q++=*p++));
    }
    return true;
}

/*
 * check if a query is update, insert, delete
 * otherwise skip it
 */
bool skip_query(std::string& query) {
    if (query.length() == 0) { // either failed queries or read
        return true;
    }
    /*
    char op[7];
    strncpy(op, query.c_str(), 6);
    for (char* p = op; p < op+6; p++) {
        if (*p <= 'Z') {
            *p+='a'-'A';
        }
    }*/
    // You can omit the above (which is questionable, given the condition *p <=
    // 'Z') by using strncasecmp
    //
    // Stylistically you can simplify as:
    // return !(strncasecmp(op, "update", 6) || strncasecmp(...) ... )
    //
    // LY: Agree

    /*
    if (strncmp(op, "update", 6) == 0 || strncmp(op, "insert", 6) == 0 || strncmp(op, "delete", 6) == 0) {
        return false;
    } else { // other writes like begin, commit, rollback, and set
        return true;
    }
    */
    const char* op = query.c_str();
    return !(strncasecmp(op, "update", 6) == 0 || strncasecmp(op, "insert", 6) == 0 || strncasecmp(op, "delete", 6) == 0);
}

std::string remove_comments(std::string& query) { // wiki query all contail comments
    if (query.find("/*") == std::string::npos) {
        return query;
    } 
    boost::regex e("(.*?)/\\*.*?\\*/(.*?)");
    std::string ret = boost::regex_replace(query, e, "$1 $2");
    return ret;
}

// JBL: duplicate code, right?
// LY: yes, because check.cc was part of main.cc and I moved it out in a hurry.
// I will move all duplicate code to some common.h common.cc when time permits
// Actually extract_table_name is not robust enough, I will use regex instead

/*
std::string extract_table_name(const char* str) {
    char a[16], b[32], c[32];
    // This assumes table names less than 32 characters? You should document the
    // assumption.
    sscanf(str,"%s %s %s", a,b,c);
    std::string table;
    if (a[0]=='u' || a[0] =='U') {
        table = b;
    } else {
        table = c;
    }
    if (table[0] == '`') {
        return table.substr(1, table.length() - 2);
    } else {
        return table;
    }
}
*/

std::string extract_table_name(const std::string& query) {
    boost::regex e("(create\\s+table|insert(\\s+ignore)?\\s+into|update|delete\\s+from)\\s+`?(.*?)`?($|\\s+.*)", boost::regex::icase);
    boost::smatch what;
    if (!boost::regex_match(query, what, e)) {
        printf("extract_table_name: regex_match error!\n%s\n", query.c_str());
        exit(-1);
    }
    return what[3].str();
}

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
            if (strcmp(type, "error") == 0) { 
                // FIXME
                // online phase has error:
                // nested trx, nothing to commit or rollback, and so on
                // should we reject audit?
                // currently we only ignore and discard error msg
                continue;
            }
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
