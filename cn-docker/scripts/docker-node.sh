#! /bin/sh
set -e

UP_DOWN="$1"
REBUILD="$2"
COMPOSE_FILE="create-node-compose.yml"

function printHelp () {
	echo "Usage: ./docker-node.sh <start|stop|restart> <-rebuild>"
	echo "       当启动时，加上-rebuild参数，将重新构建docker镜像 "
}


function dockerStart() {
	echo "rebuild:"${REBUILD}
	if [ "${REBUILD}" == "-rebuild" ]; then
	docker-compose -f $COMPOSE_FILE up --build -d 2>&1
	else
	docker-compose -f $COMPOSE_FILE up -d 2>&1
	fi

	if [ $? -ne 0 ]; then
		echo "ERROR !!!! Unable to load the images "
		exit 1
    	fi
    	#docker logs -f create-node
	echo "---------------------------------------------------------------------------------------"
	echo "-----------------------Note: attaching container create-node now!!!!!------------------"
	echo "---------------------------------------------------------------------------------------"
	docker exec -it create-node bash
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




