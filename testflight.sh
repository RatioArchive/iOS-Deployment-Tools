#!/bin/sh
if [ $# -ne 7 ]
then
  echo "This script requires 7 arguments to function:"
  echo "1: The ipa file to upload"
  echo "2: The zipped dSYM file to upload"
  echo "3: Your testflight API token"
  echo "4: Your team token"
  echo "5: A build note"
  echo "6: Notify testers: True/False"
  echo "7: Comma delimited list of distribution lists"
  exit
fi
curl http://testflightapp.com/api/builds.json \
  -F file="@$1" \
  -F dsym="@$2" \
  -F api_token="$3" \
  -F team_token="$4" \
  -F notes="$5" \
  -F notify="$6" \
  -F distribution_lists="$7"

