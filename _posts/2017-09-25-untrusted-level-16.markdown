---
title: Untrusted, Level 16
date: '2017-09-25 16:38:00'
tags: untrusted
---

# Spoiler warning:
This will contain my solutions and explanations for the various levels in the game [Untrusted](https://alexnisnevich.github.io/untrusted/). If you have not played yourself, I highly recommend doing so without reading through this post. Half the fun (and learning potential) of the game is experiencing it yourself and getting the satisfaction of the "Ah ha!" moment.
`</spoilerwarning>`

### Level 16: lasers.js
Another quickie. This level introduces laser beams that will kill the player unless the player's current color matches that of the laser.
The problem is the lasers are all colorless:
![Screen-Shot-2017-09-15-at-2.09.24-PM](/assets/images/Screen-Shot-2017-09-15-at-2.09.24-PM.png)

Or at least, they appear to be.
Your first impulse might be to remove all the code for the lasers. Trying this even seems to work at first, but it's a clever trick: removing the first block of editable code removes the **rendering** of the lasers, but they are still present.
Instead of removing the code, we can make a simple change to it to reveal the color of each laser: `ctx.strokeStyle = color;`

Now we get a much clearer picture of what we have to contend with:
![Screen-Shot-2017-09-15-at-2.11.20-PM](/assets/images/Screen-Shot-2017-09-15-at-2.11.20-PM.png)

Since the logic in the code reveals that the player color determines whether or not the lasers are deadly, we can modify a piece of code from a prior level and drop it in to rotate the player color:
```
map.getPlayer().setPhoneCallback(function () {
    var player = map.getPlayer();

if (player.getColor() == '#0f0'){player.setColor('red')}
    else if (player.getColor() == 'red'){player.setColor('yellow')}
    else if (player.getColor() == 'yellow'){player.setColor('teal')}
    else if (player.getColor() == 'teal'){player.setColor('#0f0')};

});
```

This level once again shows us the importance of minor changes in code, and it reinforces the importance of saving previously-used modules for future reference or adaption.
