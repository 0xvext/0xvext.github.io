---
title: Untrusted, level 17
date: '2017-09-26 12:58:43'
tags: untrusted
---

# Spoiler warning:
This will contain my solutions and explanations for the various levels in the game [Untrusted](https://alexnisnevich.github.io/untrusted/). If you have not played yourself, I highly recommend doing so without reading through this post. Half the fun (and learning potential) of the game is experiencing it yourself and getting the satisfaction of the "Ah ha!" moment.
`</spoilerwarning>`

### Level 17: pointers.js
This level is a doozy. A grid of rooms is displayed, with each room containing three "teleporters" (⎕) and three "traps" (\*). The teleporters are randomly linked to each other, making for a labyrinth, of sorts. This wouldn't be so bad, except that which objects are actually teleporters and which are traps is randomly shuffled after the map is generated, so the player can not tell by looking which is which.
![Screen-Shot-2017-09-18-at-8.42.30-AM](/assets/images/Screen-Shot-2017-09-18-at-8.42.30-AM.png)

Interestingly, this is one of very few levels that can be completed without making a single change to the code. My first success through this level was simply by repeating the same path through the maze, dying a huge number of times, but eventually hitting the exit:
![Screen-Shot-2017-09-18-at-8.33.16-AM](/assets/images/Screen-Shot-2017-09-18-at-8.33.16-AM.png)

As for the logic of completing this level, this post will be a little different, in that I am still figuring it out as I create the post. The facts thus far, and my thought process on them:

1. The level is named "pointers," which is a [concept in computer programming](https://en.wikipedia.org/wiki/Pointer_(computer_programming))
2. JavaScript does not inherently use the concept of pointers, due to its definition that function parameters are passed by value, rather than by reference, but [an analogous structure can be created with objects](https://stackoverflow.com/questions/10231868/pointers-in-javascript)
3. The source code for the 'shuffle' function that is used to randomize the array is available as a comment in the level's code: http://bit.ly/1l6LGQT
4. The level's code also includes the following comment which appears to be another hint:
```
       // TODO find a way to remove the API docs
        // wouldn't want the 'good doctor' to find
        // out about map.getCanvasCoords()...
```
5. The teleportersAndTraps variable is an array made up of objects (as confirmed by using the debugging trick I mentioned in a previous post):
![Screen-Shot-2017-09-25-at-10.38.34-AM](/assets/images/Screen-Shot-2017-09-25-at-10.38.34-AM.png)
6. The canvas variable is apparently an object called a [CanvasRenderingContext2D](https://www.w3.org/TR/2dcontext/)
![Screen-Shot-2017-09-25-at-10.39.57-AM](/assets/images/Screen-Shot-2017-09-25-at-10.39.57-AM.png)

So far I have been going about this one as trial-and-error, since I am not clear on the nature of the objects in use, or the properties of them.
The `map.getCanvasCoords` function exists, but is limited in what values it can be passed. For example, if I try to pass the teleportersAndTraps variable, I get the following error:
![Screen-Shot-2017-09-25-at-10.44.00-AM](/assets/images/Screen-Shot-2017-09-25-at-10.44.00-AM.png)

Interestingly, passing the player variable into the function returns a result of [ object Object ], when I would have expected it to return the (x, y) coordinates of the player:
![Screen-Shot-2017-09-25-at-10.47.23-AM](/assets/images/Screen-Shot-2017-09-25-at-10.47.23-AM.png)

I am beginning to think the objects referenced are the "pointers" the level name refers to. If so, then I need to find out how to read their values (e.g., return the values the objects point to, rather than the objects themselves).

This is the first point at which I have bothered to click the "API" button that appears in the game interface, and I realize it provides a lot of useful documentation on various functions:
![Screen-Shot-2017-09-25-at-1.12.27-PM](/assets/images/Screen-Shot-2017-09-25-at-1.12.27-PM.png)

If you can't view the image, it says:
```
map.getCanvasCoords(obj)
Returns {"x": x, "y": y}, where x and y are the respective coordinates of the given object on the canvas returned by map.getCanvasContext().
```

Continuing with my experimentation, I have reached a method for aiding the player in avoiding all traps reliably:
```
       var x1 = t1.getX();
        var y1 = t1.getY();
        var x2 = t2.getX();
        var y2 = t2.getY();
        if (t1.getType() == 'trap') {
        	map.setSquareColor(x1, y1, 'red');
        }
        else if (t1.getType() == 'teleporter' && t2.getType() == 'trap') {
        	map.setSquareColor(x1, y1, 'red');
        }
        if (t2.getType() == 'trap') {
        	map.setSquareColor(x2, y2, 'red');
        }
        else if (t2.getType() == 'teleporter' && t1.getType() == 'trap') {
        	map.setSquareColor(x2, y2, 'red');
        }
```
This results in marking both the traps and the teleporters that lead to traps as red blocks:
![Screen-Shot-2017-09-25-at-3.38.37-PM](/assets/images/Screen-Shot-2017-09-25-at-3.38.37-PM.png)

A problem remains, however, in that the level generation is such that it is possible for pairings to occur that have no actual solution. Because of this, the solution is non-deterministic. Additionally, the function mentioned in the hint (map.getCanvasCoords) was not used in this solution, which leads me to believe that there must be a deterministic solution to this level.

For now, once again, I am going to accept this as "good enough," and continue to move on to other levels, with a note to revisit this if situations dictate the need for a more deterministic approach.

This illustrates the value of accurate documentation for a given system, and shows how important a full understanding of the "moving parts" of a system are, when attempting to ~~compromise it~~ understand its security structure.
