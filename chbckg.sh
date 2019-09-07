#!/bin/bash

# Change this according to the wallpaper directory
search_dir=~/Pictures/Wallpapers

clear
echo "----- WALLPAPER SETTING SCRIPT -----"
echo -e "Enter 0 (zero) to exit	\n"

PS3='Select the wallpaper that you want to set: '
list=''
#count=0	#number of items can also be found with this

# Parsing the image names only from the directory
for entry in "$search_dir"/*
do
	list+=$(echo "$entry" | awk -F "/" '{print $6}' )
	list+=' '
	#((count++))
done

# Listing the items and asking for input
select img in $list
do
	set -- $list		#split the list
	if [ $REPLY -gt $# ]	#check if the entry is correct
	then
		echo "	Please enter between 1-$#"
		echo "	To quit, enter 0"
	elif [ $REPLY -eq 0 ]	#check if the user wants to quit
	then
		echo "	Quitting........."
		break
	else			#do as follows in case of a valid statement
		echo "	Wallpaper is set as $img "
		gsettings set org.gnome.desktop.background picture-uri "$search_dir"/"$img"
		echo "	Bye........"
		break
	fi
done


