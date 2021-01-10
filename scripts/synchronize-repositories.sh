#! /usr/bin/bash

for folder in ~/dotfiles ~/tools; do
	cd $folder && git pull && git add -A && git commit -m 'synchronizing repositories' && git push
done
