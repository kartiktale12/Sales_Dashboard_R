
library(shiny)
library(ggplot2)
library(dplyr)
library(readr)
library(forecast)

data <- read_csv("full_sales_dataset.csv")
data$Date <- as.Date(data$Date)
ui <- fluidPage(
  titlePanel(" Sales Dashboard"),
  sidebarLayout(
    sidebarPanel(
      h4("Filter Data"),
      selectInput(
        inputId = "category",
        label = "Select Category:",
        choices = unique(data$Category)
      ),
      dateRangeInput(
        inputId = "dates",
        label = "Select Date Range:",
        start = min(data$Date),
        end = max(data$Date)
      )
    ),
    mainPanel(
      h3(" Sales Trend"),
      plotOutput("trendPlot"),
      
      br(),
      
      h3(" Monthly Seasonality"),
      plotOutput("seasonPlot"),
      
      br(),
      
      h3(" Sales Forecast"),
      plotOutput("forecastPlot")
    )
  )
)
server <- function(input, output) {
  filtered_data <- reactive({
    data %>%
      filter(
        Category == input$category,
        Date >= input$dates[1],
        Date <= input$dates[2]
      theme_minimal()
  })
  output$seasonPlot <- renderPlot({
      )
  })
  output$trendPlot <- renderPlot({
    
    ggplot(filtered_data(), aes(x = Date, y = Sales)) +
      geom_line(color = "blue", size = 1) +
      geom_point() +
      labs(
        title = "Sales Trend Over Time",
        x = "Date",
        y = "Sales"

      mutate(Month = format(Date, "%b")) %>%
      group_by(Month) %>%
      summarise(Total_Sales = sum(Sales)) %>%
            ) +() %>%
    filtered_data
      ggplot(aes(x = Month, y = Total_Sales)) +
      geom_bar(stat = "identity", fill = "darkgreen") +
      labs(
        title = "Monthly Sales (Seasonality)",
        x = "Month",
        y = "Total Sales"
      ) +
      theme_minimal()
  })
  output$forecastPlot <- renderPlot({
    
    sales_values <- filtered_data()$Sales
    

    if(length(sales_values) > 10) {
      
      ts_data <- ts(sales_values, frequency = 12)
      model <- auto.arima(ts_data)
      fc <- forecast(model, h = 8)
      
      plot(fc,
           main = "Sales Forecast",
           xlab = "Time",
           ylab = "Sales")
      
    } else {
      plot.new()
      text(0.5, 0.5, "Not enough data for forecasting")
    }
  })
}
shinyApp(ui = ui, server = server)