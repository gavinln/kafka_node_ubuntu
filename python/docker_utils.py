from __future__ import print_function
import os
from docker import Client


script_dir = os.path.abspath(os.path.dirname(__file__))


def getDockerKafkaPorts():
    cli = Client(base_url='unix://var/run/docker.sock')

    ports = []
    for container in cli.containers(quiet=True):
        portList = cli.port(container, 9092)
        if portList:
            for portMap in portList:
                ports.append(int(portMap['HostPort']))
    return ports


def main():
    print(getDockerKafkaPorts())
    print('This is a library and should not be run directly')

if __name__ == "__main__":
    main()
