---
title: 'SSL/TLS Fun with Canary Tokens'
date: '2019-03-15 19:07:12'
tags: canary token privacy tracking analytics SSL TLS Firefox
---
# What had happened was...
It didn't take long to learn (or re-learn) some more interesting things, thanks to [Thinkst Canary Tokens](https://canarytokens.org/generate).

First, a small admission: I've been using you. That is, I've been using my site, since the prior post on Canary Tokens, to play with one. No, don't worry, I didn't have malicious JavaScript or invasive plugins trying to interrogate your browser (though [those](https://www.techdirt.com/articles/20131215/23260825572/facebook-is-tracking-when-you-write-something-then-decide-to-delete-it-rather-than-post-it.shtml) are totally [things](https://www.techdirt.com/articles/20141105/11315029057/verizon-may-soon-get-to-enjoy-lawsuit-over-their-sneaky-use-perma-cookies.shtml) that [some sites](https://www.techdirt.com/articles/20060503/0141241.shtml) will use).

This was a very simple URL token, inserted into the page code as an `<img>` tag. Any time the page was loaded (and thus the image requested), I would get a notification from the Canary Token. The information provided was similar to what can be provided with any site analytics framework, though unlike most modern analytics frameworks, it included the requesting IP address, much like was provided with the .docx payload I tested on VirusTotal in the [previous post](https://vext.info/2019/03/12/fun-with-canary-tokens.html).

Before getting into the interesting stuff: I've taken the auto-loading token out of all pages, and I've deleted all the notifications I received from that beacon, since I didn't feel right about having the individual IP addresses of users visiting the site, without some kind of disclosure that it was being captured.

I have left a hidden `<a>` tag with a link to a different token, to get some information on what automated crawlers are visiting the site, but unless a human views the page source and manually loads the link (with its warning), I won't receive any individual IP addresses from that one.

# So about TLS...

Now on to the lessons learned! I loaded my page and noticed that the HTTPS security status in Firefox had changed from green to yellow:

![Yellow is bad](../../../assets/images/canary-02-02.png)

Hmm. The site is hosted on [GitHub](https://www.github.com), and I use the option to enforce HTTPS... I know they get legitimate certificates from [Let's Encrypt](https://letsencrypt.org/), so what's the cause? Did they have a mix-up with their cert generation/application?

![Qualys SSL Labs](../../../assets/images/canary-02-03.png)

No, everything is fine there. Let's take a look at the debug console...

![Oops](../../../assets/images/canary-02-01.png)

Oh, right... My own fault. I had seen this behavior before, on other sites, but entirely forgot about it when I was inserting the HTTP links to the Canary Tokens into my own site: modern browsers will complain about insecure elements being loaded into secure sites.

The severity of the complaining depends on the nature of the elements. An `<img>` tag will get [less noise](https://support.mozilla.org/en-US/kb/mixed-content-blocking-firefox) than the [fields of a login form](https://developer.mozilla.org/en-US/docs/Web/Security/Mixed_content), or a `<script>` tag, for example. Any HTTP-only elements are immediately suspect, since the page as a whole is loading over HTTPS. This makes sense, because an attacker taking a mitm position could be loading a frame with HTTP content in addition to the secure HTTPS content, trying to obtain credentials or other user input. Even by just loading images, an attacker could disrupt the use of the page by loading objectionable content.

# Questions to Answer

A couple questions started forming in my head:
1. Can I hide the URL to the Canary Token so it isn't obvious where it goes?
2. Can I restore the HTTPS status to "Green" while still including the token?

Spoilers: The answer to both questions is "yes," but not both at the same time, and for good reason.

# Browser Security

Hiding the origin of an HTTP element is trivial if you control a DNS domain. Simply set up an A record of your choosing to point to the same IP address as the domain in the original URL, and voila, "HTTP overloading":

![HTTP overloading](../../../assets/images/canary-02-04.png)

This gets a little more complex if the destination has a rotating IP address, and it doesn't resolve the original problem of showing the "all clear" with regards to HTTPS in the browser.

Next I tried using HTTPS URLs instead of HTTP URLs for the Canary Tokens. I know the site for the tokens supports HTTPS (also through Let's Encrypt), but I had a suspicion this wouldn't work, with the HTTP overloading. I was surprised when I reloaded the page and got a green padlock... but then I realized the token was no longer firing. Clearly the browser was having none of this kind of dirty trick:

![No you may not](../../../assets/images/canary-02-05.png)

The reason should be obvious:

![You can't do that!](../../../assets/images/canary-02-06.png)

Trying to obfuscate the true domain destination of an element while also using HTTPS violates modern browser security: namely, the TLS certificate that is supplied by the destination doesn't match the domain name that was used to load the element. This raises flags, because it shouldn't occur under any normal/benign circumstances. In short, it means somebody is up to something sneaky.

# Options

So what to do? Well, that depends on the ultimate goal:

1. If your goal is to embed the remote resource without disclosing its DNS domain of origin, you're stuck with non-secure HTTP and DNS overloading. This will give you the "yellow" padlock in today's browsers.
2. If your goal is to embed the remote resource with completely valid HTTPS, you must disclose the DNS domain of origin (the one that matches the TLS certificate):

![Now everything is right with the world](../../../assets/images/canary-02-07.png)

For this site, since I'm not interested in either, I've removed the auto-loading Canary Token reference entirely, but kept the hidden anchor tag to see what kind of crawlers poke around the hidden elements of the site. Since that anchor tag doesn't auto load any content, using unencrypted HTTP doesn't set off any alerts in the browser. I wonder if one day we will see browsers complaining if an HTTPS site contains a single non-secure HTTP link... 🤔
