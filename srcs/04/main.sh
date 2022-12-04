#!/bin/bash

. ./config.conf
# configuration file

. ./additional_functions.sh
# function print_error_mess
# function print_help_info
# function check_valid_input_args
# define_color
# function print_system_info

ARGS="$column1_background "
ARGS+="$column1_font_color "
ARGS+="$column2_background "
ARGS+=$column2_font_color

echo $ARGS

check_valid_input_args $ARGS

# TIME_ZONE=$( timedatectl | grep "Time zone" | cut -d ":" -f 2 | cut -c 2- )
# USER=$( whoami )
# OS=$( hostnamectl | grep "Operating System" | cut -d ":" -f 2 | cut -c 2- )
# DATA=$( date +"%d %B %Y %T" )
# UPTIME=$( uptime -p )
# UPTIME_SEC=$( awk '{print $1}' /proc/uptime )
# IP=$( hostname -I | awk '{print $1}' )
# MASK=$( netstat -ei | grep $IP | awk '{print $4}' )
# GATEWAY=$( ip route | grep default | awk '{print $3}' )
# RAM_TOTAL=$( free -m | grep Mem | awk '{printf "%.3f", ($2/1024)}' )
# RAM_USED=$( free -m | grep Mem | awk '{printf "%.3f", ($3/1024)}' )
# RAM_FREE=$( free -m | grep Mem | awk '{printf "%.3f", ($4/1024)}' )
# SPACE_ROOT=$( df | grep "/$" | awk '{printf "%.2f", ($2/1024)}' )
# SPACE_ROOT_USED=$( df | grep "/$" | awk '{printf "%.2f", ($3/1024)}' )
# SPACE_ROOT_FREE=$( df | grep "/$" | awk '{printf "%.2f", ($4/1024)}' )

# print_system_info $@
