#!/bin/bash
# kill all processes

sudo killall -q ptp4l
killall -q aes67-daemon
while killall -0 aes67-daemon 2>/dev/null ; do
  sleep 1
done
