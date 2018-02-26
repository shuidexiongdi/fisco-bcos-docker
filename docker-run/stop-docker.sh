#! /bin/sh
set -e

#容器名称，与run中配置保持一致
contianer_name="fisco-bcos"

echo -e "正在尝试关闭容器："$contianer_name" ..."

docker stop $contianer_name

echo -e "已关闭"
