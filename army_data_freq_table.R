# Load needed packages -- dplyr and janitor
library(dplyr)
library(janitor)
library(knitr)
library(kableExtra)

# Read in army data using provided URL
library(readr)
rawArmyData <- read_csv("https://www.dropbox.com/s/ifh16ihiyl04gkt/rawArmyData.csv?dl=1")

## The output of janitor's tabyl call is an object that has two structures types: a tabyl and a data frame
## Creates the frequency table and formats the relative frequencies (percentages)
armyTable <- rawArmyData %>%
  filter(payGrade == "O-9") %>%
  tabyl(sex, maritalStatus) %>%
  adorn_totals(where = c("row", "col")) %>%
  adorn_percentages(denominator = "all") %>%
  adorn_pct_formatting(digits = 2) %>%
  adorn_title(
    placement = "combined", 
    row_name = "Sex",
    col_name = "Marital Status")

## Formats and adds the absolute frequencies (numbers)
formatNs <- attr(armyTable, "core") %>%
  adorn_totals(where = c("row", "col")) %>%
  mutate(
    across(where(is.numeric), format, big.mark = ",")
  )
armyFreqTab <- armyTable %>%
  adorn_ns(position = "front", ns = formatNs)

## Polishing the Table - nicer appearance
armyFreqTab %>%
  kable(
    caption = "Sex and Marital Status of Soldiers with Pay Grade O-9",
    booktabs = TRUE,
    align = c("l", rep("c", 6))
    ) %>%
  kableExtra::kable_styling(
    bootstrap_options = c("striped", "condensed"),
    font_size = 16
  )



