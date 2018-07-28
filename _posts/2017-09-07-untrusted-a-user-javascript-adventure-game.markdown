---
title: Untrusted, a user javascript adventure game
date: '2017-09-07 13:28:41'
tags: untrusted
---

In studying for my [GWAPT](https://www.giac.org/certification/web-application-penetration-tester-gwapt) I was introduced by [Eric Conrad](http://www.ericconrad.com/) to a cool educational game called [Untrusted](https://alexnisnevich.github.io/untrusted/), created by [Alex Nisnevich](http://alex.nisnevich.com) and Greg Shuflin (sorry, Greg, not certain if [this](https://www.linkedin.com/in/gregshuflin) is you or not).
The premise of the game is a top-down ASCII-based 'adventure' where the player has access to certain portions of the game's javascript. Manipulation of the javascript effects the game itself, allowing the player to break the rules and modify the game, such as by moving an object, changing its properties, or removing it entirely. This is important, since the 'game' itself is impossible to win without implementing such tactics.
This is a great example of [gamification](https://en.wikipedia.org/wiki/Gamification), where a work or educational task (in this case, learning javascript) is framed in the structure of a game in order to make it more immediately engaging, fun, and rewarding to the player/student/worker.

After this post, I will be writing up my solutions to the puzzles on Untrusted with the intention of completing all 21 levels. [Many](https://codereview.stackexchange.com/questions/46650/is-my-ai-solution-to-untrusted-game-considered-logical-or-ethical) [have done this](http://timnew.me/blog/2014/11/07/walkthrough-untrusted-the-continuing-adventures-of-dr-eval/) [before me](https://www.youtube.com/watch?v=335CACeJalE), and the game itself includes links to the [solutions on Github](https://github.com/AlexNisnevich/untrusted/tree/master/solutions), but I always enjoyg reading how individuals solve problems, so I figure others might find my own solutions interesting.
