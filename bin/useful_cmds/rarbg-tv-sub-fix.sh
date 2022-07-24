#!/bin/bash

set -euo pipefail

for i in *.mp4; do n=${i%.mp4}; s=$(/bin/ls -1 --sort=size Subs/$n/*_English.srt | tail -n1); cp $s $n.srt; done
