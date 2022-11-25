#!/bin/bash

#TIME_ZONE=$( timedatectl | grep "Time zone" | cut -d ":" -f 2 | cut -c 2- )
#USER=$( whoami )
#OS=$( hostnamectl | grep "Operating System" | cut -d ":" -f 2 | cut -c 2- )
#DATA=$( date +"%d %B %Y %T" )
#UPTIME=$( uptime -p )
#UPTIME_SEC=$( awk '{print $1}' /proc/uptime )
#IP=$( hostname -I | awk '{print $1}' )
#MASK=$( netstat -ei | grep $IP | awk '{print $4}' )
#GATEWAY=$( ip route | grep default | awk '{print $3}' )
#RAM_TOTAL=$( free -m | grep Mem | awk '{printf "%.3f", ($2/1024)}' )
#RAM_USED=$( free -m | grep Mem | awk '{printf "%.3f", ($3/1024)}' )
#RAM_FREE=$( free -m | grep Mem | awk '{printf "%.3f", ($4/1024)}' )
#SPACE_ROOT=$( df | grep "/$" | awk '{printf "%.2f", ($2/1024)}' )
#SPACE_ROOT_USED=$( df | grep "/$" | awk '{printf "%.2f", ($3/1024)}' )
#SPACE_ROOT_FREE=$( df | grep "/$" | awk '{printf "%.2f", ($4/1024)}' )

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
