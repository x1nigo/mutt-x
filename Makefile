install:
	chmod +x mx
	sudo cp mx /usr/local/bin/
	mkdir -p ~/.config/mbsync/accounts/
	mkdir -p ~/.config/mutt/accounts/
	mkdir -p ~/.local/share/mail/

uninstall:
	sudo rm /usr/local/bin/mx
	sudo rm -r ~/.config/mbsync/
	sudo rm -r ~/.config/mutt/
	sudo rm -r ~/.local/share/mail/
