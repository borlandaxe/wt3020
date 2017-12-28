#!/bin/sh	
	echo initializing... &&
	mkdir -p /tmp/script &&
	cp -af stash /tmp && 
	ln -sf /tmp/stash/autossh /tmp/script/ &&
	ln -sf /tmp/stash/transmission-cli /tmp/script/ &&
	ln -sf /tmp/stash/tmux /tmp/script/tmux &&
	ln -sf /tmp/stash/scripts/disable_wifi  /tmp/script/ &&
	ln -sf /tmp/stash/tmux.conf /home/root/.tmux.conf &&
	
	chmod +x /tmp/stash/autossh &&
	chmod +x /tmp/stash/tmux &&
	chmod +x /tmp/stash/transmission-cli &&
	chmod +x /tmp/stash/scripts/disable_wifi &&

	chmod 600 /tmp/stash/keys/id_dropbear &&
	ln -sf /tmp/stash/keys/id_dropbear $HOME/.ssh && 
	ln -sf /tmp/stash/known_hosts $HOME/.ssh && 

	route del default &&
	route add default gw 192.168.7.1 &&

	if [ ! "alive" = "$(ps | grep autossh | awk '{if($5=="autossh"){print "alive";}}')" ];then
	AUTOSSH_POLL=120 autossh -o ServerAliveInterval=60 -p22 -M6665 -NCfR 6666:127.0.0.1:22 develop@23.110.64.166
	else
		echo "autossh alreay there."
	fi
	
	leds_front off
