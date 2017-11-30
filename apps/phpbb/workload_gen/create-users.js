// Require modules
var casper = require('casper').create();

// CLI option
if (!casper.cli.has("url") || !casper.cli.has("user")) {
    casper.echo("Usage: casperjs create-users.js --url=<url> --user=USER_NAME");
    casper.echo("Supply the name of the user");
    casper.exit();
}
// Retrieve commandline arguments
var url = casper.cli.get("url");
var user = casper.cli.get("user");
url = url + '/ucp.php?mode=register';

var password = 'abcd1234';

// Create users, push to userList array and write to file
casper.echo("Creating users...");
var email = user + "@email.com";
casper.echo("Prepare to create " +  name);

// Start at URL
casper.start(url, function() {
    this.echo("Starting...");
});
casper.thenClick('input[id="agreed"]');
casper.thenClick('input[id=refresh_vc]');
casper.then(function() {
    this.echo("Registering " + user);
    this.echo(email);
    try{
        this.fill('form#register', {
            'username': user,
            'email': email,
            'new_password': password,
            'password_confirm': password,
            'confirm_code': '12345678'
        }, false);
    } catch (e) {
        this.echo(e);
    }
});
/*
casper.then(function() {
    this.capture('screen/a.png');
});
*/
casper.thenClick('input[id="submit"]');
// Finish

casper.then(function() {
//    this.capture('screen/b.png');
    this.echo("Done");
});

casper.run();
