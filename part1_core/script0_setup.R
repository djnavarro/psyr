# This script is NOT something you need to understand yet. 
# You're going to be asked to "source" this script, purely
# as a mechanism to get us started in the class.



# ------ everything here is stuff you can ignore for now ------

# installations from CRAN
install.packages("tidyverse")
install.packages("devtools")
install.packages("usethis")
install.packages("janitor")
install.packages("BayesFactor")
install.packages("cowplot")
install.packages("broom")
install.packages("gapminder")
install.packages("gganimate")
install.packages("haven")
install.packages("knitr")
install.packages("leaflet")

# installation from GitHub
devtools::install_github("djnavarro/TurtleGraphics")




# ------- the stuff from here is "slightly interesting" ------

# Okay, so some preliminaries. The file you have open here is a "script"
# and we'll talk more about them later. Here are a few things to note:
#
# 1. An R script is just a text file, and it ends with a .R file
#    extension. 
#
# 2. The main purpose of a script is to store a sequence of 
#    "commands", which are instructions to R that tell it what to do
# 
# 3. Any line that starts with a # is a "comment" and its main
#    purpose is to help out the humans! Your computer will ignore it
#    when it actually "executes" the script.
#
# 4. To make the script work, click on the "source" button in RStudio
#    (just above the top of this text!). 
#
# 5. When you click source, you'll see some output thate appears in 
#    two places: the "console" (below) and in the "plots" panel (on
#    the right)
#
# 6. You may see some warning messages. That happens a lot - if you 
#    do, don't be too worried. That's pretty normal because R is 
#    usually very cautious, and it's giving you lots of info about
#    all that installation stuff above. Ignore it unless it says
#    "error", and if it does ask Danielle or Garston for help!
#
# 7. The "code" below is going to do a very simple data analysis...

# packages
library(tidyverse)
library(gapminder)

# do some data manipulation and print to screen
gapminder %>% 
  filter(country == "Australia") %>%
  print()

# make a pretty picture 
pic <- gapminder %>% 
  filter(continent == "Europe") %>%
  ggplot(aes(x = year, y = lifeExp)) +
  geom_line() + 
  geom_point() + 
  facet_wrap(~country)

# plot the picture
plot(pic)


# Some notes:
# 
# 1. Try to make sense of the table that has been printed to the console
# 2. Look at the graph. Think a bit about whether it could be improved.
# 3. Make an attempt to work out what the commands above (the "code") are
#    doing. Don't worry if you can't figure it out yet!







