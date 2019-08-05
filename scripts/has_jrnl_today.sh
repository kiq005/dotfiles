#!/bin/bash
# Tells if have journaled today
# Last optimization reduce time from ~1,1s to 0,56s

if [ $(date +%H) -gt 16 ]; then
	[ -z "$(jrnl -on today)" ] && echo "You have not journaled today"
else
	[ -z "$(jrnl -on yesterday)" ] && echo "You have not journaled yesterday"
fi

