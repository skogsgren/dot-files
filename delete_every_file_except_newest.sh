#!/bin/bash

cd "$1"
# find the newest file in the folder
newest_file=$(/bin/ls -t | head -1)
# delete all files in the folder except the newest one
find . ! -name "$newest_file" -type f -exec rm {} +
