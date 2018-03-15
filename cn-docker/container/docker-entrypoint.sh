#! /bin/sh
set -e

ln -s /npm-install/node_modules /mydata/FISCO-BCOS/tool/node_modules

echo "cd .. && mkdir -p build && cd build/ && cmake  -DEVMJIT=OFF -DTESTS=OFF -DMINIUPNPC=OFF .. && make && make install" > build-fisco-bcos.sh && chmod +x build-fisco-bcos.sh 

while true; do
	echo "i'm running..."
	sleep 5
done

wait
