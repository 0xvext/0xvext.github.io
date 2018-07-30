#!/bin/bash

# Parse list of files in _drafts directory
for FILE in ./_drafts/*; do
	# If filename begins with "20"
	if [[ $FILE =~ ^./_drafts/20.* ]]; then
		# Prompt user re: file
		printf "Is $FILE ready to publish?\n"
		printf "[y/n]: "
		read ANSWER
		# If file is read, move to _posts directory
		if [ $ANSWER == 'y' ]; then
			mv $FILE ./_posts/
		fi
	fi
done
