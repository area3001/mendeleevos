#!/bin/sh
#
# Enables RS485 mode on ttyO5
#

case "$1" in
	start)
		printf "Enabling RS485 on ttyO5..."
		/usr/bin/uart-enable-rs485
		[ $? = 0 ] && echo "OK" || echo "FAIL"
	;;
	*)
		echo "Usage: $0 {start}"
		exit 1
esac

exit $?
