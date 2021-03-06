#! /usr/bin/bash

curr_branch_name=$(git branch --show-current)
remote=$(git branch --remote --list "*$curr_branch_name")
if [[ $remote ]]; then
  echo $remote
  exit 0
fi

for commit in $(git log --pretty=format:"%h"); do
  remote=$(git branch -r --contains $commit)
  if [[ $remote ]]; then break; fi
done

if [[ ! $commit ]]; then
  echo "could not find a remote branch to match current branch"
  exit 1
fi

echo $remote | grep -oP "origin/[^(HEAD)]+" | cut -d " " -f 1
