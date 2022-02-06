---
layout: post
title:  "(Welcome to (Welcome to Jekyll))"
date:   2022-02-05 17:02:15 -0500
categories: tools bootstrapping
tags: github jekyll homebrew ruby
---

### Overview

How I set up this page live on GitHub Pages.

### Background

- I have GitHub Pro as table stakes in this industry, and to keep
    sharp
- I want to write down what I do consistently: for others to follow,
    and to remind myself that this stuff is much easier now than even a
    few years ago.

### Steps to recreate

- Already have Visual Studio Code and [homebrew](https://brew.sh) on
    my Air M1.
- Already have `gh`{.language-plaintext .highlighter-rouge} GitHub CLI
    client installed via Homebrew
- Failed: tried installing latest Ruby via `rvm`{.language-plaintext
    .highlighter-rouge}, didn't like interface, so tried running
    `rbenv`{.language-plaintext .highlighter-rouge} instead (work well
    with `pyenv`{.language-plaintext .highlighter-rouge} and
    `plenv`{.language-plaintext .highlighter-rouge})
  - Problems with build due to problems discovering
        `libyaml`{.language-plaintext .highlighter-rouge} for build
  - Workaround: just use Homebrew Ruby 3.0.3 install instead
- Install Jekyll via `gem install --user jekyll`{.language-plaintext
    .highlighter-rouge}
  - cf. <https://jekyllrb.com/docs/installation/macos/>
  - Experienced bug with Jekyll and Ruby 3.0:
        <https://github.com/github/pages-gem/issues/752>
  - Workaround:
        `gem install --group "development" webrick`{.language-plaintext
        .highlighter-rouge}
  - Noted that hot reload only works for some templates, still have
        to restart when changing `_config.yaml`{.language-plaintext
        .highlighter-rouge}. Also Markdown character expansion (like
        em-dash) doesn't work for metadata fields like blog title.
- Create repository and configure using instructions at GitHub
  - cf.
        <https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/about-github-pages-and-jekyll>

### Additional practices

- I'm keeping my spell checking file in here to ensure that I check
    spelling in CI/CD

### TODO

- Start working outside of `main`{.language-plaintext
    .highlighter-rouge}
- See about CI/CD when PR to merge
