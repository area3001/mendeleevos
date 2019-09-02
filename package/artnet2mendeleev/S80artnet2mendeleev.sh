#!/bin/sh
#
# Starts mqtt2mendeleev
#

HOST=localhost
PORT=1883

# Add /boot to fstab
if [ -e /boot/settings ]; then
	echo "Overriding defaults from /boot/settings"
	. /boot/settings
fi

case "$1" in
	start)
		printf "Starting artnet2mendeleev..."
		start-stop-daemon -q -S -b -m -p /var/run/artnet2mendeleev.pid \
			--exec /usr/bin/artnet2mendeleev -- -h ${HOST}:${PORT}
		[ $? = 0 ] && echo "OK" || echo "FAIL"
	;;
	stop)
		printf "Stopping artnet2mendeleev..."
		start-stop-daemon -q -K -s SIGINT -p /var/run/artnet2mendeleev.pid
		[ $? = 0 ] && echo "OK" || echo "FAIL"
	;;
	restart|reload)
		$0 stop
		$0 start
	;;
	*)
		echo "Usage: $0 {start|stop|restart}"
		exit 1
esac

exit $?
