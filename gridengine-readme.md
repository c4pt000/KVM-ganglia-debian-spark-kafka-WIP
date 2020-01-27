Grid engine
-----------

The configuration is the following.

 * `node00`: Grid server. This node has the alias name `grid`.
 * others: Grid execution nodes.

Make sure Java is available in all nodes (via `default-jre` package).

The gridengine uses `/etc/hosts` to resolve hostname. Turn off the hostname
in this file to prevent inconsistent name resolusion from DNS.

    127.0.0.1   localhost
    #127.0.1.1    node00.mydomain.com   node00

### server

    apt-get install gridengine-master gridengine-client gridengine-qmon

The install process asks for basic mail setup and grid configuration.
Set up the host as the Internet site and specify `node00.mydomain.com`
as the master, which is the alias for `node00`.

    qconf -aq main.q  # to add main.q
    qconf -mq main.q  # to edit main.q

The configuration tool is `qmon`, but it's pretty buggy. Use `qconf` instead.
Look at the cheat sheet
[here](https://confluence.rcs.griffith.edu.au/display/v20zCluster/SGE+cheat+sheet).

The basic things to set up are:

 * Add node00 to master and submission hosts.
 * Add other nodes to submission and execution hosts.
 * Create `@exec` group and add execution nodes.
 * Create a parallel envirionment called `default` and set 12 slots.
 * Create a queue called `main.q` and set the default slots to 2 / host.
 * Change the number of slots of `node02` to 4 (the node has 4 physical cores).

### Client

    apt-get install gridengine-exec gridengine-client

The install process asks for basic mail setup and grid configuration.
Set up the host as the Internet site and specify `mydomain.com`
as the master, which is the alias for `node00`.

Often, the `gridengine-exec` service fails to start. In that case, don't use
`service gridengine-exec restart` because it doesn't work. Instead, look for
the gridengine process and stop the zombie process by `kill` command.

    ps axu | grep grid  # find gridengine pid
    kill 1234
    service start gridengine-exec

### MPI

Use `mpich2` package.

    apt-get install mpich2

Create a parallel environment for MPI. There is a README file in
`/usr/share/doc/gridengine-common/examples/mpi/`. First, go to Parallel
Environment menu, and add a new configuration called mpi that looks like this.

    qconf -Ap mpi

Set up the following.

    pe_name            mpi
    slots              16
    user_lists         NONE
    xuser_lists        NONE
    start_proc_args    /usr/share/doc/gridengine-common/examples/mpi/startmpi.sh \
                       -catch_rsh $pe_hostfile
    stop_proc_args     /usr/share/doc/gridengine-common/examples/mpi/stopmpi.sh
    allocation_rule    $round_robin
    control_slaves     TRUE
    job_is_first_task  FALSE
    urgency_slots      min
    accounting_summary FALSE

Next, go to Queue Control in `qmon`, and add the mpi environment in each queue.


The gridengine scripts in /usr/share/doc/gridengine-common/examples/mpi/ does
not contain the correct path. Create a symlink so that the path configuration
works with the default value. Do the following in all the hosts.

    ln -s /usr/share/doc/gridengine-common/examples/mpi /var/lib/gridengine/mpi


Ganglia monitor
---------------

Ganglia is a status monitor for the grid environment.

### Nodes (or all)

    apt-get install ganglia-monitor

### Master

    apt-get install ganglia-webfrontend
    dpkg-reconfigure -plow ganglia-webfrontend

Let the `dpkg` manager to automatically setup the apache config.

Access [this URL](http://node00.mydomain.com/ganglia).

### Restarting service

Ganglia monitor sometimes fail to register to the daemon process. If that
happens, restart the client service at all nodes and the master service at
the grid-master.

    service ganglia-monitor restart
    service gmetad restart

Use `pdsh` to do this.

    pdsh "echo <password> | sudo -S service ganglia-monitor restart"
