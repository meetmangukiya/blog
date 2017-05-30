+++
categories = []
date = "2017-05-30T11:56:02+05:30"
draft = false
featureimage = ""
menu = ""
tags = ["coala"]
title = "Final week of community bonding at coala"

+++

So, the community bonding period has finally come to an end and the coding
phases will start, more fun follows now!

I already started a bit of coding, I ported some of the plugins.

Things done in this week:

## 1. Added the Dockerfile.   
   [@yukiisbored](https://github.com/yukiisbored) created the dockerfile for 
   corobo. He is our devops guy at coala, he does the awesome work of 
   deploying coala website, webservices, blog, gitmate etc. He is awesome!
## 2. The test suite for the repo has been set. 
   Tests are written in the `tests/` directory. Errbot comes with a pytest 
   fixture `testbot` that can be used in testing. The fixture is working 
   pretty well.
## 3. Start contributing 
   Since the repository structure is already laid and the test suite has already
   been made, outside contributions on various plugins are highly encouraged,
   for a quick guide headout to our [wiki](https://github.com/coala/corobo/wiki).
## 4. Upstream
   I did some documentation fixes and fixed one wrong assertion upstream in the
   errbot repo. The gitter channel is quite active, it is helpful to have
   support upstream :D
## 5. Regarding topic modeling: 
   After recognizing the topic for the question, the next thing is to get 
   the answer from the document. This part is what I call "Passage 
   retrieval". This was a bit difficult one. There are many possible alternatives.
 
   1. We can search the documentation with the topic obtained from the question using a search engine.
   2. Use tfidf on the documentation with topic and use the one with the highest score as the appropriate doc.

## 6. Next step
   After retrieving the documentation, other thing would be linking to the
   documentation and ideally summarizing the same. For summarizing we would be
   using the summarizer available in the gensim already.(Most probably,
   subjected to change.)
