#!/bin/sh
#
# Starts mqtt2mendeleev on ${DEVICE}
#

DEVICE=ttyAMA0

case "$1" in
	start)
		printf "Starting mqtt2mendeleev on ${DEVICE}..."
		start-stop-daemon -q -S -b -m -p /var/run/mqtt2mendeleev_${DEVICE}.pid \
			--exec /usr/bin/mqtt2mendeleev -- /dev/${DEVICE}
		[ $? = 0 ] && echo "OK" || echo "FAIL"
	;;
	stop)
		rm -f /dev/${DUPLICATE}

		printf "Stopping mqtt2mendeleev on ${DEVICE}..."
		start-stop-daemon -q -K -s SIGINT -p /var/run/mqtt2mendeleev_${DEVICE}.pid
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
