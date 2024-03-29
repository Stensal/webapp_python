#!/bin/bash
mypath=$(dirname $(readlink -f $0))

cd ${mypath}/../
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

rm ${mypath}/../build/assembly_line/lib/libboost_*.so

${mypath}/sbuild.sh cattleshed
${mypath}/sbuild.sh stensalio

# build cppcms php integration
cd ${mypath}/../cppcms/contrib/integration/session/php/php5
env CPPCMS_PATH=${mypath}/../build/assembly_line ./build_ext.sh
