---
layout: posts
title:  "Living in a(n) HTTPS world"
date:   2022-02-05 18:27:00 -0500
categories: postmortems
tags: mistakes github git proxy
---

### TL;DR

Always clone with `https`, unless you're working in the enterprise.

### The Setup

I was killing time at the Apple Store by setting up this blog. I could not
push to GitHub because I was on store WiFi, which did not allow ssh traffic
through. So I tried changing `origin` to https, got bored, and figured `gh`
could do it more easily

### Whoops

I nuked my repo by telling my machine to do a `git pull` via `gh repo sync ...`

I was able to get the text out of the rendered static page which wasn't
overwritten, but my fingers were burned on the stove.

### What I learned

- git synchronization with SSH is great, but I'm going to need to use https
  at the worst possible time
- In a real cloud environment, *everything is REST API over HTTPS*, so deal
  with it
- Never force! Take a deep breath, take a break. Paranoia is good, there are
  no unnecessary backups
- It ain't done until you deploy
