inline void gdb_loop() {
    fprintf(stdout, "gdb --pid=%d\n", getpid());
    while(1);
}
// To force debug set the variable below to a path of log prefix
//#define FORCE_DEBUG_LOG "/tmp/ramdisk2g/logs/log."

#ifdef FORCE_DEBUG_LOG
    if (true) {
        FILE *f;
        std::stringstream ss;
        ss<<FORCE_DEBUG_LOG<<getpid();
        f = fopen(ss.str().c_str(), "a");
        va_list va;
        va_start(va, fmt);
        vsnprintf(buffer, sizeof(buffer) - 1, fmt, va);
        va_end(va);
        fprintf(f, "%s\n", buffer);
        fclose(f);
    return;
    }
#endif

