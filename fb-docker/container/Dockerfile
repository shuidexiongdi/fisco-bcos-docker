# Version: 1.0
# 选择基础镜像centos
FROM centos:7.3.1611

# 维护者信息
LABEL user="dengjob@163.com" type='fisco env'

# install dependencies
RUN yum install -y -q epel-release \
    && yum clean all

#install leveldb-devel after "epel" installed
RUN yum install -y leveldb-devel \
                   libmicrohttpd-devel \
    && yum clean all 

# install gosu , allow the container to be started with non-root user
ENV GOSU_VERSION 1.10
RUN set -ex \
	&& yum -y -q install wget dpkg \
	
	&& dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')" \
	&& wget -O /usr/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch"  \
	&& wget -O /tmp/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc" \
	
# verify the signature
	&& export GNUPGHOME="$(mktemp -d)" \
	&& gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
	&& gpg --batch --verify /tmp/gosu.asc /usr/bin/gosu \
	&& rm -r "$GNUPGHOME" /tmp/gosu.asc \
	
	&& chmod +x /usr/bin/gosu  \
# verify that the binary works
	&& gosu nobody true  \
	
	&& yum -y remove wget dpkg \
	&& yum clean all

# copy file
COPY ./fisco-bcos-file/fisco-bcos /usr/local/bin/


#non-root user
RUN groupadd bcos \
    && useradd -r -g bcos bcos \
    && mkdir -p /bcos-data \
    && chown -R  bcos /bcos-data

#default run
ENTRYPOINT [ "fisco-bcos" ]
