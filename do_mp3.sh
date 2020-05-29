#!/bin/bash

##################################################################
# Iterate over files in a directory looking for flac files and
# converting them to mp3 files while copying the metadata
# 5/27/20 - Now supports iterating over subdirectories in the root
##################################################################

echo "Looking for subdirectories..."
for d in *; do
    if [ -d "$d" ]; then
        echo "Looking for flac files in $d"
        for f in "$d"/*.flac; do
            echo "Converting file $f"
            output=$(echo "$f" | sed -e 's/flac/mp3/g');
            ffmpeg -i "$f" -ab 320k -map_metadata 0 -id3v2_version 3 "$output";                              
        done
    fi
done

echo "Looking for flacs in current directory..."
for f in *.flac;
    do
        output=$(echo "$f" | sed -e 's/flac/mp3/g');
        ffmpeg -i "$f" -ab 320k -map_metadata 0 -id3v2_version 3 "$output";                                           
    done

echo "Done."
