#!/bin/bash -ex

# Test first manually specifying a branch
git init test_this_branch
cd test_this_branch
../setup.sh
if [ $(egrep -r (my_module|MyModule) * .circleci .gitignore) ]
then
  exit 1
fi
cd ..

# Now test using this code to fetch the last tag
git init test_last_tag
cd test_last_tag
../setup.sh
if [ $(egrep -r (my_module|MyModule) * .circleci .gitignore) ]
then
  exit 1
fi
