#!/bin/sh
#
# Starts mqtt2mendeleev on ${DEVICE}
#

case "$1" in
	start)
		printf "Starting inputevent on..."
		start-stop-daemon -q -S -b -m -p /var/run/inputevent.pid \
			--exec inputevent -- -0 /dev/input/buttons /usr/bin/update.sh
		[ $? = 0 ] && echo "OK" || echo "FAIL"
	;;
	stop)
		printf "Stopping inputevent on..."
		start-stop-daemon -q -K -s SIGINT -p /var/run/inputevent.pid
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
