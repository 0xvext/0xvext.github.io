---
title: 'DMs to myself; airing out the Twitter backlog 2/n'
date: '2018-11-04 01:21:01'
tags: dms twitter opinion reference
---

Welcome to "DMs to myself," where I will be going through messages from Twitter that I sent to myself.  I do this in an effort to keep track of interesting or valuable pieces of information that flow through the ether that is Twitter's timeline. As I perform the review, I'm finding a lot of deleted tweets, so clearly this isn't the best method.

These posts will be a ~~hopefully regular~~ ~~probably sporadic~~ review of interesting and informative tweets that have landed under my scope but which, as is often the case, I didn't have time to delve into at the time. I will take a look at a hand full of tweets and related links and provide my own comments or observations.

Note: Some of these are quite old and even out of date. I've been building up my pile of saved tweets for a while now, and these posts start with the oldest based on when I saw them.

# Tweet 1/5
[@JohnLaTwC](https://twitter.com/JohnLaTwC/status/699304590500634625) writes:
![@JohnLaTwC](../../../assets/images/Screen2018-11-04-01.png)
"Modern defenders know security controls create attack surface. Beware the attack graph you make practicing InfoSec:"

This is an accurate post, and as a "purple teamer" I do see the validity in this reminder. Every element of complexity that we add to a system has the potential to adversely affect security.

That said, this shouldn't feed into the "perfect solution fallacy" wherein the argument is made along the lines of "$SOLUTION has a flaw, therefore it's not good and shouldn't be pursued." Every solution has flaws. There is no perfect solution to any practical problem. So long as the risk taken in applying a solution is less than the risk of **not** applying it, the solution should be applied.

A recent example: I have been hesitant about the installation of third-party password policy software on Windows Domain Controllers because in general, keeping as little third-party software on DCs as necessary is a good philosophy. But after recently encountering environments with [nFront Password Filter](https://nfrontsecurity.com/products/nfront-password-filter/) and [Password Policy Enforcer](https://anixis.com/products/ppe/) I can attest that the hurdle these solutions impose on an attacker's ability to gain access and move laterally is well worth the risk they might introduce.

# Tweet 2/5
[@darksim905](https://twitter.com/darksim905/status/911239187378122754) writes:
![@darksim905](../../../assets/images/Screen2018-11-04-02.png)

"me watching people try this help-desk ticket vulnerability attack thing"

This post links to an [excellent write up](https://medium.com/intigriti/how-i-hacked-hundreds-of-companies-through-their-helpdesk-b7680ddc2d4c) on a vulnerability in platforms that allow the creation of objects (in this case, support tickets) via custom account email addresses and simultaneously allow viewing of those objects (tickets) from accounts that can be created without verifying the email addresses used.

It's a brilliant example of a trust-model attack that doesn't rely on any bugs in service-side code or any social engineering.

# Tweet 3/5
[@jeffmcjunkin](https://twitter.com/jeffmcjunkin/status/911323834640474112) writes:
![@jeffmcjunkin](../../../assets/images/Screen2018-11-04-03.png)

"This Slack has amazing folk and really awesome discussions. 10/10 would recommend."

I'm brand new to this particular Slack hub, and while I have been admittedly resistant to using ~~millenial IRC~~ Slack in general, I have recently begun to see its value. Find and join some [good](https://bloodhoundhq.slack.com) Slack [hub](https://brakesec.slack.com)(s), socialize, listen, share, learn things. This is vital to growth and development, and networking with others in your field is a great way to spot new opportunities.

# Tweet 4/5
[@troyhunt](https://twitter.com/troyhunt/status/911287697448198145) writes:
![@troyhunt](../../../assets/images/Screen2018-11-04-04.png)

"Oh boy..."

This was in regard to a ~~horrifying~~ fascinating [article](https://gizmodo.com/passwords-to-access-over-a-half-million-car-tracking-de-1818624272) on a data breach of car tracking data. The long and short of it was an Amazon S3 bucket that wasn't properly secured. The contents of the bucket included "... email addresses and passwords, as well as some license plates and vehicle identification numbers (VIN)." So, you know, no big deal. This is another of so many examples of why we as consumers should be cautious about what data we entrust to third parties. Nevermind the abuse potential of such technology, if it is in use without the car operator's knowledge.

# Tweet 5/5
[@hexwaxwing](https://twitter.com/hexwaxwing/status/911673112386768896) writes:
![@hexwaxwing](../../../assets/images/Screen2018-11-04-05.png)

"<3 @Ben0xA's scanning recipe. 👌 #DerbyCon \`nmap -g88 -sS -Pn -n -p 445 --open 10.10.250.0/24\`"

This is some love for Nmap syntax shared by [@Ben0xA](https://twitter.com/Ben0xA) in a really good [talk](https://www.youtube.com/embed/AF3arWoKfKg) he gave at Derbycon 2017. Aside from a mistake on Nmap's source-port behavior (Nmap doesn't use the same source/dest port by default) it's good stuff and well worth your time.

Breaking down the syntax:

~~~
-g88 # Specify a source port (space is optional; Kerberos uses port 88)
-sS # Perform a SYN ("stealth") scan
-Pn # Don't validate the host is alive (avoids 'ping' check, which includes more than just ICMP)
-n # Don't resolve DNS names
-p 445 # Specify a target port (space is optional)
--open # Suppress output for any non-open ports (filtered/closed)
~~~

Random aside: Did anybody else notice the second hash that showed up in the live demo of Ben's talk when he was showing how [Responder](https://github.com/lgandx/Responder-Windows) worked?

It came from another IP address than his demo, and used elements from the audience participation itself... I'm curious what the hashed password value might have been. I'll have to throw it into my cracking rig and see...

That's it for now. This is the second of my "DMs to myself."
