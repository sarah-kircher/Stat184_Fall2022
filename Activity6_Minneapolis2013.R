library(dcData)
data("Minneapolis2013")

# How many cases are there?
num_rows <- nrow(Minneapolis2013)

# Who were the top 5 candidates in the Second Vote selections?
updated_df <- Minneapolis2013 %>%
  group_by(Second) %>%
  summarise(votesReceived = n()) %>%
  arrange(desc(votesReceived))

updated_df[1:5,]

# How many ballots are marked "undervote" in first, second, and third choice selections?
first_df <- Minneapolis2013 %>%
  group_by(First) %>%
  summarise(votesReceived = n()) %>%
  arrange(desc(votesReceived))
View(first_df)

second_df <- Minneapolis2013 %>%
  group_by(Second) %>%
  summarise(votesReceived = n()) %>%
  arrange(desc(votesReceived))
View(second_df)

third_df <- Minneapolis2013 %>%
  group_by(Third) %>%
  summarise(votesReceived = n()) %>%
  arrange(desc(votesReceived))
View(third_df)

# What are the top 3 combinations of first and second vote selections?
first_second_df <- Minneapolis2013 %>%
  group_by(First, Second) %>%
  summarise(votesReceived = n()) %>%
  arrange(desc(votesReceived))
first_second_df[1:3,]

# What Precinct had the highest number of ballots cast?
ballots_df <- Minneapolis2013 %>%
  group_by(Precinct) %>%
  summarise(votesReceived = n()) %>%
  arrange(desc(votesReceived))
ballots_df[1:1,]

