---
title: 'Cheat sheet: Basic jQuery examples'
date: '2017-10-16 01:05:28'
tags: cheatsheets
---

I recently went through the first two levels of the free intro tutorial at [JQuery](http://try.jquery.com) in order to build some basic jQuery familiarity (more on why soon).
Below are my shorthand notes and descriptions. I highly encourage visiting the site if you have never touched jQuery before, as it builds the foundational knowledge needed for understanding how jQuery is used on the web.

---

~~~ javascript
$("h2") # This is the shorthand form of calling jQuery code. The h2 will select any <h2> elements in the DOM.
$("span").text() # This will select the text "object" that is found under any (all) <span> elements in the DOM.
$("span").text("STUFF") # Similar to above, but this will set the value of the text object to STUFF.
$(document).ready(function() {
	jQUERY CODE HERE
}); # This will make sure the full DOM has loaded before executing your jQuery code.
<script src="SCRIPTFILE"></script> # HTML tags to load a script file. I think in proper HTML this can be a single <script /> tag without the </script> closing tag, but the tutorial did not allow for that.
$(".class h2") # Selects all the <h2> elements in the named class.
$("#id") # Selects all elements with the named id.
$("#id li") # Selects all the <li> elements with the named id (note this is not the preferred way to do this).
$("#id").find("li") # Selects all the <li> elements with the named id.
$("#id").children() # In the example this works the same as above, but it is using the direct parent/child relationship to make the selection. Different DOMs could have different results.
$(".class1,.class2") # Multiple selectors being used to select two different classes in a single query.
$("#id > li:first") # Using the :first pseudo selector to select the first <li> element in the named id.
$("#id > li:even") # Using the :even pseudo selector to select every other <li> element in the named id.
$("#id").find(".class") # Use traversal to select each instance of the named class within the named id.
$("#id").find("li").first() # Traverse into the named id, selecting the first <li> element found.
$("#id").find("li").last() # Similar to above, but selecting the last <li> element found.
$("#id").find("li").last().prev() # Select the <li> element one previous to the final element in the named id.
$(".class").parent() # Select the parent element of any element in the named class.
$("#id").children() # Select the children elements of the element with the named id.
~~~
More to come, as I complete the latter two free levels.
