---
title: Bash Bunny and P4wnP1
date: '2017-12-11 16:57:58'
tags: reviews
---

So I found myself in an interesting (and strange) thread on Twitter, the other day. I'll be using screenshots, and hopefully I won't get replies out of order, but it's entirely possible since I am bad at Twitterizing. Twitterpating? Tweetling? Anyway...
![Screen-Shot-2017-12-11-at-8.53.29-AM](/assets/images/Screen-Shot-2017-12-11-at-8.53.29-AM.png)

An interesting post, and right up my alley: I'm a big fan of competition in any field, the constant sharpening of tools and techniques, and reducing prices for consumers (to a point). Everybody wins in a healthy, competitive marketplace. My company uses Hak5 tools, so at this point I'm interested.

@\_MG\_ immediately asked the question that was on my mind, and @LucaBongiorni delivered:
![Screen-Shot-2017-12-11-at-8.53.58-AM](/assets/images/Screen-Shot-2017-12-11-at-8.53.58-AM.png)

Ok, a bit nationalistic, there, but whatevs. Dude doesn't like Hak5, opinions are cool. I'm with @\_MG\_'s interpretation (I had heard of P4wnP1 once a while back but had forgotten it existed, but Hak5 is front of mind among my team).

Then things started to take a turn...
![Screen-Shot-2017-12-11-at-8.54.14-AM](/assets/images/Screen-Shot-2017-12-11-at-8.54.14-AM.png)

Oh. Egos activate -\_-
As a word of advice, in my experience use of the word "should" is almost always a red flag when it comes to these discussions. That is a rant in and of itself, but "should" is where opinions live, often based on unrealistic ideals. Even if the ideals are realistic, the speaker tends to come off as overly opinionated when throwing "should" around.

I'm usualy wise enough to stay out of these conversations, since the egos in infosec are... fragile. But I had to be Mr. helpful and poke my nose in, with predictable results (lolz find a new job n00b). In fairness, my response was over-simplistic. I "should" have known better ;)

To my surprise, though, the official(?) P4wnP1 account got involved, too:
![Screen-Shot-2017-12-11-at-8.55.10-AM](/assets/images/Screen-Shot-2017-12-11-at-8.55.10-AM.png)

First post from @P4wnP1 rests on "should." While the observation re: scripting is valid, in my opinion it misses the point I was making, so I elaborate:
![Screen-Shot-2017-12-11-at-9.04.43-AM](/assets/images/Screen-Shot-2017-12-11-at-9.04.43-AM.png)

Then (at least, I think that's the sequence... threaded Twitter makes my head hurt and I can't be arsed to check timestamps) more from @P4wnP1:
![Screen-Shot-2017-12-11-at-8.55.47-AM](/assets/images/Screen-Shot-2017-12-11-at-8.55.47-AM.png)

Well, this is getting interesting. This Twitter account which apparently represents the P4wnP1 project is making some interesting (if biased and poorly worded) claims.
Primarily:
1. P4wnP1 can do everything Bash Bunny can do, and does those things better
2. P4wnP1 is a more broad project than Bash Bunny, and does things that Hak5 tools don't do
3. Bash Bunny's use cases are limited to pranksters and non-remote access implementations.

    Now I've got something to work with. Add to this list the original claim by @LucaBongiorni that P4wnP1 is cheaper than Bash Bunny...
4. Pwn4P1 is a cheaper solution than Bash Bunny

... and it's time for us all to put our money where our mouths are.

There are some issues above, and I could have argued at the time, but Twitter arguments do little good for anybody, so at this point I opted to de-escalate and step out of the exchange as peacefully as possible, with a sincere curiosity (because toys) and an eagerness to grow my tool kit:
![Screen-Shot-2017-12-11-at-9.43.00-AM](/assets/images/Screen-Shot-2017-12-11-at-9.43.00-AM.png)

Cool, so now what? I don't has a Pi Zero :|
I has a sad :(

*Amazon, 2 days later*

I has a Pi Zero :)

I picked up a CanaKit with power adapter, SD card, official case for the Pi Zero, and a couple adapters that make life easier. I also had to pick up a micro USB to male USB cable, because somehow I didn't own one of those. What kind of computer geek am I, even?
Total price: $42.66
I could have gotten a slightly cheaper kit with just the Pi Zero with case, SD card and USB cable for a total of $38.28 on Amazon, or for $34.95 straight from The CanaKit website. But dat 2-day shipping, tho.

Bash Bunny goes for $99.99 plus shipping, so this is an easy one to do the math on. I can get two Pi-based solutions for the price of one Bash Bunny.

1. P4wnP1 can do everything Bash Bunny can do, and does those things better
2. P4wnP1 is a more broad project than Bash Bunny, and does things that Hak5 tools don't do
3. Bash Bunny's use cases are limited to pranksters and non-remote access implementations.
4. ✓ Pwn4P1 is a cheaper solution than Bash Bunny

Lol what order do I do lists in, even?

Ok, one down. Three to go. Since I'm doing the list backwards, let's hit #3.

Much like the older Rubber Ducky, the Bash Bunny can be used to automate any keyboard-driven task at the user interaction level based on pre-defined keystrokes. While there are "prankster" uses for this feature, my typical use cases are as follows:

1. Attempting to gain hashes from locked machines via the [Mubix method](https://room362.com/post/2016/snagging-creds-from-locked-machines/).
2. Establishing a remote session to my Internet-facing listener on an unlocked machine (Metasploit, Cobalt Strike, Empire, etc.) via simple Powershell command automation.

These two uses cases alone prove false the claim that Bash Bunny is only useful in the limited way described by the P4wnP1 representative. This leads me to suspect a lack of familiarity with the Bash Bunny, or disingenuous represetnation on the part of a "competing" solution. I use quotes there because P4wnP1 is free, so there really isn't any competition here, from a commercial standpoint.

Now, one could argue that the "Remote Access" in question has more to do with adding a USB adapter to the Pi Zero and having it act as a standalone network device in its own right, which the Bash Bunny can't do. The LAN Turtle can, but again, we're getting into more cost, and, admitedly, the Pi Zero can serve both roles. Still, that wasn't the argument made, so I'm not going there in depth.
This claim was simply incorrect.

1. P4wnP1 can do everything Bash Bunny can do, and does those things better
2. P4wnP1 is a more broad project than Bash Bunny, and does things that Hak5 tools don't do
3. X Bash Bunny's use cases are limited to pranksters and non-remote access implementations.
4. ✓ Pwn4P1 is a cheaper solution than Bash Bunny

On to #2. This one is interesting, in that it describes intent and a current state. This could change drastically over time, but I will provide observations based on my perception of the current state.

The [P4wnP1 wiki](http://p4wnp1.readthedocs.io/en/latest/) provides a comparison table between the two solutions. I won't fully reproduce it here, but my overall take-away from the table as it stands is that, rather than the original premise, **P4wnP1 and Bash Bunny are differently-scoped projects, and each does something that the other does not.**

In particular, Bash Bunny has a physical switch built-in for multiple payloads, where the P4wnP1's response is "manually in interactive mode (Hardware switch could be soldered, script support is a low priority ToDo. At least till somebody prints a housing for the Pi which has such a switch and PIN connectors)."
I'm also a bit confused on the entry for "Shell access via Internet," which for Bash Bunny lists "not possible," and for the P4wnP1 reads "supported (WiFi client connection + SSH remote port forwarding to SSH server owned by the pentester via AutoSSH)." Again, I suppose this is the distinction between the Bash Bunny and LAN Turtle I mentioned above, but it seems disingenuous given that Hak5 markets the two devices separately.
When I use the Bash Bunny, it stays with me, in my pocket. I don't drop it off as a network "implant" device. The LAN Turtle is intended for that use.

Does this distinction really matter? Maybe not. Though once I drop off a P4wnP1 as an implant behind a computer/printer/etc., I won't be able to take it from PC to PC to try and break in/grab hashes, or trigger beacons. Then again, since I can buy two for the price of one, I could just assign one to each use...

Conclusion: Ehh... Ish. Some aspects correct, some inaccurate.

1. P4wnP1 can do everything Bash Bunny can do, and does those things better
2. ~ P4wnP1 is a more broad project than Bash Bunny, and does things that Hak5 tools don't do
3. X Bash Bunny's use cases are limited to pranksters and non-remote access implementations.
4. ✓ Pwn4P1 is a cheaper solution than Bash Bunny

And on to claim #1. More opinion here, from the P4wnP1 rep. Already, I would say part of this claim is false based on the physical switch distinction above, but that feels pedantic, so let's compare number of payloads.

[Bash Bunny payload count](https://github.com/hak5/bashbunny-payloads/tree/master/payloads/library): 68+ (counting folders only, more if you count individual files and variations)

[P4wnP1 payload count](https://github.com/mame82/P4wnP1/tree/master/payloads): 13-20 at time of writing (depends on if you count individual files and variations or just folders).

Does more mean better? No. Are all those payloads useful in every case? I can assure they are not. Would I rather have a larger library to choose from on the chance that I find something that either "just works" or that I can modify to work? Yes. Is it fair to compare a commercial product to free, volunteer-based solution? Not really, but I didn't make the initial comparison, I'm fact checking.

I can confidently say the "P4wnP1 does more" part is false; it does **different** things, but I would say they each have features the other does not have.
What about the second part of the claim? Does it do what it does better? Well... That's harder to quantify. My favorite example is the "Lock Picker" feature that the P4wnP1 author is (understandably) very proud of. It is based on Mubix's original attack, and takes it a step further: instead of just grabbing hashes via Responder with a local USB device, the P4wnP1 will try to crack that hash using a local version of John. If it succeeds, it will then try to log into the machine interactively. When this attack succeeds it's pretty [badass to behold](http://p4wnp1.readthedocs.io/en/latest/Payload-Subfolder/Windows-10-Lockpicker-Subfolder/Windows-10-Lockpicker/) (link includes video demos).

But let's think that through. If the target machine is protected by a weak password, this gets me in. That's awesome, if I'm still there. 
How fast is the Pi Zero at cracking with John? Not very. We're starting to describe divergent use cases, here.
In the one case, a user walks away from their machine. The adversary physically accesses the machine, uses a Bash Bunny/P4wnP1, captures hashed creds, then leaves.
In the second use case, the adversary leaves the P4wnP1 on the machine attempting to log in. This might be successful or not, but it definitely increases the likelihood of the attack being noticed (either the device spotted or the user noticing their machine has been logged into).

The adversary could remain nearby to use the machine interactively if a logon is successful, or automate the payload to be executed after successful login, but again, these are very different use cases with different risks. I wouldn't say that one is better than the other; they each have their place and appropriate use.

Once again, I'm going to consider this claim false. Attribute it how you will, either Twitter's character limit forcing over-simplification, disingenuous claims by a competitor, passionate opinion coming before thorough consideration and analysis, or some other reason. Whatever the reason, it's not accurate, in my opinion.

Does P4wnP1 do everything Bash Bunny does? Nope. Neither does Bash Bunny do everything P4wnP1 does.
Does P4wnP1 do what it does better than Bash Bunny? Ehhh... There isn't a clear yes/no on this question.

1. X P4wnP1 can do everything Bash Bunny can do, and does those things better
2. ~ P4wnP1 is a more broad project than Bash Bunny, and does things that Hak5 tools don't do
3. X Bash Bunny's use cases are limited to pranksters and non-remote access implementations.
4. ✓ Pwn4P1 is a cheaper solution than Bash Bunny

So far not looking great, for the outcome of the Twitter thread. But once again, this isn't a zero-sum game. We can use both tools to their strengths, and the best toolkit is ready for any eventuality. I now have a new tool to utilize on my pentests, and when the situation arises where I can leave the P4wnP1 on a machine, letting it attempt to crack away at the password, I will eagerly do so.

I would also be remiss if I didn't mention the volunteer-based effort of the creation of P4wnP1. @MaMe82 doesn't **have** to put in the work on what is admitedly a very cool, powerful, and cost-effective solution to physical and drop attacks. To some degree this is a David and Goliath type of comparison; Hak5 aren't enormous by corporate standards, but there is certainly a size disparity here. While my fact checking above is not necessarily in favor of P4wnP1, I want to be very clear that I am glad it exists, and I intend to use it and encourage others to do so, where apprioriate.

The main purpose of this post was to analyze the claims in the Twitter thread, but while I'm at it, a couple other observations and comparisons between the two that might help shed some light on the cost difference and other reasons that pen testers might make use of the Hak5 solutions instead of P4wnP1.

## Physical comparison
A physical comparison, while brief, is important when it comes to how a tool might be used. Neither of these devices is very large, but there is a distinct difference in size and appearance, as well as the nature of the connectivity:
![UNADJUSTEDNONRAW_thumb_2aa](/assets/images/UNADJUSTEDNONRAW_thumb_2aa.jpg)

Not a huge size difference, but there is one. More importantly, the need for a USB dongle has two main impacts, that I can see:

1. Con: The device is less concealed, in general
2. Pro: The device can connect in some places the Bash Bunny won't fit (tight USB ports)

I'm not going to comment on the "style" or appearance since the Pi Zero could have any number of cases. Oh, and by the way, if you think that using the "naked" board conencted to a dongle is ok... just, no. For so many reasons no.

## Educational value
Also, with the documentation and material that is included on the P4wnP1, I consider it to be a far more vaulable educational/training tool for the individual. It explains in depth the various attack tools that it comes with, and the verbosity of the write ups is **very** valuable to anyone seeking to better learn this craft.

## Warm and fuzzy
The last observation I have is regarding something a little less technical and a little less quantifiable. It's the "warm and Fuzzy" feeling a customer wants when they are selecting a product. If a significant portion of the success of a company's ability to perform an effective pentest hinges on the reliability of a product, which do you think a manager (e.g., the person involved in getting your equipment budget) is going to be happier with seeing?

P4wnP1 (after set up script completes): "If you came till here without errors, you shoud be good to go with your P4wnP1... if not - sorry, you're on your own, as this is work in progress."

Hak5 (on their wiki): "WARNING: Community payloads come with absolutely no warranty. You are solely responsible for the outcome of their execution."

Note the distinction in messaging and the sense that it gives you, the user? With the P4wnP1, the message is clear: you're on your own. No support, no help. Good luck.
With the Bash Bunny, the only portion that caution is urged is regarding the community payloads.

Are either of these disclaimers "wrong?" Not at all. They are both very reasonable. But once again, put yourself in the shoes of a manager deciding which of these products to approve a purchase order for. Which do you choose?



