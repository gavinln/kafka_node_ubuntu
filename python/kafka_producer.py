from kafka import SimpleProducer, KafkaClient
import os

from docker_utils import getDockerKafkaPorts

ports = getDockerKafkaPorts()

if len(ports) > 0:
    # To send messages synchronously
    host = os.environ['KAFKA_ADVERTISED_HOST_NAME']
    kafka = KafkaClient(host + ":" + str(ports[0]))
    producer = SimpleProducer(kafka)

# Note that the application is responsible for encoding messages to type str
    producer.send_messages("my-topic", "some message")
    producer.send_messages("my-topic", "this method", "is variadic")

    kafka.close()
else:
    print('No Docker container with Kafka broker ports found.')
