#!/bin/bash
# Get the current playing music
ART=`cmus-remote -C status | grep "tag artist" | sed -e "s/^\w*\ *\w*\ *//"`
MUS=`cmus-remote -C status | grep "tag title" | sed -e "s/^\w*\ *\w*\ *//"`

echo "($ART) - $MUS"

