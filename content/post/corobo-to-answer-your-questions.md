+++
categories = []
date = "2017-07-20T07:49:38+05:30"
draft = false
featureimage = ""
menu = ""
tags = ["coala"]
description = "Describing how corobo answers your questions."
title = "corobo - to answer your questions"

+++

A. part of my GSoC phase 2 was to get corobo to answer questions from users automatically by searching the ccorobo to answer your questions
A part of my GSoC phase 2 was to get corobo to answer questions from users automatically by searching the coala documentation and returning a link to the relevant section.
So, here today we discuss about the implementation specifics of the same. Lets get started:


# Parsing

Firstly, we need to parse the documentation. All of coala documentation are reStructuredTexts(rSTs/reSTs). Parsing rst files are done using `docutils` package.

Parsing in our answering system is quite simple. We walk through all the nodes in the documents and process all the `Section` nodes. Now, there are possibilities for a section to contain another section. So, the node is searched if a child section node exists in which case, this node is ignored, because the child node will be recorded later. So, this way we have all the sections from all the rst files. The id of each section is known as well, which helps in building links dynamically such that it points towards relevant part of the documentation.

The texts are stored in a dict, where the keys are section name and values are text, code, and filename of the rst file.

# Processing

## Documentation

We construct a knowledge graph from the texts that we grabbed earlier by parsing the documentation files.


How is the graph formed:
1. Formation of nodes.
   There is nothing special about node formation. Each token is a node, actually lemmatized node.
2. Formation of edges.
   Edges are formed between lemmatized token and lemma of head of the sentence token belongs to.


Apart from this, all the nodes have texts that the node is part of.
Example: `git` node will have texts from all the sections of coala.io/git


## Question


1. Same algorithm that we used earlier to form knowledge graph from documentation is used to create graph of the question.
2. After creating the question graph, each edge in the question is iterated over.
3. The two nodes in the edge are searched in the documentation graph. If both of them are present, then we walk through all the shortest connecting the two nodes and increment the score of each text document stored in the node by 1.
4. Score is scaled down relative to the highest scored node.
5. Top 3 results are yielded according to the score.

This is pretty much how the answers are found for a given question.

You can refer to a research paper this idea was taken from, here: https://pdfs.semanticscholar.org/57dc/e89754ad37b1a631e4ac6f375ce9cae3988e.pdf

