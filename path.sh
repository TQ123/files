#!/bin/sh
FILE_PATH="/data/local/tmp/output/002cb750.dat"
OLD_TEXT="SM-S911U|SM-S911U1|SM-S911W"
NEW_TEXT="$1"

# Replace underscores (_) with spaces ( ) in NEW_TEXT
NEW_TEXT=$(echo "$NEW_TEXT" | sed 's/_/ /g')

# Use double quotes around variables to handle spaces and special characters
sed -i "s/$OLD_TEXT/$(echo "$NEW_TEXT" | sed 's/[\/&]/\\&/g')/g" "$FILE_PATH"

export LD_LIBRARY_PATH=/data/local/tmp/lib && /data/local/tmp/./offzip -a -r /data/local/tmp/game_patch_3.7.0.19742.pak /data/local/tmp/output/
