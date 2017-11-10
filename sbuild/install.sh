#!/bin/bash
mypath=$(dirname $(readlink -f $0))

echo "create the build environment"
docker image build -t webapp_docker ${mypath}

echo "build the code in the build environment"
docker run --rm -it -v ${mypath}/../../webapp:/root/webapp webapp_docker /root/webapp/sbuild/build_all.sh

echo "build cattleshed execution environment"
cd ${mypath}/../cattleshed/docker
./get_bin.sh
docker image build -t cattleshed .
