#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"


# Build the project

# extended regular expressions like !(.git) to remove all but .git files. 
# shopt -s extglob

# remove old site data
find . -name "20*" -maxdepth 1 -print0 | xargs -0 rm -rd

# get publish directory (i.e., ./public)
DIR=$(pwd)

# find all bcdata-src repositories
find . -name "workshop20*" -print | while read f; do
    # put the script file in the correct subfolder
    cp buildSubsite.sh ./$f/scripts/buildSite.sh
    # go to that directory
    cd "$f" &&
	# run the buildSite script to build the site into e.g. public/2017
	./scripts/buildSite.sh &&
	# move that site from public/2017 to $DIR/2017
	find ./public -name "20*" -maxdepth 1 | xargs -I '{}' mv {} $DIR &&
	# remove the script file
	rm ./scripts/buildSubsite.sh
done


read -erp "Push gh-pages to origin? (y/n): " doPushToRemote

if [[ "$doPushToRemote" == "y" ]]
then
    echo "Pushing to remote..."
    read -erp "Commit Message: " commitMessage
    cd .. && git add 20* && git commit -m "$commitMessage" && git push origin master
fi


