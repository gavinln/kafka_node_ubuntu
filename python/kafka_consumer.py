from kafka import KafkaConsumer

import os
import logging
from docker_utils import getDockerKafkaPorts


logging.basicConfig(level=logging.ERROR)

ports = getDockerKafkaPorts()

if len(ports) > 0:
    # To send messages synchronously
    host = os.environ['KAFKA_ADVERTISED_HOST_NAME']

    # To consume messages
    consumer = KafkaConsumer("my-topic", group_id="my_group",
                             metadata_broker_list=[host + ":" + str(ports[0])])
    for message in consumer:
        # message is raw byte string -- decode if necessary!
        # e.g., for unicode: `message.decode('utf-8')`
        print(message)
else:
    print('No Docker container with Kafka broker ports found.')
