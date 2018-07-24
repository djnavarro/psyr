#!/usr/bin/env bash

COMMIT_MSG="$1"

# aliases
alias psyr_home='~/GitHub/psyr'
alias psyr_site='~/GitHub/psyr/_site'
alias gae_home='~/Dropbox/Webpage/ccss'
alias gae_site='~/Dropbox/Webpage/ccss/psyr'

# the script
cd psyr_home
git add --all
git commit -m "$COMMIT_MSG"
