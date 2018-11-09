---
title: 'Brakesec Book Club: Hacker Playbook 3 - Chapter 1 notes'
date: '2018-11-08 22:55:48'
tags: brakesec bookclub pentesting study lab dnscat troubleshooting pcap
---

I am participating in the Brakesec Book Club ([@Brakesec](https://twitter.com/brakesec) on twitter for more info). This time around is the [Hacker Playbook 3](http://thehackerplaybook.com/dashboard/) by Peter Kim.

This post will serve as a hybrid of my personal notes, some insights based on my work experience, and a very informal book review, of sorts, mixed up into one.

# Preface
I never read the prior versions of this book, so the preface does a nice job of familiarizing me with what the book is about, what to expect, and a little about the author's experience.

I find the mix of commercial and open source tools a bit surprising, since so many books and courses try to focus only on free/open source. I think it's a nice change though, since some commercial tools are no-brainers once you become a professional pentester (Burp, Cobalt Strike, and Nessus scanner come to mind in this category).

**Reminder not to do things that are illegal. Read the CFAA. Ignore this at your own peril.**

# Intro
Pentesting vs. Red Teaming - If you are a pentester, like I am, the switch to red teaming can be a challenge. For example, I work for a company that does not often conduct what I would call "real" red team exercises. However, you can sometimes incorporate elements of red teaming into a pentest if the client is engaged and interested. For example, with some clients I have performed a pentest, reached the goal condition (DA, sensitive data, etc.) and then with the remaining time repeated my test steps with more of an eye toward "stealth mode" to test detection abilities. This could also be inverted with a focus on stealth first, then gradually getting "louder" until you find the visibility threshold of the client. John Strand has some good insights on this with his "Strive to be caught, after being awesome."

PTES - A great model for freelance testers and those learning. In my limited experience, professional pentest companies will truncate it. Treat it like sculpting: Start with everything, and optimize as you find some steps aren't as necessary. Last edited 2014 so really doesn't appear to be maintained.

# Chapter 1
Mentions [DO](https://www.digitalocean.com) and [AWS](https://aws.amazon.com); [Linode](https://www.linode.com) is also good and has a web interface to SSH (buggy, but nice). [Ionswitch](https://www.ionswitch.com/) has a $3.50 tiny option with 1 GB RAM and 10 GB HDD. Good for simple systems like VPN or DNS, etc.

"... I recommend that you develop your own scripts to set up things such as IPTables rules, SSL certs, tools, scripts and more"

I agree 100% with the author here. The following notes are written second person, but are as much for me as anybody else reading this.

You are unlikely to know somebody else's tool as well as you know your own. PTF (as the example used in the book) is great, but it's TrustedSec's process and the tools they use/have used. It will suit lots of new setup needs, but it may not provide a custom workflow that suits your needs, and if you go with the "install everything" approach, you will have bloat.

As a challenge, think of PTF not as a tool to use but an an example of what you should aspire to make for yourself and your team, or, failing that, a tool to make your own and extend (but make sure you understand the pros and cons of forking).

A downside to just using the commands in the book are you have no idea what all got installed without looking through it all after the fact. You will learn the tools better by adding the ones you need when you identify a specific need. The challenge with Kali is how many tools it includes (overwhelm), and PTF has grown to this same approach. You will also miss errors and not know it until you try to use the tool(s) that had errors.

In the book club discussion one of the participants made the point that it makes sense to either go with Kali and manually install additional tools, or start with Ubuntu (or similar) and use PTF, but not try to mix the two. I think you can use PTF on Kali but you have to be *very* selective in what you try to install; if you try to install a tool that Kali already includes, you will almost certainly break stuff. You still might mess up some dependencies even if you don't.

An example of a challenge with just running the book's commands: during the setup of "intelligence-gathering" modules per the book's instructions: the process opens a config file in vi for entering a VirusTotal API key. There is no context provided, just a file open in vi with a single parameter. Not too hard to figure out, but likely is for a module that won't come up during the book for a while (or at all), so it's a good example of installing bloat that isn't focused to a deliberate purpose.

Another challenge: Some services are started as part of this process that you might not be aware of: kingphisher is set up on port 80 to the world.

postgres is set up on port 5432, though not globally (loopback).

**Set up your default deny inbound.**

I created a script for blocking all and opening inbound ports as needed. It's been a while since I messed with iptables, so it was a good exercise.

Reference: [Digital Ocean]( https://www.digitalocean.com/community/tutorials/iptables-essentials-common-firewall-rules-and-commands).

```bash
# Allow loopback connections
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Allow established and related incoming traffic
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Allow established outgoing traffic
iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT

# Drop invalid input traffic
iptables -A INPUT -m conntrack --ctstate INVALID -j DROP

# Allow SSH from a single IP/range
iptables -A INPUT -p tcp -s <IP>/<CIDR> --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -m conntrack --ctstate ESTABLISHED -j ACCEPT

# Allow HTTP/S from a single IP/range
iptables -A INPUT -p tcp -s <IP>/<CIDR> -m multiport --dports 80,443 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -m multiport --dports 80,443 -m conntrack --ctstate ESTABLISHED -j ACCEPT

# Block all undefined connections to interface
iptables -A INPUT -i eth0 -j DROP

# Save rules as currently set
iptables-save > /etc/iptables/rules.v4

# Install the package that auto-applies the rules in /etc/iptables/rules.v4 at boot
apt install iptables-persistent
```
*Note: The order of the rules as typed above is not optimized. It will work, but logically your most specific rules should come first in the order. As an exercise, re-order them to their most effective.*

I also created a github repo with a scripted version [here](https://github.com/0xvext/iptsetup.sh)

I did zero error handling, and it doesn't support ranges for ports, so make sure your input is valid.

# Sundry

* I noticed that some of the tools installed with PTF are GUI-based (ZAP, e.g.). When you're using a headless server to run tools in, you can use ssh -X to run the binary remotely but render the GUI locally (only from a Linux client machine or SSH program that supports X).

	However, this won't work for java apps like ZAP, and it is subject to latency, so programs with lots of GUI effects or connections with high ping times will not really be usable.

* Observation: The author comments on it being best practice to run not as root; I did this for a year. It's a pain in the ass. If you do it, put your tools in /home/$USER instead of /opt. You will still probably regret it. I don't recommend it anymore, unless you are in a very high-risk high-security implementation.

	Most of the tools we use end up requiring sudo anyway.

* There are lots of good links to reading material and tools in the first chapter, though some of the tools referenced are no longer actively maintained.

* Aggressor is super powerful - The documentation on it is really well done and thorough

* As observed in the book club meeting, the author doesn't do a great job of clarifying what the syntax being provided is for: some of the commands suggested are "install all the things!" and some of them are "install this one specific thing." As the reader, you don't need to take both approaches: if you just follow all the commands in the book in sequence you will break some things by trying to re-install tools that were already installed in the previous steps. Again, it's a better idea to selectively install what you need, rather than the hail mary.

* Registering DNS: godaddy, porkbun, namecheap, others. Just search for who has the best deal; don't renew after the first year for lab stuff (renewals are higher than first registration).Make sure you order one that includes DNS privacy at no extra cost, otherwise your name/address info can be looked up.

* Powershell install was done with PTF based on the commands given, so the manual install instructions are only needed for a one-off setup.

## dnscat2:
(Looks like not really maintained anymore)

**Also seems to crash when I test it through public DNS - works when I go direct.**

I tried looking at the ruby code where the error was being thrown (/opt/dnscat2/server/libs/dnser.rb) but I'm not remotely good enough with ruby to track down the nature of the problem.

**Spoilers: workaround is --no-cache**

### Details:
I think I may have partly figured out the issue I was having with dnscat2 in our meeting last night. I don't fully understand it yet, but I think it is partly related to DNSSEC functionality (which I don't think dnscat2 supports).

There is a lot of conjecture here, and I'm filling in gaps without full understanding of it yet, but when I compare a pcap of the direct session (doesn't crash, but connects from client straight to server) to a pcap that goes through DNS infrastructure (crashes server process), the difference I can see is that there are references to DNSSEC in the latter.

DNSSEC is an extension to base DNS protocol. Some servers support it and some don't, so my guess is some upstream servers inject those extra bits and dnscat has no idea how to handle that.

Overall process for troubleshooting:

	1. Start pcap, writing to file (dnsgood.pcap), run direct-connect DNS session, then end pcap <br /><br />
	`(tcpdump -nn -w dnsgood.pcap -i eth0 port 53)` <br /><br />
	2. Start pcap, writing to file (dnsbad.pcap), run DNS session through public DNS infrastructure, then end pcap <br /><br />
	`tcpdump -nn -w dnsbad.pcap -i eth0 port 53` <br /><br />
	3. Download pcaps from server using SCP <br /><br />
	`scp username@server:/path/to/dns*.pcap .` # <-- grabs the remote files dns*.pcap and saves them to current directory (.) <br /><br />
	4. Analyze side-by-side in wireshark <br /><br />
	`wireshark dnsbad.pcap &wireshark dnsgood.pcap &` <br /><br />
	5. Look for differences in the DNS parsing of each: spotted error in "extended RCODE" having to do with DNSSEC in dnsbad.pcap (does not appear in dnsgood.pcap)

Pcap
![Pcap](../../../assets/images/Screen2018.11.08-01.png)

Server side
![Server side](../../../assets/images/Screen2018.11.08-02.png)

Client side
![Client side](../../../assets/images/Screen2018.11.08-03.png)

The error on the client side had to do with RCODEs, so I made the connection between the two.

Fortunately, I noticed that the exception always seems to occur right after a "CACHE HIT" output, as depicted above, and I had noticed in the --help output of dnscat2 that it has a "--no-cache" option, so I gave that a try, and so far it seems to be working.

Workaround seems to be to launch server-side with --no-cache flag. Stable thus far.

The chapter closes with a quick barrage of other tools, some of which are maintained and some of which aren't.

## To do

* [https://github.com/Ne0nd0g/merlin](https://github.com/Ne0nd0g/merlin) - Test this. HTTP/2 is the wave of the future.

* Test Meterpreter via DNS beaconing.

* Test Domain fronting.

* Set up Let'sEncrypt.

Overall the first chapter has already gotten into some gold. I think it's pretty clear that the author is a pentester primarily, not an author. He says as much in the intro, and that isn't a bad thing. I'm looking forward to testing out Merlin and starting chapter 2.
