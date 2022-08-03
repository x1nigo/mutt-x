# Neo
A script meant to set up an email client with neomutt. As of now, this only works with gmail &ndash; I haven't gotten
around to making this more extensible yet.

By the way, if you are prompted for your gmail password, don't put your actual one &ndash; you need to enable `two-factor
authentication` and get an `app-password`. Use that one for the password prompt and it will be encrypted by the end of
the script.

## Syntax
```
neo [ OPTION ]
```
## Options
- `-s` or `--sync` &ndash;&ndash; Sync mail and download it to your mail directory for offline use.
- `none` &ndash;&ndash; With no option, `neo` will just open up the mail client.

## Dependencies
- neomutt
- isync
- pass
- a gpg key

## Get started
```
git clone https://github.com/x1nigo/neo.git
cd neo
sh setup.sh
```

## Getting a gpg key
Make sure that there is a `$HOME/.config/gnupg/` directory. Otherwise, there's going to be an error.
```
gpg --full-gen-key
```
