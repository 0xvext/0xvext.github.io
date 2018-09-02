---
title: How to use Steam on Mac OSX
date: '2017-10-08 17:31:04'
tags: steam cheatsheets
---

# Cheat-sheet version:
~~~ bash
USER=$(whoami)
cd /Users/${USER}/Library/Application\ Support/Steam/Steam.AppBundle/Steam/Contents/MacOS/public; ls *.res | while read line ; do file=$(echo $line | tr '[:upper:]' '[:lower:]'); mv $line $file; done
cd /Users/${USER}/Library/Application\ Support/Steam/Steam.AppBundle/Steam/Contents/MacOS/steam/cached/; ls *.res | while read line ; do file=$(echo $line | tr '[:upper:]' '[:lower:]'); mv $line $file; done
cd /Users/${USER}/Library/Application\ Support/Steam/Steam.AppBundle/Steam/Contents/MacOS/friends; ls *.res | while read line ; do file=$(echo $line | tr '[:upper:]' '[:lower:]'); mv $line $file; done
cd /Users/${USER}/Library/Application\ Support/Steam/Steam.AppBundle/Steam/Contents/MacOS/graphics; ls *.tga | while read line ; do file=$(echo $line | tr '[:upper:]' '[:lower:]'); mv $line $file; done
cd /Users/${USER}/Library/Application\ Support/Steam/Steam.AppBundle/Steam/Contents/MacOS/servers; ls *.tga | while read line ; do file=$(echo $line | tr '[:upper:]' '[:lower:]'); mv $line $file; done
~~~

# Full post:
Valve seems to have forgotten that OSX can (and should) be installed using a case-sensitive file system. Installing Steam is successful, but attempting to run it results in a blank login screen on such a system. The fix is to rename all the .res and .tga files in the Steam application folder to lower case, because reasons. Fortunately user Asturaz provided an easy script to perform this change on the Steam forums [here](https://steamcommunity.com/discussions/forum/2/282992646978253149/#c282992646985999495).

Breakdown:

`USER=$(whoami)` # Store the value of the currently logged-in user in the variable USER.

`cd /Users/${USER}/Library/Application\ Support/Steam/Steam.AppBundle/Steam/Contents/MacOS/public` # Navigate to the path containing the resources to be renamed

`;` # Do more stuff.

`ls *.res | while read line` # List contents of the folder for files ending in the .res extension; then start a while loop that runs on each line that results. During the execution, each line is temporarily stored in the variable 'line.'

`;` # Do more stuff.

`do file=$(echo $line | tr '[:upper:]' '[:lower:]')` # For each iteration of the loop, echo the lowercase version of the file that was listed above, and store its value in a variable called file.

`;` # Do more stuff.

`mv $line $file` # Rename the current file ('line') to the lowercase version ('file').

`;` # Do more stuff.

`done` End the loop.
