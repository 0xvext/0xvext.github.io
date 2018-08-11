---
title: Untrusted, levels 18 - 20
date: '2017-10-04 03:19:16'
tags: untrusted
---

# Spoiler warning:
This will contain my solutions and explanations for the various levels in the game [Untrusted](https://alexnisnevich.github.io/untrusted/). If you have not played yourself, I highly recommend doing so without reading through this post. Half the fun (and learning potential) of the game is experiencing it yourself and getting the satisfaction of the "Ah ha!" moment.
`</spoilerwarning>`

### Level 18: superDrEvalBros.js
This is a cute one. It's a very simple abstraction of a classic 2D platform-style video game. On one side we have our hero, on the other, the exit, and in the middle, a deadly pit into nothing:
![Screen-Shot-2017-10-03-at-9.18.21-PM-1](/assets/images/Screen-Shot-2017-10-03-at-9.18.21-PM-1.png)

This level is presented as a "side scroller" view, complete with jump and gravity functions that will send our hero falling down the pit, into oblivion:
![Screen-Shot-2017-10-03-at-9.18.39-PM](/assets/images/Screen-Shot-2017-10-03-at-9.18.39-PM.png)
![Screen-Shot-2017-10-03-at-9.18.39-PM-1](/assets/images/Screen-Shot-2017-10-03-at-9.18.39-PM-1.png)
![Screen-Shot-2017-10-03-at-9.18.40-PM](/assets/images/Screen-Shot-2017-10-03-at-9.18.40-PM.png)

So, if gravity kills us, let's disable gravity:
~~~ javascript
}
    function gravity() {
~~~
With gravity redefined to do nothing, we can easily float across the chasm to the exit:
![Screen-Shot-2017-10-03-at-9.24.27-PM](/assets/images/Screen-Shot-2017-10-03-at-9.24.27-PM.png)

After the previous level, this one took all of about five minutes to figure out, which was a good change of pace.

This level shows how similar solutions can be applied to significantly different problems. It also shows good game design in giving the player an easier challenge after one that was much more complex.

### Level 19: documentObjectMadness.js
This one... is weird. In place of our usual black background we have a mock webpage view. The name and code imply that this is based on the [DOM](https://en.wikipedia.org/wiki/Document_Object_Model) concept that is used in rendering \*ML files (primarily HTML). Instead of our cursor and an exit, we have our cursor in green, near the top of the document, and the cursor for an adversary in red, near the bottom:
![Screen-Shot-2017-10-03-at-9.28.49-PM](/assets/images/Screen-Shot-2017-10-03-at-9.28.49-PM.png)
Our goal is to maneuver into the same DOM object as the adversary, who moves randomly.

As far as I can tell, there is no code injection point on this level, so the only way to win is to chase the 'adversary' around the document until you connect with it. This actually isn't very hard, and a little bit of trial and error will quickly have the user on the next level. I feel like there must have been more intended for this level, since there is a whole jQuery section in the API documentation, but so far I'm missing it. On the bright side, I beat the level. On the other, I am not sure I learned anything...

### Level 20: bossFight.js
Here we are. It's just down to our hero and... a big red chain of blobs (⊙) that move back and forth, raining bullets (.) downward across the map... Yeah, I'm not sure I get it either... but just look at how intimidating this thing is:
![Screen-Shot-2017-10-03-at-9.41.51-PM](/assets/images/Screen-Shot-2017-10-03-at-9.41.51-PM.png)

This level was a lot of fun. 
It probably took me about two hours spread over the course of a couple days, trying one technique after another from the previous levels, looking for something that would work. Since the level has a restriction on the number of dynamic objects that can exist at the start of the level, we are required to insert any additional objects after the creation of the level (e.g., by activating some sort of function after the map has been validated). I tried a couple of ideas, neither of which panned out (I was sure the idea for creating a 'tripwire' to trigger an event, using the code from lasers.js was the right track, but it turns out not to work).

Once again I decided I must be looking at the problem wrong, and so I decided to try coming at the problem from different angles. Instead of focusing on the code first, I tried getting through the level in different ways. The function phone starts on the right side of the map, and if I had access to that, I could call any arbitrary code I wanted after the level had been validated... but those damn bullets.

I tried maneuvering through the bullets, a la bullet hell games. No dice. I'm either not good enough or it isn't possible:
![Screen-Shot-2017-10-03-at-10.07.33-PM](/assets/images/Screen-Shot-2017-10-03-at-10.07.33-PM.png)
I tried moving through the boss itself... nope:
![Screen-Shot-2017-10-03-at-10.07.40-PM](/assets/images/Screen-Shot-2017-10-03-at-10.07.40-PM.png)
Reviewing the code, I tried slipping past 1 space beneath the boss, since the bullets are rendered 2 spaces away... but since there are two rows of the boss, that doesn't work either. There were many deaths.

I was starting to get annoyed when, mostly by accident, I stumbled upon something important: the boss's bullets will kill you if they come into contact with you, but they can't be spawned in the space you currently occupy. So moving one space below the boss and standing still renders you invincible:
![Screen-Shot-2017-10-03-at-8.57.22-PM](/assets/images/Screen-Shot-2017-10-03-at-8.57.22-PM.png)

Armed with this knowledge, acquiring the function phone is trivial. Equipped with the phone, why don't we give the boss a taste of his own medicine?
~~~ javascript
map.getPlayer().setPhoneCallback(function () {
        var player = map.getPlayer();
        
map.defineObject('myBullet', {
        'type': 'dynamic',
        'symbol': '|',
        'color': 'blue',
        'interval': 100,
        'projectile': true,
        'behavior': function (me) {
            me.move('up');
        }
})

map.placeObject(player.getX(), player.getY() - 2, 'myBullet');
~~~
This code creates a new object (myBullet) which follows the same rules as the existing bullets, except it moves upward. For style, it's also blue and uses the pipe symbol (|).

Now it's on. In moments the boss is being shredded to bits:
![Screen-Shot-2017-10-03-at-8.59.02-PM](/assets/images/Screen-Shot-2017-10-03-at-8.59.02-PM.png)

How the tables have turned. Once the final piece of the boss is destroyed, the Algorithm (A) is dropped, and we can successfully exit the level:
![Screen-Shot-2017-10-03-at-8.59.31-PM](/assets/images/Screen-Shot-2017-10-03-at-8.59.31-PM.png)

I had a lot of fun with this level. It was a well-constructed challenge that utilized both skills developed earlier in the game and required trying something new. It helped to reinforce the importance of looking at the same problem from a different angle, which is a critical hacking perspective to take.

