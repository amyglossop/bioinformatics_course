#!/usr/bin/env bash
# make empty directories in your git repo
mkdir -p analysis docs data

# add a README.md to each directory
for my_directory in scripts analysis docs data;do
  touch ${my_directory}/README.md
  echo “# ${my_directory}” >> ${my_directory}/README.md
done
chmod +x my-script.sh
git add .
git commit -m "not tested: updated script to make empty dirs and README.md"
git push
