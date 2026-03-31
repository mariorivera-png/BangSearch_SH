#!/bin/zsh

#bang="$1"

# srch="$2"

# result=$(cat bangs/* | jq -r --arg bang "$bang" 'select(.bang == $bang) | .link')
# fllr=$(cat bangs/* | jq -r --arg bang "$bang" 'select(.bang == $bang) | .filler')
# 
# if [ -n "$result" ]; then
#   echo "Success"
# else 
#   echo "None Found"
#   exit 1
# fi
# 
# lnk=$( echo "$result" | sed "s/{search}/$srch/g")
# 
# filled=$( echo "$lnk" | sed "s/ /$fllr/g" )
# echo $srch
# echo $filled
# open "$filled"

#object=$(cat bangs/* | jq ".$1")
#echo $object

# lnk=$( $object | jq '.link')

fllr=$(cat bangs/* | jq -r ".$1.filler" | sed 's/null//g' | tr -d '\n' | xargs)
echo "$fllr"
term="$2"
srch=$(echo "$term" | sed "s~ ~$fllr~")
echo "$srch"
lnk=$(cat bangs/* | jq -r ".$1.link" | sed 's/null//g' | sed "s~{search}~$srch~g")
echo "$lnk"
