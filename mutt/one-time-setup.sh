#! /usr/bin/env bash

currDir=$(pwd)

# add symlinks to configuration files
ln -s $currDir/.mbsyncrc $HOME/.mbsyncrc
ln -s $currDir/.msmtprc $HOME/.msmtprc
ln -s $currDir/.muttrc $HOME/.muttrc

# create mutt directories
mkdir -p $HOME/mail $HOME/.mutt/cache/headers $HOME/.mutt/cache/bodies $HOME/.mutt/mailcap $HOME/.mutt/tmp
