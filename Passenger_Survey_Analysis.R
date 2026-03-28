library(dplyr)
library(ggplot2)
library(gtsummary)

df <- read.csv('assignment-2-k2448522-2.csv')

attach(df)
hist(wait)
df |> ggplot(aes(dirty)) + geom_bar()

model <- glm(good ~ dirty + wait + lastyear + usa, data=df, family = binomial)
model2  <- glm(good ~ dirty + wait + usa, data=df, family = binomial)
model3  <- glm(good ~ dirty + wait, data=df, family = binomial)
model4  <- glm(good ~ dirty + usa , data=df, family = binomial)
model5  <- glm(good ~ wait + usa, data=df, family = binomial)
modela <- glm(good ~ dirty + wait + lastyear, data=df, family = binomial)

summary(model)
summary(model2)
summary(model3)
summary(model4)
summary(model5)
summary(modela)
table1 <- df |> tbl_summary(include = c(good, dirty, wait, lastyear, usa))

table1


df |> ggplot(aes(wait)) + geom_histogram()
df |> ggplot(aes(usa, wait)) + geom_boxplot()
df |> ggplot(aes(lastyear)) + geom_bar() + labs(title = "Number of flights from SFO per passenger in the previous 12 months", x = "Number of flights", y = "Number of passengers")


ggplot(df[df$usa == 0,], aes(,wait)) + geom_boxplot() + labs(title = "Boxplot of wait times for international flights", y = "Hours spent at the airport")


table2 <- df[df$usa == 1,] |> tbl_summary(include = c(good, dirty, wait))
table2

table3 <- df[df$usa == 0,] |> tbl_summary(include = c(good, dirty, wait))
table3
