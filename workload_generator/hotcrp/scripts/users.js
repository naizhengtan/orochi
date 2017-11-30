var casper = require('casper').create();
var fs = require('fs');

// Global variables
var url, users, userList, action;
var accessible, pages, access_counter=0;
var editing_number = 20;
var num_thrd=1, tid=0;

// CLI option
parseCLI();

// Setup
doSetup();

// Settings
var screens_location = "/tmp/workload_screen/";
var submissions_location = "submissions/";
var defaultPassword = '123';
var pageviewing = ["profile", "help", "" /*home*/, "users?t=pc", "search?q="]
//var pageviewing = ["profile", "", "help", "" /*home*/, "users?t=pc", "", "search?q=", ""]
var affiliations = ['None', 'Unaffiliated', 'NYU', 'UT Austin'];
var countries = ['United States of America', 'China', 'Canada', 'Japan', 'United Kingdom', 'Spain', 'Russia', 'France', 'New Zealand', 'Mexico'];
var papers = fs.list(submissions_location).filter(function(file) {
  return (file !== '.' && file !== '..');
}).map(function(file) {
  return submissions_location + file;
});

// Extend CasperJS to add custom page info function
casper.printPageInfo = function (filename) {
  var status = this.status().currentHTTPStatus;
  switch(status) {
    case 200: var statusStyle = { fg: 'green', bold: true }; break;
    case 404: var statusStyle = { fg: 'red', bold: true }; break;
    default: var statusStyle = { fg: 'magenta', bold: true }; break;
  }

  this.echo(this.colorizer.format(status, statusStyle) + ' ' + this.getCurrentUrl() + (filename ? (" (" + filename + ")") : ""));
  //this.capture(screens_location + (filename || "img") + ".png");
}

function gen_random_str(length) {
  var text = "";
  var possible = " ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

  for( var i=0; i < length; i++ )
    text += possible.charAt(Math.floor(Math.random() * possible.length));

  return text;
}


/* Main CasperJS Navigation  */

// Start at first URL
casper.start(url);

if (action == "submission") {
  // Do for all users
  var user_id = 0;
  casper.repeat(userList.length, function() {
    this.echo("Start for new user...");
    var base = this.getGlobal('location').origin;
    phantom.clearCookies();

    // First page is alwyas login page
    this.thenOpen(url, pageLogin);
    //this.then(pageUpdateProfile);
    this.thenOpen(absoluteUri(base, 'paper.php/new'), pageSubmission);
    //this.thenClick('input[value="Save changes"]');
    this.thenClick('input[name="update"]');
    //this.capture("/tmp/hoho2.png");

    user_id ++;
    for ( var i = 0; i < editing_number; i++ ) {
      // FIXME: here is an implicit rule paper_id = user_id + 1
      this.thenOpen(absoluteUri(base, 'paper.php/'+user_id), pageEdit);
      //this.thenClick('input[value="Save changes"]');
      this.thenClick('input[name="update"]');
    }

    // Logout
    this.then(function() {
      this.printPageInfo();
      phantom.clearCookies();
      this.echo("Done");
    });
  });

} else if (action == "crawl") {
  if (!casper.cli.has("pages")) {
    casper.echo("crawl need --pages argument");
    this.exit(1);
    exit(1);
  }
  pages = casper.cli.get("pages");
  casper.echo("===user start crawling " + pages + " pages===");

  // Crawl page
  base_url = url;
  casper.repeat(userList.length, function() {
    access_counter = 0;
    phantom.clearCookies();
    this.thenOpen(url, pageLogin);
    //this.then(function() { pageCrawl(url); });
    this.then(function() { pageView(url); });
  });
}

// Run navigation
casper.run(function() {
  this.echo("Finished");
  this.exit();
});

/* Page Navigation Functions */

// Login Page
function pageLogin () {
  var user = userList.shift();
  this.echo(col(user, 'blue'));

  this.then( function() {
    this.fill('form', {
      'email': user,
      'password': defaultPassword,
      'action': 'login'
    }, false);
    }
  ).then(function() {
    this.thenClick('input[name="signin"]');
  });

  this.capture("/tmp/hoho0.png");
  this.printPageInfo("login");
};

// Update Profile
function pageUpdateProfile () {
  this.printPageInfo("update");
  if (this.getTitle() == "Profile - HotCRP") {
    this.echo("Update info");
    this.fill('form#accountform', {
      'firstName': 'user',
      'lastssssssssame': 'user' ,
      'affiliation': affiliations[getRandomInt(affiliations.length)],
      'country': countries[getRandomInt(countries.length)]
    });
    this.click('input[type="submit"][name="register"]');
  } else this.echo("No need to update account info");
  this.printPageInfo("update");
}

// New submission
function pageSubmission () {
  //this.waitForSelector("form#paperedit", function() {
    var try_again = false;
    do {
      try {
        this.fill('form#paperedit', {
          'title': 'My Paper',
          'abstract': 'My short abstract',
          'auname1': 'Curtis Li',
          'auemail1': 'fake@email.com',
          'auaff1': 'NYU',
          'paperUpload': papers[getRandomInt(papers.length)]
          }, false);
          try_again = false;
        } catch(e) {
          //try_again = true;
          this.echo(e);
          //this.exit(1);
          //exit(1);
        }
    } while (try_again);
  //});
  
  this.capture("/tmp/hoho1.png");
  this.printPageInfo("submit");
}

// Page Editing 
function pageEdit() {
  //this.waitForSelector("form#paperedit", function() {
    var try_again = false;
    do {
      try {
        this.fill('form#paperedit', {
          'title': 'My Paper',
          'abstract': gen_random_str(20),
          'auname1': 'Curtis Li',
          'auemail1': 'fake@email.com',
          'auaff1': 'NYU',
        }, false);
        try_again = false;
      } catch(e) {
        //try_again = true;
        this.echo(e);
        //this.exit(1);
        //exit(1);
      }
   } while (try_again);
 //});
  
  this.capture("/tmp/hoho2.png");
  this.printPageInfo("edit");
}

// view certain pages
function pageView (view_url) {
  //casper.echo('going to view: ' + view_url);
  casper.open(view_url).then(function () {
    access_counter ++;
    this.printPageInfo("view");
  
    if (access_counter < pages) {
      var next = base_url + "/" + pageviewing[access_counter % pageviewing.length];
      //this.echo('next to view: ' + next);
      pageView(next);
    } else this.echo("Done crawling");
  });
} 

// Crawl website
function pageCrawl (next_url) {
  casper.open(next_url).then(function () {
    this.echo(" The " + access_counter + " turn: " + next_url);
    if (next_url.indexOf("search") > -1) return;
    access_counter ++;
    accessible = [];
    this.printPageInfo();
  
    var base = this.getGlobal('location').origin;

    // Get all new links on the page
    var links = this.getElementsAttribute('a[href]', 'href');
    links = links.filter(function(link) {
      return !link.match(/^http/);
    }).map(function(link) {
      return absoluteUri(base, link);
    }).filter(function(link) {
      return (accessible.indexOf(link) < 0);
    });
    accessible = accessible.concat(links);

    if (access_counter < pages) {
      var next;
      do {
        next = accessible.splice(getRandomInt(accessible.length), 1)[0];
      } while (next.indexOf('signout') > 0);

      pageCrawl(next);
    } else this.echo("Done crawling");
  });
}



/* Helper Functions */

// Get a random int from 0 up to but not including range
function getRandomInt(range) {
  return Math.floor(Math.random() * range);
}

// Generate absolute path name
function absoluteUri(base, href) {
  //Parse a URI and return its constituent parts
  function parseUri(url) {
    var match = String(url).replace(/^\s+|\s+$/g, '').match(/^([^:\/?#]+:)?(\/\/(?:[^:@]*(?::[^:@]*)?@)?(([^:\/?#]*)(?::(\d*))?))?([^?#]*)(\?[^#]*)?(#[\s\S]*)?/);
    return (match ? { 
      href: match[0] || '', 
      protocol: match[1] || '',
      authority: match[2] || '', 
      host: match[3] || '', 
      hostname: match[4] || '', 
      port: match[5] || '', 
      pathname: match[6] || '', 
      search: match[7] || '', 
      hash: match[8] || '' 
    } : null);
  }

  // Resolve dots in the path
  function resolvePathDots(input) {
    var output = [];
    input.replace(/^(\.\.?(\/|$))+/, '')
      .replace(/\/(\.(\/|$))+/g, '/')
      .replace(/\/\.\.$/, '/../')
      .replace(/\/?[^\/]*/g, function (part) { 
        part === '/..' ? output.pop() : output.push(part); 
      });
    return output.join('').replace(/^\//, input.charAt(0) === '/' ? '/' : '');
  }
  // Parse base and href 
  href = parseUri(href || '');
  base = parseUri(base || '');

  // Build and return the URI 
  return !href || !base ? null : (href.protocol || base.protocol) +
    (href.protocol || href.authority ? href.authority : base.authority) +
    (resolvePathDots(href.protocol || href.authority || href.pathname.charAt(0) === '/' ? href.pathname : (href.pathname ? ((base.authority && !base.pathname ? '/' : '') + base.pathname.slice(0, base.pathname.lastIndexOf('/') + 1) + href.pathname) : base.pathname))) +
    (href.protocol || href.authority || href.pathname ? href.search : (href.search || base.search)) + href.hash;
}

// CLI options
function parseCLI() {
  if (!casper.cli.has("url") || !casper.cli.has("users") || !casper.cli.has("action")) {
    casper.echo("Usage: casperjs create-users.js --url=<url> --users=<username file> --action=[submission|crawl] [--num_thrd=[#thrd] --tid=[int]]");
    casper.exit();
    exit();
  }

  // Retrieve commandline arguments
  url = casper.cli.get("url");
  users = casper.cli.get("users");
  action = casper.cli.get("action");
  if (casper.cli.has("num_thrd")) {
    num_thrd = casper.cli.get("num_thrd");
    tid = casper.cli.get("tid");
  }
}

// Setup
function doSetup() {
  // Read the file and push to userList array
  var file = fs.open(users, 'r');
  allusers = [];
  while (!file.atEnd()) {
    allusers.push(file.readLine());
  }
  file.close();

  // if multi-thread, they need to split the userlist
  var num_user_for_thrd = Math.floor(allusers.length / num_thrd);
  userList = [];
  for (var i = num_user_for_thrd * tid; i < num_user_for_thrd * (tid+1); i++) {
    userList.push(allusers[i]);
  }
}

function col(text, colour) {
  var statusStyle = { fg: colour ? colour : 'red', bold: true };
  return (casper.colorizer.format(text, statusStyle));
}
