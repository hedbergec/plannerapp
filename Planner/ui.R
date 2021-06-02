

library(shiny)
library(plotly)
library(tidyverse)

shinyUI(fluidPage(
    
    # Application title
    titlePanel("Planner BETA"),
    
    # Sidebar 
    sidebarLayout(
        sidebarPanel(
            uiOutput("sampleMenu"),
            uiOutput("designMenu"),
            uiOutput("inferenceMenu"),
            uiOutput("modelMenu"),
            uiOutput("input_set")
        ),
        
        # Show 
        mainPanel(
            tabsetPanel(
                tabPanel("Power",
                         uiOutput("effectsizeSlider"),
                         fluidRow(
                             column(
                                 width = 6,
                                 h1("Exact"),
                                 verbatimTextOutput("powerlist")
                             ),
                             column(
                                 width = 6,
                                 h1("Range")
                             )
                         )
                ),
                tabPanel("MDES",
                         fluidRow(
                             column(
                                 width = 6,
                                 h1("Exact")
                             ),
                             column(
                                 width = 6,
                                 h1("Range")
                             )
                         )
                )
            )
        )
    )
))
