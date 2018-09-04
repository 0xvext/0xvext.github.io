---
title: 'Cheat sheet: Port mirroring IDS data into a Proxmox VM'
date: '2018-09-03 21:52:01'
tags: cheatsheets proxmox linux mirror
---

# Cheat-sheet version:

~~~ bash
#!/bin/dash

# seconiontap.sh

SECONIONLOG=/root/seconiontap.log

date >> $SECONIONLOG

echo "####################" >> $SECONIONLOG

echo "Clearing any existing mirror..." >> $SECONIONLOG

ovs-vsctl clear bridge vmbr4 mirrors

echo "Creating mirror on vmbr4 for Security Onion..." >> $SECONIONLOG

ovs-vsctl -- --id=@p get port tap202i1 \
-- --id=@m create mirror name=span1 select-all=true output-port=@p \
-- set bridge vmbr4 mirrors=@m >> $SECONIONLOG

echo "Showing existing mirrors..." >> $SECONIONLOG

ovs-vsctl list Mirror >> $SECONIONLOG

echo "####################" >> $SECONIONLOG
~~~
Then, run `crontab -e` and add the following line:
~~~ bash
@reboot sleep 60 && /root/seconiontap.sh
~~~

# Full post:

I've been using [Proxmox](https://www.proxmox.com/en/) as a hypervisor for some time, now. While it is not as reliable as [VMWare ESXi](https://www.vmware.com/products/esxi-and-esx/), it currently has more flexibility in that it supports both [KVM](https://www.linux-kvm.org/page/Main_Page) and [LXC](https://linuxcontainers.org/) containerized virtual instances on the same platform.

For quite some time now, I've been meaning to try out [Security Onion](https://securityonion.net/), but as I am primarily red team, it has taken a back seat for literally years, now. Some recent inspiration from [Eric Conrad](https://www.ericconrad.com/) convinced me to get it set up (which is a breeze, by the way) and start kicking the tires on my home lab. This process was completely smooth on the Security Onion side, but I discovered a little hiccup once I got it installed and configured port mirroring on my network switch: the Proxmox KVM instance running Security Onion wasn't receiving any data.

I spent some time troubleshooting...
![Some time](../../../assets/images/Screenshot-2018-09-03 22-00-12.png)

By this point I have tried everything I can think of, setting up different kinds of bridges ([Linux bridge](https://pve.proxmox.com/wiki/Network_Model#Create_the_bridge_manually) vs. [OVS bridge](https://pve.proxmox.com/wiki/Open_vSwitch)), tried containerized (doesn't work) and KVM instances of SecOnion (works, but no data from bridge), I've tried setting up manual mirroring using multiple different methods that I've found searching online (some of this was confusing, as Proxmox was creating additional network interfaces that I didn't recognize or understand)... Nada, and I'm exhausted.

After going to bed some time later without a resolution, my brain started putting pieces together. I went back to some of the [documentation](https://pve.proxmox.com/wiki/Open_vSwitch) that I had skimmed before, reading thoroughly. A single sentence caught my eye in a way that it hadn't, previously:
![Documentation matters](../../../assets/images/ScreenClip-proxmox.png)
Wait a minute... Proxmox will assign the guest VMs a tap interface... that sounds awful familiar...
![Proxmox OVS tap interfaces](../../../assets/images/ScreenClip-proxmoxtap.png)
And, like that, pieces fall into place in my mind:
![Eureka!](../../../assets/images/Screenshot-2018-09-03 22-51-52.png)

The tap interfaces (which are only visible in the system shell, not in the Proxmox GUI) are added automatically for VMs attached to an OVS-bridge interface (and, I later discovered, those with a VirtIO virtual NIC versus the Intel E1000). The naming convention of the tap interfaces is based on the ID of the VM they are assigned to, with the name "tap<VM-ID>i<interface#>." tap202i0 is the first (0) virtual interface created for VM with ID 202, and tap202i1 is the second such interface. These interfaces are dynamic in their use, but static in their naming. That is, if the VM to which the tap interfaces are assigned is shut down, the interfaces are removed from the Proxmox host, but when the VM is powered back on, the interfaces will be named as they were previously.

My prior searching had uncovered [how to configure port mirroring within an OVS](http://docs.openvswitch.org/en/latest/faq/configuration/), and now that I was equipped with the knowledge of which destination interface to use, I could use the directions effectively:

~~~ bash
$ ovs-vsctl -- --id=@p get port tap202i1 \
    -- --id=@m create mirror name=span1 select-all=true output-port=@p \
    -- set bridge vmbr4 mirrors=@m
~~~

The syntax is a bit clunky, and the linked documentation goes into good detail on it, but in short, this creates a new "Mirror" object named "span1" which will output to the second virtual interface on VM 202 (tap202i1) any traffic it sees coming into the bridge it is part of (in this case, vmbr4). That bridge had been previously configured in the GUI to include a single physical interface. That physical interface, in turn, connects to a network switch that is spanning the appropriate VLAN traffic that I want to feed into the Security Onion sensor.

A quick test in tcpdump shows that the SecOnion VM is receiving all the frames intended, and life is good!

...

...

... Until it isn't. I learned the very next day that Mirror objects configured in an OVS bridge remain until a system reboot. My hypervisor doesn't reboot very often, but I don't want to have to manually enable my IDS every time I perform system updates or have a power outage. So, in the spirit of "if I typed it twice I should have scripted it once," I put together a short script that will run once per reboot with the above OVS commands. It also spits out a little log file in the root folder to keep track of output and any errors.
Since the SecOnion VM takes a few seconds to get started, I added a delay of 60 seconds to make sure the tap interfaces exist when the script runs.

~~~ bash
#!/bin/dash

# seconiontap.sh

SECONIONLOG=/root/seconiontap.log

date >> $SECONIONLOG

echo "####################" >> $SECONIONLOG

echo "Clearing any existing mirror..." >> $SECONIONLOG

ovs-vsctl clear bridge vmbr4 mirrors

echo "Creating mirror on vmbr4 for Security Onion..." >> $SECONIONLOG

ovs-vsctl -- --id=@p get port tap202i1 \
-- --id=@m create mirror name=span1 select-all=true output-port=@p \
-- set bridge vmbr4 mirrors=@m >> $SECONIONLOG

echo "Showing existing mirrors..." >> $SECONIONLOG

ovs-vsctl list Mirror >> $SECONIONLOG

echo "####################" >> $SECONIONLOG
~~~

Then, run `crontab -e` and add the following line:
~~~ bash
@reboot sleep 60 && /root/seconiontap.sh
~~~

This version of the script is designed to live in /root/ since Proxmox has a somewhat limited security model. The log file lives there, too. If I ever revise it to follow more standard installation/log paths, those updates will go into the Github repository version [here](https://github.com/0xvext/proxmox-seconiontap.sh).
