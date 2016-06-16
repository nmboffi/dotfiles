#!/bin/bash
ac=`acpi -a | awk '{print $3}' | tr -d ,`
status=`acpi -b | awk '{print $3}' | tr -d ,` 
percent=`acpi -b | acpi -b | awk '{print $4}' | cut -d % -f 1`
remaining=`acpi -b | awk '{print $5}'`
if [ $ac == "on-line" ]
then
	echo "   $percent% $remaining remaining";
else
	if [ $percent -lt 20 ]
	then 
		echo "  $percent% $remaining remaining";
	elif [ $percent -lt 40 ]
	then 
		echo "  $percent% $remaining remaining";
	elif [ $percent -lt 60 ]
	then
		echo "  $percent% $remaining remaining";
	elif [ $percent -lt 80 ]
	then
		echo "  $percent% $remaining remaining";
	else
		echo "  $percent% $remaining remaining";
        fi 
fi

