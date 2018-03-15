目录说明：
source: fisco-bcos源码，可更新替换，无需重新制作镜像
container: 制作镜像需要的资源，其中也里面fisco-bcos作为容器默认的环境。内容可替换，需重新制作镜像
scripts: 服务脚本和容器启停脚本
output: 映射到容器里面的/output，容器内部生成文件并将文件拷贝至/output时，共享到宿主

