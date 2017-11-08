if [ -z $TOPDIR ]; then
    echo "error TOPDIR is not defined."
    exit 1;
fi

. $ENV_SCRIPT_PATH/util.sh

BUILD_DIR=$TOPDIR/build

ASSEMBLY_LINE=$BUILD_DIR/assembly_line

libcap() {
    echo "libcap is called"
    echo "$TOPDIR"
    runCmd "cd ${TOPDIR}/libcap"
    runCmd "make clean"
    runCmd "make prefix=$ASSEMBLY_LINE install"
}

boost() {
    echo "boost is called"
    echo "$TOPDIR"
    runCmd "cd ${TOPDIR}/boost"
    runCmd "./bootstrap.sh --prefix=$ASSEMBLY_LINE --without-icu"
    runCmd "./b2"
}


curl() {
    echo "curl is called"
    echo "$TOPDIR"
    runCmd "cd ${TOPDIR}/curl"
    runCmd "./configure --prefix=$ASSEMBLY_LINE --with-pic --disable-shared"
    runCmd "make clean"
    runCmd "make"
    runCmd "make install"
}

pcre2() {
    echo "pcre2 is called"
    echo "$TOPDIR"
    runCmd "cd ${TOPDIR}/pcre2"
    runCmd "./configure --prefix=$ASSEMBLY_LINE --with-pic --disable-shared"
    runCmd "make clean"
    runCmd "make"
    runCmd "make install"
}

pcre() {
    echo "pcre is called"
    echo "$TOPDIR"
    runCmd "cd ${TOPDIR}/pcre"
    runCmd "./configure --prefix=$ASSEMBLY_LINE --with-pic --disable-shared"
    runCmd "make clean"
    runCmd "make"
    runCmd "make install"
}

sqlite3() {
    echo "sqlite3 is called"
    echo "$TOPDIR"
    runCmd "cd ${TOPDIR}/sqlite3"
    runCmd "./configure --prefix=$ASSEMBLY_LINE --with-pic --disable-shared"
    runCmd "make clean"
    runCmd "make"
    runCmd "make install"
}

libwebsockets () {
    echo "libwebsockets is called"
    echo "$TOPDIR"
    runCmd "rm -rf ${BUILD_DIR}/stage-libwebsockets"
    runCmd "mkdir -p ${BUILD_DIR}/stage-libwebsockets"
    runCmd "cd ${BUILD_DIR}/stage-libwebsockets"
    runCmd "cmake ${TOPDIR}/libwebsockets \
             -DCMAKE_BUILD_TYPE=Debug \
             -DCMAKE_INSTALL_PREFIX=$ASSEMBLY_LINE \
           "
    runCmd "make"
    runCmd "make install"
}

cppcms () {
    echo "cppcms is called"
    echo "$TOPDIR"
    runCmd "rm -rf ${BUILD_DIR}/stage-cppcms"    
    runCmd "mkdir -p ${BUILD_DIR}/stage-cppcms"
    runCmd "cd ${BUILD_DIR}/stage-cppcms"
    runCmd "cmake ${TOPDIR}/cppcms \
             -DCMAKE_BUILD_TYPE=Debug \
             -DCMAKE_INSTALL_PREFIX=$ASSEMBLY_LINE \
             -DCMAKE_CXX_FLAGS=-fPIC \
             -DDISABLE_SHARED=ON \
             -DDISABLE_OPENSSL=ON \
             -DDISABLE_GCRYPT=ON \
             -DDISABLE_CACHE=OFF \
             -DDISABLE_ICU_LOCALE=ON \
             -DDISABLE_TCPCACHE=ON \
           "
    runCmd "make"
    runCmd "make install"
}

cppdb () {
    echo "cppdb is called"
    runCmd "rm -rf ${BUILD_DIR}/stage-cppdb"    
    runCmd "mkdir -p ${BUILD_DIR}/stage-cppdb"
    runCmd "cd ${BUILD_DIR}/stage-cppdb"
    runCmd "cmake ${TOPDIR}/cppdb \
             -DCMAKE_BUILD_TYPE=Debug \
             -DCMAKE_INSTALL_PREFIX=$ASSEMBLY_LINE \
             -DDISABLE_SHARED=ON \
             -DSQLITE_BACKEND_INTERNAL=ON \
             -DSQLITE3_LIB=$ASSEMBLY_LINE/lib/libsqlite3.a \
             -DSQLITE3_PATH=$ASSEMBLY_LINE/include \
             -DDISABLE_MYSQL=ON \
             -DDISABLE_PQ=ON \
             -DDISABLE_ODBC=ON
           " 
    runCmd "make"
    runCmd "make install"
}

discount () {
    echo "discount is called"
    runCmd "cd ${TOPDIR}/discount"
    runCmd "./configure.sh \
             --prefix=$ASSEMBLY_LINE \

           " 
    runCmd "make"
    runCmd "make install"
}


wikipp () {
    echo "wikiapp is called"
    runCmd "rm -rf ${BUILD_DIR}/stage-wikipp"    
    runCmd "mkdir -p ${BUILD_DIR}/stage-wikipp"
    runCmd "cd ${BUILD_DIR}/stage-wikipp"
    runCmd "cmake ${TOPDIR}/wikipp \
             -DCMAKE_BUILD_TYPE=Debug                   \
             -DCMAKE_INSTALL_PREFIX=$ASSEMBLY_LINE \
             -DTMPLCC=$ASSEMBLY_LINE/bin/cppcms_tmpl_cc \
             -DCPPCMS=$ASSEMBLY_LINE/lib/libcppcms.a    \
             -DCPPCMS_INC=$ASSEMBLY_LINE/include        \
             -DBOOSTER=$ASSEMBLY_LINE/lib/libbooster.a  \
             -DBOOSTER_INC=$ASSEMBLY_LINE/include       \
             -DCPPDB=$ASSEMBLY_LINE/lib/libcppdb.a      \
             -DCPPDB_INC=$ASSEMBLY_LINE/include         \
             -DDISCOUNT=$ASSEMBLY_LINE/lib/libmarkdown.a    \
             -DDISCOUNT_INC=$ASSEMBLY_LINE/include      \
             -DSQLITE3=$ASSEMBLY_LINE/lib/libsqlite3.a    \
             -DPCRE=$ASSEMBLY_LINE/lib/libpcre.a    \
           " 
    runCmd "make VERBOSE=0"
    runCmd "make install"
}


cppblog () {
    echo "cppblog is called"
    runCmd "rm -rf ${BUILD_DIR}/stage-cppblog"
    runCmd "mkdir -p ${BUILD_DIR}/stage-cppblog"
    runCmd "cd ${BUILD_DIR}/stage-cppblog"
    runCmd "cmake ${TOPDIR}/cppblog \
             -DCMAKE_BUILD_TYPE=Debug                   \
             -DCMAKE_INSTALL_PREFIX=$ASSEMBLY_LINE \
             -DEXE_TMPL_CC=$ASSEMBLY_LINE/bin/cppcms_tmpl_cc \
             -DEXE_SQLITE3=$ASSEMBLY_LINE/bin/sqlite3 \
             -DLIB_CPPCMS=$ASSEMBLY_LINE/lib/libcppcms.a    \
             -DINC_CPPCMS=$ASSEMBLY_LINE/include        \
             -DLIB_BOOSTER=$ASSEMBLY_LINE/lib/libbooster.a  \
             -DINC_BOOSTER=$ASSEMBLY_LINE/include       \
             -DLIB_CPPDB=$ASSEMBLY_LINE/lib/libcppdb.a      \
             -DINC_CPPDB=$ASSEMBLY_LINE/include         \
             -DLIB_MARKDOWN=$ASSEMBLY_LINE/lib/libmarkdown.a    \
             -DINC_MARKDOWN=$ASSEMBLY_LINE/include      \
             -DUSE_STATIC_VIEW=ON  \

           " 
    runCmd "make VERBOSE=1"
    runCmd "make install"
}


stensalio () {
    echo "stensalio is called"
    runCmd "rm -rf ${BUILD_DIR}/stage-stensalio"
    runCmd "mkdir -p ${BUILD_DIR}/stage-stensalio"
    runCmd "cd ${BUILD_DIR}/stage-stensalio"
    runCmd "cmake ${TOPDIR}/stensalio \
             -DCMAKE_BUILD_TYPE=Debug              \
             -DCMAKE_INSTALL_PREFIX=${ASSEMBLY_LINE} \

           "
    runCmd "make VERBOSE=1"
    runCmd "make install"
}

cattleshed () {
    echo "cattleshed is called"
    runCmd "rm -rf ${BUILD_DIR}/stage-cattleshed"
    runCmd "mkdir -p ${BUILD_DIR}/stage-cattleshed"
    runCmd "cd ${BUILD_DIR}/stage-cattleshed"
    runCmd "cmake ${TOPDIR}/cattleshed \
             -DCMAKE_BUILD_TYPE=Debug              \
             -DCMAKE_INSTALL_PREFIX=${ASSEMBLY_LINE} \
             -DCMAKE_CXX_FLAGS=-DSYSCONFDIR=\"${ASSEMBLY_LINE}/etc\" \
           "
    runCmd "make VERBOSE=1"
}
