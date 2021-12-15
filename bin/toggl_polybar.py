#!/usr/bin/env python3

from random import randint, random
import subprocess
from time import sleep


sleep(randint(0, 5) + random())
process = subprocess.run(["toggl", "now"], stdout=subprocess.PIPE)
output = process.stdout.decode("utf-8")
try:
    result = [s.strip() for s in output.split("\n")]
    if result[0].startswith("An error"):
        error, title, *rest = result
    else:
        title, *rest = result
    title = title.split("#")[0].strip()
    data = {r.split(":", 1)[0]: r.split(":", 1)[-1].strip() for r in rest}
    if len(title) > 20:
        short_title = f"{title[:20]}..."
    else:
        short_title = title
    project = data["Project"].split("(")[0].strip()
    duration = data["Duration"]
    display = f" {short_title} [{project}]: {duration}"
except:
    display = " Start tracking!"

print(display)
