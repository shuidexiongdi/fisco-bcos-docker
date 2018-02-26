用法说明：

run-docker.sh: 
	需用sudo. 启动容器之用，容器之初，由它启动，后restart才可用.
stop-docker.sh: 
	需用sudo. 容器停止之用，容器仅停止，数据等并未删除，重启即可使用.
restart-docker.sh: 
	用sudo. 容器重启之用，只有在run过之后，重启才有效，回复run时的状态.
clean-docker.sh: 
	用sudo. 容器清理之用，将停止容器，并删除容器，同时清理容器数据，如果其他容器与它公用一个目录，数据也将被删除，仅限开发或测试自用，不可用于生产！！


如通过私有仓库下载镜像时，出现http访问https的错误提示，可如下处理：
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

