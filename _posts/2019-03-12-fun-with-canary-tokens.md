---
title: 'Fun with Canary tokens'
date: '2019-03-12 22:15:43'
tags: canary token privacy tracking analytics dde virustotal
---

# Whonary Tokens?
Canary tokens are a concept that has been around for a while. The more generic name for them was [Honeytokens](https://en.wikipedia.org/wiki/Honeytoken). There are a few free services online for generating and alerting based on their use, and there are also free DIY packages for setting them up without relying on a third party. [Thinkst](https://thinkst.com/) offers [Canary tokens](https://canarytokens.org/generate) for free, and their offering really has grown a lot, in the last couple years, both in terms of features and ease of use. [Others](https://zeltser.com/honeytokens-canarytokens-setup/) [have written](https://infosecaddicts.com/easy-honeypots-canary-tokens/) [about these](https://resources.infosecinstitute.com/how-to-protect-files-with-canary-tokens/) and their merits, but today I had some fun going down a bit of a coal mine, so to speak, all thanks to these tricky little tokens.

# The Basics
In short, canary tokens are a really simple concept: seed some bogus data (a "token") somewhere within your real data. Set it up in such a way that if the bogus data is ever accessed, you receive an alert (the "canary"). This will indicate that somebody is doing things they shouldn't, since you (the data owner/steward) would have no reason to ever touch the token after you originally create it.

This requires a little bit of infrastructure, of course, but it isn't that complicated. In short, there are three components needed:

1. The token itself (e.g., a username, or document, or URL). Each token should be unique.
2. A receiving mechanism of some kind that will receive a signal if the token is activated (e.g., Active Directory, or a file access monitoring system, or a web server).
3. A notification mechanism to alert the appropriate individual(s) that the token has been activated (e.g., sending an email, or generating an event in a security event manager).

Ideally, you also keep track of some meta data around each unique token, to make sure you can recall where it was implemented.

Thinkst handles all of the infrastructure around token creation (of various types).

![Canary Token Types](../../../assets/images/canary01.png)

They also handle the signal receiving (via HTTP request to their Canary Token server infrastructure), and alerting (bundled with the same).

This makes getting started with such tokens a breeze. Simply choose the type of token you want, enter the notification email, and a note to remind you what the token was used for, click a button, and you are good to go.

![Canary Token Setup](../../../assets/images/canary02.png)

![Canary Token Setup Done!](../../../assets/images/canary03.png)

Of course, since it's free, Thinkst gets analytics data from the platform they can analyze and likely share. For more sensitive implementations, they offer a commercial version of the service, and there are self-hosted DIY solutions out there, too.

# Analysis

I have been meaning to set up and test Canary Tokens for literally years without getting around to it. Today I generated tokens for a couple different purposes, and decided to do some analysis on the MS Word Document form of the token.

First I downloaded the generated payload file, and ran it through ClamAV to see what it would pick up. Not a big surprise, it didn't detect anything:

![ClamAV](../../../assets/images/canary04.png)

As an aside, while I was getting updated signatures for ClamAV, I noticed this:

![The Matrix has you, neo...](../../../assets/images/canary04-aside.png)

Cool. Sup, neo.

![We're safe from viruses, everyone](../../../assets/images/canary04-aside.jpg)

In all seriousness, thanks to neo and everyone else who contributes their time to ClamAV. We need more open source solutions like that one.

Then I tried the AV on my Windows machine, [GENERICAV]. It also didn't detect anything. Hmm. Well, Defender has gotten better in recent years, so let's try that...

![Windows Defender](../../../assets/images/canaryclip01.png)

No, huh? Ok, well surely **some** AV is going to catch it...

![All the AV](../../../assets/images/canary05.png)

... Or not. And don't call me Shirly.

So at this point I was curious, since none of the AV platforms were catching the payload. I opened the file in MS word, and sure enough, it phoned home. I received an email shortly after indicating that it had been opened, including my IP address and some basic information about the version of the .NET browser used to request the URL.

I had also received such an email when I uploaded the file to VirusTotal. Interestingly, of all the scanners included in VirusTotal, I initially only got one notification. This either means the various scanners aren't detonating payloads (which I find hard to believe), or else Thinkst puts some rate limiting on the email notifications. I did some additional testing, and the latter appears to be the case, since I can't generate a ton of notifications from a single token rapidly. This makes sense, given that there is no email confirmation when creating a token...

Makes you think, though... 🤔

[Edited to add: I started getting further hits on the VirusTotal token more than an hour after the original upload time. Seems there is a delay before some sandboxes start really analyzing new uploads.]

Anyway, back on track, here is an example of the alerts generated when a token is opened:

![New token, who dis?](../../../assets/images/canary06.png)

Looks like Google has the fastest sandbox response, for this test:

![Google likes me!](../../../assets/images/canary07.png)

All right, so we have an AV-evading payload that phones home when a Word document is opened. Sounds like some old school macro love, right?

![Wrong](../../../assets/images/canaryclip02.png)

Wrong. Hmm. Not a macro... Searching memory... I know I remember something about a DDE vulnerability in Word. But Microsoft fixed, that right?

![DDE (bleepingcomputer)](../../../assets/images/canary09.png)

Yeah! I remember... things... See? They patched that way back when. So if it's not a macro and it's not DDE, I don't know of anything else it could be... Maybe my machine isn't patched for DDE? How do I determine that?

![DDE 2 (bleepingcomputer)](../../../assets/images/canary10.png)

Ok. Easy enough. I'll just check for that key to confirm that I'm patched...

![Registry](../../../assets/images/canaryclip03.png)

Oh really, now? I update regularly, but double-checking won't hurt...

![No Updates](../../../assets/images/canaryclip04.png)

I... what. Triple-checking, since I've had an issue in the past with false positives on Windows updates...

![Seriously, no updates](../../../assets/images/canaryclip05.png)

![Windows Builds (Wikipedia)](../../../assets/images/canary12.png)

Ok, so I'm on the latest released build... What gives?

Further investigation led to me discovering that my MS Office install wasn't getting updates, so I fixed that and ran an update... but that wasn't the problem. The DDE fix simply doesn't get applied to my machine. Apparently that registry key must be applied manually. That's good to know.

So my machine is vulnerable, lending support to this indeed being DDE. Searching for how to set up DDE quickly lands multiple pages with instructions on how to add the necessary field code to leverage the attack. It took a few more minutes of searching to find how to **view** such fields when they are already present in the file:

![Show field codes DDE](../../../assets/images/canaryclip06.png)

I enable that option, turn on viewing formatting symbols for good measure, view the file again and...

![Blank document](../../../assets/images/canaryclip07.png)

...

![Srsly?](../../../assets/images/canary13.jpg)

\*Scrolls down\*

![Gotcha!](../../../assets/images/canaryclip08.png)

Ah ha! There it is. Hidden in the footer, no less. Sneaky.

# Conclusion

This was an unplanned exploration of how the DDE functionality of MS word, more than a year after it was "fixed" by Microsoft, lingers as a potential security risk on computers running Microsoft Office (and by the way, I tested it on a Mac running Office, and it works there, too). It was also a more deliberately planned exploration of how Thinkst Canary Tokens work. There are numerous other kinds of such tokens including URL, PDF, DNS and others. So long as the implementation doesn't involve highly sensitive context(s), I encourage others to make use of the free Canary Tokens offered by Thinkst, some similar service offering, or to look into setting up your own DIY solution. This technology is a very easy to implement warning system in the event of unauthorized access.

[Edited to update: It looks like the specific functionality that was fixed in Office was the "DDEAUTO" method. I've done some testing and I can't get code execution to work with it the way it's written up in various blogs. I will have to tinker and see if that's just simple string matching or if they removed that functionality entirely. Even so, the beaconing functionality that is still in place is potentially very risky, and useful as part of the recon phase of a targeted attack, particularly since it doesn't trigger any AV signatures.]
