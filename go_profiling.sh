GOMAXPROCS=4 ./bleve-bench -count=1000 -config=configs/forestdb-1GB-buffer-cache.json -cpuprofile=forestdb-cpu-profile.out
go tool pprof --pdf ./cmd.test /dev/shm/plasma_open_prof.out  > /dev/shm/callgraph2.pdf
go tool pprof ./bleve-bench forestdb-cpu-profile.out

import (
    "github.com/t3rm1n4l/misc-tools/profserver"
    )

func init() {
        profserver.Init(":6060")
}
