#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
library(tidyverse)

load("appData.RData")

# Define server logic
shinyServer(function(input, output) {
    
    output$sampleMenu <- renderUI({
        menuBank$sampleMenu
    })
    
    output$designMenu <- renderUI({
        req(input$sample)
        menuBank$samplePicked[[input$sample]][["designMenu"]]
    })
    
    output$inferenceMenu <- renderUI({
        req(input$sample)
        req(input$design)
        menuBank$samplePicked[[input$sample]][["designPicked"]][[input$design]][["inferenceMenu"]]
    })
    
    output$modelMenu <- renderUI({
        req(input$sample)
        req(input$design)
        menuBank$samplePicked[[input$sample]][["designPicked"]][[input$design]][["modelMenu"]]
    })
    
    input_set_list <- reactive({
        req(input$sample)
        req(input$design)
        set_list <- names(
            menuBank$samplePicked[[input$sample
            ]][["designPicked"
            ]][[input$design
            ]][["dimPicked"
            ]][[paste0(input$design,"_",input$inference,"_",input$model)
            ]][["inputs"]]
        )
        set_list_drop <- length(set_list) #remove "ranges"
        return(menuBank$samplePicked[[input$sample
        ]][["designPicked"
        ]][[input$design
        ]][["dimPicked"
        ]][[paste0(input$design,"_",input$inference,"_",input$model)
        ]][["inputs"]][-set_list_drop])
        
    })
    
    output$input_set <- renderUI({
        if (is.list(input_set_list())) {
            do.call(
                tagList,
                input_set_list()
            )
        }
    })
    
    output$powerSlider <- renderUI({
        sliderInput("power",
                    "Select level of power", 
                    min = .2, 
                    max = .99, 
                    step = .01)
    })
    
    output$effectsizeSlider <- renderUI({
        sliderInput("effectsize",
                    "Select expected effect size", 
                    value = .3,
                    min = .05, 
                    max = 1.5, 
                    step = .05)
    })
    
    exact_power <- reactive({
        dim_N <- paste0(input$design,"_",input$inference,"_",input$model,"_N")
        dim_df <- paste0(input$design,"_",input$inference,"_",input$model,"_df")
        dim_V <- paste0(input$design,"_",input$inference,"_",input$model,"_V")
        input_string_N <- paste0(
            paste0("input$",
                               menuBank$functionList[[dim_N]][["args"]]), 
            collapse = ","
            )
        
        input_string_df <- paste0(
            paste0("input$",
                   menuBank$functionList[[dim_df]][["args"]]), 
            collapse = ","
        )
        
        input_string_V <- paste0(
            paste0("input$",
                   menuBank$functionList[[dim_V]][["args"]]), 
            collapse = ","
        )
        
        V_cmd <- paste0(
            dim_V,"(",input_string_V,")"
        )
        
        df_cmd <- paste0(
            dim_df,"(",input_string_df,")"
        )
        
        
        V <- eval(
            parse(
                text =  V_cmd
            )
        )
        
        df <- eval(
            parse(
                text = df_cmd
            )
        )
        
        ncp <- input$effectsize*sqrt(V)
        
        alpha <- .05
        
        critR <- qt(alpha/2, df, lower.tail = FALSE)
        
        beta <- pt(critR,df,ncp) - pt(-critR,df,ncp)
        
        power <- 1-beta
        
        return(list(
            es = input$effectsize,
            alpha = alpha,
            beta = beta,
            power = power,
            ncp = ncp,
            df = df,
            vinput = V_cmd,
            dfinput = df_cmd
        ))
        
        
    })
    
    output$powerlist <- renderPrint(exact_power())
    
})
