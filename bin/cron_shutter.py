#!/usr/bin/env python3

import os
import psutil
import subprocess
import sys
import time


def internet_blocker(files):
    for file in files:
        stats = os.stat(file)
        last_modified= time.time() - stats.st_mtime
        if last_modified < (36 * 60 * 60):
            subprocess.run(["shutdown", "-P", "now"])

def killer_shutter():
    flag = False
    for pid in psutil.pids():
        p = psutil.Process(pid)
        if len(p.cmdline()) > 1 and "killer.sh" in p.cmdline()[1]:
            flag = True
    if not flag:
        subprocess.run(["shutdown", "-P", "now"])

if __name__ == "__main__":
    FILES = sys.argv[1:]
    internet_blocker(FILES)
    killer_shutter()
