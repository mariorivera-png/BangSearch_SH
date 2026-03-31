#!/bin/zsh

bng="$1"
nm="$2"
lnk="$3"
fllr="$4"
cat1="$5"
cat2="$6"

touch "bangs/$nm.json"

echo "{\"$bng\": {\"bang\": \"$bng\", \"name\": \"$nm\", \"link\": \"$lnk\", \"filler\": \"$fllr\", \"category\": [\"$cat1\", \"$cat2\"]}}" >bangs/$nm.json
