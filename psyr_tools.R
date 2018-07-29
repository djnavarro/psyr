library(rmarkdown)
library(here)

# render the site in a new environment: handy to make sure 
# that nothing in the RMD files is evaluating in .GlobalEnv
psyr_render <- function() {
  render_site(input = here(), envir = new.env())
}

# git commit from R console
psyr_commit <- function(message) {
  message <- paste0('"',message,'"')
  cmd <- paste(here("_shell","git_commit.sh"), message)
  system(cmd)
}

# git log from R console
psyr_log <- function() {
  system(here("_shell","git_log.sh"))
}

# git push from R console
psyr_push <- function() {
  system(here("_shell","git_push.sh"))
}

# git status from R console
psyr_status <- function(){
  system(here("_shell","git_status.sh"))
}

# copy to local GAE and deploy
psyr_deploy <- function() {
  system(here("_shell","gae_deploy.sh"))
}
