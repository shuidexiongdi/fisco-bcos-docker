#! /bin/sh
set -e

#镜像版本和容器启动名称
images="10.60.248.41:5000/fisco-bcos:1.0"
contianer_name="fisco-bcos"

#镜像里面的可执行文件路径和日志路径
run_fisco="/bcos-data/start_node.sh"
log_fisco="/bcos-data/log"

#宿主机器共享日志路径
#local仅测试环境使用，生产要使用固定路径，不可使用与用户绑定的路径
local=$HOME
log_dir=$local"/log-fisco-bcos"
mkdir -p $log_dir/node0
mkdir -p $log_dir/node1
chmod -R +xr $log_dir

#镜像中fisco-bcos启动端口，本地映射端口默认与镜像中端口保持一致
rpcport1=8645
rpcport2=8646
p2pport1=30403
p2pport2=30404
channelPort1=8991
channelPort2=8992
local_ip="0.0.0.0"

echo -e "--------------区块链docker:"$contianer_name"节点信息--------------"
echo -e "节点信息："
echo -e "  节点名 \tIP\t\trpcport\t\tp2pport\t\tchannelPort\t日志目录"
echo -e "  node0\t\t"$local_ip"\t\t"$rpcport1"\t\t"$p2pport1"\t\t"$channelPort1"\t\t"$log_dir/node0
echo -e "  node1\t\t"$local_ip"\t\t"$rpcport2"\t\t"$p2pport2"\t\t"$channelPort2"\t\t"$log_dir/node1
echo -e "验证区块链节点是否启动："
echo -e "	# ps -ef |grep fisco-bcos"
echo -e "验证一个区块链节点是否连接了另一个："
echo -e "	# cat "$log_dir"/node0/* | grep peers"
echo -e "验证区块链节点是否能够进行共识： "
echo -e "	# tail -f "$log_dir"/node0/* | grep ++++"
echo -e ""
echo -e "尝试启动区块链docker节点..."
docker run --name $contianer_name -v $log_dir:$log_fisco -p $rpcport1:$rpcport1 -p $rpcport2:$rpcport2 -p $p2pport1:$p2pport1 -p $p2pport2:$p2pport2 -p $channelPort1:$channelPort1 -p $channelPort2:$channelPort2 -i $images $run_fisco &


