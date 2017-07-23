+++
categories = []
date = "2017-07-23T07:49:38+05:30"
draft = false
featureimage = ""
menu = ""
tags = ["coala"]
description = "corobo answering as a microservice"
title = "corobo - answering microservice"

+++


In the last blog I tried to explain the answering mechanism in corobo. Now, it's
time to deploy it. Deployment is not always as easy as working locally. But
there's docker that makes it easier.

## Problem:

Answering module uses spacy which requires training model to work. That training
model is about 1 GB of data. Adding that to corobo Dockerfile didn't quite make
sense because that'd increase the size of the image by 1 GB.

Since we want corobo to be adaptable by other orgs and since answering plugin is
coala specific(for now), we didn't include answering module in the corobo docker image.

## Solution

We created a microservice to access the answering infrastructure. There are 2
endpoints:

1. `/answer` which grabs the question from `question` query parameter and returns an array of answers with scores.
2. `/summarize` which grabs the text to be summarized from `text` query parameter and returns a json respone with summarized text as value and `res` as key.

Now, the answer for a question is retrieved by making a call to `/answer` endpoint which is then summarized by calling `/summarize` endpoint.

The microservice is deployed in its own docker container, has its own docker image and ofcourse it's own Dockerfile.
This decouples the answering deps from corobo, and hence not affecting other orgs' corobo instance and also no increase in corobo docker image's size.
