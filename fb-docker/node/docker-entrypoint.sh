#! /bin/sh
set -e


FISCOLOG="/bcos-data/log"

if [ $(id -u) = '0' ]; then
	#mkdir -p $FISCOLOG
	chown -R bcos $FISCOLOG
	chmod 755 $FISCOLOG
fi

FISCODATA="/bcos-data/nodedata"

if [ $(id -u) = '0' ]; then
        chown -R bcos $FISCODATA
        chmod 755 $FISCODATA
fi

#gosu user 'bcos' to run fisco-bcos
exec gosu bcos fisco-bcos   --genesis /bcos-data/nodedata/genesis.json --config /bcos-data/nodedata/config.json &
#exec gosu bcos /bcos-data/nodedata/start.sh

exec "$@"

wait
