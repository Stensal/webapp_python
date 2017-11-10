#!/bin/bash
mypath=$(dirname $(readlink -f $0))

docker image build -t webapp_docker . 
docker run --rm -it -v ${mypath}/../../webapp:/root/webapp webapp_docker /root/webapp/sbuild/build_all.sh
