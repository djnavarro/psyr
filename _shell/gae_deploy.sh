#!/usr/bin/env bash

# aliases
alias psyr_home='~/GitHub/psyr'
alias psyr_site='~/GitHub/psyr/_site'
alias gae_home='~/Dropbox/Webpage/ccss'
alias gae_site='~/Dropbox/Webpage/ccss/psyr'

# the google sdk manages the path for gcloud through
# bash profile: need to reload for the script
source ~/.bash_profile

# copy static files from github land to dropbox land
cp -r psyr_site/* gae_site

# deploy (quietly)
cd gae_home
gcloud app deploy --quiet --project=compcogscisydney
