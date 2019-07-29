#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
library(shinydashboard)
library(DT)
library(here)
library(plotly)

ui <- dashboardPage(
  dashboardHeader(title = "Energy Consumption Predictor - Time Series Dashboard",
                  titleWidth = 550),
  dashboardSidebar(disable = TRUE),
  dashboardBody(
    fluidRow(
      column(width = 8,
             box(plotOutput("diag_plots"),
                 width = NULL)),
            # box(plotlyOutput("forecast_plots"),
            #       width = NULL),
      column(width = 4,
             box(selectInput("forecast", "Choose Forecast Method:",
                             c("GARCH Conditional Mean" = "fit_garch1",
                               "GARCH Conditional Sigma" = "fit_garch2",
                               "GARCH Conditional Covariance" = "fit_garch3",
                               "GARCH Conditional Correlation" = "fit_garch4",
                               "EW Portfolio Plot" = "fit_garch5",
                               "VAR" = "fit_VAR")),
                 width=NULL),
             sliderInput('ahead_count', 'Number of predictor steps', min = 1, max = 15, value = 1),
             box(verbatimTextOutput('test_print'),
                 width=NULL)
             )
    )
    )
)