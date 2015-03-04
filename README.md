kafka_node_ubuntu
=================

* Source code - [Github][1]
* Author - Gavin Noronha - <gavinln@hotmail.com>

[1]: https://github.com/gavinln/kafka_node_ubuntu.git

About
-----

This project provides a [Ubuntu (14.04)][2] [Vagrant][3] Virtual Machine (VM)
with [Docker][4] containers to host [Kafka][5] and [Zookeeper][6]. It also has
[Node.js][7] installed to support Javascript clients.

[2]: http://releases.ubuntu.com/14.04/
[3]: http://www.vagrantup.com/
[4]: https://www.docker.com/
[5]: http://kafka.apache.org/
[6]: http://zookeeper.apache.org/
[7]: http://nodejs.org/


There are [Puppet][8] scripts that automatically install the software when the
VM is started.

[8]: http://puppetlabs.com/

Running
-------

1. To start the virtual machine(VM) type

    ```
    vagrant up
    ```

2. Connect to the VM

    ```
    vagrant ssh
    ```

3. Add the current user to the Docker group

    ```bash
    sudo gpasswd -a ${USER} docker
    ```

4. Type exit to logout and login to the VM as in step 2

5. Change to the Kafka directory

    ```bash
    cd /vagrant/docker/kafka
    ```
6. Setup the environment for Kafka

    ```bash
    source /vagrant/scripts/kafka_docker_setup.sh
    ```

7. Start Zookeeper and Kafka

    ```bash
    fig up -d
    ```

8. Start the producer Kafka shell

    ```bash
    ./start-kafka-shell.sh $KAFKA_ADVERTISED_HOST_NAME $KAFKA_ADVERTISED_HOST_NAME:2181
    cd $KAFKA_HOME
    ```

9. Start the consumer Kafka shell by repeating steps 2, 5, 6, and 8

10. Run the shell producer by executing the following lines

    ```bash
    bin/kafka-topics.sh --create --topic topic --partitions 4 --zookeeper $ZK --replication-factor 1
    bin/kafka-topics.sh --describe --topic topic --zookeeper $ZK
    bin/kafka-console-producer.sh --topic=topic --broker-list=`broker-list.sh`
    ```

11. Run the shell consumer by executing the following lines

    ```bash
    bin/kafka-console-consumer.sh --topic=topic --zookeeper=$ZK
    ```

12. Type lines in the producer shell to send to the consumer

13. Type Ctrl+C followed by "exit" to exit the producer and consumer shells

14. Type `exit` to quit the virtual machine

15. To halt the VM type (fast to startup after a halt command)

    ```
    vagrant halt
    ```

16. To destroy the VM (slow to create VM after a destroy command)

    ```
    vagrant destroy
    ```

Requirements
------------

The following software is needed to get the software from github and run
Vagrant. The Git environment also provides an [SSH client][9] for Windows.

* [Oracle VM VirtualBox][10]
* [Vagrant][11]
* [Git][12]

[9]: http://en.wikipedia.org/wiki/Secure_Shell
[10]: https://www.virtualbox.org/
[11]: http://vagrantup.com/
[12]: http://git-scm.com/

