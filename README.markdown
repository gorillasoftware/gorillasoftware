# Hi
This is a staticmatic setup for now version 0.11 but as staticmatic is updated, so will be the boilerplate

# Basic Features
A directory tree that takes into consideratio

-    javascript
     -    separating plugins, vendor and library files for easy module style javascript development
-    fonts
-    helpers

# Awesome Features

-    Paul Irish's HTML5 Boilerplate baked in
-    Rakefile with your most common tasks
     -    assemble javascript libraries with the help of sprocketize
     -    compress javascript and css with the help of juicer
     -    add, commit, push to git repos
     -    deploy to staging or production servers with rsync
     -    play with cron
-    more compass config options
-    blog helper for your own staticmatic blog! (alpha version :P)
-    a couple other useful helpers to get you started

# Use
create an empty folder somewhere where you want your project to be  
somewhere else do
    git clone git://github.com/pferdefleisch/staticmatic-boilerplate.git
    cd staticmatic-boilerplate
    git checkout-index -a -f --prefix=/path/to/empty/project/folder/with_trailing_slash/
navigate to your new project's folder and start your own git repo with `git init` if you want ;)
and if you want it as an actual staticmatic installation and not just a site skeleton:  
`gem install bundler rake`  
then in your site's root  
`rake bundle`  
this will install all the rest of the necessary gems and make the rake tasks possible
# Let me know what you think
Send me a message or email me for questions, praise or feature requests.

# TODO:
-    More js documentation
-    Make it cooler