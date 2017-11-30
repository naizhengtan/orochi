// Require modules
var casper = require('casper').create();
var fs = require('fs');

// CLI option
if (!casper.cli.has("url") || (!casper.cli.has("users") && !casper.cli.has("num"))) {
  casper.echo("Usage: casperjs create-users.js --url=<url> (--users=<username file> || --num=<number of users>)");
  casper.echo("Supply either a file with newline seperated usernames, or a number of usernames to be generated (in the form of user#@email.com");
  casper.exit();
}

// Retrieve commandline arguments
var url = casper.cli.get("url");
var users = casper.cli.has("users") ? casper.cli.get("users") : null;
var numUsers = casper.cli.has("num") ? parseInt(casper.cli.get("num")) : null;

var userList = [];
var file;
var counter = 0;

// Open user list file and populate user list
if (casper.cli.has("users")) {
  // Read the file and push to userList array
  casper.echo("Reading file...");
  numUsers = 0;
  file = fs.open(users, 'r');
  while (!file.atEnd()) {
    userList.push(file.readLine());
    numUsers++;
  }
} else {
  // Create users, push to userList array and write to file
  casper.echo("Creating users...");
  file = fs.open('users.txt', 'w');
  for (var i = 0; i < numUsers; i++) {
    var email = "user" + i + "@email.com";
    file.writeLine(email);
    userList.push(email);
    casper.echo("Created " +  email);
  }
  file.flush();
}
file.close();

// Start at URL
casper.start(url, function() {
  this.echo("Starting...");
});

// Repeat user creation
casper.repeat(numUsers, function() {
  var email = userList[counter++];
  this.echo("Registering " + email);

  try{
    this.fill('form', {
      'email': email,
      'action': 'new'
    }, true);
  } catch (e) {
    this.echo(e);
    this.exit(1);
  }
});

// Finish
casper.then(function() {
  this.echo("Done");
});

casper.run();
