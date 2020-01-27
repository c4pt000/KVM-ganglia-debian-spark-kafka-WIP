# WARNING DO NOT RUN BOTH SERVER AND CLIENT OF GANGLIA THROUGH DOCKER SYSTEM PID 1 PRIVLEDGED HOST IT WILL CRASH THE LOCAL # # MACHINE IF THEY BOTH RUN AT THE SAME TIME ON THE SAME MACHINE STILL DEBUGGING RUNNING VIA SEPERATE KVM INSTANCES OF DOCKER # RUNNING SEPERATELY THROUGH KVM IMAGES

# e.g. SUPERCOMPUTERS AND YOU!
https://hackaday.com/2008/12/30/25c3-hackers-completely-break-ssl-using-200-ps3s/

# ^^ could be ganglia might not be with 256mb base ram as an example DIY cheap SUPERCOMPUTING or NOT!

# THIS IS STILL LABELED A WIP (work in progress)
<br>
attempted to remove machine "halt and catch fire" from conflict over System Process ID 1 between server and client
<br>
attempting to get interconnection of server/client to respond via multicast ip paths, (still two other projects 24 hrs 
<br>
incremental changes beside this)
<br>
see komorebi-centos for batch editing of config for placement of screensaver wallpaper,
<br>
original source: https://github.com/kurthuwig/docker-ganglia
<br>
this is a WIP to package gangila distributed computing server/client into kali penetration linux as a docker deployment for server and client


wget https://github.com/c4pt000/docker-ganglia-kali-WIP/blob/master/1st_server-kali-ganglia-deploy-server-node.sh


port 80, 53, 8649

dependent with current configs

sh 1st_server-kali-ganglia-deploy-server-node.sh

<br>
point to this once running the main node
<br>
http://127.0.0.1/ganglia/

(if no firefox, firedog, firecat, firerat)
<br>
use chrome to browse http://127.0.0.1/ganglia
<br>
should be active for localhost server node
<br>
<br>



for each client node machine hopefully lan
<br><br>
client instance
root@kali:/# ps ax | grep mon
    121 ?        Rsl    0:22 /usr/sbin/gmond --pid-file /var/run/gmond.pid
    140 pts/1    S+     0:00 grep mon
root@kali:/# 
<br><br>

<br>
<br>

https://github.com/ganglia/monitor-core/wiki/Ganglia-Quick-Start#Installation
<br>
WIP
<br>
ganglia running under docker kali images with ganglia enabled
<br>
* image 1 main image as master or main controlling node
<br>
docker ganglia main monitor
<br>
* distributed computing via Docker deployable
<br>
* image 2-> etc multiple deployable image each image acts as a client connection to send resources to image 1 each of these 
<br>
images is a secondary node or slave node to distribute resources to main node "image 1" being the master node
<br>
docker ganglia deployable client to connect to main monitor
<br>

docker build .
<br>
Supported tags and respective `Dockerfile` links
================================================

 - [`latest` (*latest/Dockerfile*)](https://github.com/kurthuwig/docker-ganglia/blob/master/Dockerfile)

What is ganglia?
================

[Ganglia](http://ganglia.info/) is a scalable distributed monitoring system for high-performance computing systems such as clusters and Grids. It is based on a hierarchical design targeted at federations of clusters. It leverages widely used technologies such as XML for data representation, XDR for compact, portable data transport, and RRDtool for data storage and visualization. It uses carefully engineered data structures and algorithms to achieve very low per-node overheads and high concurrency. The implementation is robust, has been ported to an extensive set of operating systems and processor architectures, and is currently in use on thousands of clusters around the world. It has been used to link clusters across university campuses and around the world and can scale to handle clusters with 2000 nodes.

Installation
============

This docker image needs a persistent storage to store its configuration and data.
The corresponding docker command would be

    docker run \
      -d \
      -v /path_to_directory/etc:/etc/ganglia \
      -v /path_to_directory/data:/var/lib/ganglia \
      -p 127.0.0.1:80:80 \
      -p 8649:8649 \
      -p 8649:8649/udp \
      kurthuwig/ganglia:latest

and the corresponding [docker-compose](http://docs.docker.com/compose/) (or [fig](http://www.fig.sh/)) file would be

    ganglia:
      image: kurthuwig/ganglia:latest
      ports:
       - "127.0.0.1:80:80"
       - "8649:8649"
       - "8649:8649/udp"
      volumes:
       - /path_to_directory/etc:/etc/ganglia
       - /path_to_directory/data:/var/lib/ganglia

If the `etc` directory does not contain a configuration, a default configuration will be created.

Accessing the web GUI
=====================

After launch the web GUI is available at

http://localhost/ganglia/

If you want to access it from the outside, you have to change the `127.0.0.1` to `0.0.0.0` or the IP that you want it to appear on.
If you want to have it on another port, in the same line change the `80` to the desired port, e.g.

    -p 127.0.0.1:8888:80 \

Environment variables
=====================

The container uses no environment variables

Contact
=======

Kurt Huwig (@GMail.com: kurthuwig)
