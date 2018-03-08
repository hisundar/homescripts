cat fts_diag.json | jq '.["/debug/pprof/goroutine?debug=2"] | split("\n")' > stacktrace.log
