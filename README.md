## AIM OF THIS PROJECT
The project aims to analyze and visualize electricity generation data from coal power plants in India. It provides an interactive interface using the Shiny framework in R, allowing users to:

- **Explore Trends** Users can select different variables and regions to plot graphs that show trends in electricity generation over time.

- **Understanding Relationship:** The app enables users to perform linear regression analysis to understand the relationship between variables and predict electricity generation.

- **Compare Data:** Users can compare actual and predicted values to evaluate the effectiveness of the regression model.

- **Summarize data:** The app provides summary statistics of the dataset, offering insights into the overall electricity generation patterns.

By providing these features, the project aims to help users gain insights into electricity generation from coal power plants in India and make informed decisions based on the data analysis.

# Electricity Generation Analysis

This Shiny app analyzes electricity generation data from coal power plants in India. It provides interactive visualizations and statistical analysis to understand the trends and factors affecting electricity generation.

## Features

- **Graph Selection:** Choose from a variety of graphs to visualize data.
- **Region Selection:** Select the region for a detailed analysis.
- **Linear Regression Model:** Explore the linear regression model between selected variables.
- **Regression Plot:** View a plot comparing actual vs. predicted values from the regression model.
- **Data Summary:** See a summary of the dataset.

## Dataset

The app uses a dataset from the "Coal Power Plants database_INDIA_FINAL.xlsx" file for analysis. Missing values in the dataset are replaced by the mean.

## Libraries Used

- `shiny`
- `plotly`
- `ggplot2`
- `lmtest`
- `dplyr`
- `xlsx`

## Running the App

To run the app, ensure you have R and the required libraries installed. Then, execute the code in RStudio or any other R environment.

## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/repository-name.git
