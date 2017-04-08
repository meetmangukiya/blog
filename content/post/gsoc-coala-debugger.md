+++
date = "2017-03-19T18:15:48+05:30"
title = "GSoC Proposal - Debugger for coala bears"
draft = false
tags = ['coala']
+++

# I am applying for Google Summer of Code

## What is Google Summer of Code a.k.a. GSoC?

Google Summer of Code is a platform to encourage students to work for Open
Source. It is a 3 month internship-like program whereby student works with Open
Source Organizations under the guidance of a mentor
(who is usually a member of the organization) to write/modify programs/softwares
for the organization.

## What is coala?

coala is a program that provides a unified interface to statically analyse
any project through one application. It wraps many linters across different
languages and prints results and messages from those linters, and also apply
and suggest patches for the given messages.

coala runs all the analyis routines through the bears. Bears are like plugins
and coala is like a framework. Bears are configured through a file `.coafile`.

coala runs all the analysis/bears by just running `coala`, isn't it just
awesome!

I am applying for a GSoC project under [coala](https://coala.io)

## What is my project about?

### Debug and profile bears.

My project is about creating a debugger for coala, to debug the coala bears and
create an interface to profile the bears.

### Debugger

#### Why not use pdb?

You may ask that one may just use `pdb` to debug the bears.

Writing bears in coala is very easy, thanks to its user friendly and abstract
API. But the bear developers, usually find difficulty in debugging the bears.
In bear debugging, the user usually do not need to debug the bear that
*low levelly*

#### Debug modes

The debugger that I'll be creating has three modes:

1. Debug Mode:
    In Debug mode, the debugging is started as it is as in pdb.
2. Superficial Mode:
    In Superficial mode, the arguments and return values of debugged function
    call is captured. This would remove unnecessary stepping.
3. Report Mode:
    This is probably the most useful mode. If this mode is used, then the bear
    is ran and the arguments and the return values of all the subsequent function
    calls are captured and printed in a beautiful tabular form.

#### Debugging environment

The job of importing the bear, instantiate them, and run the bear with requried
setting is a trivial job that can be automated inside coala, so the devs don't
need to set it up on their own ;)

The bear being debugged will be imported. If no settings are provided in the CLI
then settings in the coafile will be used while running the bear.

#### Debug!

After the importing and collecting of settings is done. Its time to start
debugging. The run method of the bear is called in *Debug Mode*. After that at
every line, user has an option to do whatever options pdb already has plus the
superficial mode. Superficial mode will perform the function call and print the
arguments and the return value at that line.

Using the report mode. If the report mode flag is set to true, then the run
method of bear is called in superficial mode which will directly print the
**Results** and return values and arguments of all the function calls in the run
 method.

### Profiler

After the bear is written and debugged, the author may want to check if he can
do any performance improvements in the bear. This is where profiling comes into
the picture.

User can run bear with a `--profile` option and a nice profile report will be
created for the given run.

**More specific info in the [proposal](https://meetmangukiya.github.io/GSoC-DebugandProfileBears-coala.pdf)**
