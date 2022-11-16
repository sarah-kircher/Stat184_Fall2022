## How does the relationship between the carat and price of a diamond vary depending on the diamond cut?

# Plan ----
## Data set - diamonds data set - from ggplot2 library
## Load packages (ggplot2) and data (diamonds)
## Aim: Plot carat of diamond vs. price of diamond for each diamond cut (fair, good, very good, premium, ideal)
## Geometry: point - scatterplot, smooth - line of best fit
## Mappings: carat, price
## Facet: cut

# Code ----
# Load in needed packages (ggplot2) and data set (diamonds)
library(ggplot2)
data(diamonds)

# Assign the loaded data set to a variable to use in ggplot code
diamondsData <- diamonds

## Polished Code-- 
## The code below is similar to the original visualization code, but there were a few revisions
## The plots are organized by the diamond cut using facet- fair, good, very good, premium, and ideal
## The title and subtitle were edited to include the addition of the cut of the diamond
ggplot(
  data = diamondsData,
  mapping = aes(x = carat, y = price)) +
  geom_point(shape = "circle", size = 1.5, colour = "#FFA500") +
  geom_smooth(span = 0.75) +
  theme_minimal() +
  facet_wrap(vars(color)) +
  ylab("Price (U.S. Dollars)") +
  xlab("Carat (Grams)") +
  ggtitle("Carat vs. Price of Diamond by Diamond Color", 
          subtitle = "As the color of the diamond changes, the price per carat changes.")



