#!/usr/bin/env bash
if [ -n "$(pgrep -x cmus)" ]; then
	cmus-remote --prev
elif [ -n "$(pgrep -x spotify)" ]; then
	spotifycli --prev
fi
