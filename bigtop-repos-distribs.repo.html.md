https://supergsego.com/apache/bigtop/stable/repos/

<br>

cd /etc/apt/sources.list.d/
<br>
wget https://supergsego.com/apache/bigtop/stable/repos/debian9/bigtop.list
<br>
wget https://supergsego.com/apache/bigtop/stable/repos/GPG-KEY-bigtop
<br>
apt-key add GPG-KEY-bigtop
<br>
apt-get update



https://cwiki.apache.org/confluence/display/BIGTOP/How+to+install+Hadoop+distribution+from+Bigtop+0.5.0#HowtoinstallHadoopdistributionfromBigtop0.5.0-Ubuntu(64bit,lucid,precise,quantal)


sudo apt-get install hadoop\* flume-* mahout\* oozie\* whirr-* hive\*

* taken from https://gist.github.com/tonycox/322e8ffa584123f1b498c705cf5d972f

# Install bigtop-utils
sudo apt-get install bigtop-utils

# Install the full Hadoop stack (or parts of it)
sudo apt-get install hadoop\* flume-* oozie\* hive\*

## Running

# Format the namenode
sudo /etc/init.d/hadoop-hdfs-namenode init

# Start the necessary Hadoop services
for i in hadoop-hdfs-namenode hadoop-hdfs-datanode ; do sudo service $i start ; done
sudo service hadoop-yarn-resourcemanager start
sudo service hadoop-yarn-nodemanager start

# Check hadoop fs
sudo hdfs dfs -ls /

# Run hive
hadoop fs -mkdir /tmp
hadoop fs -mkdir /user/hive/warehouse
hadoop -chmod g+x /tmp
hadoop -chmod g+x /user/hive/warehouse

# if dirs have not been created on local fs
# sudo mkdir /var/run/hive
# sudo mkdir /var/lock/subsys

sudo /etc/init.d/hive-server start
