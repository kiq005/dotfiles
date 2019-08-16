#!/bin/bash
# Get the current playing music
ART=""
MUS=""
if [ ! -z "$(pgrep -x cmus)" ]; then
	ART=`cmus-remote -C status | grep "tag artist" | sed -e "s/^\w*\ *\w*\ *//"`
	MUS=`cmus-remote -C status | grep "tag title" | sed -e "s/^\w*\ *\w*\ *//"`
elif [ ! -z "$(pgrep -x spotify)" ]; then
	ART=`spotifycli --artist`
	MUS=`spotifycli --song`
fi


echo "($ART) - $MUS"

