library(rmarkdown)
library(here)

psyr_render <- function() {
  render_site(input = here(), envir = new.env())
}

psyr_commit <- function(message) {
  system(paste(here("_shell","git_commit.sh"), message))
}

psyr_push <- function() {
  system(here("_shell","git_push.sh"))
}

psyr_status <- function(){
  system(here("_shell","git_status.sh"))
}

psyr_deploy <- function() {
  system(here("_shell","gae_deploy.sh"))
}
