---
title: 'DMs to myself 3'
date: '2019-01-21 15:34:25'
tags: dms twitter opinion reference
---

Welcome to "DMs to myself," where I will be going through messages from Twitter that I sent to myself.  I do this in an effort to keep track of interesting or valuable pieces of information that flow through the ether that is Twitter's timeline. As I perform the review, I'm finding a lot of deleted tweets, so clearly this isn't the best method.

These posts will be a ~~hopefully regular~~ ~~probably sporadic~~ review of interesting and informative tweets that have landed under my scope but which, as is often the case, I didn't have time to delve into at the time. I will take a look at a hand full of tweets and related links and provide my own comments or observations.

Note: Some of these are quite old and even out of date. I've been building up my pile of saved tweets for a while now, and these posts start with the oldest based on when I saw them.

# Tweet 1/5 - Windows Privilege Escalation Methods for Pentesters
[@DanielX4v3r](https://twitter.com/DanielX4v3r/status/911849582459572226) writes:
![@DanielX4v3r](../../../assets/images/dmstome-2019-21-01.png)

"Recommended reading - Windows Privilege Escalation Methods for Pentesters: https://pentest.blog/windows-privilege-escalation-methods-for-pentesters/ … by @pentestblog"

This blog post by Gokhan Sagoglu on @pentestblog ([blog](https://pentest.blog/)) is great in that it goes into some really granular and well-illustrated details of common privesc methods that are easy to find (such as with automated PowerView scans), but if you haven't executed yourself, might be a bit opaque. @pentestblog doesn't seem to be too active on Twitter lately, but the blog itself is still active and worth reading.

# Tweet 2/5 - Nmap custom ports with script scans
[@liamosaur](https://twitter.com/liamosaur/status/912491527573692416) writes:
![@liamosaur](../../../assets/images/dmstome-2019-21-02.png)

"If you want an nmap script to run on a non-standard port, add a + before the script name, eg: nmap --script +mysql-enum -p 6666 x.x.x.x"

This is a great tip for using Nmap with more versatility than the default. A great example of this is running scans for heartbleed and shellshock on nonstandard ports; there are still a fair number of appliances and web services that don't run on the typical port ranges for web that contain these vulnerabilities.

# Tweet 3/5 - Getting the goods with CrackMapExec: Part 1
[@L4bf0x](https://twitter.com/L4bf0x/status/913205630231564290) writes:
![@L4bf0x](../../../assets/images/dmstome-2019-21-03.png)
"One of my all-time fav tutorials for internals: https://byt3bl33d3r.github.io/getting-the-goods-with-crackmapexec-part-1.html … by @byt3bl33d3r"

[@byt3bl33d3r](https://byt3bl33d3r.github.io) is a source of some really excellent information and tools in the pentesting/red teaming space. I've been following his work for some time and I'm always impressed. This is no exception, and though the ecosystem in security is changing rapidly, the insights in this post remain valid. The illustrative use of animated gifs to show commands running is also really excellent for the reader.

[CrackMapExec](https://github.com/byt3bl33d3r/CrackMapExec) is a tool I've been meaning to learn and put into use for some time. Now that I've made the time to do a bit of reading, this blog post by itself helps me better understand the tool and its functionality. Next step is to lab it up and get my hands dirty.

And of course there is [a part 2](https://byt3bl33d3r.github.io/getting-the-goods-with-crackmapexec-part-2.html).

# Tweet 4/5 - Privacy implications of email tracking
[@x0rz](https://twitter.com/x0rz/status/913724020796854273) writes:
![@x0rz](../../../assets/images/dmstome-2019-21-04.png)

"Privacy implications of email tracking https://senglehardt.com/papers/pets18_email_tracking.pdf … (PDF)"

Privacy is a crucially important concept - and one that I feel most folks don't think much about or take seriously enough. This is a great read authored by Steven Englehardt, Jeffrey Han, and Arvind Narayanan. I am including excepts from the piece here with my commentary, but you really should give the whole document a read. It's only 18 pages and it has some excellent data analysis.


"... a network of hundreds of third parties that track email recipients via methods such as embedded pixels. About 30% of emails leak the recipient’s email address to one or more of these third parties when they are viewed."

Think about that. Nearly a third of every email they analyzed had some sort of tracking mechanism in it. From a bare minimum pragmatic standpoint, those beacons reveal activity on the user's email account, which could result in additional spammy messages coming in. In the most extreme of privacy implications, those beacons could put an individual at risk of their privacy or even personal safety (e.g., in the case of a political protester in a country without protected freedom of speech). The ubiquity of this technology use should concern us all. For further reading on this subject, I highly recommend a paper referenced in this one: [Cookies That Give You Away: The Surveillance Implications of Web Tracking](https://senglehardt.com/papers/www15_cookie_surveil.pdf).

The authors "...present a set of heuristics to classify such leak-age as intentional or accidental (Section 4.1). Intentional leakage suggests a business relationship between
the party sending the information and the party receiving it, whereas accidental leakage happens due to poor programming practices..."

This is excellent for the reader in helping to understand general rules of thumb regarding how their data is exposed, and whether that exposure is deliberate or not. The authors later go on to suggest systematic solutions to these challenges.

More interesting data, the authors "... find that 85% of emails in our corpus contain embedded third-party content, and 70% contain resources categorized as trackers by popular tracking-protection lists."

This does not surprise me, and it raises the point of one of the significant challenges that users face in this space: the techniques that are described in the paper are considered "legitimate business" by many. Marketing and advertising are part and parcel of our modern economy. The problem with this it the very same techniques can be used maliciously (either by companies or criminals), and telling the two apart is challenging, at best.

The scale and the nature of the exposure is further described, in that out of over 12 thousand emails, the authors "... find that about 29% of emails leak the user’s email address to at least one third party, and about 19% of senders sent at least one email that had such a leak. The majority of these leaks (62%) are intentional, based on our heuristics. Tracking protection is helpful, but not perfect: it reduces the number of email leaks by 87%."

I know a fair amount about web tracking and email tracking, but one specific finding that was surprising to me was that the authors "... observe some tracking images which redirect to
new domains upon every subsequent reload of the same email."
This is an interesting and advanced wrinkle in the overall tracking landscape that I had never considered before. It makes sense, though, as there may be value in determining if a reader views the same message multiple times.

# Tweet 1/5 - Windows Privilege Escalation Methods for Pentesters
[@thegrugq](https://twitter.com/thegrugq/status/913680673973473280) writes:
![@thegrugq](../../../assets/images/dmstome-2019-21-05.png)

"Know your hacker. [Link to [article](https://medium.com/@thegrugq/cyber-operators-differences-matter-7cfba2ddb9a6)]"

As are most from thegrugq, this is a good article. I am biased as a pentester, and I don't agree 100% with his pigeon-holing structure (specifically, lumping red team in with pentesters, since there is a difference that has become more and more clear in the last couple years). Also, I **wish** I had 2 weeks of testing, per thegrugq's comment: "Finally, those guys are fast. They have two weeks to work and they hardly need it before they have DA."

That said, I 100% agree with thegrugq's conclusion to the pentester section: "Clients who do not scope a project to make pentester intent mimic malicious actor intent are not getting value from their services." This is also a burden on the pentester companies. If a pentest company is not **helping** their client to scope an engagement to mimic real world scenarios and risks, that company is failing their client. In his conclusion, thegrugq does go on to add that "Good pen test teams will rise to the challenge and supply the sort of assessment that actually generates value."

As a last bonus, ASM is my new favorite acronym :D
