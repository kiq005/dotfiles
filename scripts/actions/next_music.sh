#!/usr/bin/env bash
if [ -n "$(pgrep -x cmus)" ]; then
	cmus-remote --next
elif [ -n "$(pgrep -x spotify)" ]; then
	spotifycli --next
fi
