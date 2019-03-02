#!/bin/bash

##########################################
# Iterate over files in a directory
# looking for flac files and
# converting them to mp3 files
# while copying the metadata
##########################################
for f in *.flac; 
  do 
    output=$(echo "$f" | sed -e 's/flac/mp3/g'); 
    ffmpeg -i "$f" -ab 320k -map_metadata 0 -id3v2_version 3 "$output"; 
  done
