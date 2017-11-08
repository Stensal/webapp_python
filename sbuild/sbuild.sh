#!/bin/bash
mypath=$(dirname $(readlink -f $0))
ENV_SCRIPT_PATH=$mypath
TOPDIR=$mypath/..

. $mypath/functions.sh

pushd .
$1
popd
