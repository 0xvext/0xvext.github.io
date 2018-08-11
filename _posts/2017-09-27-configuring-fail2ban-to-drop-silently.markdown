---
title: Configuring fail2ban to drop silently
date: '2017-09-27 17:52:19'
tags: fail2ban
---

# Cheat-sheet version:
~~~ bash
apt install fail2ban
printf "[Init]\nblocktype = DROP" > /etc/fail2ban/action.d/iptables-blocktype.local
service fail2ban restart
~~~

# Full post:

By default, [fail2ban](http://www.fail2ban.org/wiki/index.php/Main_Page) will send [ICMP unreachable](https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Destination_unreachable) messages in response to any connections from hosts on its banned list. This [was changed](https://github.com/fail2ban/fail2ban/issues/507) a number of years ago from the former default behavior of DROP.

If, like me, you prefer silent drops to the informative ICMP unreachable message, the behavior can be changed as follows:
1. Create the file /etc/fail2ban/action.d/iptables-blocktype.local
2. Enter the following code:
```
[Init]
blocktype = DROP
```
3. Save the file and restart fail2ban.

This won't deter a persistent connection attempt, but for simple automated attacks they are more likely to move on to another target when receiving no response than when receiving active replies. 
At a minimum, it will slow some tools that modify their rate limiting behavior between response/no response.

Realistically, all a live adversary needs to do is port scan from another IP to confirm that the host is alive, but for the script-kiddies and simple attacks it will help to remove the system from their radar.
