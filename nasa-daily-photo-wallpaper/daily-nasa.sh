#!/bin/bash

# config file to prevent duplicate download
DIR="/home/$(whoami)/.config/dnasa"
FILE="${DIR}/date.txt"

NASA='https://apod.nasa.gov/apod/'
HOMEPAGE="${NASA}astropix.html"

# change it to /tmp if you dont want to keep the picture
SAVE_LOCATION="/home/$(whoami)/Dropbox/Pictures"

# Time Zone
export TZ='EDT'

# initializing
if [ !  -e "$FILE" ]
then 
   mkdir -p "$DIR"
   touch "$FILE"
   echo "$(date -I) 0" > "$FILE"
fi

if [[ "$(awk '{print $1}' "$FILE")" != "$(date -I)" ]]
then
   echo "$(date -I) 0" > "$FILE"
fi

if [[ "$(awk '{print $2}' "$FILE")"  == 0 ]]
then
   # download, find and parse
   ADDR="$(wget -O- $HOMEPAGE | grep '<a href="image' | cut -d\" -f2)"
   wget -P "${SAVE_LOCATION}" "${NASA}${ADDR}"

   # update config file
   echo "$(date -I) 1" > "$FILE"
   
   # IMG is the name of the picture. ADDR is like image/2010/NGC7331eder_1024.jpg
   IMG="$(echo $ADDR | cut -d/ -f3)"

   # setup desktop wallpaper - gnome3 only
   gsettings set org.gnome.desktop.background picture-uri "file://${SAVE_LOCATION}/${IMG}"
fi