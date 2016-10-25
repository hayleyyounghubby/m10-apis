### Exercise 3 ###
library(jsonlite)
library(dplyr)
# Use the `load` function to load in the nelly_tracks file.  That should make the data.frame
# `top_nelly` available to you
load('nelly_tracks.Rdata')
View(top.nelly)

# Use the `flatten` function to flatten the data.frame -- note what differs!
flat.top.nelly <- flatten(top.nelly)
View(flat.top.nelly)

# Use your `dplyr` functions to get the number of the songs that appear on each albumt
colnames(flat.top.nelly)

num.songs <- flat.top.nelly %>%
  group_by(album.name) %>%
  summarise(n = n()) %>%
  arrange(-n)

# album.name     n
# <chr> <int>
#   1 Nellyville (Explicit Version)     3
# 2               Country Grammar     2
# 3                     Sweatsuit     2
# 4                           5.0     1
# 5               Die a Happy Man     1
# 6       The Fix (feat. Jeremih)     1

# Bonus: perform both of the steps above in one line (one statement)




