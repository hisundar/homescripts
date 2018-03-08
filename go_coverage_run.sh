go test   -v -coverprofile=/dev/shm/skiplist.out github.com/couchbase/nitro/skiplist -timeout 3000s
go tool cover -html=/dev/shm/cover.out -o /tmp/ramdisk2g/coverage.html

go test -v -test.run TestMossJustLoad -cpuprofile=/dev/shm/compact0.out
go test -v -test.run TestMossJustLoad -cpuprofile=/dev/shm/compact50.out -memprofile /dev/shm/compact50.mem
go tool pprof -tree  -lines moss.test /dev/shm/compact50.mem > /dev/shm/compact50.mem.tree


