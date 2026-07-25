#!/bin/bash

gitcontribute() {
  git log --all --since="7 years ago" --format='%aN|%aE' | sort | uniq -c | sort -nr | awk '
  {
    count = $1
    match($0, /[0-9]+[ \t]+/)
    rest = substr($0, RSTART + RLENGTH)
    print count "|" rest
  }' | jq -Rs '
    split("\n") | map(select(length > 0) | split("|")) | map({
      name: .[1],
      email: .[2],
      contributions: .[0] | gsub(" "; "") | tonumber
    })
  ' > contributions.json
}
