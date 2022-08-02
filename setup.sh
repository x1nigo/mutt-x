#! /bin/sh

# NOTE: This script is only for GMAIL accounts...for now.
# Make sure to run this script as regular user and NOT as root.

# Variables

muttdir="$HOME/.config/mutt/"

## Functions

error {
	printf "%s\n" "$1"
	exit
}

entermail {
	printf "Enter your email address:\n"
	read email

	if [ -z $email ]; then
		printf "You did not enter anything.\n"
		exit
	fi
}

setuppass {
	printf "Enter your gpg ID:\n"
	read gpgid

	pass init $gpgid
	pass add $email
}

maildir {
	mkdir -p $HOME/.mail/gmail/
}

muttinstall {
	printf "Setting up muttrc file...\n"
	sleep 1

	echo "set imap_user = \"$email\"
set smtp_pass = "`pass show $email`"
set folder = \"~/.mail/gmail/\"
set smtp_url = \"smtp://$email@smtp.gmail.com:587/\"
set from = \"$email\"

set spoolfile = \"+Inbox\"
set record = \"+Sent\"
unset record
set trash = \"+Trash\"
set postponed = \"+[Gmail]/Drafts\"

mailboxes =Inbox =\"[Gmail]/Sent Mail\" =[Gmail]/Important =[Gmail]/Starred =[Gmail]/Drafts =[Gmail]/Spam =Trash

source x1nigo.mutt

set sidebar_visible=yes
set sidebar_format="%B%?F? [%F]?%* %?N?%N/?%S"
set sidebar_width=25
set sidebar_short_path=yes
set sidebar_delim_chars='/.'
set mail_check_stats
set editor=vim

bind index,pager \Ck sidebar-prev
bind index,pager \Cj sidebar-next
bind index,pager \Co sidebar-open
bind index,pager \Cb sidebar-toggle-visible
bind index,pager   h exit
bind index         l display-message" > muttrc
}

isyncinstall {
	printf "Setting up mbsyncrc file...\n"
	sleep 1

	echo "IMAPAccount gmail
Host imap.gmail.com
User $email
PassCmd "pass show $email"
SSLType IMAPS
CertificateFile /etc/ssl/certs/ca-certificates.crt

IMAPStore gmail-remote
Account gmail

MaildirStore gmail-local
SubFolders Verbatim
Path ~/.mail/gmail/
Inbox ~/.mail/gmail/Inbox

Channel gmail
Far :gmail-remote:
Near :gmail-local:
Patterns *
Create Both
Expunge Both
SyncState *" > .mbsyncrc
}

arrangestuff {
	sudo cp mx /usr/bin/ &&

	mkdir $HOME/.config/mutt
	cp muttrc $muttdir && cp colors.mutt $muttdir &&
	cp .mbsyncrc $HOME/
}

## Main Function

# Enter your email
entermail || error "A problem occurred with your email."

# Set up your password
setuppass || error "Failed to set up your password."

# Set up the mail directory
maildir || error "Could not create mail directory."

# Setting up of muttrc file
muttinstall || error "Failed to set up the muttrc file."

# Setting up of mbsyncrc file
isyncinstall || error "Could not set up the mbsyncrc file."

# Move files to their respective locations
arrangestuff || error "An error occurred in moving respective files."

# Closing message
printf "============================================================================\n"
printf "Congratulations! You have successfully set up a terminal-based email client.\n"
printf "============================================================================\n"
printf "\n"
printf "Some commands you should know:\n"
printf "------------------------------\n"
printf "Syntax => \`mx\` to bring up mutt-x1nigo"
printf "          \`mx -s\` to sync mail and store on your machine"
printf "          can also be \`--sync\` instead of -s"
printf "------------------------------\n"
printf "\n"
printf "Have fun!"
printf "\n"
