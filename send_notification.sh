#!/usr/bin/env bash

# Read input variables
COMPONENT=$1
STATUS=$2
LINK=https://discord.com/api/webhooks/988117458915295252/A1kEyUiRsoXL-0BfZnblq8jQB7rV5l7i3sYCu4auDE58ajN0rZ-MW8VtZ8uBeFbkoqO_

echo $STATUS

# Default message
MESSAGE=""$COMPONENT" failed :no_entry:"
if [ $STATUS == 0 ]; then
    MESSAGE=""$COMPONENT" passed :white_check_mark:"
fi

# Send notification
curl -X POST \
  "$LINK" \
  -H 'Cache-Control: no-cache' \
  -H 'Content-Type: application/json' \
  -d '{
	"content":"'"$MESSAGE"'"
}'
