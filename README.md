Orochi
======

Orochi is a (research) system to solve **The Efficient Server Audit Problem**
for PHP web applications.
Please see the definition of "The Efficient Server Audit Problem" and other information
in our [paper](https://cs.nyu.edu/~mwalfish/papers/ssco-sosp17.pdf).

Install and run Orochi
----------------------

Since Orochi requires building and deploying its own MySQL/HHVM 
as well as some software/libraries with specific version, I strongly 
recommend using a clean environment to try Orochi, for example
Linux container. Also, Orochi needs Ubuntu14.04.

### Build a clean Linux container (Ubuntu)

Install Linux container:
  $ sudo apt install lxc

Create one container with Ubuntu14.04:
  $ sudo lxc-create -t download -n orochi -- -d ubuntu -r trusty -a amd64

Run and attach to the created container:
  $ sudo lxc-start -n orochi
  $ sudo lxc-attach -n orochi


### Install Orochi

(Inside Linux container "orochi")
Clone Orochi project:

  $ git clone https://github.com/naizhengtan/orochi.git

Set environment variable:

    $ export ORO_HOME="OROCHI/REPO/"
      ("OROCHI/REPO/" should be replaced with Orochi's root folder)

Go to folder "install" and build:

    $ cd $ORO_HOME/install/
    $ ./1_prepare.sh
    $ ./2_build_verification.sh
    $ ./3_deploy_config.sh


### Run benchmarks (audit phase)

We have provided some benchmarks collected from our
experiment apps (HotCRP, MediaWiki and phpBB). One can
re-run/re-verify these benchmarks to see how Orochi works.

First, download the benchmarks from a remote server.

    $ cd $ORO_HOME/benchmark/
    $ ./download.sh

Second, deploy benchmarks (copy the relevant data, i.e. trace and hints)
to their correct locations.

    $ ./deploy.sh <app>
      (<app> should be one of hotcrp/wiki/phpbb)

Third, run Orochi's audit phase.

    $ cd $ORO_HOME/verification
    $ ./verify2.sh <app>
      (<app> should be one of hotcrp/wiki/phpbb)

Now, you can see the result of audit.


### Run online phase and audit phase

Go to folder "install" and run script:

    $ cd $ORO_HOME/install
    $ ./4_build_online.sh

Run workload generator:

    $ cd $ORO_HOME/workload_generator/<app>
      (<app> should be one of hotcrp/wiki/phpbb)
    $ ./local_workload_gen.sh
    $ cd $ORO_HOME/verification/verify2.sh <app>
      (<app> should be the same app as the workload
      generated in the last step.) 

Now, you can see the result of audit.


License
-------

License information can be found in the COPYING file.
