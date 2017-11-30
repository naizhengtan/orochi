var casper = require("casper").create(
  {logLevel:"verbose", debug:true}
);

var base_url, url, num_pc, action;
var pc_list = [];
var access_counter, pages, accessible;
var review_times = 20;
var pageviewing = ["profile", "help", "" /*home*/, "users?t=pc", "search?q="]
//var pageviewing = ["profile", "", "help", "" /*home*/, "users?t=pc", "", "search?q=", ""]

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

// CLI option
parseCLI();
init();

// MAIN
casper.start(url, function() {
  this.echo("load " + url);
});

if (action == "review") {
  var links;
  casper.repeat(num_pc, function() {
    this.echo("Start pc review...");
    var base = this.getGlobal('location').origin;
    phantom.clearCookies();

    this.thenOpen(url, pageLogin);

    this.then(function getLinks(){
      links = this.evaluate(function(){
        var links = document.getElementsByTagName('a');
        links = Array.prototype.map.call(links,function(link){
          return link.getAttribute('href');
        });
        return links;
      });

      links = links.filter(function(link) {
        return link.match(/paper\/[0-9]+/);
      }).filter(function(item, pos, self) {
        return self.indexOf(item) == pos;
      }).map(function(link) {
        // NOTE: this is a trick for multiple times review!
        return absoluteUri(base, link)+"?m=re";
      });

      var length = links.length;
      this.repeat(length, function() {
        var url = links.shift();
        this.repeat(review_times, function() {
          this.echo(url);
          this.thenOpen(url, paperReview);
          this.thenClick('input[name="submitreview"]');
        });
      });
    });
  });

} else if (action == "crawl") {
  if (!casper.cli.has("pages")) {
    casper.echo("crawl need --pages argument");
    this.exit(1);
    exit(1);
  }
  pages = casper.cli.get("pages");
  casper.echo("===pc start crawling " + pages + " pages===");

  // Crawl page
  base_url=url;
  casper.repeat(num_pc, function() {
    access_counter = 0;
    accessible = [];
    phantom.clearCookies();
    this.thenOpen(url, pageLogin);
    //this.then(function() { pageCrawl(url); });
    this.then(function() { pageView(url); });
  });
}


casper.run(function() {
  this.echo("Done");
  this.exit();
});

function tmpPrint() {
  this.capture("/tmp/workload_screen/xx.png");
}

function gen_random_str(length) {
  var text = "";
  var possible = " ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

  for( var i=0; i < length; i++ )
    text += possible.charAt(Math.floor(Math.random() * possible.length));

  return text;
}

function paperReview() {
  try {
    this.evaluate(function() {
      document.querySelector('select[name="overAllMerit"]').selectedIndex = 3;
      document.querySelector('select[name="reviewerQualification"]').selectedIndex = 3;
      document.querySelector('textarea[name="paperSummary"]').textContent = gen_random_str(50);
      document.querySelector('textarea[name="commentsToAuthor"]').textContent = gen_random_str(200);
      document.querySelector('textarea[name="commentsToPC"]').textContent = gen_random_str(200);
    });
    this.printPageInfo("review");
  } catch(e) {
    this.print(e);
    this.exit(1);
    exit(1);
  }
}

// view certain pages
function pageView (view_url) {
  //casper.echo('going to view: ' + view_url);
  casper.open(view_url).then(function () {
    access_counter ++;
    this.printPageInfo("view");
  
    if (access_counter < pages) {
      var next = base_url + "/" + pageviewing[access_counter % pageviewing.length];
      //this.echo('next to view: [' + access_counter+']' + next);
      pageView(next);
    } else this.echo("Done crawling");
  });
} 

// Crawl website
function pageCrawl (next_url) {
  casper.open(next_url).then(function () {
    this.echo(" The " + access_counter + " turn: " + next_url);
    access_counter ++;
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


// Login Page
function pageLogin () {
  var user = pc_list.shift();
  this.echo(col(user, 'blue'));

  this.fill('form', {
    'email': user,
    'password': "123",
    'action': 'login'
  }, true);

  this.printPageInfo("login");
};
//=============

// Init
function init() {
  for (i = 0; i < num_pc; i++) {
    pc_list.push("pc"+i+"@email.com");
  }
}

// CLI options
function parseCLI() {
  if (!casper.cli.has("url") || !casper.cli.has("num") || !casper.cli.has("action")) {
    casper.echo("Usage: casperjs pc.js --url=<url> --num=<num> --action=[review|crawl]");
    casper.exit();
    exit(1);
  }

  // Retrieve commandline arguments
  url = casper.cli.get("url");
  num_pc = casper.cli.get("num");
  action = casper.cli.get("action");
}

function col(text, colour) {
  var statusStyle = { fg: colour ? colour : 'red', bold: true };
  return (casper.colorizer.format(text, statusStyle));
}

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

// Get a random int from 0 up to but not including range
function getRandomInt(range) {
  return Math.floor(Math.random() * range);
}
