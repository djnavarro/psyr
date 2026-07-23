#!/usr/bin/env bash

# the google sdk manages the path for gcloud through
# bash profile: need to reload for the script
source ~/.bash_profile

# copy static files from PSYR site to GAE site
cp -r ~/GitHub/psyr/_site/* ~/Dropbox/Webpage/ccss/psyr

# deploy (quietly) from GAE home
cd ~/Dropbox/Webpage/ccss
gcloud app deploy --quiet --project=compcogscisydney
