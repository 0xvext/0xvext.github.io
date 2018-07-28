---
title: Installing Oracle Java on Kali Rolling 2017.1
date: '2017-08-28 22:28:50'
tags: kali
---

# Cheat-sheet version:
Download [Oracle JRE](http://www.oracle.com/technetwork/java/javase/downloads/jre8-downloads-2133155.html). 
`sudo apt install java-package`
`make-jpkg jre-8u144-linux-x64.tar.gz`
`sudo dpkg -i oracle-java8-jre_8u144_amd64.deb`
`sudo update-java-alternatives -s oracle-java8-jre-amd64`
`java -version`

# Full post:

Since I use Cobalt Strike during my pentests, I like to adhere to the developer's [advice](https://www.cobaltstrike.com/help-install) and use Oracle's Java instead of the OpenJDK package. According to [Mr. Mudge](https://www.linkedin.com/in/rsmudge), OpenJDK causes various bugs and issues with Cobalt Strike. Personally I find even the official Oracle JRE buggy enough (especially on Linux), so if using the closed-source version helps reduce such problems, I'm willing.

I built a fresh VM on Kali-Rolling 2017.1 and discovered that guides on installing the official Oracle JRE within Kali were lacking.
The options I found:
1. Were months old, and mostly referencing Kali 2016 and/or Java 1.7
2. Relied on third-party repositories that I am not thoroughly familiar with (and, even their documents seemed to be out of date).

It's possible these guides might have worked, but I am hesitant, based on my past experience, to use older guides on newer versions. I am also leery of adding third party repositories.

With the rapid pace of development in Kali-Rolling, I decided to put together this post on how I successfully installed Java 1.8 in Kali-Rolling 2017.1.

Oracle isn't friendly with Debian (from which Kali is derived), so the only download options on the Oracle site are RPM and gzipped-tar packages, neither of which makes for a streamlined install process.
Fortunately, there is an existing tool in the main Debian repositories called [JavaPackage](https://wiki.debian.org/JavaPackage). This tool will take a .tar.gz file from the Oracle site and convert it into a .deb file for easy installation in Debian variants.

Setting up the environment consisted of the following steps (if you are kicking it [HackNaked](https://securityweekly.com/) style, omit the sudo):

1. Download the latest Oracle JRE package from [Oracle](http://www.oracle.com/technetwork/java/javase/downloads/jre8-downloads-2133155.html). As of this writing, the current version that I was successful with is jre-8u144.
2. Install the Debian package JavaPackage to add the make-jpkg command.
`sudo apt install java-package`
3. Convert the .tar.gz file to .deb with JavaPackage
`make-jpkg jre-8u144-linux-x64.tar.gz`
4. Install the new .deb file.
`sudo dpkg -i oracle-java8-jre_8u144_amd64.deb`
5. Update the system to use the new JRE instead of OpenJDK.
`sudo update-java-alternatives -s oracle-java8-jre-amd64`
5. (Optional) Verify the version of Java that is active on the system.
`java -version`
> java version "1.8.0_144"
> Java(TM) SE Runtime Environment (build 1.8.0_144-b01)
> Java HotSpot(TM) 64-Bit Server VM (build 25.144-b01, mixed mode)

After this, you should be good to go.

