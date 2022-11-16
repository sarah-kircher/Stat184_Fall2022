## Load packages - dplyr, ggplot2, janitor, kableExtra, knitr
## Load data set - diamonds from ggplot2 package
library(dplyr)
library(janitor)
library(ggplot2)
library(kableExtra)
library(knitr)
data(diamonds)

# Creates new diamonds data frame of statistics of the length (x) relative to the diamond cut
# Groups the diamonds data set by cut and selects the cut and length (x) before calculating stats
# Calculates the count, minimum, first quintile, second quintile, median, third quintile, fourth quintile, maximum, mean, standard deviation
# Adds row and column titles
diamond_x_stats <- diamonds %>%
  group_by(cut) %>%
  select(cut, x) %>%
  summarise(across(c(x), list(
    Minimum = min,
    Quintile1 = ~quantile(., probs = 0.20),
    Quintile2 = ~quantile(., probs = 0.40),
    Median = median,
    Quintile3 = ~quantile(., probs = 0.60),
    Quintile4 = ~quantile(., probs = 0.80),
    Maximum = max,
    Mean = mean,
    Standard_Deviation = sd
  )),
    Count = n()
  ) %>% 
  adorn_title(
  placement = "combined", 
  row_name = "Cut",
  col_name = "Statistics")

# Rounds decimals to two digits past decimal point
rounded_x_stats <- diamond_x_stats %>%
  mutate_if(is.numeric, round, digits = 2)

##Polishing the Table - nicer appearance
rounded_x_stats %>%
  kable(
    caption = "Diamond Length (x) Relative to Diamond Cut Summary Table",
    booktabs = TRUE,
    align = c("l", rep("c", 6))
  ) %>%
  kableExtra::kable_styling(
    bootstrap_options = c("striped", "condensed"),
    font_size = 16
  )


  


