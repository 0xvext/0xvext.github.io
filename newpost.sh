#!/bin/bash

# Set date format for filename and header
FILEDATE=$(date '+%Y-%m-%d')
HEADERDATE=$(date '+%Y-%m-%d %H:%M:%S')
# Prompt for post title
printf 'Choose a title: '
read TITLE
# Replace spaces with dashes, convert to lower, and strip non-alpha other than dashes.
URLTITLE=$(printf "$TITLE" | sed 's/ /-/g' | sed -e 's/\(.*\)/\L\1/' | sed 's/[^[:alnum:]-]//g')
# Name, create, and initialize draft file
FILEPATH="./_drafts/"
FILENAME="$FILEDATE-$URLTITLE.md"
touch "$FILEPATH$FILENAME"
printf -- "---\n" > "$FILEPATH$FILENAME"
printf "title: '$TITLE'\n" >> "$FILEPATH$FILENAME"
printf "date: '$HEADERDATE'\n" >> "$FILEPATH$FILENAME"
printf "tags: \n" >> "$FILEPATH$FILENAME"
printf -- "---\n\n" >> "$FILEPATH$FILENAME"
cat ./_drafts/YYYY-MM-DD-template.md >> "$FILEPATH$FILENAME"
# Open file for editing
atom "$FILEPATH$FILENAME"
./publish.sh
./gitsync.sh
