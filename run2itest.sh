# go get github.com/google/uuid
# go get github.com/prataprc/goparsec
# go get github.com/prataprc/monster
# edit tests/config/build_validation.json IndexUsing to plasma

echo "go is available at ~/.cbdepscache/exploded"
if [ $# -gt 0 ]; then
    ROOTDIR=$1
else
    ROOTDIR=`pwd`/../../../../../../../../
fi
echo "Root dir is $ROOTDIR"
ulimit -n 65535
export STORAGE=plasma
export WORKSPACE=.
export GOPATH=$ROOTDIR/godeps:$ROOTDIR/goproj
export GOROOT=~/.cbdepscache/exploded/x86_64/go-1.9.6/go/
export CBAUTH_REVRPC_URL="http://Administrator:asdasd@127.0.0.1:9000/query"
export CGO_CFLAGS="-I$ROOTDIR/forestdb/include -I$ROOTDIR/sigar/include -I$ROOTDIR/build/tlm/deps/curl.exploded/include"
export CGO_LDFLAGS="-L $ROOTDIR/install/lib"
export LD_LIBRARY_PATH=$ROOTDIR/install/lib

#go test -v -timeout 4000s -test.run TestScanWithNoTimeout
#cd $ROOTDIR/goproj/src/github.com/couchbase/indexing/secondary/tests/largedatatests/

cat /dev/shm/clustrun_pipe && sleep 15 && $ROOTDIR/ns_server/cluster_connect -n2 -s 1500 -I 1500 -T n0:kv+n1ql,n1:kv+index && sleep 40 && go test -timeout 4h -v -cbconfig ../config/buildtest_$STORAGE.json -useclient n1ql 2>&1 | tee -a $WORKSPACE/test.log

