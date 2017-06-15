+++
categories = []
date = "2017-06-15T00:22:27+05:30"
draft = false
featureimage = ""
menu = ""
tags = ["coala"]
title = "GSoC Phase-1 Mid"

+++

The coding phase started with the first week of June. Since then:

# Ported 6 plugins, created 1 new plugin

The 7 plugins ported are:

1. explain - It returns an explanatory message for a given term.
2. ghetto
3. lmgtfy - returns a lmgtfy link with a given search string.
4. nevermind - returns a 'I'm sorry' message.
5. ship-it - returns motivational squirrel images.
6. the-rules - returns bot rules

One new plugin that was created is:

1. searchdocs - retuns a link to relevant search page.

## Some things about testing in errbot

All of these 7 plugins were pretty simple to implement. Also, there is a policy
of 100% test coverage in the corobo repository. So, all the plugins are tested
as well. Testing is actually an interesting part. Actually the testing statement
is pretty simple `self.assertCommand('!message that is a command', 'expected
output of the command.')`. But there's a lot going on in here.

First of all, here the `self` is actually the instance of a stub of errbot.
A stub is a minimal working substitution of an object, usually created and used
in testing.

Fortunately, the stub is available from errbot itself. There is a pytest fixture
that can be used to get the stub in your testing function, or you can yourself
instantiate the `TestBot` class appropriately. If you use the fixture, then that
part is handled by the fixture itself implicitly :D.

Rough flow is:

1. Instantiate the bot.
2. Bot collects the plugins.
3. Bot instantiates the plugins.
4. The plugins are activated. (You can override `activate` method to perform
   do something during `activation`).
5. After the plugin is activated, bot registers the commands and calls the appropriate command based on whether it is a normal cmd, or a cmd that has to be triggered if the msg matches the given regex viz. `re_botcmd`, or a callback cmd that is called on every single message.
6. Well, after the function call it is our plugin taking over and doing the processing and appropriately respond with [a] message/messages.

### One of the biggest pitfall

I had to do some intensive mocking in the `LabHub` plugin(PR can be found here https://github.com/coala/corobo/pull/71 ), it is already +300 change and there's
still much stuff to add all the functionality.

This plugin is mainly about managing/modifying github and gitlab repositories.
Like inviting people to the org, creating issues, assigning issues, unassigning
issues, etc. Since, all of these primarily makes REST API(http requests) calls,
most of the plugin is tested using mocking the features, essentially monkey
patching the functions that make the API call and set the return value to
something sane.

Usually mocking is about playing with python namespaces and assignign them
appropriately.

So the problem that arised was:

# #1.
errbot uses [yapsy](https://github.com/tibonihoo/yapsy/) for plugin management and loading. So, now, since the loading is done by some third party library it is not possible to access the namespace of the plugin, hence, it cannot be monkey patched. So, to get around this, it took me some time to find solution to this problem. I got away with a dirty workaround on this one. When one instantiates the stub viz. `TestBot` class mentioned earlier, it has the yapsy plugin manager as one of the attributes and it could be used to instantiate the plugin directly from the code, manually.
    ```py
    from errbot.backends.test import TestBot
    import plugin.ThePluginClass

    # the stub
    testbot = TestBot()
    testbot.start()

    # load and instanciate the plugin
    plug = testbot.bot.plugin_manager.instanciateElement(plugin.ThePluginClass)
    # activate the plugin
    plug.activate()

    # patch the plugin.ThePluginClass namespace for mocking
    ```

# #2.
So after I found this workaround I used it. It worked for most of the functions properly, other then the callback function. Since the callback function is registered by errbot and our plugin was manually instantiated and activated, it isn't registered to errbot and hence doesn't call the callback function.

# IGitt

In last few days I started contributing to [IGitt](https://gitlab.com/gitmate/open-source/IGitt). I wanted to use it in the `LabHub` plugin. Since I had both GitHub and GitLab utilities to manage, IGitt was the perfect choice. It provides with a unified interface for various Git-hosting services, it is awesome, isn't it?

I implemented some small things that I needed for my plugins, and also wrote
tests for the GitHub implementation. Testing in IGitt was previously done
through doctests and making real API calls. So, we came up with idea that we
should record API requests and then reuse it, instead of making API calls on
each build. Thanks to the open-source community, there are already
things/libraries that do that. We used vcrpy for that. What vcr does is records
the http requests, with responses, headers and almost all the data in a file
which is called cassette. Then, it plays the cassettes, i.e. returns the
responses from the files to the requests made in the code. Hence, it is a _vcr_
replaying and recording http _cassettes_.

The review process was pretty quick, thanks to @fneu, @sils, @nkprince007,
@jayvdb which are almost all the contributors of IGitt ATM. Since the review process was quick
I can quickly integrate the same in my corobo plugin. It is awesome!

Helpful Links:

1. https://en.wikipedia.org/wiki/Monkey_patch
2. https://en.wikipedia.org/wiki/Mock_object
3. https://en.wikipedia.org/wiki/Test-driven_development
