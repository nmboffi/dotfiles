#!/bin/bash

pac=$(checkupdates | wc -l)
#aur=$(cower -u | wc -l)

check=$((pac))
if [[ "$check" != "0" ]]
then
    echo "$pac %{F#25232A}%{F-} $aur"
else
	echo "%{F#25232A}%{F-} No updates!"
fi
