## How do the frequencies vary as we look at the pay grade, martial status, and sex of members of the U.S. Army?
# Plan ----
## Data set - Army Marital Status - oneDrive folder
## Load packages (ggplot2, esquisse)
## Aim: rank of frequencies by pay grade, marital status, and sex of members
## Geometry: 
## Mappings: pay grade, marital status, sex of members, frequencies

## Code ----
armyData <- army_marital_status

library(ggplot2)
#library(esquisse)
library(dplyr)

#esquisse::esquisser(data = armyData, viewer = "browser")

payGroups <- list(
  warrant = c("W-1", "W-2", "W-3", "W-4", "W-5"),
  enlisted = c("E-1", "E-2", "E-3", "E-4", "E-5", "E-6", "E-7", "E-8", "E-9"),
  officer = c("O-1", "O-2", "O-3", "O-4", "O-5", "O-6", "O-7", "O-8", "O-9", "O-10")
)

# Filter data by warrant pay grade
armyData %>%
  filter(pay_grade %in% payGroups$warrant) %>%
  ggplot(
    mapping = aes(pay_grade, weight = value)
  ) +
  geom_bar(fill = "#112446") +
  theme_bw() +
  facet_grid(vars(gender), vars(marital_status))

# Filter data by enlisted pay grade
armyData %>%
  filter(pay_grade %in% payGroups$enlisted) %>%
  ggplot(
    mapping = aes(pay_grade, weight = value)
  ) +
  geom_bar(fill = "#112446") +
  theme_bw() +
  facet_grid(vars(gender), vars(marital_status))

# Filter data by officer pay grade
armyData %>%
  filter(pay_grade %in% payGroups$officer) %>%
  ggplot(
    mapping = aes(pay_grade, weight = value)
  ) +
  geom_bar(fill = "#112446") +
  theme_bw() +
  facet_grid(vars(gender), vars(marital_status))

## Pay Grade
ggplot(
  data = armyData,
  mapping = aes(x = pay_grade, y = value)) +
  geom_boxplot(fill = "#112446") +
  theme_minimal() +
  ylab("Frequency of Service Members") +
  xlab("Pay Grade")

## Marital Status
ggplot(
  data = armyData,
  mapping = aes(x = marital_status, y = value)) +
  geom_boxplot(fill = "#112446") +
  theme_minimal() +
  ylab("Frequency of Service Members") +
  xlab("Marital Status")

## Sex of Service Member
ggplot(
  data = armyData,
  mapping = aes(x = gender, y = value)) +
  geom_boxplot(fill = "#112446") +
  theme_minimal() +
  ylab("Frequency of Service Members") +
  xlab("Sex of Service Member")

