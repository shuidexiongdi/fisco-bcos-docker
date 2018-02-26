目录说明：
1. fisco-bcos-file,里面有fisco-bcos编译后的文件，和各个node节点的文件，及节点启动脚本
2. Dockerfile，构建镜像为脚本，里面有版本号，和构建过程
3. build.sh，执行构建的脚本，可直接执行

构建之前需要准备的文件：
1. fisco-bcos编译后的文件，如有更新，则将更新的文件替换原先的文件
2. 各node节点文件，里面有各个node的创世块配置文件、一般配置文件和各种证书等
需确保有如下文件：
证书文件（node/data）：ca.crt、server.crt、server.key
节点身份文件（node/data）：network.rlp、network.rlp.pub
配置文件（node/）：genesis.json、config.json、log.conf
3. 节点启动脚本，根据node的实际情况提供的启动脚本
