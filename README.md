# Docker container with static website / jupyter notebook server

This uses the jupyter / tornado web server to serve a website (which we build using jekyll) and notebook content.

There is a sample website included in the Content folder, but the expectation is that you will nuke that and replace it with content via a sub-repository.  




Open source content for Leap Day theme. Theme was first designed / developed for GitHub Pages and is availalbe for download, forking and using anywhere else on the web.

The Leap Day Pages demo is [here](http://mattgraham.github.com/leapday)


### Developing Locally

```
.script/server
```

Running `_scripts/server` will run `jekyll serve && compass --watch` commands via terminal. You will be able to open http://localhost:4444 and make changes to any of the, md, .html or .scss files and compass will compile them for you. Simply refresh your browser (or use something like livereload) and develop away. Most of the colors and sizing is found in the _variables.scss file.


### Credits

Leap-Day Theme is by [Matt Graham](http://madebygraham.com), twitter [@michigangraham](http://twitter.com/#!/michigangraham). Use, reuse and modify away.

[Creative Commons Attribution](http://creativecommons.org/licenses/by/3.0/)
