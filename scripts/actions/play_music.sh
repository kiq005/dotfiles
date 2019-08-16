#!/bin/bash
if [ -n "$(pgrep -x cmus)" ]; then
	cmus-remote --play
elif [ -n "$(pgrep -x spotify)" ]; then
	spotifycli --play
fi
