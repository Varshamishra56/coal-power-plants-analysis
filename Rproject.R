library(shiny)
library(plotly)
library(ggplot2)
library(lmtest)
library(dplyr)
library(xlsx)

st<-read.xlsx("Coal Power Plants database_INDIA_FINAL.xlsx",sheetIndex = 1)


#NA values replaced by mean
numeric_columns <- sapply(st, is.numeric)

st <- st %>%
  mutate_at(vars(which(numeric_columns)), ~ ifelse(is.na(.), mean(., na.rm = TRUE), .))


ui <- fluidPage(
  titlePanel("Electricity Generation due to coal power plants"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "versus",
        label = "Select which graph you want to plot",
        choices = names(st)[21:33],
        selected = "X2013"
      ),
      conditionalPanel(
        condition = "input.selectedtab == 1",
        selectInput(
          inputId = "region",
          label = "Select the region",
          choices = names(st)[1:8],
          selected = "Region"
        )
      )
    ),
    mainPanel(
      tabsetPanel(
        type = "tabs",
        tabPanel("graphPlot", value = 1, plotlyOutput("scatterplot1")),
        tabPanel("summary of the dataframe", value = 2, dataTableOutput("summaryTable")),
        tabPanel("Linear Regression Model", value = 3, verbatimTextOutput("linearRegressionOutput")),
        tabPanel("Regression Plot", value = 4, plotlyOutput("regressionPlot")),  # New tab for regression plot
        tabPanel("Comparison", value = 5, tableOutput("comparisonTable")),  # New tab for comparison
        tabPanel("Average Accuracy (Complete Data)", value = 7, verbatimTextOutput("averageAccuracyCompleteData")),  # New tab for average accuracy of complete data
        id = "selectedtab"
      )
    )
  )
)

server <- function(input, output) {
  # Define model globally
  model <- reactive({
    # Linear regression model
    formula <- as.formula(paste(input$versus, "~", input$region))
    lm(formula, data = st)
  })
  
  output$scatterplot1 <- renderPlotly({
    gg <- ggplot(st, aes_string(x = input$region, y = input$versus)) +
      labs(title = "Year Wise plot for electricity", y = input$versus, x = input$region) +
      geom_line(color="grey")+
      geom_point(color = "blue")
    ggplotly(gg)
    
  })
  
  output$summaryTable <- renderDataTable({
    summary(st)
  })
  
  output$linearRegressionOutput <- renderPrint({
    summary(model())
  })
  
  output$regressionPlot <- renderPlotly({
    comparison_data <- data.frame(
      True_Values = st[, input$versus],
      Predicted_Values = predict(model())
    )
    
    gg <- ggplot(comparison_data, aes(x = True_Values, y = Predicted_Values)) +
      geom_point(color = "blue") +
      geom_abline( color = "red") +
      labs(title = "Linear Regression Plot", y = "Predicted Values", x = "True Values")
    
    ggplotly(gg)
  })
  
  output$comparisonTable <- renderTable({
    comparison_data <- data.frame(
      True_Values = st[, input$versus],
      Predicted_Values = predict(model())
    )
  })
  
  
  #AVrage accuracy 
  output$averageAccuracyCompleteData <- renderPrint({
    accuracy_complete_data <- summary(lm(as.formula(paste(input$versus, "~", paste(names(st)[1:8], collapse = " + "))), data = st))$r.squared
    
    paste("Average Accuracy (Complete Data): ", round(accuracy_complete_data, 5))
  })
}

shinyApp(ui, server)