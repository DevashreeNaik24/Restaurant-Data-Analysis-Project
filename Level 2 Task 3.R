install.packages("tidyr")
install.packages("corrplot")

library(ggplot2)
library(dplyr)
library(tidyr)
library(corrplot)

file_path <- "/Users/devashreenaik/Desktop/Cognifyz Technologies Project (Data Analyst)/Dataset .csv"
data <- read.csv(file_path)


head(data)
str(data)


chain_counts <- data %>%
  group_by(Restaurant.Name) %>%
  summarise(Count = n()) %>%
  filter(Count > 1)


print("Restaurant Chains Identified:")
print(chain_counts)




colnames(data)



ggplot(data, aes(x = Votes, y = Aggregate.rating)) +  
  geom_point(aes(color = Restaurant.Name), alpha = 0.6) +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  labs(title = "Scatter Plot: Votes vs Ratings", x = "Votes", y = "Ratings") +
  theme_minimal()


correlation <- cor(data$Votes, data$Aggregate.rating, use = "complete.obs")  
print(paste("Correlation between Votes and Ratings:", round(correlation, 2)))


ggplot(data, aes(x = Restaurant.Name, y = Aggregate.rating, fill = Restaurant)) + 
  geom_boxplot() +
  labs(title = "Distribution of Ratings for Restaurant Chains", x = "Restaurant Chain", y = "Ratings") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme_minimal()



rating_variability <- data %>%
  group_by(Restaurant) %>%
  summarise(Average_Rating = mean(Aggregate.rating, na.rm = TRUE
            Rating_SD = sd(Rating, na.rm = TRUE)) %>%
  arrange(desc(Average_Rating))


high_variability_chains <- rating_variability %>%
  filter(Rating_SD > quantile(Rating_SD, 0.75)) %>%
  head(10)

print("Top-rated Chains with Highest Variability:")
print(high_variability_chains)


heatmap_data <- data %>%
  group_by(Restaurant.Name) %>%
  summarise(Avg_Rating = mean(Aggregate.rating, na.rm = TRUE), Total_Votes = sum(Votes, na.rm = TRUE))


heatmap_matrix <- spread(heatmap_data, key = Restaurant.Name, value = Avg_Rating)

install.packages("reshape2")
library(reshape2)
heatmap_matrix_melt <- melt(heatmap_matrix)

heatmap_data <- data %>%
  group_by(Restaurant.Name) %>%
  summarise(Avg_Rating = mean(Aggregate.rating, na.rm = TRUE), Total_Votes = sum(Votes, na.rm = TRUE))

library(tidyr)
heatmap_matrix <- spread(heatmap_data, key = Restaurant.Name, value = Avg_Rating)

library(reshape2)
heatmap_matrix_melt <- melt(heatmap_matrix, id.vars = NULL)

ggplot(heatmap_matrix_melt, aes(x = variable, y = value, fill = value)) +
  geom_tile() +
  scale_fill_gradient(low = "white", high = "blue") +
  labs(title = "Heatmap of Ratings by Restaurant and Votes", 
       x = "Restaurant Chain", 
       y = "Average Rating") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


write.csv(rating_variability, "Restaurant_Chain_Variability_Analysis.csv", row.names = FALSE)
write.csv(high_variability_chains, "Top_Rated_Chains_With_Variability.csv", row.names = FALSE)

threshold_value <- 1.0 

high_variability_chains <- data %>%
  group_by(Restaurant.Name) %>%
  summarise(Std_Dev = sd(Aggregate.rating, na.rm = TRUE)) %>%
  filter(Std_Dev > threshold_value)

print(high_variability_chains)
print("CSV file 'High_Variability_Chains.csv' has been saved.")
file.copy("Restaurant_Chain_Variability_Analysis.csv", "/mnt/data/Restaurant_Chain_Variability_Analysis.csv")
file.copy("Top_Rated_Chains_With_Variability.csv", "/mnt/data/Top_Rated_Chains_With_Variability.csv")

getwd()