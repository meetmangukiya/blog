+++
date = "2017-03-18T14:47:27+05:30"
title = "Up and running with the awesome hugo"
description = "Hugo is a static site generator"
draft = false
tags = ['hugo', 'web']
+++

# Hello World!

I am kickstarting this website today. I've been switching themes and platforms.
First I tried Jekyll, but it didn't turn out that good for me. Then I started
writing a new website from scratch and dropped it in between :P. Now, I am using
[hugo](https://gohugo.io), seems pretty cool and easy to use until now. Let's hope
I stick around this one for a while atleast.

I am using [Ghostwriter theme](https://github.com/roryg/ghostwriter) and hope to
stick with it.

# Setup
The setup was pretty simple:

1. Install hugo.
2. Scaffold & Install themes.
```sh
    hugo new site meetmangukiya
    cd meetmangukiya/
    hugo new post/hello-world.md

    cd themes
    git clone https://github.com/roryg/ghostwriter
    cd ghostwriter
    npm install
    cd ../../

    vim config.toml
    # configuration ...
    hugo server --theme=ghostwriter --buildDrafts
    # go check localhost:1313
    # There, you have a website running already :D
    ```  
3. Build and deploy
```sh
hugo -t ghostwriter
cd public
git init
git remote add origin <remote>
git add *
git commit -m ":rocket: Deploy"
git push -u origin master
```

4. Automating deploy:
This goes in `deploy.sh`
```sh
hugo -t ghostwriter
cd public/
git checkout master
git add *
git commit -m "Website Update $(date -u)"
git push
```

That's it, isn't it just wonderful!
