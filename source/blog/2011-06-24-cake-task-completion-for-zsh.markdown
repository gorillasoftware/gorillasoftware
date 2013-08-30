---
title: Cake Task Completion for Zsh
date: 2011-06-24T10:27:33+00:00
tags: build tools, command line, shell
---
Working on a node.js/coffeescript project I got tired of keeping in
mind and typing all the tasks defined in the Cakefile. As Cakefiles are very
similar to the Ruby Rakefiles, I had a look at existing solutions for
rake. The first google result pointed me to a 
[working snipped](http://weblog.rubyonrails.org/2006/3/9/fast-rake-task-completion-for-zsh) I
already had lying around in my zsh.d directory. It turned out to be very
easy task to modify the rake completion.
Basically, I just needed to change the following line from

```bash
rake --silent --tasks | cut -d " " -f 2 > .rake_tasks
```

to

```bash
cake | cut -d " " -f 2 > .cake_tasks
```

Additionally, I removed the annoying 'Generating .\*_tasks' output. Add
an .cake_tasks line to the ignore list of your repository and you're
done.

The final zsh snippet looks like this. Add it to your `.zshrc` or to
some other location that gets loaded when zsh starts:

```bash
_cake_does_task_list_need_generating () {
  if [ ! -f .cake_tasks ]; then return 0;
  else
    accurate=$(stat -f%m .cake_tasks)
    changed=$(stat -f%m Cakefile)
    return $(expr $accurate '>=' $changed)
  fi
}
_cake () {
  if [ -f Cakefile ]; then
    if _cake_does_task_list_need_generating; then
      cake | cut -d " " -f 2 > .cake_tasks
    fi
    compadd `cat .cake_tasks`
  fi
}
compdef _cake cake
```
