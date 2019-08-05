#!/bin/bash
# Find the task with greatest priority on taskwarior
MSG=$(task _get $(task next limit:1 +READY | tail -n +4 | head -n 1 | sed 's/^ //' | cut -d ' ' -f1).description)
echo "$MSG"
