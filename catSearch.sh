#!/bin/zsh

#fllr=$(cat bangs/* | jq -r ".$1.filler" | sed "s/null//g")
#echo $fllr
#term="$2"
#srch=$(echo $term | sed "s/ /$fllr/g")
#echo $srch
#lnk=$(cat bangs/* | jq -r ".$1.link" | sed "s/null//g" | sed "s/{search}/$srch/g")
#echo $lnk

categ="$1"

rg -l "$categ" . | while IFS= read -r line || [ -n "$line" ]; do
srch=$(echo "$2" | sed "s/ /$(cat $line | jq -r '.[].filler')/g")
reslts=$(cat $line | jq -r '.[].link' | sed "s/{search}/$srch/g")
open $reslts
done
