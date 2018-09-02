---
title: Configuring SNMP v3 on Ubiquiti Edgerouter-X
date: '2017-10-08 21:55:16'
tags: ubiquiti cheatsheets
---

# Cheat-sheet version

```
<intIP> = The IP of the interface you want to listen for SNMP traffic
<snmpPort> = The port to use (UDP)
<viewName> = arbitrary name of a View object
<engineId> = Hex-value engine ID, e.g. 0xaaaa
<groupName> = arbitrary name of a Group object
<userName> = arbitrary name of a User object
<authKey> = a long, complex key used for authentication
<encKey> = a long, complex key used for encryption (key should be separate from authKey!)

set service snmp listen-address <intIP> port <snmpPort>
set service snmp v3 view <viewName>
set service snmp v3 view <viewName> oid 1
set service snmp v3 engineid <engineId>
set service snmp v3 group <groupName>
set service snmp v3 group <groupName> mode ro
set service snmp v3 group <groupName> seclevel priv
set service snmp v3 group <groupName> view <viewName>
set service snmp v3 user <userName> auth plaintext-key <authKey> 
set service snmp v3 user <userName> auth type sha
set service snmp v3 user <userName> engineid <engineId>
set service snmp v3 user <userName> group <groupName>
set service snmp v3 user <userName> mode ro
set service snmp v3 user <userName> privacy plaintext-key <encKey>
set service snmp v3 user <userName> privacy type aes
```

# Full post

Ubiquiti is usually pretty good with their documentation, but for some reason I found the SNMP version 3 documentation a bit lacking.

Multiple users and groups can be defined, as needed.

```
 snmp {
        listen-address <intIP> {
            port <snmpPort>
        }
        v3 {
            engineid <engineId>
            group <groupName> {
                mode ro
                seclevel priv
                view <viewName>
            }
            user <User name> {
                auth {
                    plaintext-key <authKey>
                    type sha
                }
                engineid <engineId>
                group <groupName>
                mode ro
                privacy {
                    plaintext-key <encKey>
                    type aes
                }
            }
            view <viewName> {
                oid 1 {
                }
            }
        }
    }
```
