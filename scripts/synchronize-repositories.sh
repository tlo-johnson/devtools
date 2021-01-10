#! /usr/bin/bash

for folder in ~/dotfiles ~/tools; do
	cd $folder && git add -A && git commit -m 'synchronizing repositories' && git pull && git push
done
