---
title: LastPass versus 1Password versus KeePass, part 1
date: '2017-11-10 13:55:50'
tags: reviews
---

These posts are to documement my overall experience with different password storage solutions, and an amateur evaluation that I performed from the perspective of a customer/user of different password vault options. This is one step in my ongoing quest to improve the security of my information and systems.

In that light, these posts are also about why I made the decision to stop trusting my passwords to LastPass after three years of use, why 1Password is not currently a reasonable alternative (in my opinion), and why I ultimately went back to using KeePass and my own syncing solution.

# Part 1: History

Years ago (read: 2010-2011ish?), I used [KeePass](https://keepass.info/). I carried it around in an encrypted [TrueCrypt](http://truecrypt.sourceforge.net/) volume that lived on a portable USB drive. There are some issues with this approach that I encountered, such as losing the USB drive, the USB drive becoming corrupted, or not having local administrator rights on a machine that I needed to access my passwords from (required for TrueCrypt at the time, and still required by its replacement, [VeraCrypt](https://www.veracrypt.fr/en/Home.html), for at least some features).

One could certainly ask why I bothered with double-encrypting, given that KeePass encrypts its vaults to begin with, but I figured double encrypting was better than single encrypting, and given the relatively high likelihood of losing a USB drive, I felt it prudent at the time. Threat models adjust over time as we become better informed.

[There are many ways](https://www.google.com/search?q=keepass+sync) to set up [butt](https://github.com/smrk3r/cloud-to-butt)-based sync services with KeePass, either leveraging one of multiple plugins to the app itself, or setting up your own favorite [butt sync](https://en.wikipedia.org/wiki/Comparison_of_file_synchronization_software) service to make sure the KeePass database is always available.
A number of articles provide guidance on how to set up your favorite butt syncing service. At the time, none of these was to my liking.

Eventually (two or three years later), the inconvenience of having to keep up with that USB drive (and a couple of scares that had me convinced I had lost it; yes I had backups; no, double-encryption didn't make me feel ok with that) led me to deciding to move my data into the butt.

Around this time (end of 2014), [LastPass](https://www.lastpass.com/) was getting more and more popular. They were still a standalone company at the time (more on that, later), and I was curious. They talked good talk and I wanted to know if they walked the walk, so to speak, when it came to security. There were three key pieces of input that convinced me to try LastPass, which I would end up using until November of 2017:
1. LastPass had demonstrated that they knew how to handle proper security incident response[^1].
2. I read a very interesting article in which the author provided generalized opinion about the security at LastPass. This was based on having reviewed "behind the scenes" information that he was under NDA not to disclose in specifics, but which he described enough to get me interested. Unfortunately I can't seem to find this article, years later.
3. I reached out directly to LastPass, asking for access to similar information as the author of the above article, indicating I would be happy to sign an NDA as well. I fully expected them to tell me to pound sand... but they sent me the NDA. After that was handled, they provided additional information that satisfied me that they knew their business, when it came to security.
![stunned](/assets/images/stunned.jpg)
Mfw they sent back the NDA.

So I signed up. I tried them out for a while, and eventually migrated all my passwords into their service for around three years. During those three years, I've been a paying customer, and a vocal proponent of LastPass. I encouraged friends, family, colleagues and clients to use their service.
I am no longer a customer of LastPass, nor do I feel that I can, in good conscience, recommend them to others from this point forward.

In trying to find a good alternative, I gave 1Password a try. I was very quickly disappointed in both their product/service and their organization's attitude and communications technique in a couple of key areas. It's possible I caught them at a bad time (in transition to their new business model), but I don't think that is the root issue.

Ultimately, I ended up bringing my passwords back into my own control using KeePass and an alternative syncing solution. Upcoming posts will go into details on each of the alternatives I evaluated, and why I reached the decision that I did in this regard.

[^1]: "On Tuesday, May 3, 2011, LastPass discovered an anomaly in their incoming network traffic, and then another similar anomaly in their outgoing traffic. Administrators found none of the hallmarks of a classic security breach (for example, database logs showed no evidence of a non-administrator user being elevated to administrator privileges), but neither could they determine the root cause of the anomalies. Furthermore, given the size of the anomalies, it is theoretically possible that data such as email addresses, the server Salt, and the salted password hashes were copied from the LastPass database. To address the situation, LastPass decommissioned the "breached" servers so they could be rebuilt, and on May 4, 2011, they requested all users to change their master password. However, the resulting user traffic overwhelmed the login servers and, temporarily, administrators were asking users to refrain from changing their passwords until further notice, having judged that the possibility of the passwords themselves being compromised was trivially small. LastPass also stated that while there was no direct evidence any customer information was directly compromised, they preferred to err on the side of caution." - Taken from prior version of Wikipedia article on LastPass. Fun fact: this entire paragraph was removed from the Wikipedia article on November 1st, 2017.
