<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Electricity Generation Analysis</title>
</head>
<body>
    <h1>Electricity Generation Analysis</h1>
    <p>This Shiny app analyzes electricity generation data from coal power plants in India. It provides interactive visualizations and statistical analysis to understand the trends and factors affecting electricity generation.</p>
    
    <h2>Features</h2>
    <ul>
        <li><strong>Graph Selection:</strong> Choose from a variety of graphs to visualize data.</li>
        <li><strong>Region Selection:</strong> Select the region for a detailed analysis.</li>
        <li><strong>Linear Regression Model:</strong> Explore the linear regression model between selected variables.</li>
        <li><strong>Regression Plot:</strong> View a plot comparing actual vs. predicted values from the regression model.</li>
        <li><strong>Data Summary:</strong> See a summary of the dataset.</li>
    </ul>
    
    <h2>Dataset</h2>
    <p>The app uses a dataset from the "Coal Power Plants database_INDIA_FINAL.xlsx" file for analysis. Missing values in the dataset are replaced by the mean.</p>
    
    <h2>Libraries Used</h2>
    <ul>
        <li>shiny</li>
        <li>plotly</li>
        <li>ggplot2</li>
        <li>lmtest</li>
        <li>dplyr</li>
        <li>xlsx</li>
    </ul>
    
    <h2>Running the App</h2>
    <p>To run the app, ensure you have R and the required libraries installed. Then, execute the code in RStudio or any other R environment.</p>
</body>
</html>
