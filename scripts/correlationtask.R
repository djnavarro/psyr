
# create an X11 window
X11()

# use base graphics to draw the correlation
drawplot <- function(n) {
  
  # random points & sample correlation
  x <- rnorm(n)
  y <- rnorm(n)
  r <- cor(x,y)
  
  # draw the plot
  plot.new()
  plot.window(xlim=c(-4,4), ylim=c(-4,4))
  lines(x, y, pch=19, type="p")
  
  return(r) # return the correlation
}

# function to return the user keyboard response
response <- function(key) {
  
  # z = negative correlation
  if(key == "z") {
    return(-1)
  }
  
  # / = positive correlation
  if(key == "/") {
    return(1)
  }
  
  # anything else is invalid
  return(NA)
}

# parameters for the experiment
npoints <- 40
ntrials <- 10

# set up data storage
d <- tibble(
  trial = numeric(ntrials),
  corr = numeric(ntrials),
  resp = numeric(ntrials),
  rt = numeric(ntrials))

# loop over trials
for(i in 1:ntrials) {
  
  # start timing
  start <- Sys.time()
  
  # draw plot (and store correlation)
  d$corr[i] <- drawplot(npoints)
  
  # wait for (then record) response
  d$resp[i] <- getGraphicsEvent(
    prompt = "z = NEGATIVE, / = POSITIVE",
    consolePrompt = "",
    onKeybd = response
  )
  
  # record the response time
  d$rt[i] <- as.numeric(Sys.time() - start)
  
}

# close the X11 window
dev.off()

# print the data to console
print(d)
