# =========================
# Passenger Survey Analysis
# =========================

# Load libraries
library(dplyr)
library(ggplot2)
library(gtsummary)
library(readr)

# -------------------------
# Load Data
# -------------------------
df <- read_csv("data/assignment-2-k2448522-2.csv")

# Inspect structure
glimpse(df)
summary(df)

# -------------------------
# Exploratory Data Analysis
# -------------------------

# Histogram of wait times
ggplot(df, aes(x = wait)) +
  geom_histogram(bins = 30) +
  labs(
    title = "Distribution of Wait Times",
    x = "Wait Time (hours)",
    y = "Frequency"
  )

# Cleanliness responses
ggplot(df, aes(x = factor(dirty))) +
  geom_bar() +
  labs(
    title = "Perceived Cleanliness",
    x = "Dirty (0 = No, 1 = Yes)",
    y = "Count"
  )

# Flights in last year
ggplot(df, aes(x = lastyear)) +
  geom_bar() +
  labs(
    title = "Flights in Previous 12 Months",
    x = "Number of Flights",
    y = "Count"
  )

# Wait times by flight type
ggplot(df, aes(x = factor(usa), y = wait)) +
  geom_boxplot() +
  labs(
    title = "Wait Times by Flight Type",
    x = "Flight Type (0 = International, 1 = Domestic)",
    y = "Wait Time (hours)"
  )

# -------------------------
# Summary Tables
# -------------------------

# Overall summary
summary_table <- df %>%
  tbl_summary(include = c(good, dirty, wait, lastyear, usa))

summary_table

# Domestic vs International summaries
domestic_summary <- df %>%
  filter(usa == 1) %>%
  tbl_summary(include = c(good, dirty, wait))

international_summary <- df %>%
  filter(usa == 0) %>%
  tbl_summary(include = c(good, dirty, wait))

domestic_summary
international_summary

# -------------------------
# Logistic Regression Models
# -------------------------

model_full <- glm(good ~ dirty + wait + lastyear + usa, data = df, family = binomial)
model_dw   <- glm(good ~ dirty + wait, data = df, family = binomial)
model_dwu  <- glm(good ~ dirty + wait + usa, data = df, family = binomial)
model_dwl  <- glm(good ~ dirty + wait + lastyear, data = df, family = binomial)
model_du   <- glm(good ~ dirty + usa, data = df, family = binomial)
model_wu   <- glm(good ~ wait + usa, data = df, family = binomial)

# -------------------------
# Model Comparison
# -------------------------

models <- list(
  Full = model_full,
  Dirty_Wait = model_dw,
  Dirty_Wait_USA = model_dwu,
  Dirty_Wait_LastYear = model_dwl,
  Dirty_USA = model_du,
  Wait_USA = model_wu
)

# Print summaries
lapply(models, summary)

# Compare using AIC
AIC(model_full, model_dw, model_dwu, model_dwl, model_du, model_wu)