### /etc/storage/started_script.sh ###

plot=$(df | grep sda1 | awk '{print $6}')
/bin/rm -rf /etc/storage/script
/sbin/leds_front off
#/bin/sh /etc/storage/samba/restart_samba.sh &
#ifconfig ra0 down
/bin/sh $plot/.padavan/load.sh
