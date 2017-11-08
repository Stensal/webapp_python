#!/bin/bash
mypath=$(dirname $(readlink -f $0))

for i in pcre sqlite3; do
   pushd $i
   autoreconf -ivf
   popd
done

${mypath}/sbuild.sh boost \
&& ${mypath}/sbuild.sh libcap \
&& ${mypath}/sbuild.sh pcre \
&& ${mypath}/sbuild.sh sqlite3 \
&& ${mypath}/sbuild.sh cppdb \
&& ${mypath}/sbuild.sh curl \
&& ${mypath}/sbuild.sh sqlite3 \
&& ${mypath}/sbuild.sh cppcms 
