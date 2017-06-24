+++
categories = []
date = "2017-06-24T23:53:01+05:30"
draft = false
featureimage = ""
menu = ""
tags = ["coala"]
title = "GSoC Phase-1 End"
description = "Coding phase 1 has come to an end, here's what I've achieved so far!"
+++

GSoC Phase-1 End
Hey!
It is end of June and phase-1 already! Time flies, doesn't it?(except when you are waiting for a review of your PR :P)

In the last blog post, there were 7 plugins, now there are total 11 plugins. All the old plugins have been ported and functional.

New plugins that weren't in the last post are:
1. WolframAlpha plugin - Used to query wolfram alpha from chat.
2. Coatils - Awesome stats regarding coala and contributors.
3. Coala_lowercase_c - To tell the user that coala and cEPs are always written with lowercase c.
4. LabHub - This the plugin whose Mega PR was still under review during the last post.

This is version 1.1 of corobo. Here's the changelog:
## Changelog(from cobot to corobo):
1. Framework - Moved to [errbot](http://errbot.io) ;) It's all python now!
2. Assigning, creating, unassigning, and marking PRs pending and wip are working for gitlab repos as well.

## New stuff
### Stats!
Various coala related stats are now available through corobo:
1. Contribution Stats:  
    If you don't know, we maintain coala contributors' contributions stats at coala.io. The contribution stats are available through http://webservices.coala.io/contrib/ endpoint. The same is used to get this stats.
2. Bear stats:  
   Returns number of bears that are currently available. As of now there are 102 bears!! That is a huge number, isn't it?
3. Bear stats for given langauge:  
    You can even get number of bears of a particular language using `corobo bear stats <lang>`.
4. Lang stats:  
    Returns the number of languages coala supports. As of now coala supports 63 languages!
5. stats:  
    This returns both the number of bears and number of languages supported.

### LabHub
1. Issue Assignment:  
    To assign yourself to given issue. However, this assign is smarter then earlier. It performs checks of eligibility before assigning the issue. Currently there is one check which allows newcomers to only assign themselves to issues that are labeled newcomer or low difficulty.
2. Creating new issues:  
     You can create issues on coala repositories both across GitLab and GitHub.
3. Inviting users:  
    This is available to maintainers only. It is used to invite users to different teams namely newcomers, developers, maintainers team.
4. Marking PR status:  
    We, at coala, mark PRs that are work in progress with label process/wip and those that are awaiting review as process/pending review. This command allows you to label PR status. So, if you've reviewed a PR and PR needs more work, you mark it wip. If you've done the required changes and want the PR to be reviewed again, you mark it pending.
5. Unassigning:  
    Unassigns the given user from the issue.

## RAML
Since, I was consuming webservices.coala.io, I used RAML to express the API, and generate a client from the RAML file. I used [ramlient](https://github.com/timofurrer/ramlient) to generate the client. If you are using RAML to describe your API, you should check ramlient, however it is still in early stages. It doesn't use all the information from the RAML file.
It wasn't working earlier, then we reached out to the original author who agreed to help with the development :D . He reviewed and merged pretty quickly, and released the same.

I searched for python client generators, but there were pretty less options. There was nsxramlclient, but it was python2 and also it didn't support RAML 1.0

## IGitt
We talked about this lovely piece of software in my last post, remember? Well, everything was working in the LabHub plugin except that the gitlab repos can't be used :O . The reason being IGitt only supported authentication using OAuth tokens, since that was the primary usecase at GitMate. I wasn't aware of that until then. Then we created a new `Token` base class in the interface. `GitHubToken` was implemented for GitHub. `GitLabPrivateToken`, and `GitLabOAuthToken` were implemented for GitLab. We completely changed the process of Authentication with that PR. It was a breaking change. If one used the earlier authentication mode, then on update everything will be broken. Fix it if you are using IGitt and read this ;)

corobo was left in the wild yesterday. A bug surfaced after that which have been fixed and a PR is created. And a few bugs in errbot gitter backend as well. Awaiting community review on the new version of cobot - the corobo!

That's it for now, will meet in a couple of weeks now :D
