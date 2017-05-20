+++
categories = []
date = "2017-05-19T21:09:27+05:30"
draft = false
featureimage = ""
menu = ""
tags = ["coala"]
title = "GSoC community bonding week 2"

+++

# Status Update

## Create milestones

Started creating milestones for bonding phase and coding phase 1, 2, and 3 and
populating those milestones with issues. 

1. [Bonding Milestone](https://gitlab.com/coala/GSoC-2017/milestones/2)
2. [Coding Phase 1 Milestone](https://gitlab.com/coala/GSoC-2017/milestones/23)
3. [Coding Phase 2 Milestone](https://gitlab.com/coala/GSoC-2017/milestones/24)
4. [Coding Phase 3 Milestone](https://gitlab.com/coala/GSoC-2017/milestones/25)

## Search Engine Frameworks VS. Topic Modeling Frameworks

Started discussing about the auto-responding feature of corobo. We started by
weighing **search engine frameworks** vs. **topic modeling frameworks**. It was
decided to use topic modeling frameworks instad of any other search engine
frameworks like Solr, Lucene, ElasticSearch, etc.

Related issue: https://gitlab.com/coala/GSoC-2017/issues/3

## Build Prototype

Basic steps to retrieve the topic/key of the question:

1. Pre-process the input text.
2. Train over the input documentation.
3. Use the trained model to retrieve the topic of the question.

In prototypes, we try to change the training methods, pre-processing methods to
get as efficient results as possible.

Prototypes can be found here:
https://github.com/meetmangukiya/topic-modelling-prototype

## Basic repo structure and setup CI

The repository for the new cobot is setup at github:
https://github.com/coala/corobo

Travis CI is setup for the repository. coafile is added to the repository.

## Start writing a cEP

I started writing a cEP for my GSoC project:
https://github.com/coala/cEPs/pull/77
