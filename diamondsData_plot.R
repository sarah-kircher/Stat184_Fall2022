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

# Create the scatterplot using geom_point of carat of diamond vs. price of diamond
# Add a line of best fit using geom_smooth - span = amount of smoothing
# Add axes labels with proper units - grams and U.S. dollars
# Add title and subtitle for viewer comprehension of plot
## Code for original visualization
ggplot(
  data = diamondsData,
  mapping = aes(x = carat, y = price)) +
  geom_point(shape = "circle", size = 1.5, colour = "#112446") +
  geom_smooth(span = 0.75) +
  theme_minimal() +
  ylab("Price (U.S. Dollars)") +
  xlab("Carat (Grams)") +
  ggtitle("Carat vs. Price of Diamonds", subtitle = "As the carat of a diamond increases, the price of a diamond increases.")

## Polished Code-- 
## The code below is similar to the original visualization code, but there were a few revisions
## The plots are organized by the diamond cut using facet- fair, good, very good, premium, and ideal
## The title and subtitle were edited to include the addition of the cut of the diamond
  ggplot(
    data = diamondsData,
    mapping = aes(x = carat, y = price)) +
  geom_point(shape = "circle", size = 1.5, colour = "#112446") +
  geom_smooth(span = 0.75) +
  theme_minimal() +
  facet_wrap(vars(cut)) +
  ylab("Price (U.S. Dollars)") +
  xlab("Carat (Grams)") +
  ggtitle("Carat vs. Price of Diamond by Diamond Cut", 
          subtitle = "As the quality of the diamond cut increases, the price per carat increases.")
  
  
  
  