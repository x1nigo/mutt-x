install:
	chmod +x mx
	sudo cp mx /usr/local/bin/
	mkdir -p ~/.config/isync/accounts/
	mkdir -p ~/.config/mutt/accounts/

uninstall:
	sudo rm /usr/local/bin/mx
	sudo rm -r ~/.config/isync/
	sudo rm -r ~/.config/mutt/
