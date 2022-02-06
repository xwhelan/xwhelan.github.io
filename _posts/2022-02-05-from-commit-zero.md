---
layout: post
title:  "From (commit) zero to (commit) one"
date:   2022-02-05 21:00:00 -0500
categories: rants
tags: tooling java jvm build shuhari scaffolding poetry
---

> A complex system that works is invariably found to have evolved from a
> simple system that works.
>
> ---John Gall, _Systemantics_

## Getting to First Commit

- If your code doesn't run, it doesn't work
- If your code doesn't deploy, it doesn't work
- If your code won't build, it doesn't work
- If you don't have any tests on your code, it doesn't work
- If you haven't committed to source code management, it doesn't work
- If someone looks at your repository and doesn't immediately understand how
  to test, build, and deploy your code, _it doesn't work_.

It is essential to be able to commit code that is working in some way as early
as possible in your project.

## Scaffolding is Life

If you give a user a tool which will generate a repository that can output
(a domain specific, actionable) "Hello, World!", you have gotten your user
to commit one with almost zero effort.

Rails does that. Be like Rails.

## Java in Action vs. Java Inaction

Introductory CS classes and textbooks tend to start with toy projects that
actively avoid doing what is actually useful in "real life".

On the one hand, this is inevitable. It takes several passes on any complex
topic to be able to start creating in it.

On the other hand, it trains students to do things the wrong way the first
time.

"Learn it right the first time, do it right the rest of your life. Learn it
wrong the first time, spend the rest of your way learning to do it right."

I tried to look at how to build a greenfield Java project:

- Took one look at Maven config, did not want to write XML
- Looked at alternate products, saw Gradle
- Ran `gradle init` and saw that it will scaffold out a project
- Modern sensible defaults:
  - Kotlin over Java
  - JUnit Jupiter over JUnit 4, with option of Spock
  - Preferred Gradle DSL is in Kotlin, with Groovy as backup option

I love this. When the init script is done, I have a repository, ready to
commit, with a sample unit test, idiomatic build scripts, and everything
works. It's ready to hook up to GitHub Actions and light up a build badge.

Further reading:
[spring.io / Getting Started: Building Java Projects with Gradle](https://github.com/xwhelan/xwhelan.github.io/settings/hooks/341781725/deliveries)

## Everybody Gets a Scaffold

I was starting to hate Python because nobody thinks they write good Python.
The learning curve is so gentle that it encourages [expert beginners](https://daedtech.com/how-developers-stop-learning-rise-of-the-expert-beginner/)

(Read the article on expert beginners. It's great.)

[Poetry](https://python-poetry.org) fixes this by providing a dead simple
scaffold for building well-structured, testable packages that pass builds
right from the jump.
