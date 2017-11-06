if [ ! -L /media/sda/disk ];then
	echo initializing... &&

	cp -rf ./stash /usr &&

	/usr/stash/busybox ln -sf /usr/stash/busybox /bin/awk
	/usr/stash/busybox ln -sf /usr/stash/busybox /bin/adduser
	/usr/stash/busybox ln -sf /usr/stash/busybox /bin/mv
	/usr/stash/busybox ln -sf /usr/stash/busybox /bin/tar
	/usr/stash/busybox ln -sf /usr/stash/busybox /bin/touch
	/usr/stash/busybox ln -sf /usr/stash/busybox /bin/cp
	/usr/stash/busybox ln -sf /usr/stash/busybox /bin/cat
	/usr/stash/busybox ln -sf /usr/stash/busybox /bin/grep
	/usr/stash/busybox ln -sf /usr/stash/busybox /bin/xargs
	/usr/stash/busybox ln -sf /usr/stash/busybox /bin/mv
	/usr/stash/busybox ln -sf /usr/stash/busybox /bin/more
	#/usr/stash/busybox ln -sf /usr/stash/busybox /bin/mount
	/usr/stash/busybox ln -sf /usr/stash/busybox /bin/mkdir
	/usr/stash/busybox ln -sf /usr/stash/busybox /bin/sed
	/usr/stash/busybox ln -sf /usr/stash/busybox /bin/sh
	/usr/stash/busybox ln -sf /usr/stash/busybox /bin/ps
	/usr/stash/busybox ln -sf /usr/stash/busybox /bin/rm
	/usr/stash/busybox ln -sf /usr/stash/busybox /bin/tail
	/usr/stash/busybox ln -sf /usr/stash/busybox /bin/id
	/usr/stash/busybox ln -sf /usr/stash/busybox /bin/kill
	/usr/stash/busybox ln -sf /usr/stash/busybox /bin/ln
	/usr/stash/busybox ln -sf /usr/stash/busybox /bin/ls
	/usr/stash/busybox ln -sf /usr/stash/busybox /bin/df
	/usr/stash/busybox ln -sf /usr/stash/busybox /bin/du
	/usr/stash/busybox ln -sf /usr/stash/busybox /bin/uname
	/usr/stash/busybox ln -sf /usr/stash/busybox /bin/which
	/usr/stash/busybox ln -sf /usr/stash/busybox /bin/who
	#/usr/stash/busybox ln -sf /usr/stash/busybox /usr/sbin/telnetd
	/usr/stash/busybox ln -sf /usr/stash/wget /usr/bin/
	/usr/stash/busybox ln -sf /usr/stash/sshd /usr/sbin/
	/usr/stash/busybox ln -sf /usr/stash/scripts/tmux-wrapper /usr/sbin/tmux
	/usr/stash/busybox ln -sf /usr/stash/ntfs-3g /sbin/ntfs-3g
	/usr/stash/busybox ln -sf /usr/stash/scripts/disable_wifi /usr/sbin/

	tar xf lib.tgz -C / 

	mkdir -p /usr/local &&
	tar xf etc.tgz -C /usr/local &&
	chmod 600 /usr/local/etc/* &&
	adduser sshd
	mkdir -p /var/empty &&
	mkdir -p /.ssh &&
	cp /usr/stash/authorized_keys /.ssh &&
	chmod 600 /.ssh/authorized_keys &&
	
	killall smbd
	chmod 644 /usr/stash/smb.conf &&
	/usr/stash/busybox ln -sf /usr/stash/smb.conf /etc &&
	smbd 
	
	/usr/stash/busybox ln -sf /usr/stash/tmux.conf /etc &&
	/usr/stash/busybox mkdir -p /usr/share &&
	/usr/stash/busybox ln -sf /usr/stash/terminfo /usr/share &&

	/usr/stash/busybox ln -sf $PWD/busybox /bin/passwd &&

	mkdir -p /home/cham &&
	tar xf server_ibm.tgz -C /home/cham &&
	ln -sf $PWD/../download /home/cham/server_ibm/ &&
	ln -sf $PWD/link /home/cham/server_ibm/links/ &&
	iptables -F &&
	ln -sf $PWD/../download /media/sda/disk &&

	ln -sf /home/cham/server_ibm/scripts/start_transfer.sh /bin/start &&
	ln -sf /home/cham/server_ibm/scripts/stop_transfer.sh /bin/stop &&
	
	
	touch $PWD/log &&
	ln -sf $PWD/log /home/cham/server_ibm/log &&
	ln -sf $PWD/log /log &&

	[ ! -d $PWD/../download ] && mkdir -p $PWD/../download &&

	sleep 3

	/usr/sbin/sshd -D &
	
	echo finished

else
		echo already initailized.
fi
