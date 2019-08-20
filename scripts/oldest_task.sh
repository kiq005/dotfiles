#!/usr/bin/env bash
TASK_ID=$(task oldest limit:1 | tail -n +4 | head -n 1 | sed 's/^ //' | cut -d ' ' -f1)
TASK_DATE=$(task _get "$TASK_ID".entry)
echo "$TASK_DATE"
