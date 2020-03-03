#!/usr/bin/env sh

set -e

sel=$(hacksaw -f "-i %i -g %g")
now=$(date --rfc-3339=seconds)
filename="$HOME/Pictures/screenshots/$(echo $now | sed "s/ /T/").png"
name=$(shotgun "$filename" $sel $*)

output=$(cat "$filename" | leaves upload)

if type xsel > /dev/null; then
    echo $output | xsel --clipboard
fi

if type toastify > /dev/null; then
    toastify send "🍂 $output"
fi

echo $output
