#! /bin/sh

# NOTE: This script is only for GMAIL accounts...for now.
# Make sure to run this script as regular user and NOT as root.

# Variables

muttdir="$HOME/.config/mutt/"

## Functions

error() {
	printf "%s\n" "$1"
	exit
}

entermail() {
	printf "Enter your email address:\n"
	read email

	if [ -z $email ]; then
		printf "You did not enter anything.\n"
		exit
	fi
}

setuppass() {
	pass init $email
	pass add $email
}

maildir() {
	mkdir -p $HOME/.mail/gmail/
}

muttinstall() {
	printf "Setting up muttrc file...\n"
	sleep 1

	echo "set imap_user = \"$email\"
set smtp_pass = \"\`pass show $email\`\"
set folder = \"~/.mail/gmail/\"
set smtp_url = \"smtp://$email@smtp.gmail.com:587/\"
set from = \"$email\"

set spoolfile = \"+Inbox\"
set record = \"+Sent\"
unset record
set trash = \"+Trash\"
set postponed = \"+[Gmail]/Drafts\"

mailboxes =Inbox =\"[Gmail]/Sent Mail\" =[Gmail]/Important =[Gmail]/Starred =[Gmail]/Drafts =[Gmail]/Spam =Trash

set sidebar_visible=yes
set sidebar_format=\"%B%?F? [%F]?%* %?N?%N/?%S\"
set sidebar_width=20
set sidebar_short_path=yes
set sidebar_delim_chars='/.'
set mail_check_stats
set editor=vim
set index_format = \"%4C %Z %{!%d %b %Y} %-20.20Fp %s %c\"

set sort = reverse-date-received

bind index,pager \Ck sidebar-prev
bind index,pager \Cj sidebar-next
bind index,pager \Co sidebar-open
bind index,pager \Cb sidebar-toggle-visible
bind index,pager,attach h exit
bind index l display-message
bind pager l view-attachments
bind attach l view-attach

## Basics
color normal white default
color indicator brightblack white
color tree yellow default
color status brightwhite black
color error red default
color message color253 default
color signature brightred default
color attachment cyan default
color search color100 default
color tilde color130 default
color markers color138 default
color hdrdefault brightblue default

color quoted red default
color quoted1 red default
color quoted2 red default
color quoted3 red default
color quoted4 red default
color quoted5 red default
color quoted6 red default
color quoted7 red default
color quoted8 red default
color quoted9 red default

## Index
color index brightdefault black '(~N|~O)'
color index_author brightred default '.*'
color index_date brightyellow default
color index_number brightblue default
color index_subject brightblue default '.*'
color index_size brightcyan default
color index_flags brightcyan default '.*'

## Pager
color header brightblue default '^date:'
color header brightblue default '^(to|cc|bcc):'
color header brightblue default '^from:'
color header brightblue default '^subject:'
color header brightblue default '^user-agent:'
color header brightblue default '^reply-to:'
color header brightblue default '^x-mailer:'
color body white default '.*'
color body brightred default '((fttp|http|https)://|news:)[^ >)\"\t]+'

## Sidebar
color sidebar_divider black black
color sidebar_highlight brightwhite black
color sidebar_indicator brightblack white
color sidebar_new brightgreen default
color sidebar_ordinary white default
color sidebar_unread brightcyan default" > muttrc
}

isyncinstall() {
	printf "Setting up mbsyncrc file...\n"
	sleep 1

	echo "IMAPAccount gmail
Host imap.gmail.com
User $email
PassCmd \"pass show $email\"
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

arrangestuff() {
	mkdir $muttdir &&
	cp muttrc $muttdir &&
	cp .mbsyncrc $HOME/
}

getpermission() {
	chmod 700 $HOME/.config/gnupg/*
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

# Set proper permissions to GnuPG
getpermission || error "Error setting up permissions for gnupg directory."

# Closing message
printf "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - \n"
printf "Congratulations! You have successfully set up a terminal-based email client.\n"
printf "Make sure to run mx -s first before launching the client so you actually\n"
printf "have some mail to browse through!\n"
printf "— x1nigo\n"
printf "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - \n"
