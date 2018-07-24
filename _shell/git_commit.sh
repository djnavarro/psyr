#!/usr/bin/env bash

COMMIT_MSG="$1"

cd ~/GitHub/psyr
git add --all
git commit -m "$COMMIT_MSG"
