---
title: 'Analysis of Facebook advertiser data'
date: '2018-11-04 17:30:19'
tags: facebook privacy advertisement
---

I'm not a big fan of Facebook due to [numerous](https://www.nbcnews.com/tech/social-media/timeline-facebook-s-privacy-issues-its-responses-n859651) [privacy](https://www.schneier.com/blog/archives/2018/10/facebook_is_usi.html) [concerns](https://www.forbes.com/sites/thomasbrewster/2016/06/29/facebook-location-tracking-friend-games/). I've gone back and forth on the subject of closing my account for some time, but as yet still haven't pulled the trigger.

I rarely make use of the platform, and when I do I'm typically reminded of the reasons that I should  opt out, in as much as that is possible (read: [it isn't](https://webtransparency.cs.princeton.edu/webcensus/)). As an aside, I've made some efforts to de-Google my life, and it's even harder to opt out of their ecosystem.

This time around, I decided to spend some time reviewing the information dump [available](https://www.facebook.com/settings?tab=your_facebook_information) in the Facebook settings area. The dump consists of a huge amount of user-visible information (friends, comments, likes, instant messages, etc.) and a small amount of data that isn't usually visible to users.

Of particular interest in this latter category was the "Friend peer group" (in which I am apprently associated with people who are in the "Established Adult Life" stage), the IP address information, and the "Advertisers Who Uploaded a Contact List With Your Information" view. This contains a list of advertising enteities, who, as Facebook describes it, uploaded my information to Facebook.

I ran basic analysis on these advertisers. At a high level, the categories are a bit skewed by one big player:

![Longtail](../../../assets/images/Screen2018-11-04-18-01.png)

So apparently, car companies love me. Various car dealers **all around the country** make up 265 out of the 356 entries in my advertiser list. Why? Couldn't say, I'm not exactly what you would call a primo target for car companies. Is this a normal thing for others? I have no idea.

Normalizing the remaining categories by slicing out the car dealers, the (sideways) long tail becomes a little easier to examine:

![Longertail](../../../assets/images/Screen2018-11-04-18-02.png)

Some observations and questions raised by this data:

* Car dealerships (265) seem to buy/sell/distribute data about individuals like mad. Of the dealership entities in the list, I **might** have had a direct business transaction with **one** of them. I'm not even 100% sure of that one, but it is at least a local dealership whose name I recognize. The other 264 are all around the country, most in states I've never lived in or even visited. Also interestingly, a vary **large, well-known national car chain** that I've done business with is not on the list.

* The next biggest "category," (trailing by a huge margin), were entities that I couldn't actually verify a single industry for, because their names are so vague that I couldn't confirm what organization had my data. Some examples of these include "Animals," "Creed," "Market Research," and "The Sisters Brothers," among others. Some of these are clearly marketing firms, but **which** marketing firms is harder to nail down.

* "Pets" comes in next, and while I don't have a direct relationship with any of the companies listed, I have a pretty strong idea that I know which **major pet store chain** gave/sold them my info.

* "Food" comes in as a strangely large category. There are apparently a lot of food brands (ranging from organic health brands that I've purchased for years to absolute garbage brands that I won't eat if I can avoid it, and others in between) that are very interested in this kind of advertising data. I find it odd only because I'm not sure of the mechanism they use to gather the data in the first place. I would guess supermarket buyer rewards programs and/or credit card purchase metrics.

* Video games are a mix, with most of it being "legitimate," but had I known at the time that the information would be captured and used in this way, I might have thought twice before giving it up. If you're a gamer and follow gaming news, you won't be surprised to hear that EA shows up as one of the most frequent entities on the list, even though I play very few of their games. Also worth noting, "World of Warcraft," (a game I have never played or even trialled) showed up. I guess this is a result of the forced syncronization between Facebook and Starcraft 2 accounts that was in play briefly before fan backlash led to them canceling the requirement. Thanks, Activision.

* There are 6 entries for a company that does garage door repair and installation. I do not, nor have I ever, owned a garage. I have no idea why this lands so high.

* There are 5 entries for a company that builds homes. I suppose this one is a big more generic and understandable, but I also haven't had a home built, nor ever looked into building one.

* 4 different sports entities show up, which is only notable because I have as close to zero interest in sports as possible, and I've certainly never directly used any sports websites or other sports-related services. Possibly something from a gym membership, though?

After these larger groupings, we switch into the fun part: longtail analysis. The outliers range from benign to bizarre. Some of my favorites:

* There are two entries for medical care, one of which is a hearing aid company. I don't even.

* One senior living facility shows up. I've always been "geared like" an old man... but damn.

* A tequila distiller is on the list. Another one of those things that I'm sure casts a pretty wide net, but I just don't get it.

* Oculus shows up, which is probably an example of Facebook just sharing information among its brands, although there is a chance I signed up for some kind of information **before** Facebook acquired them. I honestly can't recall.

* There is a child care company on the list. If there are **any** demographic indicators for me having children, somebody's algorithms are way off.

* There is a paper manufacturing company on the list. I don't have any idea how that makes sense.

* A school in a state I've never lived in or near apparently has me. Possibly part of some college information sharing ring.

* Across all categories, there are only 16 entries (less than 5%!) that I am confident are made up of:
	1. Products or services I use or have used and,
	2. Would be sites or services I would have deliberately and directly given my information to

Overall, this leads me to think that Facebook's demographic information isn't as valuable as they make it out to be. This would be in line with recent news that their video ad placement was possibly misrepresented in terms of its value and impact.

I'm also curious why car dealers make up such a huge portion of the advertisers in the list. I suspect that car dealers are part of some big fraternity of information selling/sharing amongst themselves. Who wants to bet they don't do a great job of securing that information?
