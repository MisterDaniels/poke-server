FROM ubuntu:latest AS builder

ENV TZ=America/Sao_Paulo

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update
RUN apt install -y cmake build-essential \
    liblua5.2-dev libgmp3-dev libmysqlclient-dev \
    libpugixml-dev libcrypto++-dev libfmt-dev g++ python2-dev \
    autotools-dev libicu-dev libbz2-dev curl tar

RUN curl -o boost_1_60_0.tar.gz https://razaoinfo.dl.sourceforge.net/project/boost/boost/1.60.0/boost_1_60_0.tar.gz && \
    tar -xf boost_1_60_0.tar.gz && \
    cd boost_1_60_0 && \
    ./bootstrap.sh --prefix=/usr/local && \
    ./b2 install

FROM builder AS compiler

ARG DOCKER_WORK_DIR

COPY . $DOCKER_WORK_DIR

RUN mkdir $DOCKER_WORK_DIR/build && cd $DOCKER_WORK_DIR/build && cmake .. && make && mv tfs ..