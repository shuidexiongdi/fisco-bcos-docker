#! /bin/sh
set -e

host="10.60.248.41:5000"
image_name="fisco-bcos"
version="1.0"

docker build -t=$host"/"$image_name":"$version . &
