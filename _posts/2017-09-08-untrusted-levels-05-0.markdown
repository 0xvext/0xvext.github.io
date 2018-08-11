---
title: Untrusted, levels 05 - 07
date: '2017-09-08 14:23:58'
tags: untrusted
---

# Spoiler warning:
This will contain my solutions and explanations for the various levels in the game [Untrusted](https://alexnisnevich.github.io/untrusted/). If you have not played yourself, I highly recommend doing so without reading through this post. Half the fun (and learning potential) of the game is experiencing it yourself and getting the satisfaction of the "Ah ha!" moment.
`</spoilerwarning>`

### Level 5: minesweeper.js
Aside from being pretty harsh on the eyes, this level is the first to give us an entirely new setup. Gone is the cell of blocks surrounding our player icon. Instead, we find a seemingly empty red field with no barriers between the player and the exit:
![Screen-Shot-2017-09-08-at-9.08.00-AM](/assets/images/Screen-Shot-2017-09-08-at-9.08.00-AM.png)

As the level description tells us, however, the reality is a bit more sinister. Hidden among the level are a number of 'mines' that, if touched by the player, explode and reset the level:
![Screen-Shot-2017-09-08-at-9.09.47-AM](/assets/images/Screen-Shot-2017-09-08-at-9.09.47-AM.png)

Reviewing the level's code, our injection point puts us right in the middle of a loop that is responsible for placing all the mines. A clue lies in a line earlier in the code where the background spaces are being set to a color red. Since the mines are also red, changing their color should give us a much more reasonable playing field, and it does:
`map.setSquareColor(x, y, '#bar');`
![Screen-Shot-2017-09-08-at-9.13.25-AM](/assets/images/Screen-Shot-2017-09-08-at-9.13.25-AM.png)

This illustrates how, even if we can't remove or bypass code, we might be able to modify it in a manner that makes it useful to us, such as by revealing information that was intended to be hidden.

### Level 6: drones101.js
Now things are starting to get interesting. On this level, there are no monolithic obstructions as we have seen previously. Instead, there is a single 'attack drone' (d) that stands between the player and the exit:
![Screen-Shot-2017-09-08-at-9.18.47-AM](/assets/images/Screen-Shot-2017-09-08-at-9.18.47-AM.png)

This drone will move every time the player moves, using some simple logic to always make a move that brings it closer to the player (if possible), or at a minimum does not allow the distasnce between it and the player to increase. Its pursuit handled, the drone is of course programmed with the pleasant property of exploding if it comes into contact with the player:
![Screen-Shot-2017-09-08-at-9.20.53-AM](/assets/images/Screen-Shot-2017-09-08-at-9.20.53-AM.png)

Our injection point is outside the definition of the drone, but still within the level's main setup function, just after the placement of various elements on the map.
My first thought to solve this problem was to create a static obstruction of some kind on the map to interrupt the drone from reaching the player long enough to slip past to the exit. That might be possible, but in a few attempts I realized it was prone to failure and required too much precision by the player to ensure success. It was also a boring way to approach the problem.
I started over and decided to make a drone of my own. This drone would follow the same logic of the attack drone, but instead of being attracted to the player, it would be attracted to the attack drone. The code I came up with was based on the definition of the attack drone:
~~~ javascript
    map.defineObject('defenseDrone', {
            'type': 'dynamic',
            'symbol': 'D',
            'color': 'blue',
            'behavior': function (me) {
                moveToward(me, 'attackDrone');
            }
        });
    map.placeObject(2, 2, 'defenseDrone');
~~~
He might not be as explosive as the attack drone, but a quick test reveals that when the two meet, their mirrored logic prevents the attack drone from pursuing the player long enough for the player to reach the exit:
![Screen-Shot-2017-09-08-at-9.32.16-AM](/assets/images/Screen-Shot-2017-09-08-at-9.32.16-AM.png)![Screen-Shot-2017-09-08-at-9.32.39-AM](/assets/images/Screen-Shot-2017-09-08-at-9.32.39-AM.png)![Screen-Shot-2017-09-08-at-9.33.12-AM](/assets/images/Screen-Shot-2017-09-08-at-9.33.12-AM.png)![Screen-Shot-2017-09-08-at-9.33.57-AM](/assets/images/Screen-Shot-2017-09-08-at-9.33.57-AM.png)![Screen-Shot-2017-09-08-at-9.34.12-AM](/assets/images/Screen-Shot-2017-09-08-at-9.34.12-AM.png)![Screen-Shot-2017-09-08-at-9.34.34-AM](/assets/images/Screen-Shot-2017-09-08-at-9.34.34-AM.png)

Note that this still requires the player to avoid making a mistake, as blindly rushing to the exit can result in the attack drone intercepting the player. Since risk management is the name of the game in security, I wanted to make this fool proof, giving the attack drone zero chance to intercept the player.
My admittedly inelegant solution was to create three more drones, and place them such that they would quickly converge and surround the attack drone, regardless of how the player moves. I had to get a little creative with the placement due to some bias in the movement logic:
~~~ javascript
    map.placeObject(40, 12, 'defenseDrone');
    map.placeObject(41, 11, 'defenseDrone');
    map.placeObject(44, 16, 'defenseDrone');
    map.placeObject(45, 15, 'defenseDrone');
~~~
![Screen-Shot-2017-09-08-at-9.46.17-AM](/assets/images/Screen-Shot-2017-09-08-at-9.46.17-AM.png)
![Screen-Shot-2017-09-08-at-9.46.33-AM](/assets/images/Screen-Shot-2017-09-08-at-9.46.33-AM.png)![Screen-Shot-2017-09-08-at-9.46.57-AM](/assets/images/Screen-Shot-2017-09-08-at-9.46.57-AM.png)

I used static position references due to the simplicity of the canvas, but a better solution would be to use either the canvas size for relative positioning, or relative position from the attack drone's starting location.

This level illustrates the need for problem solving in a dynamic setting, and the need for proactive defenses from attack.

### Level 7: colors.js
Right off the bat, this level shows us something new and interesting. A series of colored locks prevents the player's access to the exit:
![Screen-Shot-2017-09-08-at-9.57.30-AM](/assets/images/Screen-Shot-2017-09-08-at-9.57.30-AM.png)

Fortunately, there is a new mechanism introduced to the player: the function phone (☎)!
With a simple press of the Q key, the player can activate a function that is kindly defined as blank with our code injection point placed right in the middle of the definition. Arbitrary code execution, anyone?

Some experimentation reveals that the player icon color determines progress through the locks: if the player is green, the green locks can be passed. If the player is red, the red locks can be passed, and so on. With this understanding, we need to define the function called by the phone to cycle through the colors:
~~~ javascript
if (player.getColor() == '#0f0'){player.setColor('#f00')}
        else if (player.getColor() == '#f00'){player.setColor('#ff0')}
        else if (player.getColor() == '#ff0'){player.setColor('#0f0')};
~~~

With this in place, the player can toggle through the three colors at each appropriate location, ultimately reaching the exit:
![Screen-Shot-2017-09-08-at-10.13.20-AM](/assets/images/Screen-Shot-2017-09-08-at-10.13.20-AM.png)

This level illustrates the concept of functions that can be defined and called at will during the execution of the program. This is distinct from the prior examples which required code changes to take place at the time of level generation. It also illustrates the danger of arbitrary code execution.
