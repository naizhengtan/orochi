var casper = require('casper').create();
var fs = require('fs');

if (!casper.cli.has("url")) {
    print_usage();
    exit(-1);
}

var num_user;
var urlBase = casper.cli.get("url");
var user_readList = {}; // contain multiple list, each for one user
var guest_readList = [];
var user_counter = 0, user_name = "";


//var urlBase = 'http://216.165.71.216:8089';

casper.start();

if (!casper.cli.has("numuser")) {
  casper.echo("Must specify number of user!");
  print_usage();
  exit(-1);
}
num_user = casper.cli.get("numuser");

if (!casper.cli.has("user_file_folder")) {
  casper.echo("User read or reply must be supplied a to-do file");
  print_usage();
  exit(-1);
}
read_file(casper.cli.get("user_file_folder"), true);

if (!casper.cli.has("guest_read_file")) {
  casper.echo("User read or reply must be supplied a to-do file");
  print_usage();
  exit(-1);
}
read_file(casper.cli.get("guest_read_file"), false);

// start to run
var output = '';
for (var property in user_readList) {
  output += property + ': ' + user_readList[property].toString()+'; \n';
}
casper.echo(output);

// loop each users
user_counter=0;
casper.repeat(num_user, function() {
  user_name = "user"+user_counter;

  // clear cookie
  phantom.clearCookies();
  // login
  var loginPage = urlBase+'/ucp.php?mode=login';
  casper.echo("Access url: " + loginPage);
  // open login page and login
  casper.thenOpen(loginPage, pageLogin);
  casper.echo("Login: about to click the button");
  // click login
  casper.thenClick('input[name="login"]');
  //casper.echo("Login: button clicked, " + user_readList[user_name].length + " pages are going to be read");
  casper.echo("user_name: " + user_name);
  casper.echo("list: " + user_readList[user_name].toString());

  var i = 0;
  casper.repeat(user_readList[user_name].length, function() {
    //casper.echo("in repeat" );
    //casper.echo("list: " + user_readList[user_name].toString());
    var thread = user_readList[user_name][i++];
    //casper.echo("thread: " + thread);
    var viewPage = urlBase+'/viewtopic.php?f=2&t='+thread;
    //casper.echo("view : " + viewPage);

    this.then(function() {
      this.echo("Access url: " + viewPage);
      this.thenOpen(viewPage);
      this.then(function() {
        this.echo(user_name + ' viewed thread ' + thread);
      });
    });
  });

  user_counter++;
});

// guest's turn
var i = 0;
casper.repeat(guest_readList.length, function() {
  phantom.clearCookies();

  var thread = guest_readList[i++];
  var viewPage = urlBase+'/viewtopic.php?f=2&t='+thread;
  this.then(function() {
    this.echo("Access url: " + viewPage);
    this.thenOpen(viewPage);
  });
  casper.then(function() {
    this.echo('Guest viewed thread ' + thread);
  });
});
casper.run();

function pageLogin() {
  this.wait(500, function() {
    var password = 'abcd1234';
    try {
      this.fill('form#login', {
        'username': user_name,
        'password': password
      }, false);
    } catch (e) {
      this.echo('in pageLogin');
      this.echo(this.getCurrentUrl());
      this.echo(e);
    }
  });
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

function read_file(filename, is_user) {
  casper.echo("Reading file...");

  // this is users
  if (is_user) {
    for (i=0; i<num_user; i++) {
      user_readList["user"+i] = [];
      var filepath = filename + "/user" + i;
      var file = fs.open(filepath, 'r');
      while (!file.atEnd()) {
        user_readList["user"+i].push(file.readLine());
      }
    }
  } else {
    // this is guest
    var file = fs.open(filename, 'r');
    while (!file.atEnd()) {
      guest_readList.push(file.readLine());
    }
  }
}

function print_usage() {
    casper.echo("Usage: casperjs user.js --url=<url> --numuser=<num_user> --user_file_folder=ufd --guest_read_file=gfile");
}
