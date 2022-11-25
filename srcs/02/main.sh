#!/bin/bash

. ./system_info.sh

TIME_ZONE=$( timedatectl | grep "Time zone" | cut -d ":" -f 2 | cut -c 2- )
USER=$( whoami )
OS=$( hostnamectl | grep "Operating System" | cut -d ":" -f 2 | cut -c 2- )
DATA=$( date +"%d %B %Y %T" )
UPTIME=$( uptime -p )
UPTIME_SEC=$( awk '{print $1}' /proc/uptime )
IP=$( hostname -I | awk '{print $1}' )
MASK=$( netstat -ei | grep $IP | awk '{print $4}' )
GATEWAY=$( ip route | grep default | awk '{print $3}' )
RAM_TOTAL=$( free -m | grep Mem | awk '{printf "%.3f", ($2/1024)}' )
RAM_USED=$( free -m | grep Mem | awk '{printf "%.3f", ($3/1024)}' )
RAM_FREE=$( free -m | grep Mem | awk '{printf "%.3f", ($4/1024)}' )
SPACE_ROOT=$( df | grep "/$" | awk '{printf "%.2f", ($2/1024)}' )
SPACE_ROOT_USED=$( df | grep "/$" | awk '{printf "%.2f", ($3/1024)}' )
SPACE_ROOT_FREE=$( df | grep "/$" | awk '{printf "%.2f", ($4/1024)}' )

print_system_info

echo ""
echo "Do you want to save system infomation to a file?"
echo -n "Enter Y/y to confirm: "
read ANSWER

if [[ $ANSWER == "Y" || $ANSWER == "y" ]]
then
	FILENAME=$( date +"%d_%m_%y_%H_%M_%S.status" )
	print_system_info > $FILENAME
fi

