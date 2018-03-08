echo "go is available at ~/.cbdepscache/exploded"
if [ $# -gt 0 ]; then
    ROOTDIR=$1
else
    ROOTDIR=`pwd`/../../../../../../../../
fi
echo "Root dir is $ROOTDIR"
export GOPATH=$ROOTDIR/goproj:$ROOTDIR/godeps
export GOROOT=~/.cbdepscache/exploded/x86_64/go-1.8/go/
export CBAUTH_REVRPC_URL="http://Administrator:asdasd@127.0.0.1:9000/query"
#go test -v -timeout 4000s -test.run TestScanWithNoTimeout
#cd $ROOTDIR/goproj/src/github.com/couchbase/indexing/secondary/tests/largedatatests/
cat /dev/shm/clustrun_pipe && sleep 15 && $ROOTDIR/ns_server/cluster_connect -n2 -s 1500 -I 1500 -T n0:kv,n1:kv+index && sleep 40 && go test -v -timeout 4000s | tee op1.log; go test -v -timeout 4000s | tee op2.log

export CGO_CFLAGS="-I$ROOTDIR/forestdb/include -I$ROOTDIR/sigar/include"
export CGO_LDFLAGS="-L $ROOTDIR/install/lib"
export LD_LIBRARY_PATH=$ROOTDIR/install/lib
