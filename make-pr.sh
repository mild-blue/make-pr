#!/bin/bash
set -e

helpFunction()
{
   echo ""
   echo "Usage: $0 -i issue"
   echo -e "\t-a Issue nubmer from github"
   exit 1 # Exit script after printing help
}

while getopts "i:" opt
do
   case "$opt" in
      i ) issue="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

# Print helpFunction in case parameters are empty
if [ -z "$issue" ]
then
   echo "Some or all of the parameters are empty";
   helpFunction
fi

issue_title=$(gh issue view "$issue" | sed -n 1p| sed "s/title:\t//g"  )

if [ -z "$issue_title" ];
then
    echo "Issue $issue not found"
    exit 1
fi


issue_title_cleaned=$(echo "$issue_title" | sed "s/ /_/g" | tr '[:upper:]' '[:lower:]')

branch_name="$issue"_"$issue_title_cleaned"

git checkout -b "$branch_name"
git commit --allow-empty -m "make pull request"
git push -u origin "$branch_name"

gh pr create --title "$issue_title" --body "Closes #$issue"