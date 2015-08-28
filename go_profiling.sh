GOMAXPROCS=4 ./bleve-bench -count=1000 -config=configs/forestdb-1GB-buffer-cache.json -cpuprofile=forestdb-cpu-profile.out
go tool pprof ./bleve-bench forestdb-cpu-profile.out
