#!/bin/bash
# Create a new jekyll post with the current date and the given title
# and print the path to the post file.
#
# author: andreasl
# cf. <>https://gist.github.com/aamnah/f89fca7906f66f6f6a12?permalink_comment_id=3243700#gistcomment-3243700
set -euo pipefail

post_title="$*"
if [ -z "$post_title" ]; then
    printf 'Error: Script needs a post title.\n'
    exit 1
fi


repo_dir="$(git rev-parse --show-toplevel)"
post_date="$(date '+%Y-%m-%d')"
post_time="$(date '+%Y-%m-%d %H:%M:00 %z')"
title_slug="$(  \
    printf -- "%s" "$post_title"  \
    | sed -E 's/[^a-zA-Z0-9]+/-/g'  \
    | tr "[:upper:]" "[:lower:]"
)"
post_path="${repo_dir}/_posts/${post_date}-${title_slug}.md"

if [ -e "$post_path" ]; then
    printf 'Error: Post exists already.\n'
    exit 2
fi

# Templated frontmatter to post
cat << EOF > "${post_path}"
---
layout: post
title: "${post_title}"
date: ${post_time}
categories: []
tags: []
---

EOF

printf -- '%s\n' "${post_path}"
