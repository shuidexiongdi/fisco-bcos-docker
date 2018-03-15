# Version: 1.0
# 选择基础镜像centos
FROM centos:7.3.1611

# 维护者信息
LABEL user="dengjob@163.com" type='create node env'

# install dependencies
RUN yum -y -q install epel-release 
RUN yum -y install \
	make \
        gcc-c++ \
        boost-devel \
        leveldb-devel \
        curl-devel \
        libmicrohttpd-devel \
        gmp-devel \
	deltarpm \
        openssl openssl-devel \
	&& yum clean all

#install tmp tool
RUN yum install -y git \
	wget \
	&& yum clean all

#install nodejs
RUN curl -sL https://rpm.nodesource.com/setup_8.x | bash - \
	&& yum install -y nodejs \
	&& node -v \
	&& npm -v \
	&& npm install -g babel-cli babel-preset-es2017 ethereum-console \
	&& echo '{ "presets": ["es2017"] }' > ~/.babelrc

#install fisco-solc
RUN wget https://github.com/FISCO-BCOS/FISCO-BCOS/raw/master/fisco-solc \
	&& cp fisco-solc  /usr/bin/fisco-solc \
	&& chmod +x /usr/bin/fisco-solc \
	&& rm fisco-solc

# install cmake
RUN wget https://cmake.org/files/v3.7/cmake-3.7.1-Linux-x86_64.tar.gz \
	&& tar zxvf cmake-3.7.1-Linux-x86_64.tar.gz \
	&& echo "export PATH=$PATH:/cmake-3.7.1-Linux-x86_64/bin" >> /root/.bashrc \
	&& source /root/.bashrc \
	&& rm cmake-3.7.1-Linux-x86_64.tar.gz

#uninstall tmp tool
#RUN yum remove git wget

COPY ./fisco-bcos-source/package.json /npm-install/

RUN cd /npm-install \
	&& npm install 

#install fisco-bcos
#RUN mkdir -p /mydata \
#	&&  mkdir -p /mydata \
#	&& cd /mydata && git clone https://github.com/FISCO-BCOS/FISCO-BCOS.git \
#	&& cd FISCO-BCOS && chmod +x scripts/install_deps.sh \
#	&& ./scripts/install_deps.sh \
#	&& mkdir -p build \
#	&& cd build/ \
#  #export cmake to use
# 	&& echo "export PATH=$PATH:/cmake-3.7.1-Linux-x86_64/bin" >> /root/.bashrc && source /root/.bashrc \
#	&& cmake  -DEVMJIT=OFF -DTESTS=OFF -DMINIUPNPC=OFF .. \
#	&& make && make install

COPY ./fisco-bcos-source/fisco-bcos /usr/local/bin/fisco-bcos
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
