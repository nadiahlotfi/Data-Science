str(Carseats)
Carseats

describe(Carseats)
describe(Carseats, Sales, CompPrice, Income)
describe(Carseats, Sales:Income)
describe(Carseats, -Sales:-Income)

normality(Carseats)
normality(Carseats, Sales, Price, Age, Education)
normality(Carseats, -Sales, -Price)

plot_normality(Carseats, Sales, Price, Age, Education)

correlate(Carseats)
correlate(Carseats, Sales, CompPrice, Income)
correlate(Carseats, Sales:Income)
correlate(Carseats, -Sales:-Income)

#plotting correlations
#once again, can choose variables(in the case of this dataset, its name is vars...)
Carseats%>%
  correlate() %>%
  plot()

categ<- target_by(Carseats, US)

cat_num <- relate(categ, Sales)
summary(cat_num)
plot(cat_num)
