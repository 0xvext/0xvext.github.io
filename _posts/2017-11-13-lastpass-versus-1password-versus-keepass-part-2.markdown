---
title: LastPass versus 1Password versus KeePass, part 2
date: '2017-11-13 04:35:38'
tags: reviews
---

Now that I've gone over the background and the summary of my conclusions in part 1, this post will be to analyze various aspects of the offerings themselves. While I will try to do as much of an apples-to-apples comparison as possible (using some very basic rubric), there will no doubt be observations I can make about one solution that do not apply to another, or which I did not fully assess with another, based on the amount of time and experience with that given solution.
# Part 2: Comparison of features and traits
Rather than break sections up the way reviews often are (all about option 1, then all about option 2), I'll be segmenting this post by feature comparisons. Each comparison section will review one of the considerations I made when evaluating which password solution to use. I will touch on each of the three assessed solutions within each section.

## Comparison 1 - Site SSL score
This may seem trite, but I find that checking out a website's score in the free Qualys SSL Labs site can be very informative. While high grades are not an assurance that there are no other security issues with the site, low scores are often an indicator that proper care and maintenance are not being performed in other areas, and can be a cause for concern. Anything below an "A" grade is often a possible indicator of such concerns. An "A+" is ideal, but I consider A to be acceptable. 
As of this writing, all three sites involved receive at least A grades, at least on their user-facing web interfaces:
https://www.lastpass.com
https://1password.com
https://www.keepass.info

LastPass received an A+ for https://lastpass.com, but that address redirects to https://www.lastpass.com, which only received an "A:"

![sslhealth](/assets/images/sslhealth.png)
![sslhealth-1](/assets/images/sslhealth-1.png)

1Password resolves to multiple hosts under the same name, all of which receive A grades:
![sslhealth-2](/assets/images/sslhealth-2.png)

And while it isn't apples-to-apples (since there is no web service), KeePass also gets an A grade:
![sslhealth-3](/assets/images/sslhealth-3.png)
KeePass uses SourceForge for primary hosting, which, surprisingly, given past issues, gets an A+:
![sslhealth-4](/assets/images/sslhealth-4.png)

This illustrates the limitations on what an SSL Labs grade can provide: While the SSL/TLS security of the page gets a top grade, SourceForge itself has had its share of problems over the past decade or so, due to serving up questionable ads, and [making it hard for users to download software without bundled adware](https://en.wikipedia.org/wiki/SourceForge#DevShare_adware).
Overall, I consider SourceForge being the primary download option of KeePass to be a negative. Fortunately, the source code is available directly from the KeePass website without going through SourceForge, so it's not a deal breaker.

## Comparison 2 - Terms of Service and Privacy Policy
Another one of those trite but potentially valuable indicators. The devil is always in the details, but as a consumer I think it is important to be aware of the size and the nature of terms of service and privacy policies for the software and services we use.
There is no simple way to summarize if a given set of terms of service are better or worse than any other, but each individual user should read through them and understand the implications. Based on your personal [threat model](https://en.wikipedia.org/wiki/Threat_model), a single clause in a terms of service document (or its omission), could be the deal breaker for you.

Length is not a reliable indicator, but it *does* give some idea as to how complex the terms of service documentation is. For that reason, here I compare the overall length of each terms of service and privacy policy in number of words, and I give a  brief summary of my take on each.

### LastPass
#### Terms of Service
Word count: 4,110

LastPass no longer has its own standalone terms of service document since the company was [acquired by LogMeIn in 2015](https://investor.logmeininc.com/about-us/investors/news/press-release-details/2015/LogMeIn-to-Acquire-Password-Management-Leader-LastPass/default.aspx). LastPass has instead been brought under the master terms of service for LogMeIn. This has both pros and cons. On the plus side, LogMeIn is a large, established company that no doubt has excellent legal representation, and professionally-crafted terms of service. On the down side, the terms are over-broad, in my opinion, for a password-manager service. Their [indemnity clause](https://www.logmeininc.com/legal/terms-and-conditions), in particular, is the most aggressive of those being discussed. That said, this is not abnormal for "cloud services" these days, and is not surprising.

#### Privacy Policy
Word count: 2,727

Same as the terms of service, LastPass is under the generic [LogMeIn privacy policy](https://secure.logmein.com/home/en/policies/privacy/), rather than any policy crafted specifically for LastPass. Like most modern privacy policies of large companies, it has all the expected legalese that makes it sound consumer-friendly, when in reality it sets up a legally-protected agreement that they can share your data in various unregulated ways. It reads like a legal contract, covers their sharing of your data as they deem "needed," and makes sure to let you know that they can share in other ways if you consent to it. Which you do by using their service.

### 1Password
#### Terms of Service
Word count: 2,485

The 1Password [terms of service](https://1password.com/legal/terms-of-service/) is a little easier to read than that of LastPass, but not much. It doesn't ring of the same "mega corp" style that can be found in LogMeIn's materials, but it still reads like a get-out-of-responsibility-free card. Their limitation of liability section, in particular, has the same basic intent as the indemnity clause mentioned above, and their language is in a way even more far-reaching. It states that they shall not be liable for numerous harms, including those that come about as a result of:

> "... the unauthorized access to, use of or alteration of your transmissions or content, whether based on warranty, contract, tort (including negligence) or any other claim in law, whether or not we have been informed of the possibility of such damage, and even if a remedy set forth herein is found to have failed of its essential purpose."

I am not a lawyer, but I wonder if that would even be enforceable in court. It would likely depend on the specific circumstances and the decisions of those who have actually been through law school.

#### Privacy Policy
Word count: 1,451

This document is far more human-readable than that of LastPass. It is clearly designed to inform the reader and states that it is not a legal agreement, but rather an internal policy. It is also clearly written specifically with a focus on reasonable privacy practices of a single service, rather than a large umbrella policy that could cover any concievable service.

### KeePass
#### Terms of Service
KeePass is a free, open-source software project. There is no service, and so there is no terms of service document to evaluate.

#### Privacy Policy
KeePass is a free, open-source software project. There is no information gathered by the author, and so there is no privacy policy to evaluate.

---

These first two aspects of the three services are useful, but there is a good deal of the story left to tell. Next post will get into service support, pricing, and the nature of each solution.
