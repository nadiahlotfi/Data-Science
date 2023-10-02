data = read.csv("C:/Users/USER/Documents/Churn_Train.csv");
data

#view Churn_Data
describe(data)
data$Total.Charges
#check for missing values in Total.Charges
is.na(data$Total.Charges)

#impute missing values with mean values
mean_data <- mean(data$Total.Charges, na.rm = TRUE)
data$Total.Charges[is.na(data$Total.Charges)] <- mean_data

#calculate descriptive statistics using describe()
describe(data)
describe(data, CustomerID, Monthly.Charges, Total.Charges)
describe(data, Monthly.Charges:Total.Charges) 
describe(data, (Monthly.Charges:Total.Charges))

#test normality
normality(data)
normality(data, Monthly.Charges, Total.Charges)
normality(data, Monthly.Charges:Total.Charges)
normality(data, (Monthly.Charges:Total.Charges))

#plot normality
plot_normality(data,Monthly.Charges,Total.Charges)

#calculate correlation
correlate(data)
correlate(data, Monthly.Charges,Total.Charges)
correlate(data, Monthly.Charges:Total.Charges)
correlate(data, (Monthly.Charges:Total.Charges))

#plotting correlations
data %>%
  correlate() %>%
  plot()

correlate(data,Monthly.Charges,Total.Charges) %>%
  plot()

#EDA used on target variable
categ <- target_by(data,Contract)

#EDA when target variable is categorical, predictor is numerical
cat_num <- relate(categ,Monthly.Charges)
summary(cat_num)
plot(cat_num)

#EDA when target variable is categorical, predictor is categorical
cat_cat <- relate(categ,Internet.Service)
summary(cat_cat)
plot(cat_cat)

#EDA when target variable is numerical, predictor is numerical
num <- target_by(data,Monthly.Charges)
num_num <- relate(num,Total.Charges)
summary(num_num)
plot(num_num)

#EDA when target variable is numerical, predictor is categorical
num_cat <- relate(num,Senior.Citizen)
summary(num_cat)
plot(num_cat)

data %>%
  eda_paged_report(target = "Payment.Method", subtitle = "Churn",output_dir = "./", output_file = "EDA_Lab2.pdf", theme = "orange")