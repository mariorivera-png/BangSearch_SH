#!/bin/zsh

categ="$1"

rg -l "$categ" $HOME/Scripts/MarioSearch_SH/bangs/. | while IFS= read -r line || [ -n "$line" ]; do
  srch=$(echo "$2" | sed "s/ /$(cat $line | jq -r '.[].filler')/g")
  reslts=$(cat $line | jq -r '.[].link' | sed "s/{search}/$srch/g")
  echo "$reslts"
  open $reslts
done
