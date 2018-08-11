---
title: 'Cheat sheet: Installing Jekyll on Linode'
date: '2018-02-15 14:34:30'
tags: cheatsheets
---

I am in the process of migrating away from Ghost. Long/short, there is too much dynamic code, and the exposure makes me uncomfortable. I've discovered [Jekyll](https://jekyllrb.com/) and [Github Pages](https://pages.github.com/), and I think I'm going to go in that direction. Thoughts on pros/cons to come, but right now I am taking the first steps in setting up the back-end.
Below is a quick setup list of commands for getting Jekyll running on a fresh [Linode VPS](https://www.linode.com/?r=e384d5061a2c7b5a4ce1774604e86cf07983c1bf) (referral link).

~~~ bash
apt install ruby
gem install bundler
echo "source 'https://rubygems.org'" > Gemfile
echo "gem 'github-pages', group: :jekyll_plugins" >> Gemfile
apt install ruby2.3-dev
apt install make
apt install gcc
apt install dh-autoreconf
apt install zlib1g-dev
bundle install
~~~

More commands to come on the next steps, but this handles the various dependencies that are needed to follow the instructions [here](https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/#platform-linux).
