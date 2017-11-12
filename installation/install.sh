#!/bin/bash
mypath=$(dirname $(readlink -f $0))

echo "create the build environment"
docker image build -t webapp_docker ${mypath}

echo "build the code in the build environment"
docker run --rm -it -v ${mypath}/../../webapp:/root/webapp webapp_docker /root/webapp/installation/build_all.sh

echo "prepare build cattleshed execution environment"
cd ${mypath}/../cattleshed/docker
./get_bin.sh

echo "prepare build cattleshed execution environment"
cd ${mypath}/../stensalio/docker
./get_bin.sh ${mypath}/../build/stage-stensalio

cd ${mypath}
docker-compose build
