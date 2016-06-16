#!/bin/bash
name=`iwconfig wlp4s0 | grep ESSID | awk '{print $4" "$5}' | cut -d '"' -f 2`
if [ $name == "off/any" ]
then
	echo -e "  OFF"
else
	echo -e "  " $name
fi
