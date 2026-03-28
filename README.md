Passenger Survey Analysis (R)
Overview

This project analyses passenger survey data from San Francisco International Airport (SFO). The aim is to understand the factors that influence whether passengers report a positive experience.

The analysis is carried out in R, combining exploratory data analysis with statistical modelling.

Dataset

The dataset includes survey responses from passengers, covering:

Perceived cleanliness of the airport

Time spent at the airport

Flight type (domestic or international)

Number of flights taken in the past year

Overall satisfaction (approval)

Methods

Exploratory data analysis (summary statistics and visualisations)

Logistic regression modelling using glm()

Model comparison using Akaike Information Criterion (AIC)

Key Findings

Cleanliness and waiting time are the most important predictors of passenger satisfaction

Flight type and travel frequency have little impact on overall experience

A simpler model using fewer variables provided better performance based on AIC

Project Structure
├── data/
├── scripts/
├── report/
└── README.md
How to Run

Open the R script in RStudio (or your preferred R environment)

Ensure required packages are installed

Run the script to reproduce the analysis

Technologies Used

R

Base R functions (glm)

Data visualisation tools (e.g., ggplot2 if used)

Author

Dipayan Chowdhury
