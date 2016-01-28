export GOPATH=~/work/sherlock/goproj:~/work/sherlock/godeps
cd ~/work/sherlock/goproj/src/github.com/couchbase/indexing/secondary/tests/largedatatests/
~/work/sherlock/ns_server/cluster_connect -n2 -s 1500 -T n0:kv,n1:kv+index && sleep 40 && go test -v -timeout 4000s
