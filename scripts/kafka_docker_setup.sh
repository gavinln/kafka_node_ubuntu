#!/bin/bash

HOST_IP=$(ip -f inet address show eth1 | grep -o 'inet [0-9\.]\+' | cut -d\  -f 2)

export KAFKA_ADVERTISED_HOST_NAME=$HOST_IP
