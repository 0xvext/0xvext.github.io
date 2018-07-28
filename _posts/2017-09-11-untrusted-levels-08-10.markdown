---
title: Untrusted, levels 08 - 10
date: '2017-09-11 14:49:39'
tags: untrusted
---

# Spoiler warning:
This will contain my solutions and explanations for the various levels in the game [Untrusted](https://alexnisnevich.github.io/untrusted/). If you have not played yourself, I highly recommend doing so without reading through this post. Half the fun (and learning potential) of the game is experiencing it yourself and getting the satisfaction of the "Ah ha!" moment.
`</spoilerwarning>`   

## Chapter 2: Raiders of the Lost Algorithm
### Level 8: intoTheWoods.js
This level finds our adventurer entering a new region, filled with trees (♣) and large arrangements of blocks called fortresses. As far as I can tell the fortresses don't actually do anything... but I expect their code will come in useful in a future level. As for code injection, we are strictly limited to entering the name of a function to call from a list of pre-created functions.

The forest itself is the main hurdle, with a randomly-generated placement of trees that never seem to have an open path all the way through to the exit. Fortunately, our function phone can simply be assigned to call the same function that originally generated the trees, re-drawing them in a new random pattern. The player than thus make as much progress toward the exit as possible, then regenerate the trees in order to advance further:
![Screen-Shot-2017-09-11-at-10.09.48-AM](/assets/images/Screen-Shot-2017-09-11-at-10.09.48-AM.png)
![Screen-Shot-2017-09-11-at-10.10.01-AM-1](/assets/images/Screen-Shot-2017-09-11-at-10.10.01-AM-1.png)
![Screen-Shot-2017-09-11-at-10.10.08-AM](/assets/images/Screen-Shot-2017-09-11-at-10.10.08-AM.png)
![Screen-Shot-2017-09-11-at-10.10.25-AM](/assets/images/Screen-Shot-2017-09-11-at-10.10.25-AM.png)

This level illustrates that even when restricted to a set of pre-existing functions, unexpected re-use of those functions can result in flaws in the application's logic. This is analogous to abusing stored procedures in a SQL application.

### Level 9: fordingTheRiver.js
Continuing our adventure through the wilderness, here we find a deadly river between our hero and the exit:
![Screen-Shot-2017-09-11-at-10.19.28-AM](/assets/images/Screen-Shot-2017-09-11-at-10.19.28-AM.png)

When the player moves, the raft (▓) will advance from top of the river to the bottom, following the imaginary current. Unfortunately, once it reaches the bottom, there is no way to move the raft back up to the top...

... but of course there is.
To solve the problem, we need to instruct the raft to move back in the opposite direction. We can use the function phone to make this toggle.
Note that for the first time, in this level we must enter the full text of assigning the function call to the phone, because it is not placed for us. Fortunately, we can refer back to the previous levels to get the code, and instruct it to set the direction of the raft:
```   
   map.getPlayer().setPhoneCallback(function () {
        raftDirection = 'up';
    });
```

After hopping onto the raft, a press of the Q key will change the raft's direction. Then, moving up in a straight line will safely transfer the player across the dangerous waters.

This level primarily illustrates the importance of adding code from scratch, and in this case, of saving a library of re-usable code for future projects.

### Level 10: ambush.js
This level is an interesting new challenge, and admitedly it took me a while to find a solution. I imagine there are many other interesting solutions, and no doubt more elegant ones than this, but there was value in trying different approaches to eventually solve the problem.

After fording the river, our adventurer begins crossing a bridge only to find it packed full of drones:
![Screen-Shot-2017-09-11-at-10.30.59-AM](/assets/images/Screen-Shot-2017-09-11-at-10.30.59-AM.png)

Similar to the last encounter, some of the drones immediately pursue and kill the player, based on movement. Interestingly, there are two other types of drones who exhibit different behavior (but, based on the code, are all deadly).

As the level's description hints, we must change the drones' behavior in order to survive. We have three injection points in this code, each within the defintion of the behavior for the three drone types.

Ultimately, the solution I found was to leave the "reinforcementDrones" (yellow) stationary, to insert the following code into the "attackDrones" (red):
```
            if (me.canMove('up')) {
            	me.move('up');
            }
            else if (me.canMove('left')) {
            	me.move('left');
            }
```
And to insert the following code into the "defenseDrones" (green):
```
            if (me.canMove('up')) {
            	me.move('up');
            }
            else if (me.canMove('right')) {
            	me.move('right');
            }
```

Instructing the defenseDrones to simply move left would also work, though it would require more complicated movement for the player. Plus, I liked the symmetry of the two groups moving away from the center :)

In working through this solution, I made the following observations: 
1. There is a bias for movement "up" before other directions; the top row of drones activates its movement first, then the next line, and so on below. This can result in interesting and unexpected results versus the concept of all drones moving at once. This is why the code above for defenseDrones differs from that of attackDrones; while using the same code twice would work, the symmetry was broken due to the order of operations.
2. After completing this level, I wondered if there was a different intended solution by the game's author, since the next map is the one that deliberately introduces the player to the "me.canMove" property.

This was a fun exercise in problem solving, and it illustrates the value of repeated testing, trial-and-error, and mapping out the behavior of a program in order to better understand what is happening "under the hood."
