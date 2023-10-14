#activity 2 (mice)
library(mice)

titanic_numeric <- titanic_train %>%
  select(Survived, Pclass, SibSp, Parch, Age)

md.pattern(titanic_numeric)

mice_imputed <- data.frame(
  original = titanic_train$Age,
  imputed_pmm = complete(mice(titanic_numeric, method = "pmm"))$Age,
  imputed_cart = complete(mice(titanic_numeric, method = "cart"))$Age,
  imputed_lasso = complete(mice(titanic_numeric, method = "lasso.norm"))$Age
)

mice_imputed

library(ggplot2)
library(gridExtra)

h1 <- ggplot(mice_imputed, aes(x = original)) +
  geom_histogram(fill = "#ad1538", color = "#000000", position = "identity") +
  ggtitle("Original distribution") +
  theme_classic()

h2 <- ggplot(mice_imputed, aes(x = imputed_pmm)) +
  geom_histogram(fill = "#15ad4f", color = "#000000", position = "identity") +
  ggtitle("PMM-imputed distribution") +
  theme_classic()

h3 <- ggplot(mice_imputed, aes(x = imputed_cart)) +
  geom_histogram(fill = "#1543ad", color = "#000000", position = "identity") +
  ggtitle("CART-imputed distribution") +
  theme_classic()

h4 <- ggplot(mice_imputed, aes(x = imputed_lasso)) +
  geom_histogram(fill = "#ad8415", color = "#000000", position = "identity") +
  ggtitle("Lasso-imputed distribution") +
  theme_classic()

plot_grid(h1, h2, h3, h4, nrow = 2, ncol = 2)

#Churn_Train
getwd()
data = read.csv("Churn_Train.csv",header=TRUE)

data$Total.Charges 
missing_values <- colSums(is.na(data))
# Print the count of missing values for each column
print(missing_values)

library(ggplot2)
library(dplyr)
library(cowplot)

#visualize the plot
ggplot(data, aes(Total.Charges) ) +
  geom_histogram(color = "#000000", fill = "#985732") +
  ggtitle("Variable distribution") +
  theme_classic() +
  theme(plot.title = element_text(size=18))

value_imputed <- data.frame(
  original = data$Total.Charges,
  imputed_zero = replace(data$Total.Charges, is.na(data$Total.Charges), 0),
  imputed_mean = replace(data$Total.Charges, is.na(data$Total.Charges), mean(data$Total.Charges, na.rm = TRUE)),
  imputed_median = replace(data$Total.Charges, is.na(data$Total.Charges), median(data$Total.Charges, na.rm = TRUE))
)
value_imputed

h1 <- ggplot(value_imputed, aes(x = original)) +
  geom_histogram(fill = "#ad1538", color = "#000000", position = "identity") +
  ggtitle("Original distribution") +
  theme_classic()
h2 <- ggplot(value_imputed, aes(x = imputed_zero)) +
  geom_histogram(fill = "#15ad4f", color = "#000000", position = "identity") +
  ggtitle("Zero-imputed distribution") +
  theme_classic()
h3 <- ggplot(value_imputed, aes(x = imputed_mean)) +
  geom_histogram(fill = "#1543ad", color = "#000000", position = "identity") +
  ggtitle("Mean-imputed distribution") +
  theme_classic()
h4 <- ggplot(value_imputed, aes(x = imputed_median)) +
  geom_histogram(fill = "#ad8415", color = "#000000", position = "identity") +
  ggtitle("Median-imputed distribution") +
  theme_classic()
plot_grid(h1, h2, h3, h4, nrow = 2, ncol = 2)