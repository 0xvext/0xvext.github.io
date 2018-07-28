---
title: Configuring SNMPv3 on Ubuntu Server 16.04
date: '2017-10-09 02:02:51'
tags: ubuntu
---

Another instance of documentation that wasn't fully explanatory or didn't work. I got my SNMPv3 set up succesfully using the following in /etc/snmp/snmpd.conf:

```
agentAddress  udp:161 # This allows remote connections (default is localhost only)
createUser <username>  SHA <authKey>  AES <encryptKey> # Creates a user with both authentication and encryption
rouser   <username>  priv # Specify the same username as above. Enables the user for encrypted communications
```

It is also safe to comment out the `trapsink`, `extend` and `extend-sh` lines from the config.
