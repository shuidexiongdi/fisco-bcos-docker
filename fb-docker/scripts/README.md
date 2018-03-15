用法说明：

./docker-node.sh start 启动
./docker-node.sh stop  停止
./docker-node.sh restart 重启

#问题1：如通过私有仓库下载镜像时，出现http访问https的错误提示，可如下处理：
centos:
# sudo vi /etc/sysconfig/docker
定位到OPTIONS='--selinux-enabled...一行，加入 --insecure-registry 私有仓库地址:端口，如下例：
# OPTIONS='--selinux-enabled --log-driver=journald --signature-verification=false --insecure-registry 10.60.248.41:5000'

保存，重启docker服务：
sudo systemctl restart docker

ubuntu:
# cd /etc/docker
新建文件daemon.json
# sudo vi daemon.json
#文件中写入 { "insecure-registries":["10.60.248.41:5000"] }

保存，重启docker服务：
sudo systemctl restart docker

#问题2：避免执行docker命令使用root：
su –
adduser docker #新建docker，用来启停容器
passwd docker
visudo
授权sudo：docker  ALL=(ALL)       ALL
sudo groupadd docker  #新建docker
sudo gpasswd -a docker docker #将docker加入docker
sudo systemctl restart docker

