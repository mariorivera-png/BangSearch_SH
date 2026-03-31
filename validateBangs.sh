#!/bin/zsh

bang="$1"

srch="$2"

result=$(cat bangs/* | jq -r --arg bang "$bang" 'select(.bang == $bang) | .link')
fllr=$(cat bangs/* | jq -r --arg bang "$bang" 'select(.bang == $bang) | .filler')

if [ -n "$result" ]; then
  echo $srch
else 
  echo "None Found"
  exit 1
fi

lnk=$( echo "$result" | sed "s/{search}/$srch/g")

filled=$( echo "$lnk" | sed "s/ /$fllr/g" )
echo $filled
open "$filled"

