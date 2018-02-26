#! /bin/sh
set -e

#注意，此脚本将清理环境，包括数据和日志，仅限开发和测试环境自用！

#容器名称，与run中配置保持一致
contianer_name="fisco-bcos"

#宿主日志路径，与run中配置保持一直
#local仅测试环境使用，生产要使用固定路径，不可使用与用户绑定的路径
local=$HOME
log_dir=$local"/log-fisco-bcos"

echo -e "正在尝试关闭容器："$contianer_name" ..."

docker stop $contianer_name

echo -e "------已关闭-------"

echo -e "正在尝试删除容器："$contianer_name" ..."

docker rm $contianer_name

echo -e "------已删除-------"

echo -e "正在尝试清理日志："$log_dir"/* ..."

rm -rf $log_dir/*

echo -e "------已清理-------"
