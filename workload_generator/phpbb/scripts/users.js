var casper = require('casper').create();
var fs = require('fs');

if (!casper.cli.has("url")) {
    print_usage();
    exit(-1);
}

var urlBase = casper.cli.get("url");
var readList = [];


//var urlBase = 'http://216.165.71.216:8089';

casper.start();

if (casper.cli.has("user")) {
    var user = casper.cli.get("user");
    if (!casper.cli.has("action")) {
        casper.echo("Must specify user action!");
        print_usage();
        exit(-1);
    }
    var action = casper.cli.get("action");
    if (action != "read" && action != "post" && action != "reply") {
        print_usage();
        exit(-1);
    }
    if (action == "read" || action == "reply") {
        if (!casper.cli.has("readFile")) {
            casper.echo("User read or reply must be supplied a to-do file");
            print_usage();
            exit(-1);
        }
        read_file(casper.cli.get("readFile"));
    }
    var readThenReply = 0;
    if (casper.cli.has("readThenReply")) {
        readThenReply = 1;
    }
    var loginPage = urlBase+'/ucp.php?mode=login';
    casper.echo("Access url: " + loginPage);
    // open login page and login
    casper.thenOpen(loginPage, pageLogin);
    // click login
    casper.thenClick('input[name="login"]');

    if (action == "post") {
        var postPage = urlBase+'/posting.php?mode=post&f=2';
        // postTopic
        casper.echo("Access url: " + postPage);
        casper.thenOpen(postPage, postTopic);
        // click submit
        casper.thenClick('input[name="post"]');
        casper.then(function() {
            this.echo(user + ' posted on forum');
        // this.capture('screen/submit_post.png');
        });
    } else {
        var i = 0;
        casper.repeat(readList.length, function() {
            var thread = readList[i++];
            if (action == "read" || readThenReply == 1) {
                var viewPage = urlBase+'/viewtopic.php?f=2&t='+thread;
                this.then(function() {
                    this.echo("Access url: " + viewPage);
                    this.thenOpen(viewPage);
                });
                this.then(function() {
                    this.echo(user + ' viewed thread ' + thread);
//                    this.echo(this.getCurrentUrl());
                });
            }
            if (action == "reply") {
                var replyPage = urlBase + '/posting.php?mode=reply&f=2&t=' + thread;
                this.echo("Access url: " + replyPage);
                this.thenOpen(replyPage, replyTopic);
                this.thenClick('input[name="post"]');
                this.then(function() {
                    this.echo(user + ' replied to thread ' + thread);
                    // this.capture('screen/submit'+i+'.png');
                });
            }
        });
    }
} else {
    if (!casper.cli.has("readFile")) {
        casper.echo("Guest read must be supplied a to-read file");
        print_usage();
        exit(-1);
    }
    read_file(casper.cli.get("readFile"));
    var i = 0;
    casper.repeat(readList.length, function() {
        var thread = readList[i++];
        var viewPage = urlBase+'/viewtopic.php?f=2&t='+thread;
        this.then(function() {
            this.echo("Access url: " + viewPage);
            this.thenOpen(viewPage);
        });
        casper.then(function() {
            this.echo('Guest viewed thread ' + thread);
//            this.echo(this.getCurrentUrl());
            // this.capture('screen/guest'+i+'.png');
        });
    });
}
casper.run();

function pageLogin() {
    var password = 'abcd1234';
    try {
        this.fill('form#login', {
            'username': user,
            'password': password
        }, false);
    } catch (e) {
        this.echo('in pageLogin');
        this.echo(this.getCurrentUrl());
        this.echo(e);
    }
}

function postTopic() {
    var subjectLength = 20;
    var contentLength = 200;
    try{
        this.fill('form#postform', {
            'subject': random_string(subjectLength),
            'message': random_string(contentLength)
        }, false);
    } catch (e) {
        this.echo('in postTopic');
        this.echo(this.getCurrentUrl());
        this.echo(e);
    }
}

function replyTopic() {
    var contentLength = Math.random() * 100 + 50;
    try{
        this.fill('form#postform', {
            'message': random_string(contentLength)
        }, false);
    } catch (e) {
        this.echo('in replyTopic');
        this.echo(this.getCurrentUrl());
        this.echo(e);
    }
}

function random_string(length) {
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    for( var i=0; i < length; i++ )
        text += possible.charAt(Math.floor(Math.random() * possible.length));

    return text;
}

function read_file(filename) {
    casper.echo("Reading file...");
    file = fs.open(filename, 'r');
    while (!file.atEnd()) {
        readList.push(file.readLine());
    }
}

function print_usage() {
    casper.echo("Usage: casperjs user.js --url=<url> --user=<user> --action=<post|read|reply> --readFile=<thread to view|reply>");
}
