var casper = require('casper').create();

// global variables
var user = "admin@nyu.edu";
var num_pc;
var pc_list = [];
var url, action;


// COPIED from workload-builder
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
};

parseCLI();
phantom.clearCookies();

// MAIN
// Start at first URL
casper.start(url, function() {
  this.echo("load " + url);
});

// First page is alwyas login page
casper.then(pageLogin);

if (action == "open-conf") {
  casper.echo("Action: [Open site for submission]");

  // check the checkbox
  casper.then(function() {
    var base = this.getGlobal('location').origin;
    this.thenOpen(absoluteUri(base, '/settings/sub'), function() {
      try {
        var id = 'input[name="sub_open"]';//"cbsub_open";
        if (!this.exists(id)) {
          this.echo("Error: " + id + " does not exist");
        } else if (typeof(this.getElementInfo(id)["attributes"]["checked"]) == "undefined") {
          this.echo("The checkbox " + id + " is not checked");
          this.click(id);
          this.echo("The checkbox " + id + " checked");
        } else {
          this.echo("The checkbox " + id + " has already been checked");
        }
        //this.capture( "/tmp/xx.png");
      } catch(e) {
        this.echo(e);
        this.exit(1);
      }
    });
  });
  // save the result
  casper.thenClick('input[name="update"]');

} else if (action == "create-pc") {
  if (!casper.cli.has("num")) {
    casper.echo("create-pc action need --num argument");
    casper.exit(1);
  }
  num_pc = casper.cli.get("num");
  initPC();
  casper.echo("Action: [Create " + num_pc + " pc accounts ]");

  // got to account create Page
  casper.then(function() {
    var base = this.getGlobal('location').origin;
    this.repeat(num_pc, function() {
      try {
        this.thenOpen(absoluteUri(base, '/profile/new?role=pc'), create_pc); 
        // click the button
        this.thenClick('input[value="Create account"]');
      } catch(e) {
        this.echoo(e);
        this.exit(1);
      }
    });
  });
} else if (action == "open-review") {
  casper.echo("Action: [Open the review]");

  casper.then(function() {
    var base = this.getGlobal('location').origin;
    this.thenOpen(absoluteUri(base, '/settings/reviews'), function() {
      try {
        var id = 'input[name="rev_open"]';//"cbsub_open";
        if (!this.exists(id)) {
          this.echo("Error: " + id + " does not exist");
        } else if (typeof(this.getElementInfo(id)["attributes"]["checked"]) == "undefined") {
          this.echo("The checkbox " + id + " is not checked");
          this.click(id);
          this.echo("The checkbox " + id + " checked");
        } else {
          this.echo("The checkbox " + id + " has already been checked");
        }

      } catch(e) {
        this.echo(e);
        this.exit(1);
      }
    });
  });
  // save the result
  casper.thenClick('input[name="update"]');

} else if (action == "assign-paper") {
  casper.echo("Action: [Assign papers]");

  casper.then(function() {
    try {
      var base = this.getGlobal('location').origin;
      this.thenOpen(absoluteUri(base, '/autoassign'), function() {
        this.click('input[name="assign"]');
      });
      //this.then(function(){this.capture("/tmp/workload_screen/xx.png");});
      this.waitForSelector('input[name="submit"]');
      this.thenClick('input[name="submit"]');
      //this.then(function(){this.capture("/tmp/workload_screen/xx.png");});
    } catch(e) {
      this.echo(e);
      this.exit(1);
    }
  });
}

// Run navigation
casper.run( function() {
  this.echo("Finished");
  this.exit();
});

function create_pc () {
  // fill the email
  var email = pc_list.shift();
  this.echo("Creating pc: " + email);
  this.fill("form#accountform", {
    "uemail" : email,
    "firstName" : "abc",
    "lastName" : "cba",
    "affiliation" : "NYU"
  }, false);
  //this.capture("/tmp/workload_screen/creat.png");
  this.printPageInfo("create_pc");
};

function checkTheBox (id) {
};

// COPIED from workload-builder
//========================================

// Init
function initPC() {
  for (i = 0; i < num_pc; i++) {
    pc_list.push("pc"+i+"@email.com");
  }
}

// CLI options
function parseCLI() {
  if (!casper.cli.has("url") || !casper.cli.has("action")) {
    casper.echo("Usage: casperjs admin-setting.js --url=<url> --action=<op>");
    casper.echo(" actions: open-conf");
    casper.echo("          create-pc --num=<pc-num>");
    casper.echo("          open-review");
    casper.echo("          assign-paper");
    exit();
  }

  // Retrieve commandline arguments
  url = casper.cli.get("url");
  action = casper.cli.get("action");
};

// COPIED from workload-builder
// Login Page
function pageLogin () {
  this.echo(user);

  this.fill('form', {
    'email': user,
    'password': "123",
    'action': 'login'
  }, true);

  this.printPageInfo("login");
};

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
};
