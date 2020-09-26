# Setup of mutt as an email client.
Based off of [a-modern-mutt-setup](https://webgefrickel.de/blog/a-modern-mutt-setup) and [a-modern-mutt-setup-part-two](https://webgefrickel.de/blog/a-modern-mutt-setup-part-two).

## Deviations:
- I'm using gpg to secure credentials. See [password management](https://wiki.archlinux.org/index.php/msmtp#Password_management) on the msmtp page.

## Required tooling
- mbsync `brew install isync`. The package is called isync but the binary is called mbsync
- msmtp `brew install msmtp`
- mutt `brew install mutt`

## One-time setup
Besides installing the required tooling, a credentials file is required. This file is configured as part of the PassCmd setting in `.mbsyncrc` and as part of the passwordeval setting in `.msmtprc`. At the time of this writing, that location is set to `.credentials/gmail-credentials.gpg`. Instructions from [gpg password management](https://wiki.archlinux.org/index.php/msmtp#Password_management) were used to generate the gpg file during setup of this project.

Note: The rest of the one-time setup required has been scripted in `./one-time-setup.sh`. Run that file if you feel like an automated setup.

Symlinks from $HOME need to be set up for the files listed below.
- `./.mbsyncrc`
- `./.msmtprc`
- `./.muttrc`

Create the expected directory structure for mutt - errors are thrown if mutt does not find the directory structure it expects.
- `$HOME/mail`
- `$HOME/.mutt/cache/headers`
- `$HOME/.mutt/cache/bodies`
- `$HOME/.mutt/mailcap`
- `$HOME/.mutt/tmp`

## Usage
The following commands can be useful once running
- Sync all mailboxes `mbsync -a`
- Sync all mailboxes from mutt using `O`. This is set up as part of the mutt key bindings in `./bindings`
- Send an email `echo Test | msmtp -a fake@email.com fake@email.com`
