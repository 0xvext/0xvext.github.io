---
title: Untrusted, levels 13 - 14
date: '2017-09-15 18:00:08'
tags: untrusted
---

# Spoiler warning:
This will contain my solutions and explanations for the various levels in the game [Untrusted](https://alexnisnevich.github.io/untrusted/). If you have not played yourself, I highly recommend doing so without reading through this post. Half the fun (and learning potential) of the game is experiencing it yourself and getting the satisfaction of the "Ah ha!" moment.
`</spoilerwarning>`

### Level 13: robotMaze.js (revisited)
After my last post, I realized a major flaw that I had left in my solution: While it would work for most level layouts, a certain layout of level would be nearly impossible for the algorithm I came up with to solve. Specifically, level layouts where the robot gets trapped in a section of the maze where it needs to make multiple moves 'up' to escape:
![Screen-Shot-2017-09-15-at-9.33.27-AM](/assets/images/Screen-Shot-2017-09-15-at-9.33.27-AM.png)

Due to the order of the 'if' statements, as soon as the robot is a couple spaces 'up' from the player, it will prioritize moving 'down' to get closer. It's trapped :(

There are probably a number of ways to solve this, but I went for a very specific solution that I put at the beginning of the algorithm so that if the player ever stands on the very bottom row of the map, the robot will move 'up' regardless of any other logic. The final code ended up being:

```
var moves = ['up','down','left','right'];
//Determine the distance between the robot and the player as (x,y) values             
    var leftDist = me.getX() - player.getX();
    var upDist = me.getY() - player.getY();
/*Set a direction based on the distance values, with a bias based toward the greater value in the pair, and a slight bias for 'up' and 'left' when distances are equal*/
    var direction;
    if (player.getY() == map.getHeight() - 1) {
    	direction = 'up';
    }
    else if (upDist == 0 && leftDist == 0) {
        return;
    } else if (upDist > 0 && upDist >= leftDist && me.canMove('up')) {
        direction = 'up';
    } else if (upDist < 0 && upDist < leftDist && me.canMove('down')) {
        direction = 'down';
    } else if (leftDist > 0 && leftDist >= upDist && me.canMove('left')) {
        direction = 'left';
    } else if (leftDist < 0 && leftDist < upDist && me.canMove('right')) {
        direction = 'right';
    }
    else {
    //Select a random adjacent direction
    direction = moves[map.getRandomInt(0, moves.length - 1)];
	}
    if (me.canMove(direction)) {
        me.move(direction);
    }
```

This still isn't perfect, and I have identified some level layouts where it won't work, but it handles the majority of level layouts. I still have some refining to do on the algorithm. My next idea is to replace the code with a full-control model for the robot, rather than relying on it to path-find, and taking random movement out of the picture completely. A little less interesting, perhaps, but more reliable. I'm sure there is a way to fully automate it in a more reliable fashion, as well. Perhaps if another level requires pathfinding I will focus on a better version of the automated approach.

### Level 14: crispsContest.js
This level took a little trial and error, but I wasn't stuck nearly as long as the last one. It's a combinaton of figuring out the correct code **and** identifying the correct order in a series of moves to solve a puzzle layout:
![Screen-Shot-2017-09-15-at-9.50.22-AM](/assets/images/Screen-Shot-2017-09-15-at-9.50.22-AM.png)

The code insertion point we have access to is limited to a single portion: what items is removed from the player inventory when passing through a 'greenLock' (⊗) object.

I did some experimentation to see if simply substituting one key for another would work, but there are just enough keys and gates to keep that from working. We have to be a bit more tricky:

`greenKey');}if(1){;//`

Here we are completing the logic of the original expression, causing the expression to end prematurely (the first '}'), and adding new logic that is always true ('if(1)') for the following 'return: false' expression.
When the function returns false, the player is able to pass through the lock.
This might not seem like a big deal, but when you realize that the game doesn't actually check whether or not the player HAS a greenKey item before parsing the logic, it becomes evident that greenLocks are now free to pass.

Once this is in place, it simply becomes a matter of gathering up the keys in the right order to end up with one yellow and one blue key (hint: start in the top-left first):
![Screen-Shot-2017-09-15-at-9.56.34-AM](/assets/images/Screen-Shot-2017-09-15-at-9.56.34-AM.png)

Then it is a simple matter of passing through the yellowLock, grabbing the Algorithm, and exiting. The two yellow keys on the left and right bottom of the map are diversions.

This level is a good illustration of using code injection to escape the established logic of an application to either redirect or entirely change that logic for other purposes. This is why [OWASP prioritizes the proper sanitation of user inputs so highly](https://www.owasp.org/images/f/f8/OWASP_Top_10_-_2013.pdf). Remember: data validation should be done through whitelisting, not blacklisting.
