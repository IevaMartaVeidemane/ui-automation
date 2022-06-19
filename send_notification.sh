#!/usr/bin/env bash

# Read input variables
COMPONENT=$1
STATUS=$2
LINK=$3

echo $STATUS

# Default message
MESSAGE=""$COMPONENT" failed :no_entry:"
if [ $STATUS = 0 ]; then
    MESSAGE=""$COMPONENT" passed :white_check_mark:"
fi

# remove double qoutes
temp="${LINK%\"}"
temp="${LINK#\"}"
echo "$LINK"

# Send notification
curl -X POST \
  "$LINK" \
  -H 'Cache-Control: no-cache' \
  -H 'Content-Type: application/json' \
  -d '{
	"content":"'"$MESSAGE"'"
}'
