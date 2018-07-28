---
title: Untrusted, level 15
date: '2017-09-17 18:07:00'
tags: untrusted
---

# Spoiler warning:
This will contain my solutions and explanations for the various levels in the game [Untrusted](https://alexnisnevich.github.io/untrusted/). If you have not played yourself, I highly recommend doing so without reading through this post. Half the fun (and learning potential) of the game is experiencing it yourself and getting the satisfaction of the "Ah ha!" moment.
`</spoilerwarning>`

## Chapter 3: Betrayal
### Level 15: exceptionalCrossing.js
Lies. It was all lies :(
In this level, we discover that the mysterious guide who has been helping us through the prior levels had ulterior motives not in our best interest! Et tu, anonymous computer voice?

The level itself is familiar in layout (and music): It's a re-use of fordingTheRiver.js, only this time we don't have a raft, and we are above the water instead of below it, while the exit is below:
![Screen-Shot-2017-09-15-at-12.23.56-PM](/assets/images/Screen-Shot-2017-09-15-at-12.23.56-PM.png)

Our injection point for this level is within the function that kills the player on contact with a block of water. We have free control of whatever text is displayed by the function, and nowhere else to insert code.

This one took a bit of trial and error to arrive at a solution. The chief constraint is around the game's character limit; since we can not insert line breaks, there is a maximum number of characters that will fit.

The solution I eventually arrived at was as follows:
`);},'onCollision':''});map.defineObject('',{a:{//`

This one probably needs some explanation, so I will break it down below.

Our injection point exists within the `player.killedBy()` function, which is part of the `'onCollision': function (player)` property, which is one of multiple properties defined in the `map.defineObject('water'` declaration. Simplified, and with other pieces removed, the syntax is as follows:
```
map.defineObject('water', {
    'onCollision': function (player) {
        player.killedBy(<arbirtraryCodeHere>);
    }
});
```
So, in order to break out of the existing structure, we need to terminate first the 'killedBy' function using `);`, then terminate the 'onCollision' property using `}` so we have moved our logical injection point: `);}`

This isn't a solution, but now we have moved our arbitrary code location as follows:
```
map.defineObject('water', {
    'onCollision': function (player) {
        player.killedBy();}
    <arbirtraryCodeHere>);
    }
});
```
Any code we write is now in the property list of the defineObject function, rather than in the argument list of the killedBy function.

We don't want water to kill the player, so why don't we redefine the 'onCollision' property? There is no validation going on to prevent this, so when the code runs, onCollision will be defined to kill the player, and then overwritten with whatever we define it as. Let's define it to do nothing:
`);},'onCollision':''`

Now, cleaned up for proper presentation, the code reads like this:

```
map.defineObject('water', {
    'onCollision': function (player) {
        player.killedBy();
    }
    'onCollision':''<arbitraryCodeHere>);
    }
});
```
This is looking good, but there is a problem: since we co-opted some of the open parens and braces above our injection point by closing them early, we have left an unmatched `}`, and left the remaining `});` hanging. This invalidates the code and we get an error when we try to run it:
![Screen-Shot-2017-09-15-at-12.42.29-PM](/assets/images/Screen-Shot-2017-09-15-at-12.42.29-PM.png)

We can remove the `);` that appears on the same line as our injection point by following our code with a single-line comment: `);},'onCollision':''//`. That cleans up some of our issue, but it still leaves us with a hanging brace and a hanging paren on lines that we can't touch. In order to fix those, we will have to first close up what we left hanging by adding `});` before our comment: `);},'onCollision':''});//`

This solves the parsing order issue we introduced and it makes everything through our new code valid, but leaves us with one final problem: the original `}})` are left hanging below our code. To close those up, we need to cleanly open a compatible structure that uses `(`,`{`, and `{`, in that order.

I will save you the trial-and-error that I went through to arrive at my solution, but I referred to the block of code that those braces and parens originally closed, and modeled accordingly: `map.defineObject('',{a:{`.

Finally, we end up with: `);},'onCollision':''});map.defineObject('',{a:{//`.

Or, formatted and commented:

```
map.defineObject('water', {
    'onCollision': function (player) {
        player.killedBy(); //Kill the player (our code starts here)
    },
    'onCollision':'' //On second thought, don't
});
map.defineObject('', { //Do nothing, needed for syntax
    a:{ //Do nothing, needed for syntax (our code ends here)
    }
});
```

This was another great example of the dangers of code injection, and how improper input validation can result in drastic changes being made, even within relatively complex blocks of code that provide a limited input length.
