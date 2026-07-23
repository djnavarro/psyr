# Shell scripts

The shell scripts are simple, but they handle the few parts of the project that are idiosyncratic to Danielle's machine. In principle `psyr` should be completely portable, so the R source code is location and platform agnostic (it uses the `.here` file to set project root)

Inevitably there's that one final step in deployment where my local copy of the  `psyr` static site needs to be mirrored as a subdirectory within the local copy of the lab website. So somewhere there needs to be one script that actually knows where these two things sit on my local machine. That's this bit!

- `git_status.sh`, `git_push.sh` and `git_commit.sh` are trivial: they're just wrappers to the relevant git commands. The only reason they exist is so that I can call them from R using `system()`. 
- `gae_deploy.sh` is the one that matters: it reads my bash profile so that the script knows where to find `gcloud`; copies the static site from "git-land" to "dropbox-land"; then deploys. This is convenient because the `psyr` source should be clonable on github, but the deployed project lives as a subdirectory within the lab webpage (in dropbox-land)