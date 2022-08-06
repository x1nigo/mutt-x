install:
	chmod +x mx
	sudo cp mx /usr/local/bin/
	mkdir -p ~/.config/isync/accounts/
	mkdir -p ~/.config/mutt/accounts/
	mkdir -p ~/.local/share/mail/

uninstall:
	sudo rm /usr/local/bin/mx
	sudo rm -r ~/.config/isync/
	sudo rm -r ~/.config/mutt/
	sudo rm -r ~/.local/share/mail/
