## Load packages - dplyr, ggplot2, janitor, kableExtra, knitr
## Load data set - diamonds from ggplot2 package
library(dplyr)
library(janitor)
library(ggplot2)
library(kableExtra)
library(knitr)
data(diamonds)

# Creates new diamonds data frame of statistics of price relative to the diamond cut
# Groups the diamonds data set by cut
# Selects the cut and price before calculating stats
# Calculates the count, minimum, first quartile, median, third quantile, maximum, mean
# Adds row and column titles
diamond_price_stats <- diamonds %>%
  group_by(cut) %>%
  select(cut, price) %>%
  summarise(across(c(price), list(
    Minimum = min,
    Q1 = ~quantile(., probs = 0.25),
    Median = median,
    Q3 = ~quantile(., probs = 0.75),
    Maximum = max,
    Mean = mean
  )),
  Count = n()
  ) %>% 
  adorn_title(
    placement = "combined", 
    row_name = "Cut",
    col_name = "Statistics")

# Rounds decimals to two digits past decimal point
rounded_price_stats <- diamond_price_stats %>%
  mutate_if(is.numeric, round, digits = 2)

# Polishing the Table - nicer appearance
rounded_price_stats %>%
  kable(
    caption = "Diamond Price Relative to Diamond Cut Summary Table",
    booktabs = TRUE,
    align = c("l", rep("c", 6))
  ) %>%
  kableExtra::kable_styling(
    bootstrap_options = c("striped", "condensed"),
    font_size = 16
  )

## Table 2 - relative to color of diamond
diamond_price_stats <- diamonds %>%
  group_by(color) %>%
  select(color, price) %>%
  summarise(across(c(price), list(
    Minimum = min,
    Q1 = ~quantile(., probs = 0.25),
    Median = median,
    Q3 = ~quantile(., probs = 0.75),
    Maximum = max,
    Mean = mean
  ))  ) %>% 
  adorn_title(
    placement = "combined", 
    row_name = "Color",
    col_name = "Statistics")

# Rounds decimals to two digits past decimal point
rounded_price_stats <- diamond_price_stats %>%
  mutate_if(is.numeric, round, digits = 2)

# Polishing the Table - nicer appearance
rounded_price_stats %>%
  kable(
    caption = "Diamond Price Relative to Diamond Color Summary Table",
    booktabs = TRUE,
    align = c("l", rep("c", 6))
  ) %>%
  kableExtra::kable_styling(
    bootstrap_options = c("striped", "condensed"),
    font_size = 16
  )
