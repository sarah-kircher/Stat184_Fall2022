library(ggplot2)
library(dplyr)
data(diamonds)

# How to get the five-number summary of the carat column?
fivenum(diamonds$carat)

# Approach One
## Benefits -- specify exactly which stats you want to look at, order whichever way you want
## Cons -- separate commands, re-write commands, each output is its own separate entity
min(diamonds$carat, na.rm = TRUE)
quantile(diamonds$carat, probs = 0.25, na.rm = TRUE)
median(diamonds$carat, na.rm = TRUE)
quantile(diamonds$carat, probs = 0.75, na.rm = TRUE)
max(diamonds$carat, na.rm = TRUE)

# Approach Two
## Benefits -- auto five-num sum, easy to use, returns vector with named values, can be used with pipe
## Cons -- you can ONLY get five-num sum, order is pre-determined, wrangling data can be complicated
summary(diamonds$carat)

# Approach Three
diamonds %>%
  group_by(carat) %>%
  summarize(
    min = min(carat, na.rm = TRUE),
    Q1 = quantile(carat, probs = 0.25, na.rm = TRUE),
    med = median(carat, na.rm = TRUE),
    Q3 = quantile(carat, probs = 0.75, na.rm = TRUE),
    max = max(carat, na.rm = TRUE)
  )


