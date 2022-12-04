#!/bin/bash

function print_system_info {
	echo "TIME_ZONE = $TIME_ZONE"
	echo "USER = $USER"
	echo "OS = $OS"
	echo "DATE = $DATA"
	echo "UPTIME = $UPTIME"
	echo "UPTIME_SEC = $UPTIME_SEC"
	echo "IP = $IP"
	echo "MASK = $MASK"
	echo "GATEWAY = $GATEWAY"
	echo "RAM_TOTAL = $RAM_TOTAL Gb"
	echo "RAM_USED = $RAM_USED Gb"
	echo "RAM_FREE = $RAM_FREE Gb"
	echo "SPACE_ROOT = $SPACE_ROOT Mb"
	echo "SPACE_ROOT_USED = $SPACE_ROOT_USED Mb"
	echo "SPACE_ROOT_FREE = $SPACE_ROOT_FREE Mb"
}
