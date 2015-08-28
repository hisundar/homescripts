mkdir -p /tmp/ramdisk2g/sherlock
cd /tmp/ramdisk2g/sherlock
repo init -u git://github.com/couchbase/manifest.git -m sherlock.xml
repo sync -j 4
export GOPATH=`pwd`/goproj:`pwd`/godeps
cd goproj
go get github.com/prataprc/goparsec
cd src/github.com/couchbase/indexing/secondary/tests/functionaltests 
go get -t ./...
cd ../../../../../../../../
make clean
make -j 4
