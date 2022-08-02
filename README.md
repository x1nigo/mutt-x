# mutt-x1nigo
A script meant to set up an email client with neomutt. As of now, this only works with gmail &ndash; I haven't gotten
around to making this more extensible yet.

By the way, if you are prompted for your gmail password, don't put your actual one &ndash; you need to enable `two-factor
authentication` and get an `app-password`. Use that one for the password prompt. Don't worry, your password will be
encrypted by the end of the script.

## Syntax
```
mx [ OPTION ]
```
## Options
- `-s` or `--sync` &ndash;&ndash; Sync mail and download it to your mail directory for offline use.
- `none` &ndash;&ndash; With no option, `mx` will just open up the mail client.

## Dependencies
- neomutt
- isync
- pass
- a gpg key (and you know your gpg id)

## Get started
```
git clone https://github.com/x1nigo/mutt-x1nigo.git
cd mutt-x1nigo
sh setup.sh
```

## Getting a gpg key
Before doing anything else, make sure that there is a `$XDG_CONFIG_HOME/gnupg/` directory.
```
gpg --full-gen-key
```
Once you've completed the process for generating a gpg key, you can find your gpg id
by using the following command:
```
gpg --fingerprint your@email.com
```
From the output of that command, what you need to look for is this part:
```
pub abc1234 2022-01-01 [SC]
    AB12 23CD EF45 67GH IJ89 AB12 23CD EF45 67GH IJ89
```
Your gpg id is `0x` + the LAST 8 characters of that long list of gibberish. In other words,
your gpd id is going to be `0x67GHIJ89`.
