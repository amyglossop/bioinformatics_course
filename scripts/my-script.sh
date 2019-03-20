#!/usr/bin/env bash
mkdir -p analysis docs data

for my_directory in scripts analyis docs data;do
  touch ${my_directory}/README.md
  echo "# ${my_directory}" >> ${my_directory}/README.md
done

chmod +x my-script.sh

git add .
git commit -m "not tested: updated script to make empty dirs and readme.md"
git push
