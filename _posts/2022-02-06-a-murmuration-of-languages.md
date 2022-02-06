---
layout: post
title: "a murmuration of languages"
date: 2022-02-06 12:03:00 -0500
categories: rants
tags: bash perl python tooling
---
## TL;DR

- If it's a command you run twice, make a script
- Use [shellcheck](https://github.com/koalaman/shellcheck)
- Give (good) Perl a chance
- But beware of Perl arrays (and references) if you don't understand C arrays (and pointers)
- Your functions may be doing too much. Break them up into smaller functions

## The First Hundred Lines

In automation, the shallow end of the pool is 100 lines of code or less.

The progression is typically:

1. Start with a recurring command line. Copy paste a clever one liner.
2. Put the one-liner in a script. Refactor, add command line and environment variable handling. Document and add to a repository
3. Eventually run into too many bugs with bash arrays or have an `awk` argument take up half the script.
4. Re-implement in another language
5. Wonder if you should have just done it Python to begin with

On the one hand: not every script needs to be a tested, scalable application.

On the other hand: if an action is performed twice, it will most likely be performed many more times after that, and should be documented in executable code.

On the gripping hand: _more automated processes are always preferable to more manual processes._

## Evening the Difficulty Curve

At the start of the process, work to reduce friction in getting one liners into shell scripts:

- Adopt `shellcheck` into your daily practice to eliminate
- Practice [defensive bash programming](https://www.reddit.com/r/linux/comments/4p470v/secure_your_bash_scripts_with_defensive_bash/) - a good article even if it is a bit dated and has some red herrings
- Early on, make use of more "program" shell features like `getopts` and `select`

I will caveat this with what comes next...

## Ontogeny Recapitulates Phylogeny

I believe that it is import to study the history of computing, because we are all dealing with the effects of design decisions made twenty or forty years ago. A good question to ask when finding a weird problem is "how did everyone else deal with this?"

One answer to this question, when posed to the problem of managing and scaling growing shell scripts, is: _create another runtime_.

The `awk` language started as a DSL for text processing and fulfilled one niche in the functionality gap between bash and C. I crossed paths once with a Solaris veteran who could do anything he needed to with nothing but awk.

When awk scripts got to be too big for awk but too small for C, I believe that Larry Wall created Perl.

## Necromancy for Fun and Profit

> “There are only two kinds of languages: the ones people complain about and the ones nobody uses.”
>
> ― Bjarne Stroustrup, The C++ Programming Language

The thing about Perl is that its syntax is very close to shell scripting. It also has a running mode that makes it mostly compatible with awk. It also also has a superset of regular expressions that became **PCRE**, going beyond its own usefulness in the same way that **JSON** did.

That bears special mention: regular expressions are language primitives, where functions' arity isn't. Python requires you to import a library and then make decisions about tradeoffs in compiling regexes. Want to invoke an outside function? Learn the process library or learn some other library that does it in Python.

It can be terrible. It can also be written with the structure and discipline of a rigorous daily practice. 90% of that is achievable simply by adding `use strict;`, the same way 60% of bash problems can be surfaced through `set -euo pipefail`.

Simply put, Perl was the solution to the problem of expanding shell scripts. The bones of these decisions can be found under many popular libraries; simply look under the hood of `openssl` distributions.

And because the syntax isn't super great and offers the developers a loaded gun pointed at their feet, its (primordial) package management environment, CPAN, will execute all of the included tests on install. Unit testing is a first class operation in a language where error handling isn't.

## Given certain conditions, forget what I just said

Arrays are not great in shell, so going from shell to Perl isn't going to
help you with that:

- Arrays in bash are the biggest sign you need a better language
- Beware of array conversion in bash vs. zsh (for all your zshrc imports)
- Shellcheck helps avoid the worst unforced array errors
- Perl's concept of arrays is taken directly from C. So if you don't at least dimly get C pointers, Perl arrays and reference/dereference syntax are going to hurt

However, the use of arrays in bash might be the tool trying to tell you that you are using it wrong.

A lot of the time, the desire to take an input array, iterate through it, and put the results into a different array is a tic acquired from writing too many for loops. It's a sign that **your function is doing too much**, and you need to break it up into smaller, simpler, testable functions.

_You aren't getting charged by the stack frame!_
