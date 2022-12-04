#!/bin/bash

WHITE_FONT="\033[37m"
RED_FONT="\033[31m"
GREEN_FONT="\033[32m"
BLUE_FONT="\033[34m"
PURPLE_FONT="\033[35m"
BLACK_FONT="\033[30m"

WHITE_BACKGROUND="\033[47m"
RED_BACKGROUND="\033[41m"
GREEN_BACKGROUND="\033[42m"
BLUE_BACKGROUND="\033[44m"
PURPLE_BACKGROUND="\033[45m"
BLACK_BACKGROUND="\033[40m"

NORMAL="\033[0m"

ERROR_INVALID_NUM_ARGS="invalid number of arguments"
ERROR_INVALID_VALUE_ARGS="invalid value of arguments"
ERROR_INVALID_VALUE_COLOR="value of colors for font and background are the same"

function print_error_mess {
	echo "Error: $@"
}

function print_help_info {
	echo "Enter: 4 arguments, that represent colors."
	echo ""
	echo "First argument is the background of value names (HOSTNAME, TIMEZONE, etc.)"
	echo "Second argument is the font color of value names (HOSTNAME, TIMEZONE, etc.)"
	echo "Third argument is the background color of value (after the '=' sign)"
	echo "Fourth argument is the font color of value (after '=' sign)"
	echo ""
	echo "The font and background colors of the same column must not match."
	echo ""
	echo "Color designations:"
	echo "1 - white"
	echo "2 - red"
	echo "3 - green"
	echo "4 - blue"
	echo "5 - purple"
	echo "6 - black"
}

function check_valid_input_args {
	if [[ $# -ne 4 ]]
	then
		print_error_mess $ERROR_INVALID_NUM_ARGS
		echo ""
		print_help_info
		exit 1
	fi

	for arg in $@
	do
		if ! [[ ${#arg} -eq 1 && $arg =~ [1-6] ]]
		then
			print_error_mess $ERROR_INVALID_VALUE_ARGS
			echo ""
			print_help_info
			exit 1
		fi
	done

	if [[ $1 -eq $2 || $3 -eq $4 ]]
	then
		print_error_mess $ERROR_INVALID_VALUE_COLOR
		echo ""
		print_help_info
		exit 1
	fi
}

function define_color {
	case $1 in
		1) echo 7 ;;
		2) echo 1 ;;
		3) echo 2 ;;
		4) echo 4 ;;
		5) echo 5 ;;
		6) echo 0 ;;
	esac
}

function print_system_info {

	FONT_LEFT="\033[3$( define_color $1 )m"
	BACKGROUND_LEFT="\033[4$( define_color $2 )m"
	FONT_RIGHT="\033[3$( define_color $3 )m"
	BACKGROUND_RIGHT="\033[4$( define_color $4 )m"

	echo -e "${FONT_LEFT}${BACKGROUND_LEFT}TIME_ZONE      ${NORMAL} = ${FONT_RIGHT}${BACKGROUND_RIGHT}$TIME_ZONE${NORMAL}"
	echo -e "${FONT_LEFT}${BACKGROUND_LEFT}USER           ${NORMAL} = ${FONT_RIGHT}${BACKGROUND_RIGHT}$USER${NORMAL}"
	echo -e "${FONT_LEFT}${BACKGROUND_LEFT}OS             ${NORMAL} = ${FONT_RIGHT}${BACKGROUND_RIGHT}$OS${NORMAL}"
	echo -e "${FONT_LEFT}${BACKGROUND_LEFT}DATE           ${NORMAL} = ${FONT_RIGHT}${BACKGROUND_RIGHT}$DATA${NORMAL}"
	echo -e "${FONT_LEFT}${BACKGROUND_LEFT}UPTIME         ${NORMAL} = ${FONT_RIGHT}${BACKGROUND_RIGHT}$UPTIME${NORMAL}"
	echo -e "${FONT_LEFT}${BACKGROUND_LEFT}UPTIME_SEC     ${NORMAL} = ${FONT_RIGHT}${BACKGROUND_RIGHT}$UPTIME_SEC${NORMAL}"
	echo -e "${FONT_LEFT}${BACKGROUND_LEFT}IP             ${NORMAL} = ${FONT_RIGHT}${BACKGROUND_RIGHT}$IP${NORMAL}"
	echo -e "${FONT_LEFT}${BACKGROUND_LEFT}MASK           ${NORMAL} = ${FONT_RIGHT}${BACKGROUND_RIGHT}$MASK${NORMAL}"
	echo -e "${FONT_LEFT}${BACKGROUND_LEFT}GATEWAY        ${NORMAL} = ${FONT_RIGHT}${BACKGROUND_RIGHT}$GATEWAY${NORMAL}"
	echo -e "${FONT_LEFT}${BACKGROUND_LEFT}RAM_TOTAL      ${NORMAL} = ${FONT_RIGHT}${BACKGROUND_RIGHT}$RAM_TOTAL Gb${NORMAL}"
	echo -e "${FONT_LEFT}${BACKGROUND_LEFT}RAM_USED       ${NORMAL} = ${FONT_RIGHT}${BACKGROUND_RIGHT}$RAM_USED Gb${NORMAL}"
	echo -e "${FONT_LEFT}${BACKGROUND_LEFT}RAM_FREE       ${NORMAL} = ${FONT_RIGHT}${BACKGROUND_RIGHT}$RAM_FREE Gb${NORMAL}"
	echo -e "${FONT_LEFT}${BACKGROUND_LEFT}SPACE_ROOT     ${NORMAL} = ${FONT_RIGHT}${BACKGROUND_RIGHT}$SPACE_ROOT Mb${NORMAL}"
	echo -e "${FONT_LEFT}${BACKGROUND_LEFT}SPACE_ROOT_USED${NORMAL} = ${FONT_RIGHT}${BACKGROUND_RIGHT}$SPACE_ROOT_USED Mb${NORMAL}"
	echo -e "${FONT_LEFT}${BACKGROUND_LEFT}SPACE_ROOT_FREE${NORMAL} = ${FONT_RIGHT}${BACKGROUND_RIGHT}$SPACE_ROOT_FREE Mb${NORMAL}"
}
