To setup the zsh
1. Start zsh
zsh
cd /vagrant/scripts
./zsh_setup.sh

Setup environment for docker to run
source /vagrant/scripts/kafka_docker_setup.sh

Start Zookeeper & Kafa
fig up -d

Start Kafka shell

Start two Kafka shells
./start-kafka-shell.sh $KAFKA_ADVERTISED_HOST_NAME $KAFKA_ADVERTISED_HOST_NAME:2181
cd $KAFKA_HOME

Start producer in one Kafka shell
bin/kafka-topics.sh --create --topic topic --partitions 4 --zookeeper $ZK --replication-factor 1
bin/kafka-topics.sh --describe --topic topic --zookeeper $ZK
bin/kafka-console-producer.sh --topic=topic --broker-list=`broker-list.sh`

Start consumer in another Kafka shell
bin/kafka-console-consumer.sh --topic=topic --zookeeper=$ZK

Type lines in producer shell to send to consumer



Start tmux
tmux

Split window by typing: Ctrl+B "
Switch panes by typing: Ctrl+B O
Scroll by typing: Ctrl+B [

Start Docker without sudo
sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo service docker restart


