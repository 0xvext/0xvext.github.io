---
title: 'The Ways I Use Mind Maps'
date: '2021-04-07 21:42:47'
tags: mindmap xmind study notes documentation
---

Not so long ago, a friend and colleague of mine inspired me to start using mind maps. Since then, I've incorporated mind maps into various workflows wherever I can, and I thought it would be interesting to show some examples.

My tool of choice is [XMind](https://www.xmind.net), but there are [numerous other](https://alternativeto.net/software/xmind/) popular mind mapping tools available. I went with XMind because of its primarily-offline design (though they do have a web app option); the fact that they offer a free trial version (though they try their best to hide that fact); and that the application is designed to be primarily used via keyboard, which minimizes the amount of mouse clicking that needs to be done to draw your mind map.

# What is a Mind Map?

In short, mind maps are visual representations of the hierarchical relationship of various items. The items could be abstract ideas or tangible objects, or a mix of the two. The mind map is a way to lay out your understanding of these relationships in a visual format that serves a number of purposes:
* Taking notes on a new subject or a brainstorming session
* Studying a complex topic with multiple levels of nested relationships
* High-level documentation (think of a subject outline)
* Identifying gaps in knowledge - and then filling them
* Maybe even resume creation/improvement

XMind in particular comes with a bunch of different layout options that make it useful for free form mind mapping/brainstorming, or for more traditional, established diagrams like organization charts, data flows, and logic charts.

## Baby's first mind map
I'm describing the uses of mind maps, but in case you haven't seen one, here's a basic example:

![Hello, mind map](../../../assets/images/Screenshot_2021-04-07_18-42-13.png)

This is a simple layout comprised of a main anchor subject, three main topics, and nested sub topics beneath each.

A good mind map program will also support various styles so the importance or status of an element can be indicated at a glance:

![Colorized mind map](../../../assets/images/Screenshot_2021-04-07_18-58-27.png)

In this example, bright yellow might be important, darker yellow less important, and strikethrough something to disregard entirely. Red and green could be arbitrary statuses like good and bad, or vulnerable and secure.

From an ease-of-use standpoint, all of this (except some of the colors) was generated using only the keyboard. Keys like Tab, Enter, and Space are used to create the various nested objects, and the application handles arranging them in a way that looks presentable. This frees the user up to focus on the content, rather than the presentation.

There are a few other features that require some mouse clicking, like adding additional non-hierarchical "relationship" links:

![Mind map with additional relationships](../../../assets/images/Screenshot_2021-04-07_19-03-12.png)

Depending on if you use the free or paid version, some settings can be configured to remember or shortcut your preferred styles, or they might be fully manual.

Within XMind, you can switch to the "Outliner" view after creating a mind map. This might be familiar from school, or using Microsoft Word:

![Outliner view](../../../assets/images/Screenshot_2021-04-07_19-05-23.png)

It's just a nested list of items. While I'm sure there is some limit, you can go pretty absurdly deep, so running out of room for nested items is unlikely.

XMind has a gallery of shared example mind maps on [their website](https://www.xmind.net/share/).

Now that I've illustrated what a mind map looks like, here are some examples of how I find them useful.

# Uses

## Taking notes

Whenever I'm taking notes on a new subject, I have gotten into the habit of creating a mind map. A great example of this is when discussing the scope of a security assessment (whether it be a network penetration test, code review, web application test, etc.). One of the early stages of any such engagement is to discuss with the subject matter experts how their system(s) work and how the data flows within it. As the subject matter experts are describing or demonstrating the environment to me, I'll be capturing my understanding in a mind map.

This serves a couple immediate purposes:

1. It captures the information for my notes. I can either drop the outline structure into a tool like OneNote or Evernote if I need to elaborate on it or add multimedia, and/or I can just keep it as is in mind map form.
2. It serves a similar purpose to writing things down. I'm rather slow at traditional pen-and-paper writing, but my typing speed is solid. There is some evidence that writing something down, or typing it out (rather than copy pasting) helps to solidify memory (the [generation effect](https://en.wikipedia.org/wiki/Generation_effect)). Anecdotally, I can attest that the simple act of typing up what I'm hearing seems to help increase the likelihood that I will be able to recall that information later. The visual presentation and interactive creation of the mind map format also [seems to help reinforce memory](https://www.mindmeister.com/blog/mind-mapping-benefits-who-needs-mind-maps/).

## Studying

While there is some overlap with #1 above, my "study mode" tends to be quite a bit slower and more deliberate than taking notes in a brief meeting or scoping discussion. This might be a new technical subject that I've never learned before, or an old subject I'm brushing up on. It might be something for work, or for a [really complicated form of entertainment](https://www.pathofexile.com/passive-skill-tree).

![I can't quit you](../../../assets/images/Screenshot_2021-04-07_21-20-29.png)

I sometimes find that, as I'm taking down what I consider the key elements of a new idea, I later have to rearrange the nodes. This might be due to the way the information is initially presented, or due to some quirk of my own mind in how it "wants to" map the information. Fortunately, a good mind map program makes it easy to click and drag or cut and paste items from one location on the map to another:

![Rearranged mind map](../../../assets/images/Screenshot_2021-04-07_19-31-54.png)

I also capture notes on introductions to topics, such as when I was watching the [Fundamentals of DevSecOps](https://www.pluralsight.com/paths/fundamentals-of-devsecops) lectures on Pluralsight:

![DevSecOps mind map](../../../assets/images/Screenshot_2021-04-07_20-32-38.png)

# Documentation

Whether I'm playing with a [capture the flag](https://www.hackthebox.eu) or performing a penetration test, keeping track of what I've done - and not forgetting to revisit things that I'm setting aside for later - is crucial. Mind maps are a great way to keep track of a testing environment at a high level, and to prioritize - or mark as complete - certain aspects of your assessment.

As an example, I'll share the current state of my mind map working through an older Hackthebox machine, Canape (Note: If you haven't tried Canape yourself, this will contain some spoilers. I'm only part of the way through the box at time of writing though, so there is more yet to discover):

![Canape mind map](../../../assets/images/Screenshot_2021-04-07_19-38-39.png)

This map grew as my understanding of the target machine did, starting with the discovery of open ports on the box, mapping out the initial web directories that were present on the main page, finding a /.git directory, and then describing the functionality disclosed by the source code in the /.git directory.

Once I (finally) managed to get OS command execution, I marked that sucker red and saved my exact syntax for further reference as I wrote up a python script to automate the attack.

You might notice on the left side of the map there are two key sections: "Things to check", and "Checked." As I map out the application and discover more and more of its contents - or, in this case, as I enumerate services, settings, and various internal aspects of the machine via command injection - I jot them down and mark them as priority (yellow) to review later. This way I can continue on my current train of thought without derailing it, but I can also quickly capture things that are worth further investigation later. Once my current mental thread is completed, I go through that "Things to check" list and exhaust possibilities, striking them through and moving them under the "Checked" node. This helps me keep track without losing the documentation I've already established. I can use the strikethrough information later if I need to reference things that I checked but which didn't pan out during the test. If a client asks me to enumerate the various things that I tried that weren't fruitful, I already have it in outline form.

Oh, and with XMind, there is functionality built in for flow charts, org charts, timelines, and "fishbone charts:"

![Fishbone mind map](../../../assets/images/Screenshot_2021-04-07_20-38-50.png)

There is even enough flexibility in the application to create rough data flow diagrams. This isn't going to compete with Visio any time soon, but it works for a quick-and-dirty model:

![Data flow diagram](../../../assets/images/Screenshot_2021-04-07_20-40-50.png)

## Identifying knowledge gaps

Once the initial information is mapped out, I find that mind maps are great for highlighting areas where additional knowledge is needed. This can be done through color coding, arrangement, with a dedicated "to do" section, or a combination of these. In particular, I've found that once I have really poured my understanding into a mind map, if there are sections that are vastly outsized compared to others, it either indicates:

1. That the smaller subsection is very simple and doesn't need more detail, or;
2. That my understanding is lacking in that subsection.

Here's a use case example. When looking at job descriptions for a potential new opportunity, I like to go through the description, create a mind map from the description's key elements, and then color-code each item based on my own self-evaluated confidence in that space:

![Color legend](../../../assets/images/Screenshot_2021-04-07_20-43-36.png)

![Job description mapping](../../../assets/images/Screenshot_2021-04-07_20-44-44.png)

That image is deliberately zoomed out so as not to disclose which jobs I may or may not have been recently applying to.

As you can see, there is a lot of dark green on there, so that's a good start. The lighter green might need some work, but it's the yellow and red where I have significant gaps, and should focus my attentions to improve:

![Job description mapping with child nodes](../../../assets/images/Screenshot_2021-04-07_20-46-57.png)

I did some fleshing out, a little study, and added more to the map. Not bad. Some notes to self, some additional areas that I need to study... but then one of those items turned into a rabbit hole all by itself:

![Job description mapping with a rabbit hole](../../../assets/images/Screenshot_2021-04-07_20-48-07.png)

Does jotting all that down in a mind map make me an expert in the subject? Not by a long shot. But it gives me a mental framework that I can start associating my experiences with, and it gives me reference material I can call on in the future if and when I start focusing on such tasks or communicating in that space. I am much more likely to be able to speak with some cursory intelligence in an interview on a subject I've studied and mind mapped, than one I only read in a job description. It also revealed to me just how broad that one sub-item was, when I only had a very informal understanding of it to begin with.

## Resume building?

This last use is a new idea and I haven't really put it to the test yet. It could end up as a case of "square peg, round hole," stemming from my current infatuation with mind maps. I wonder, though, if there might be a use in mind mapping when building/updating/improving a resume/CV. The nascent idea goes like this:

### Mind map first approach
If you're making a resume from scratch (either because you're new to building one, or just think it's time to revamp and start fresh), jot down the key ideas you want to make sure are represented. What are the first things you want a potential employer to think of when they look at your resume for [7.4 seconds](https://www.theladders.com/static/images/basicSite/pdfs/TheLadders-EyeTracking-StudyC2.pdf)? Those are your main topics. Now, what are the key details you need to represent for each of those main topics? Those are your subtopics. Map it all out, **then** start putting the content into your resume template of choice in a word processor.

### Mind map second approach
What if you already have a pretty solid resume, and it just needs some improvement? This can be trickier, but try to put yourself in the mind of a recruiter. Open up your resume, and capture the first thing that stands out to you in a mind map. What's the second thing? Into the map it goes. Third thing? Map it. Now, were those three eye-catching elements what you **want** a recruiter or employer to see first? If not, you might at least have a layout problem, and you might need to rework your resume content. This evaluation can probably go a level or two deeper. If you find that your resume doesn't even paint the picture that you intend to yourself, chances are it needs some work. I would venture that this exercise is even more valuable with a partner doing the review for you - a friend or colleague who will humor you by viewing your resume like you were a potential candidate, and mind mapping for you what stood out to them. That mind map can be your input for areas where you might need to rearrange or rephrase the content of your resume.

With either approach, I think there is potential here for a worthwhile exercise in tightening up a resume or building a whole new one.

# Another useful tool

All said, I'm loving the use of mind maps, and XMind in particular. I've known about this concept for years but never got around to really giving it a try until recently, which I have to thank my friend for inspiring. I hope others find this write up useful, and that it might inspire some of you to take advantage of a new tool. If you have some novel uses of mind maps, [send them my way](https://twitter.com/0xvext)!
