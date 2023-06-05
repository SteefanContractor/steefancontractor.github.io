#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Remove public directory
cp -r public/.git .git_backup
rm -rf public

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cp -r .git_backup public/.git
cd public

# Checkout the correct branch
git checkout June2023_update

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin June2023_update

# Come Back up to the Project Root
cd ..
