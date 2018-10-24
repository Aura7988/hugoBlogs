#!/usr/local/bin/bash

echo -e "\033[0;31mCommitting updates to GitHub...\033[0m"

git add -A . && git commit -m "$1" && git push
