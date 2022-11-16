## How does the ordered structure of the height data vary by the family role of the person?
# Plan ----
## Data set - Galton Family Heights - oneDrive folder
## Load packages (ggplot2, esquisse)
## Aim: rank of heights by family role
## Geometry: box plot
## Mappings: family role, heights

# Code ----
galtonData <- family_heights

library(ggplot2)
library(esquisse)

esquisse::esquisser(data = galtonData, viewer = "browser")

ggplot(
  data = galtonData,
  mapping = aes(x = family_member, y = height_in)) +
  geom_boxplot(fill = "#FF8C00") +
  theme_minimal() +
  ylab("Height (Inches)")
  
)