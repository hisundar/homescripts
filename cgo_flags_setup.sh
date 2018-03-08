export CGO_CFLAGS="-I/root/sundar/couchbase/forestdb/include"
export CGO_CFLAGS="-I/root/sundar/couchbase/sigar/include"
export CGO_LDFLAGS="-L /root/sundar/couchbase/install/lib"
export LD_LIBRARY_PATH=/root/sundar/couchbase/install/lib

go test -v -test.run TestSimpleIndex_StringDataType -cbconfig ../config/buildtest_plasma.json

the next time you run, if you dont want setup to be run, (flush bucket, drop all indexes etc), pls use -skipsetup true flag
