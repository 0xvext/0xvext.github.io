---
title: Jekyll + Github Pages vs. Ghost self-hosting.
date: '2018-08-11 18:57:33'
tags: jekyll githubpages ghost
---
I've been meaning to get these thoughts up on the blog for a bit, since [transitioning](https://vext.info/2018/07/29/migrating-from-ghost-to-jekyll-and-github-pages.html) from a self-hosted instance of Ghost to Jekyll-powered Github Pages. As previously described, the overall reason for the change was my concern about self-hosting a dynamic page while not having the time to properly monitor and manage such a platform. While I have different reservations with relying on third-party hosting, Github Pages seems to be a good fit, thus far. This blog is nowhere near their [usage limits](https://help.github.com/articles/what-is-github-pages/#usage-limits), so until and unless I hit them, I don't have much to worry about in that regard. Remains to be seen what the whole [Microsoft acquisition](https://blogs.microsoft.com/blog/2018/06/04/microsoft-github-empowering-developers/) will mean for the platform.

This post is to describe the pros and cons I have identified thus far from the move, and my own approach for addressing some of the latter.

## Pros
* Free hosting platform. These are becoming all too rare these days. A third-party hosting platform does carry some trust concerns, but overall it solves more concerns than it raises, for me. This blog is a hobby project, so I can't justify sinking money into it for hosting, so self-hosting means using my home Internet connection, which is not appealing for a number of reasons. Github certainly has higher availability assurance than my personal ISP connection, and combined with CloudFlare free caching (something that didn't work very well with Ghost), it's even less likely to be unavailable at any given time. Time will tell if Microsoft clutters the platform up with advertisements or decides to kill the web hosting portion of it entirely, but for now it's free as in beer, and their terms of use aren't even that scary.

* Less dynamic code to worry about. As in, effectively none. The dynamic code that exists is all back-end, functioning as a parsing engine for markdown that is uploaded, rather than executing any dynamic code based on requests. That means that whatever dynamic attack surface exists is exposed only to the material that **I** upload, rather than visitors to the site.

## Cons
* No built-in method for online private drafts. Since the composition process is either local composition on my own computer or markdown files uploaded via the Github GUI, that means that drafts can't be saved online in a private manner. Drafts can be kept offline-only, introducing a data loss potential, uploaded to the Github repository unpublished, revealing their contents, or else stored in some third-party cloud platform until ready for publishing.

* One of the nice things about a CMS like Ghost is that you can have numerous unpublished drafts. You can even write a post in advance and schedule it to automatically publish at a later date, which is a feature that I will miss.

* Relying on third-party infrastructure. With the pros above come the natural flip side cons. This only came up as I noticed a period of time where the blog was being served up by Github without HTTP redirecting to HTTPS. It was very short-lived, but it did remind me that with the added complexity of a third-party hosting platform comes increased likelihood of failure in various capacities.

* Unless using one of the [supported Jekyll themes](https://pages.github.com/themes/), at least for initial setup, users have to locally install the Jekyll environment to submit posts and preview drafts offline. This isn't a huge issue, and is somewhat analogous to setting up a server platform such as Ghost, but it does introduce some challenges when traveling, which I do frequently for business.

## Solutions
* Drafts - I haven't yet identified a perfect solution for the lack of private drafts. For composing with accurate preview, the markdown has to be created locally and loaded in an editor that supports markdown formatting, or, for the best experience, built and previewed locally with an active Jekyll environment. The two main possibilities I have identified so far are either composing drafts in a cloud platform like [Evernote](https://www.evernote.com), or composing locally and using some sort of cloud sync software to keep a private copy of the drafts folder that is not pushed to the Github repository. Neither of these is seamless, and each carry their own pros and cons. If money is no object, a private Github repository could be used for this purpose easily enough, but dat $$$, tho.

* Scheduled posts - The only way I can think to solve this one would be to set up a dedicated and automated Jekyll/Git instance with drafts written in advance, using something like cron to push the posts at a specific date. This would require storing the github credentials in [some form](https://help.github.com/articles/caching-your-github-password-in-git/#platform-all), which I am not a big fan of. Still, if the need arises, it can be done easily enough.

* Third party infrastructure reliance - Particularly as it pertains to HTTPS not being active, I'm thinking I will set up some monitoring for overall site availability and a sanity check to confirm that it's not being served up without HTTPS. I haven't yet built this out. More to come once I have that in place.

* Jekyll environment - There isn't really anything to do here other than accept the requirement. For existing sites the Jekyll environment is not strictly necessary, unless working on format changes or trying something new that has not been previewed in Jekyll before. While the process is a bit more manual, copying an existing post markdown and using that as a template is perfectly viable within Github Pages. That said, things are more streamlined using Jekyll and git.

## Future Considerations
As mentioned above, the main changing variables I foresee are either Microsoft drastically changing the platform, or else this blog becoming large enough to exceed usage limits for the free service. Neither of those seem particularly immediate, so I will save further thoughts on the subject for another time.

## Fun Fact
This was my first blog post written and published from an airplane. Hi from 33,000 feet!
![Flight info](../../../assets/images/2018-08-11-3.06.24-PM.png)
