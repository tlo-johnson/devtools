#! /usr/bin/bash

remote_branch=$(get_remote.sh)
git fetch origin && git rebase $remote_branch
