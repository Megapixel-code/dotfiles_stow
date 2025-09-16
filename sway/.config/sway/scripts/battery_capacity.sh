#!/bin/bash

battery_name=`upower -e | grep -i "battery"`

if [ -z "$battery_name" ];then
	echo "";
fi

battery_state=`upower -i | grep -i "state:"`	# charging discharging

echo $battery_name
