---
title: 'DMs to myself; airing out the Twitter backlog post 1/n'
date: '2018-10-23 17:08:01'
tags: dms twitter opinion reference
---

Welcome to "DMs to myself," where I will be going through messages from Twitter that I sent to myself in an effort not to lose interesting or valuable pieces of information that flow through the ether that is Twitter's timeline.

These posts will be a ~~hopefully regular~~ ~~probably sporadic~~ review of interesting and informative tweets that have landed under my scope but which, as is often the case, I didn't have time to delve into at the time. I will take a look at a hand full of tweets and related links and provide my own comments or observations.

Note: Some of these are ooold. I've been building up my pile of saved tweets for a while now.

# Tweet 1/5
[@J0hnnyXm4s](https://twitter.com/J0hnnyXm4s) writes:
![@J0hnnyXm4s](../../../assets/images/ScreenShot-2018-10-23-1.png)
"MBP, Dell XPS 13, or Razer Blade Stealth? (All maxed-out, all 13")? No replies; just vote:"

Both these laptops are slick. I haven't owned a Dell XPS myself, but the form factor and specs are impressive.
For me, the host OS is a huge factor of the difference, but there are some other considerations to make.

Quick pro/con list:

## MBP
### Pro
	* Mac OS native.
	* Hardware GPU beefy enough to crack passwords with Hashcat.
	* Best touch interface around.
	* Display is second to none.
	* Up to 1TB SSD.

### Con
	* Price. Always price with Apple.
	* No full-size USB ports: you need dongles for all the things.
	* Issues with keyboard problems.
	* Keyboard feel and sound.
	* Touch bar is silly and wastes energy.

## Dell XPS
### Pro
	* Has classic USB ports.
	* Similar form factor for less money.

### Con
	* Native OS is Windows (or Linux at best).
	* Just a guess, but I imagine it won't perform as well as MBP.
	* Smaller storage options from Dell. Not sure why this doesn't have a 1TB SSD option.

Winner? Depends who's buying. If your company will pay for the decked-out MBP, it's good... but money is an object.

# Tweet 2/5
[@strawp](https://twitter.com/strawp) writes:
![@strawp](../../../assets/images/ScreenShot-2018-10-23-2.png)
"Need to inject a Windows command with a param but spaces are stripped? Use a space from an env var e.g. notepad%ProgramFiles:~10,1%file.txt"

This one is a clever way to insert a space into an interface that prevents entering spaces. Presumably this was for some sort of application testing where command injection was found, but the input system was smart enough to strip spaces and normally-encoded spaces.

The brilliance of this technique is that it will use the native environment variables of the host machine that the command is being injected to. This assumes that the process being injected through understands what system variables are, but assuming it does, the string provided ("%ProgramFiles:~10,1%") is a space.

Why? At first I wasn't clear on this. I confirmed my guess that :~10,1 means to start from the beginning of the string, count 10 characters, and then insert 1 character starting from that position ([DOS string manipulation](https://www.dostips.com/DtTipsStringManipulation.php)), but "ProgramFiles" doesn't have any spaces, especially at the 10th position...

Then the duh moment: The string being operated on isn't "ProgramFiles," it's what that variable points to, which on most systems is "C:\Program Files" (or whatever drive letter it happens to be).
The 10th character is "m," meaning that the next 1 character we insert is a space. Brilliant.

# Tweet 3/5
[@patio11](https://twitter.com/patio11) writes:
![@patio11](../../../assets/images/ScreenShot-2018-10-23-3.png)
"If someone has opened an account in your name do not call the bank and ask them to close it. You do not have or want authority on acct!"

This is only one tweet out of a long thread having to do with identify theft, how to protect yourself from it, and what to do if it should occur to you. Patrick wrote up an extensive and really well made article [here](https://www.kalzumeus.com/2017/09/09/identity-theft-credit-reports/) with more detailed information.

# Tweet 4/5
[@joswr1ght](https://twitter.com/joswr1ght) writes:
![@joswr1ght](../../../assets/images/ScreenShot-2018-10-23-4.png)
"I use this little Python trick all the time to decode HEX strings into binary data, writing it to a file for analysis."
~~~ python
$ python
>>> hexstr = "<paste hex string here>"
>>> data = hexstr.decode('hex')
>>> filehandle = open("foo.bin", "wb")
>>> filehandle.write(data)
>>> filehandle.close()
>>> ^Z
$
~~~

A good tool to have in your belt if you ever do analysis of suspicious data streams and needs to reliably export a binary from hex-encoded data.

# Tweet 5/5
[@jeffmcjunkin](https://twitter.com/jeffmcjunkin) writes:
![@jeffmcjunkin](../../../assets/images/ScreenShot-2018-10-23-5.png)
""Parsing for Pentesters" by @bluscreenofjeff - https://implicitdeny.org/2016/07/finding-diamonds-rough-parsing-pentesters/ … Great stuff! Def. take a look at .gnmap section - super useful!"

This is a really good write up on fundamentals of using bash and how to be efficient with some command line kung fu. It's a great crash course into how to use pipelining of input/output commands, and the author provides excellent screenshot examples to introduce each of the tools covered (xargs, grep, cut, awk, sed). It's a great read and I highly recommend that anyone working in security (whether new to the field or brushing up on your skills) give it a read.

And there we go. This is the first of my "DMs to myself." A little random, and I hope informative for others!
