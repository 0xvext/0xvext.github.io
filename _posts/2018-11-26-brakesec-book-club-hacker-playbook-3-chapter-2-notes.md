---
title: 'Brakesec Book Club: Hacker Playbook 3 - Chapter 2 notes'
date: '2018-11-26 22:09:08'
tags: brakesec bookclub pentesting study lab discover subbrute
---

I am participating in the Brakesec Book Club ([@Brakesec](https://twitter.com/brakesec) on twitter for more info). This time around is the [Hacker Playbook 3](http://thehackerplaybook.com/dashboard/) by Peter Kim.

This post will serve as a hybrid of my personal notes, some insights based on my work experience, and a very informal book review, of sorts, mixed up into one.

This post was created over the US Thanksgiving holiday, and I was traveling, so had a smaller set of notes to work from.

# Protip
As you study, I recommend saving useful blog posts and articles from the Internet. Sites have a way of dying over time, and while you can often recover most content through [The Internet Archive](https://www.archive.org), some features of an article might be lost to time. [Evernote](https://www.evernote.com) has a really good web plugin that can be used to save whole articles with their HTML formatting intact to separate notes in your Evernote book.

# Scope it out
The author doesn't do a good job of discussing scoping restrictions in this section. I assume this was covered in an earlier edition of the book, but since I haven't read it I can't confirm that. One of the book's examples could result in landing materials that are outside of the scope authorized (cyberspacekittens.com). For those new to pentesting or red teaming, make sure you have a solid grasp on scoping concepts. There are [a ton](https://duckduckgo.com/?q=pentest+scoping&t=ffsb&ia=web) of free resources on this subject.

# Discover scripts
I had heard of this tool before, but never really tried it out. Oh the time I wasted. Almost 100% of my manual recon steps in a pentest are automated through the use of this tool, and then some. I can not recommend this highly enough. If you are pentesting, you should use this prior to your engagements. If you are read teaming, you should use this prior to and during your engagements.

Note: I did run into an issue trying to quickly set the tool up in a Kali VM. My guess is I either didn't set it up right or it conflicted with other tools already present in Kali (e.g., TheHarvester). I will review this in the future but for now I'm focusing on the book content so I'll be using the pre-built VM provided with the book to focus on the lab content.

# Knock
I had never heard of this tool before, and in the book lab as described, I found it to be **slow**. I let it run for about two hours using the million+ word dictionary provided. It hadn't finished so I terminated it. I'm not sure if it's listed as a valid option or just to illustrate the difference between tools, because...

# Subbrute is way faster
Running Subbrute went way faster than Knock, and it came up with a ton of subdomains in the cyberspacekittens scope. It **did** DoS my [PiHole](https://pi-hole.net/) for the hour-long duration of the testing, but after the scan was complete the PiHole recovered fine without needing a reboot.

# SimplyEmail is... redundant?
I'm not sure what this tool will grab that Discover Scripts won't. It looks like it might have a larger searching profile. This wasn't particularly evident in running it against the cyberspacekittens domain, and even when I ran it against my company I didn't come up with any results that Discover Scripts hadn't found. I'll give it another visit in real engagements to see if it comes up with unique results. My guess is the author included it for a reason.

# Cloud all the things!
There are some really interesting and cool Amazon search tools and techniques described. I honestly didn't get very far into this with the travel and holiday, so I'm making myself a note to revisit these and run through the labs at length.

# Legal gray areas
The author makes a statement that **is** valid: "One of the best ways to get email accounts is to continually monitor and capture past breachers." But.

The author also does not include links on where to find breaches, and that is for a very good reason. Researchers, even well-intentioned, have been prosecuted in the past for possessing and transmitting breach data. This is one of those gray areas that (at best) puts a researcher on the wrong side of an uncomfortable conversation about the CFAA, and at worst is an outright violation of the law. Be careful out there, and don't do anything illegal. The GDPR only makes this whole ecosystem that much more complex and confusing.

This is one of those challenging areas where criminals are not restrained by the letter of the law (since most of them are out of its reach), but sincerely well-intentioned researchers and professionals are at risk of such just in an effort to do their jobs and try to keep some semblence of parity with the "bad guys." I've heard some convincing arguments that separate lists (e.g. one list of usersnames and one list of passwords or password hashes) can be "legitimate" if they are stored in such a way that they two can't be rejoined (e.g., randomize the lists), but I am not a lawyer, and even possessing this kind of information probably has some risks with it.

[Troy Hunt](https://www.troyhunt.com/the-legitimisation-of-have-i-been-pwned/) has written about this extensively.

# Shout outs
If you find these posts useful, give the [@Brakesec](https://twitter.com/brakesec) Slack channel a look. It's a really good environment with some cool people. Also, take a look at [apageinsec](https://apageinsec.wordpress.com/2018/11/26/thp3-ch-1-review/) for some much better-written posts that also follow along the book club and the chapters reviewed.

# To do
* Revisit all the Amazon S3 labs.
* Set up Discover from scratch.
