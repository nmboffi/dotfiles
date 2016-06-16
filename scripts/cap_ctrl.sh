#!/usr/bin/bash

xmodmap -e "clear lock" 
xmodmap -e "keycode 66 = Control_L"
xmodmap -e "add Control = Control_L"
