Orochi
======

Orochi is a (research) system that solves **The Efficient Server Audit Problem** for PHP web applications. [This paper](https://cs.nyu.edu/~mwalfish/papers/ssco-sosp17.pdf) defines the problem and gives context.

How to install and run Orochi
----------------------

The following steps build Orochi's components and deploy them on your machine.
The commands have been tested on Ubuntu 14.04,
so we recommend using a newly installed Ubuntu 14.04.
A fresh Linux environment can be created using
a Linux container (please see [Step 0](#step0)).

Of course, one can install Orochi on other Linux distributions 
and/or an existing environment.
However, there might be dependency and configuration problems.
To address those issues, see the detailed installation process in
[detailed instructions](detailed_instructions.md).

Below we step through the process for installing Orochi on Linux container.
For installing Orochi on an existing environment, skip [Step 0](#step0)
and start from [Step 1](#step1).

### <a name="step0"/> Step 0: Build a Linux container (on Ubuntu)

Install Linux container:

    $ sudo apt install lxc

Create one container with Ubuntu14.04 template:

    $ sudo lxc-create -t download -n orochi -- -d ubuntu -r trusty -a amd64

Run and attach to the created container:

    $ sudo lxc-start -n orochi
    $ sudo lxc-attach -n orochi


### <a name="step1"/> Step 1: Install Orochi

(If you got here from [Step 0](#step0), the next steps should be
performed inside the Linux container.)

Fetch Orochi's code:

    $ git clone https://github.com/naizhengtan/orochi.git

Set environment variable:

    $ export ORO_HOME="OROCHI/REPO/"
      # "OROCHI/REPO/" should be replaced with Orochi's root folder

Go to folder "install" and build:

    $ cd $ORO_HOME/install/
    $ ./1_prepare.sh
    $ ./2_build_verification.sh
    $ ./3_build_online.sh
    $ ./4_deploy_config.sh

If the above scripts encounter errors during installation, they will
print error messages with pointers to our [detailed
instructions](detailed_instructions.md), which should help address the
problems.


### <a name="step2"/> Step 2: Run Orochi

There are two phases in Orochi:

  * online phase: an online server collects a trace (including HTTP requests/responses and reports)
  * audit phase: a verifier re-executes the requests in a given trace and compares the responses

The previous [install step](#step1) has installed both the online server and verifier.
In the following steps, [Run the verifier](#runverifier) goes through running
the audit phase on a given trace, and [Run the online server](#runonline) 
talks about the online phase.

#### <a name="runverifier"/> (i) Run the verifier

In this section, one will run the verifier on a given trace.
We have provided the traces we've evaluated in our paper.
One can reproduce our results by downloading these traces
and re-executing Orochi's audit phase against them.

First, download the traces from our server.

    $ cd $ORO_HOME/benchmark/
    $ ./download.sh

Second, copy the trace data to the location where the verifier expects
it.

    $ ./deploy.sh <app>
      # <app> should be one of hotcrp/wiki/phpbb

Third, run Orochi's audit phase.

    $ cd $ORO_HOME/verification
    $ ./verify2.sh <app>
      # <app> should be the same app as the second step

Now, the verifier outputs whether it accepts or rejects the trace
(accept means the re-generated responses are the same as what is in the
trace).  It also outputs the CPU time spent on different components.

#### <a name="runonline"/> (ii) Run the online server

First, start the online server.

    $ cd $ORO_HOME/online_server/
    $ ./start_online_server.sh

Second, run a workload generator.

    $ cd $ORO_HOME/workload_generator/<app>
      # <app> should be one of hotcrp/wiki/phpbb
    $ ./local_workload_gen.sh

The three apps we have experimented with (MediaWiki, phpBB and HotCRP) are located
under $ORO\_HOME/apps/. For more app details,
please see [Application configurations](detailed_instructions.md/#appconfig)
in the [detailed instructions](detailed_instructions.md).

One can customize the workload generator for new workloads.
To do so, please refer to [Generate workloads](detailed_instructions.md/#generateworkloads)
in the [detailed instructions](detailed_instructions.md),

Third, collect trace data for a following audit phase.

    $ cd $ORO_HOME/benchmark/
    $ ./collect.sh <trace-name>

Now, the trace has been collected into "trace-name".
One can start a verifier to audit this captured trace:
see [Run verifier](#runverifier).

Port a new PHP application to Orochi
------------------------------------

Please see 
[Guidelines for porting new PHP app to Orochi](detailed_instructions.md/#portingguideline)
in the [detailed instructions](detailed_instructions.md).


License
-------

License information can be found in the COPYING file.
