# Mutt-X
A script meant to set up an email client with neomutt. So far, I've only seen this work with Gmail and Yahoo mail &ndash; although both require
`app-passwords` for third-party applications to access them.

Also, this script is strictly for offline use. `isync` will download your mail into your
assigned mail directory and `neomutt` will access the data from there. Make sure to run `ms s`
from time to time to sync your files.

## Dependencies
- `neomutt` &ndash; The email client.
- `isync` &ndash; Syncs mail to download onto your system.
- `dmenu` &ndash; [Suckless's](http://suckless.org) dynamic menu. This makes it
easier to switch accounts.
- `pass` &ndash; A simple password store.
- `a gpg keypair` &ndash; Encryption and signing tool. To get this, you need
to run `gpg --full-gen-key` and go through the process.

## Usage
- `mx a <your@email.com>` &ndash; Add an email.
- `mx d` &ndash; Delete an email.
- `mx o` &ndash; Opens neomutt with specified account.
- `mx s` &ndash; Sync mail and downloads them to your mail directory
- `mx l` &ndash; Lists all accounts of mutt-x.
- `mx h` &ndash; Displays this help text.
- If you run `neomutt`, nothing will happen. I deliberately made this script run
that way because I needed dmenu to list out the available accounts first. Use `mx o`
and dmenu will take care of the rest.

## References
- See https://github.com/LukeSmithxyz/mutt-wizard. Much of the ideas of this script
came from mutt-wizard, the original.
- Neomutt's [webpage](https://neomutt.org/). This helped a lot when configuring
the said email client.
