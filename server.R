#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(coefplot)
library(quantmod)
library(rugarch)
library(rmgarch)

fit_GARCH <- readRDS("DCCGarch_model.Rds")
fit_VAR <- readRDS("VARmodel.Rds")


server <- function(input, output) {
  nahead  <- reactive({
    input$ahead_count
  })
  output$forecast_plots <- renderPlotly({
  })
  output$diag_plots <- renderPlot({
    if (input$forecast == "fit_VAR") {
      plot( predict(fit_VAR, n.ahead = nahead()))
     } else if (input$forecast == "fit_garch1") {
       plot(fit_GARCH, which = 1)
       
     }
    else if (input$forecast == "fit_garch2") {
      plot(fit_GARCH, which = 2)
      
    }
    else if (input$forecast == "fit_garch3") {
      plot(fit_GARCH, which = 3)
      
    }
    else if (input$forecast == "fit_garch4") {
      plot(fit_GARCH, which = 4)
      
    }
    else if (input$forecast == "fit_garch5") {
      plot(fit_GARCH, which = 5)
      
    }    
    
  })
  output$test_print = renderPrint({
    if (input$forecast == "fit_VAR") {
      predict(fit_VAR, n.ahead = nahead())
     } else if (input$forecast == "fit_garch1") {
       dccforecast(fit_GARCH, n.ahead = nahead())
     } else if (input$forecast == "fit_garch2") {
       dccforecast(fit_GARCH, n.ahead = nahead())
     } else if (input$forecast == "fit_garch3") {
       dccforecast(fit_GARCH, n.ahead = nahead())
     } else if (input$forecast == "fit_garch4") {
       dccforecast(fit_GARCH, n.ahead = nahead())
     } else if (input$forecast == "fit_garch5") {
       dccforecast(fit_GARCH, n.ahead = nahead())
     } 
       
  })
}
