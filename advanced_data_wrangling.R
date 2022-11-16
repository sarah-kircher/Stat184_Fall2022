library(dplyr)
library(ggplot2)
data(diamonds)

# Updated diamonds data frame - x,y,z relative to cut
# Calculates the count, min, Q1, median, Q3, max, mad, mean, and sd for each dimension x,y,z relative to cut
# Make sure that the group_by attribute is included in the select() function
# Include ~ if bringing in extra arguments -- use as a safety function
# Put count outside of the across - for one column rather than 3 (one for each attribute)
updated_diamonds <- diamonds %>%
  group_by(cut) %>%
  select(cut, x, y, z) %>%
  summarise(across(c(x,y,z), list(
  min = min,
  Q1 = ~quantile(., probs = 0.25),
  median = median,
  Q3 = ~quantile(., probs = 0.75),
  max = max,
  mad = mad,
  mean = mean,
  sd = sd
)),
count = n()
)


