#! /usr/bin/env bash

currDir=$(pwd)

# create mutt directories
mkdir -p $HOME/mail $HOME/.mutt/cache/headers $HOME/.mutt/cache/bodies $HOME/.mutt/tmp

# add symlinks to configuration files
ln -s $currDir/.mbsyncrc $HOME/.mbsyncrc
ln -s $currDir/.msmtprc $HOME/.msmtprc
ln -s $currDir/.muttrc $HOME/.muttrc
ln -s $currDir/mailcap $HOME/.mutt/mailcap

ln -s $currDir/.muttrc-outlook $HOME/.mutt
ln -s $currDir/.muttrc-gmail $HOME/.mutt
ln -s $currDir/.muttrc-stoke $HOME/.mutt
