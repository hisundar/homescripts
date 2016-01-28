static volatile int doone;
// install perf
// echo 0 > /proc/sys/kernel/kptr_restrict
#if !defined(WIN32) && !defined(_WIN32)
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/signal.h>
void profile_me () {
    pid_t pid, sid;
    char perf_cmd[256];
    sprintf(perf_cmd, "perf record -p %d -F 2 -g -- sleep 100", getpid());
    fprintf(stderr, "Sigalarm handler invoked! %s", perf_cmd);
    fprintf(stderr, "\n");
    if (!doone) {
        doone = 1;
    } else {
        return;
    }

    pid = fork();
    if (pid > 0) {
        return;
    }
    /* Change the file mode mask */
    umask(0);

    /* Create a new SID for the child process */
    sid = setsid();
    if (sid < 0) {
        exit(EXIT_FAILURE);
    }

    /* Change the current working directory.  This prevents the current
     *  *      *        directory from being locked; hence not being able to remove it. */
    if ((chdir("/dev/shm/")) < 0) {
        printf("Can't change directory\n");
        exit(EXIT_FAILURE);
    }

    /* Redirect standard files to /dev/null */
    freopen( "/dev/null", "r", stdin);
    /*
     *     freopen( "/dev/null", "w", stdout);
     *         freopen( "/dev/null", "w", stderr);
     *         */
    int r = system(perf_cmd);
    if (r < 0) {
        printf("Unable to spawn profiler %s\n", perf_cmd);
        usleep(10000);
        int r = system(perf_cmd);
        if (r < 0) {
            printf("Unable to spawn profiler %s again\n", perf_cmd);
        }
    }
    exit(r);
}

void sigalrm_handler(int sig) {
    profile_me();
}

#ifdef sighandler_t
#define SET_SIGALARM(SECS) \
    sighandler_t _original_handler = signal(SIGALRM, sigalrm_handler); alarm(SECS);

#else

#define SET_SIGALARM(SECS) \
    sig_t _original_handler = signal(SIGALRM, sigalrm_handler); alarm(SECS);

#endif

#define CLEAR_SIGALARM() signal(SIGALRM, _original_handler);
#endif // not windows

LIBFDB_API
fdb_status fdb_set(fdb_kvs_handle *handle, fdb_doc *doc) {
    fdb_status ret;
    SET_SIGALARM(2);
    ret = __fdb_set(handle, doc);
    CLEAR_SIGALARM();
    return ret;
}

