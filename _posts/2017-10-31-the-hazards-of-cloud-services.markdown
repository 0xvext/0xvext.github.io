---
title: The hazards of cloud services
date: '2017-10-31 02:58:32'
tags: cloudflare
---

I ran into an issue with the site over the weekend that, in hind sight, I should have avoided.

Following the sound advice of [Troy Hunt](https://www.troyhunt.com/), I've configured this blog to use the [free Cloudflare service](https://www.cloudflare.com/plans/) for DNS, HTTPS enforcement and basic cloud DoS protection.

Since I want all traffic coming inbound to the blog to filter through Cloudflare, I have some restrictions on requests that come from any other ranges than those [provided by Cloudflare](https://www.cloudflare.com/ips/) on their website.

The guide that I used for configuring the source filtering included its own copy of the Cloudflare source IP ranges, but it turns out those ranges were out of date. I didn't notice the difference in the ranges, and when load-balancing led to some IPs not included in my config requesting access to the page, they were denied.

Access has been restored as of 2017.10.29, but this also brought to light an important aspect of relying on cloud services: their IP ranges can, and over time do, change. This problem will occur again in the future if Cloudflare has a need to expand its IP space. That might be years or days, but it is likely to happen again, particularly in the IPv6 space.

To correct this issue long term, I am creating scripts that will scrape the Cloudflare IP range files on a daily basis. If differences are detected, those differences will be added into the filtering mechanisms I use for the site (for now, Nginx, and in the future, IPTables).

The initial version of the scripts can be found on [GitHub](https://github.com/0xvext/getCloudflareIps). The current version downloads the updated files from Cloudflare and spits out an Nginx file that can be included in site configurations. Future versions will incorporate more advanced checking for changes, automating the daily check, and applying the filter if it is changed.
