#!/usr/bin/env bash
if [ -n "$(pgrep -x cmus)" ]; then
	cmus-remote --pause
elif [ -n "$(pgrep -x spotify)" ]; then
	spotifycli --pause
fi
