#! /bin/sh
set -e

#/bcos-data/node0/start0.sh &
#/bcos-data/node1/start1.sh &

FISCOLOG="/bcos-data/log"

if [ $(id -u) = '0' ]; then
	mkdir -p $FISCOLOG
	chown -R bcos $FISCOLOG
	chmod 750 $FISCOLOG
fi

#gosu user 'bcos' to run fisco-bcos
exec gosu bcos fisco-bcos   --genesis /bcos-data/node0/genesis.json --config /bcos-data/node0/config.json &
exec gosu bcos fisco-bcos   --genesis /bcos-data/node1/genesis.json --config /bcos-data/node1/config.json &

wait
