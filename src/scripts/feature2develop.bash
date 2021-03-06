#!/bin/bash -eu

FILE_PATH=$(greadlink -f ${BASH_SOURCE[0]})
# FILE_PATH=/Users/moon/projects/trickboxes/basic/scripts/setup.bash
FILE_DIR=$(dirname $FILE_PATH)
SCRIPTS_DIR=$FILE_DIR
SRC_DIR=$(dirname $SCRIPTS_DIR)
BASIC_DIR=$(dirname $SRC_DIR)


branch_name=$($SCRIPTS_DIR/git_branch.bash)

git push origin $branch_name
git checkout develop
git merge --no-ff $branch_name
git push origin develop
git checkout $branch_name
