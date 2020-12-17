#!/usr/bin/env python3

import datetime
import os
import random
import subprocess
import sys
import time


def internet_blocker(files):
    for file in files:
        stats = os.stat(file)
        last_modfied = time.time() - stats.st_mtime
        if last_modfied < (3 * 60 * 60):
            subprocess.run(["shutdown", "-P"])

def night_shutter():
    curr_dt = datetime.datetime.now()
    if curr_dt.hour >= 23 or curr_dt.hour <= 3:
        noise = random.randint(-5, 5)
        if curr_dt.minute >= 30:
            if noise < 0:
                h = str(curr_dt.hour)
                t = str(60 - abs(noise))
            else:
                h = str(curr_dt.hour + 1)
                t = str(abs(noise)).zfill(2)
        else:
            h = str(curr_dt.hour)
            t = str(30 + noise)
        shut_time = h + ":" + t
        subprocess.run(["shutdown", "-h", shut_time])


if __name__ == "__main__":
    FILES = sys.argv[1:]
    internet_blocker(FILES)
    night_shutter()
