sleep 5
killall smbd
smbd -D -s /etc/storage/samba/smb.conf
