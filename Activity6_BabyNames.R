library(dcData)
library(dplyr)
data(BabyNames)

## OG Code Chunk 1
BabyNames %>%
  group_by( "First" ) %>%
  summarise( votesReceived=n()  )

## Revised Code Chunk 1
BabyNames %>%
  group_by(name) %>%
  summarise( votesReceived=n()  )

## OG Code Chunk 2
Tmp <- group_by(BabyNames, year, sex) %>%
  summarise (Tmp, totalBirths=sum(count))

## Revised Code Chunk 2
Tmp <- group_by(BabyNames, year, sex)
summarise(Tmp, totalBirths=sum(count))

## OG Code Chunk 3
Tmp <- group_by(BabyNames, year, sex)
summarise( BabyNames, totalBirths=sum(count))

## Revised Code Chunk 3
Tmp <- group_by(BabyNames, year, sex)
summarise( Tmp, totalBirths=sum(count))


