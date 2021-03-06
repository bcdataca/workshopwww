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
    #echo "start of loop" &&
    #pwd | cat
    # go to that directory
    cd "$f" &&
	#echo "directory:" &&
	#pwd | cat && 
	# run the buildSite script to build the site into e.g. public/2017
	./scripts/buildSite.sh &&
	# move that site from public/2017 to $DIR/2017
	find ./public -name "20*" -maxdepth 1 | xargs -I '{}' mv {} $DIR &&
	# go back up a directory
	cd .. &&
	pwd | cat
done


read -erp "Push workshopwebsite to origin? (y/n): " doPushToRemote

if [[ "$doPushToRemote" == "y" ]]
then
    echo "Pushing to remote..."
    read -erp "Commit Message: " commitMessage
    git add 20* && git commit -m "$commitMessage" && git push origin master
fi


