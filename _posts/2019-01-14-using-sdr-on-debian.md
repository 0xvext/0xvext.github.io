---
title: 'Using SDR on Debian'
date: '2019-01-14 17:04:54'
tags: sdr debian
---

Sometimes the instructions don't register, the way they are laid out.

I have a small receive-only SDR USB adapter, and since smart meters are used in my neighborhood, I decided to fire it up and tinker.

The projects that focus on this particular use that I wanted to play with are [rtlamr](https://github.com/bemasher/rtlamr) and [rtlamr-collect](https://github.com/bemasher/rtlamr-collect). These are cool, lightweight solutions to capturing smart meter data.

For whatever reason, my brain had issues with [the setup instructions](https://github.com/bemasher/rtlamr/blob/master/README.md) for rtlamr. I don't think this is really a flaw with the instructions - they do, in fact, include every element that is required for success - but as happens from time to time, my brain was not following the step-by-step, so I had to write a dummy-proof (read: me-proof) version:

1. Don't use Windows
2. Install go: `sudo apt install golang`
3. Download and setup [rtl-sdr](https://osmocom.org/projects/rtl-sdr/wiki/Rtl-sdr)
```
		1. cd /tmp
		2. git clone git://git.osmocom.org/rtl-sdr.git
		3. cd rtl-sdr/
		4. mkdir build
		5. cd build
		6. cmake ../
		7. make
		8. sudo make install
		9. sudo ldconfig
```
4. If, like me, you encounter the following error...
```
		Kernel driver is active, or device is claimed by second instance of librtlsdr.
		In the first case, please either detach or blacklist the kernel module
		(dvb_usb_rtl28xxu), or enable automatic detaching at compile time.
		usb_claim_interface error -6
		Failed to open rtlsdr device #0.
```
... at this point, add the following modules to `/etc/modprobe.d/blacklist.conf` to prevent them from being automatically activated during OS boot
```
blacklist dvb_usb_rtl28xxu
blacklist rtl2832
blacklist rtl2830
```

You might need to reboot or use rmmod to unload them after adding this.

5. Continue with the instructions on the rtlamr repo:
```
		1. go get github.com/bemasher/rtlamr
		2. In a terminal, start the listener with `rtl_tcp`
		3. In another terminal, start the poller with `rtlamr`
```

Unrelated to the above, while I was tinkering with the radio receiver (there are lots of good resources on [rtl-sdr.com](https://www.rtl-sdr.com)), I recalled a cool video I had seen on [Veritasium](https://www.youtube.com/watch?v=CNodxp9Jy4A). This video wasn't news to me when it came out (I had seen Samy's talk in its original form), but the software that Samy was using for demonstration stood out to me. I went back to the video, used "zoom, enhance" (aka I went full screen and squinted a bit) to find the name of the program. That program is called [gqrx](http://gqrx.dk/), and it's really slick. Highly recommend, for those who like to tinker.

Next step: setting up rtlamr-collect!
