---
title: 'DMs to myself 4'
date: '2019-04-20 23:57:25'
tags: dms twitter opinion reference
---

Welcome to "DMs to myself," where I will be going through messages from Twitter that I sent to myself.  I do this in an effort to keep track of interesting or valuable pieces of information that flow through the ether that is Twitter's timeline. Think of this as an "in case you missed it," but really directed at myself.

These posts will be a ~~hopefully regular~~ ~~probably sporadic~~ review of interesting and informative tweets that have landed under my scope but which, as is often the case, I didn't have time to delve into at the time. I will take a look at a hand full of tweets and related links and provide my own comments or observations.

Note: Some of these are quite old and even out of date. I've been building up my pile of saved tweets for a while now, and these posts start with the oldest based on when I saw them.

# Tweet 1/5 - Pentest Note Taking
[@m3g9tr0n](https://twitter.com/m3g9tr0n/status/911957911961825281) writes:
![@m3g9tr0n](../../../assets/images/dms-tm-04-01.png)

"Pentesters: What do you use for taking notes, PoCs during your assessments? #pentesting #reporting"

This tweet alone is worth a blog post. There were a ton of replies with what folks use for their note taking such as:

* [OneNote](https://www.onenote.com) (x4) - The Microsoft classic. This tool has grown and changed over time. The biggest con is the price tag, if you don't already have Office. If you do, it's already included, and you could do worse than this. I've heard it said that all OneNote books are encrypted at rest on MS servers, but I haven't researched this, and my guess is they aren't zero-knowledge encrypted. Good for general notes and keeping non-sensitive materials, but if you're conducting a pentest there is some risk/exposure to storing the details in this platform.
* [OmniFocus](https://www.omnigroup.com/omnifocus) - A Mac-specific solution that I haven't used, this tool is task-focused and designed around workflows that follow a task or series of tasks.
* [CherryTree](https://www.giuspen.com/cherrytree/) (x3) - Another tool I hadn't heard of. This one sounds interesting. It looks like an offline, free note-taking application that is very similar in design to Evernote. As of this writing it still seems to be actively developed.
* [Keepnote](http://keepnote.org/) (x5) - Another popular tool that appears very similar in its design to Evernote. One of the immediately notable differences is that Keepnote does not limit note organization to two levels (notebooks + notes); rather, multiple folders can be nested sequentially.
* [Typora.io](https://typora.io/) - Still in beta, as of this writing, Typora is a lightweight markdown editor that seems to be designed around a streamlined interface with minimal clutter. It looks quite nice, though I don't see many features that make it optimal for pentesting purposes, in my opinion.
* Evernote (x2) - I've been a user of Evernote for years, and it's a solid product, though it has plenty of quirks of its own. One of my favorite aspects about how Evernote runs their business is that they aren't a data-mining company. Their revenue comes from subscribers paying for their product. They do have some encryption options for sensitive notes, but they are limited, and unfortunately don't apply to images, so Evernote shares the same concerns re: sensitive data as OneNote. I use Evernote for web clippings and saving my notes/PoCs, but I don't use it for client-specific data or sensitive details about a pentest. It also still doesn't have Markdown support, as of this writing, which has made me consider abandoning the platform more than once.
* Pencil & paper (x3) - The old classic, and often overlooked. Particularly for sensitive materials that need to be documented, a properly-secured notepad is hard to beat. You can't remotely hack what isn't online.
* Plain text editors (TextWrangler, Vim, Nano) - Also often overlooked. Sometimes you just need a quick and dirty digital notepad. Typing in markdown is a good habit for later export to other platforms that support it.
* [Zim](https://zim-wiki.org/) - I hadn't heard of this before. It's a neat concept: an offline wiki in a local, easy to use editor. I haven't used it personally, but glancing through the screenshots I can see how this could fit into a pentest workflow.
* [Sublime](https://www.sublimetext.com/) - I like Sublime. I've used it before, and it has some really great features, particularly for programming uses. It is the closest to vi/vim features in a GUI-based editor that I've ever seen. Unfortunately, it has a simply absurd price tag ($80, at the time of writing), which puts it way out of sync with alternatives. The price tag might make sense for developers, but not for note takers. Another one that isn't really ideal for pentest documentation, since it lacks some key features.
* [XMind](https://www.xmind.net/) - I've heard great things about XMind for years. Mind mapping is a great way to study, and I see how it could be really useful, particularly *during* a pentest, to keep track of things to try, ideas to pursue. The price tag has kept me away from it in the past, but I think I'm going to give it a try soon, particularly as they now have two different offerings. The newer XMind Zen supports Markdown editing, which is great. I have to look into the details of privacy/sensitivity for materials in this platform (e.g., auto sync of contents) before I take the plunge, but it's on my list of products to try.

There were a few other tools mentioned, some of which I couldn't find by the names used in the tweets, and some of which I think were a bit out of scope for the original question asked. This tweet was from 2017, but another up-and-comer these days that is highly recommended by a colleague of mine is [Notion](https://www.notion.so/). This one has a long way to go in the features department, but they are off to a great start. I'll be keeping my eye on this one.

# Tweet 2/5 - Terms of Service
[@waxzce](https://twitter.com/waxzce/status/898548366958673920) writes:
![@waxzce](../../../assets/images/dms-tm-04-02.png)

"“I have read and agree to the Terms” is the biggest lie on the web. We aim to fix that. [https://tosdr.org/](https://tosdr.org/)  // very good idea, Thank you""

This is an amazing project that seeks to inform users, and make the world just a little bit better of a place. In their own words:

"We are a user rights initiative to rate and label website terms & privacy policies, from very good Class A to very bad Class E.

Terms of service are often too long to read, but it's important to understand what's in them. Your rights online depend on them. We hope that our ratings can help you get informed about your rights. Do not hesitate to click on a service below, to have more details!"

They offer a plugin for web browsers. I'm a bit wary of that part, but the overall project is a great idea, and I've referred to it multiple times. Probably one of the biggest challenges is simply the scale of the problem at hand, and trying to keep track and maintain up to date information about numerous companies/services.

# Tweet 3/5 - Twitter Geocode Searching
[@xKaliSec](https://twitter.com/xKaliSec/status/913803139240939520) writes:
![@xKaliSec](../../../assets/images/dms-tm-04-03.png)

"How to get tweets from a specific location [Doxing] https://www.youtube.com/watch?v=Kr-7xHF4e4Q …"

I had seen prior art on identifying images from platforms like instagram and facebook based on their geo location. Many of those techniques have gone away since there are often privacy concerns related to the functionality. It kind of blew my mind that this feature is still built right into Twitter as a platform, and publicly searchable. All a user need do is enter the search "[geocode](https://en.wikipedia.org/wiki/Geocoding):" followed by latitude and longitude coordinates, and another comma-separated parameter with the diameter size of the circle around those coordinates to include tweets from. Here's an example of tweets made within .1km of the White House:

![Twitter Geocoding](../../../assets/images/dms-tm-04-04.png)

There is a pretty obvious high-popularity tweeter that seems to be absent from the data, but there is still a huge amount of room for abuse of this feature. My gut instinct is there is more abuse potential than legitimate use/research, but I'd be curious to read the thoughts of others, on the matter.

# Tweet 4/5 - Under the Wire PowerShell
[@Lee_Holmes](https://twitter.com/Lee_Holmes/status/906261930142081024) writes:
![@Lee_Holmes](../../../assets/images/dms-tm-04-05.png)

"Wow! A PowerShell-based wargame to teach you PowerShell, Windows management, and a bit of incident response? Yes! http://www.underthewire.tech "

I've spent about five minutes on this "wargames" site and I'm already in love. This is the kind of fun education that "educational games" back in the day failed to achieve (I'm look at you, Math Blaster).

![Sup](../../../assets/images/s-l1000.jpg)

This reminds me a lot of the JavaScript game Untrusted that I have [posted about before](https://vext.info/2017/09/07/untrusted-a-user-javascript-adventure-game.html). I may have a new series of walkthroughs to work on, soon...

# Tweet 5/5 - Retrieving Wifi Passwords
[@DynamicWebPaige](https://twitter.com/DynamicWebPaige/status/914240788103561216) writes:
![@DynamicWebPaige](../../../assets/images/dms-tm-04-06.png)

"Did you know that "netsh wlan show profile" shows every network your computer has ever connected to? And "key=clear" shows the *passwords*?"

Just a quick, easy command to look at where a given machine has been, from a wifi perspective. Potentially useful in a security assessment of a given device, or just in recovering your own wifi password.
