#!/bin/bash
# reinstall kernel module

#uninstall kernel module
if sudo lsmod | grep MergingRavennaALSA > /dev/null 2>&1 ; then
  sudo rmmod MergingRavennaALSA
fi
#install kernel module again
sudo insmod ../3rdparty/ravenna-alsa-lkm/driver/MergingRavennaALSA.ko
