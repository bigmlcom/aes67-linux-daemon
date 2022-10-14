# Using AES67 Linux Daemon at BigML

## setup
### build
From the repository root directory, you will need to run the following
scripts:

``` bash
./ubuntu-packages.sh
./build.
```

### daemon setup
From [daemon.conf file](../daemon/daemon.conf) in [daemon
folder](../daemon) and the instructions in [DEVICES](../DEVICES.md) ,
we created our own daemon configuration.

If you want to use this in your local network (not just locally in
your laptop), change the network interface name to your Ethernet card.

Then, just need to run, from this folder, `make daemon`.  When the
daemon is up, open the webui *http://[address:8080]* and do the
following:

- go to **Config** tab and verify that the sample rate is set to 48kHz
  and the TIC frame size @1FS is set to 48 samples
- go to **PTP** tab and verify that the status id *Locked* (it can
  take 30 seconds to appear)
- go to **Sources** tab and add a new Source using the plus button
    * set Codec to L24
    * set Max samples per packet to 48 samples
	* set the number of channels you want
    * press the **Submit** button


## tests
To use this as an `AES67` **transmiter**:

```bash
speaker-test -D plughw:RAVENNA -r 48000 -c 2 -t sine
```

o, from a file

```bash
aplay -D plughw:RAVENNA -r 48000 -c 2 -f S24_3LE test.wav
```

To use this as an `AES67` **receiver**:

- go to the webui, click on the **Browser** tab and wait for the
  transmitter to show up as remote SAP source
- on the webui, select the **Sinks** tab, click on the plus icon to
   add a new Sink, mark the "Use SDP" flag and select the transmitter
   SAP source
- open a shell on the Linux host and start the recording on the RAVENA
  ALSA device. For example:

```bash
arecord -D plughw:RAVENNA -c 2 -f S24_3LE -r 48000 -t wav sink.wav
```
