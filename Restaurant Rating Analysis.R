#Libraries
install.packages("ggplot2")  
  
#load the libraries
library(ggplot2)
library(dplyr)

#Importing dataset
file_path <- "/Users/devashreenaik/Desktop/Cognifyz Technologies Project (Data Analyst)/Dataset .csv"  
data <- read.csv(file_path)

head(data) 

str(data)

#Analyze Rating Distribution
ggplot(data, aes(x = Aggregate.rating)) +  
  geom_histogram(binwidth = 0.5, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Aggregate Ratings", x = "Ratings", y = "Frequency") +
  theme_minimal()

#common rating range
str(data$Rating)


data$Rating <- as.numeric(as.character(data$Rating))

data$Rating_Range <- cut(data$Rating, breaks = seq(0, 5, by = 1), include.lowest = TRUE)
print(head(data$Rating_Range))

data$Rating_Range <- cut(data$Rating, breaks = seq(0, 5, by = 1), include.lowest = TRUE)
rating_range_counts <- data %>%
  group_by(Rating_Range) %>%
  summarize(Count = n()) %>%
  arrange(desc(Count))

print("Rating Range Counts:")
print(rating_range_counts)

data$Rating_Range <- cut(data$Rating, breaks = seq(0, 5, by = 1), include.lowest = TRUE)
rating_range_counts <- data %>%
  group_by(Rating_Range) %>%
  summarize(Count = n()) %>%
  arrange(desc(Count))

most_common_range <- rating_range_counts$Rating_Range[which.max(rating_range_counts$Count)]
print(paste("Most Common Rating Range:", most_common_range))

avg_votes <- mean(data$Votes, na.rm = TRUE)  
print(paste("Average Number of Votes Received by Restaurants:", round(avg_votes, 2)))

ggplot(rating_range_counts, aes(x = Rating_Range, y = Count)) +
  geom_bar(stat = "identity", fill = "lightgreen") +
  labs(title = "Most Common Rating Range", x = "Rating Range", y = "Number of Restaurants") +
  theme_minimal()