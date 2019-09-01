#!/usr/bin/env bash
# Find the task with greatest priority on taskwarior
TASK="$(task next limit:1 +READY '(+DUE or -SCHEDULED)' \
	| tail -n +4 \
	| head -n 1 \
	| sed 's/^ //' \
	| cut -d ' ' -f1 )"
MSG="$(task _get "$TASK".description)"
echo "$MSG"
