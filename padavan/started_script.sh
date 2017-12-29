plot=$(df | grep sda1 | awk '{print $6}')
/bin/rm -rf /etc/storage/script
/sbin/leds_front off
/bin/sh $plot/.padavan/load.sh
