install:
	chmod +x mx
	sudo cp mx /usr/bin/
	mkdir -p ~/.config/isync/accounts/
	mkdir -p ~/.config/mutt/accounts/

uninstall:
	sudo rm /usr/bin/mx
	sudo rm -r ~/.config/isync/
	sudo rm -r ~/.config/mutt/
