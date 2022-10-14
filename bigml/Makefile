cleanup:
	./scripts/cleanup.sh
start-ptp:
	sudo /usr/sbin/ptp4l -i lo -l7 -E -S &

stop-pulseaudio:
	./scripts/pulseaudio-stop.sh

install-kernel:
	./scripts/kernel-module.sh

daemon: cleanup start-ptp stop-pulseaudio install-kernel
	../daemon/aes67-daemon -c ../bigml/daemon.conf
