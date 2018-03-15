#! /bin/sh
set -e

UP_DOWN="$1"
COMPOSE_FILE="fisco-compose.yml"

function printHelp () {
	echo "Usage: ./docker-node.sh <start|stop|restart> "
}


function dockerStart() {
	docker-compose -f $COMPOSE_FILE up -d 2>&1
	if [ $? -ne 0 ]; then
		echo "ERROR !!!! Unable to load the images "
		exit 1
    	fi
    	docker logs -f fisco-bcos
}

function dockerStop() {
	docker-compose -f $COMPOSE_FILE down
}


#Create the network using docker compose
if [ "${UP_DOWN}" == "start" ]; then
	dockerStart
elif [ "${UP_DOWN}" == "stop" ]; then ## Clear the network
	dockerStop
elif [ "${UP_DOWN}" == "restart" ]; then ## Restart the network
	dockerStop
	dockerStart
else
	printHelp
	exit 1
fi




