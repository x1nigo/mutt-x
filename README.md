# Mutt-X
A script meant to set up an email client with neomutt. When entering your password for your email 
(after runing `mx a <your@email.com>`), make sure that you know whether or not such email requires
an `app password` for third-party applications. Gmail, for example, requires this.

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

## Get started
```
git clone https://github.com/x1nigo/mutt-x
cd mutt-x
make install
```

## Usage
- `mx a <your@email.com>` &ndash; Add an email.
- `mx d` &ndash; Delete an account (and their mail).
- `mx o` &ndash; Opens neomutt with specified account.
- `mx s` &ndash; Sync mail and downloads them to your mail directory.
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
