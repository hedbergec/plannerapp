library(shiny)
library(plotly)
library(tidyverse)

#options(error= recover)

server <- function(input, output) {
  
  load("appData.RData")
  
  output$effectsizeSlider <- renderUI({
    sliderInput("es",
                "Select expected effect size", 
                value = .3,
                min = .05, 
                max = 1.5, 
                step = .01)
  })
  
  output$type2ErrorSlider <- renderUI({
    sliderInput("beta",
                "Select expected Type II Error", 
                value = .2,
                min = .01, 
                max = .5, 
                step = .01)
  })
  
  output$alphaMenu <- renderUI({
    selectInput("alpha",
                "Signifiance Level",
                choices = c(".1" = .1, 
                            ".05" = .05, 
                            ".01" = .01, 
                            ".001" = .001),
                selected = .05)
  })
  
  alpha <- reactive({
    req(input$alpha)
    return(as.numeric(input$alpha))
  })
  
  # output$tailsMenu <- renderUI({
  #     selectInput("tails",
  #                 "One or Two Tails",
  #                 choices = c("one-tail" = 1, 
  #                             "two-tails" = 2),
  #                 selected = 2)
  # })
  
  tails <- reactive({
    # req(input$tails)
    # return(as.numeric(input$tails))
    return(2)
  })
  
  output$sampleMenu <- renderUI({
    menuBank$sampleMenu
  })
  
  output$designMenu <- renderUI({
    req(input$sample)
    req(input$sample != "waiting")
    menuBank$samplePicked[[input$sample]][["designMenu"]]
  })
  
  output$inferenceMenu <- renderUI({
    req(input$sample)
    req(input$sample != "waiting")
    req(input$design)
    req(input$design != "waiting")
    menuBank$samplePicked[[input$sample]][["designPicked"]][[input$design]][["inferenceMenu"]]
  })
  
  output$modelMenu <- renderUI({
    req(input$sample)
    req(input$sample != "waiting")
    req(input$design)
    req(input$design != "waiting")
    menuBank$samplePicked[[input$sample]][["designPicked"]][[input$design]][["modelMenu"]]
  })
  
  input_set_list <- reactive({
    req(input$sample)
    req(input$sample != "waiting")
    req(input$design)
    req(input$design != "waiting")
    set_list <- names(
      menuBank$samplePicked[[input$sample
      ]][["designPicked"
      ]][[input$design
      ]][["dimPicked"
      ]][[paste0(input$design,"_",input$inference,"_",input$model)
      ]][["inputs"]]
    )
    set_list_drop <- length(set_list) #remove "ranges," the last element
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
  
  
  
  N <- reactive({
    req(input$design)
    req(input$design != "waiting")
    req(input$inference)
    req(input$inference != "waiting")
    req(input$model)
    req(input$model != "waiting")
    
    dim_N <- paste0(input$design,"_",input$inference,"_",input$model,"_N")
    
    input_string_N <- paste0(
      paste0("input$",
             menuBank$functionList[[dim_N]][["args"]]), 
      collapse = ","
    )
    
    N_cmd <- paste0(
      dim_N,"(",input_string_N,")"
    )
    
    N <- eval(
      parse(
        text = N_cmd
      )
    )
    
    return(
      list(
        value = N, 
        cmd = N_cmd
      )
    )
    
  })
  
  df <- reactive({
    req(input$design)
    req(input$design != "waiting")
    req(input$inference)
    req(input$inference != "waiting")
    req(input$model)
    req(input$model != "waiting")
    
    dim_df <- paste0(input$design,"_",input$inference,"_",input$model,"_df")
    input_string_df <- paste0(
      paste0("input$",
             menuBank$functionList[[dim_df]][["args"]]), 
      collapse = ","
    )
    df_cmd <- paste0(
      dim_df,"(",input_string_df,")"
    )
    df <- eval(
      parse(
        text = df_cmd
      )
    )
    
    return(
      list(
        value = df, 
        cmd = df_cmd
      )
    )
  })
  
  V <- reactive({
    req(input$design)
    req(input$design != "waiting")
    req(input$inference)
    req(input$inference != "waiting")
    req(input$model)
    req(input$model != "waiting")
    
    dim_V <- paste0(input$design,"_",input$inference,"_",input$model,"_V")
    
    input_string_V <- paste0(
      paste0("input$",
             menuBank$functionList[[dim_V]][["args"]]), 
      collapse = ","
    )
    
    V_cmd <- paste0(
      dim_V,"(",input_string_V,")"
    )
    
    V <- eval(
      parse(
        text =  V_cmd
      )
    )
    
    return(
      list(
        value = V, 
        cmd = V_cmd
      )
    )
  })
  
  ncp <- reactive({
    req(input$design)
    req(input$design != "waiting")
    req(input$inference)
    req(input$inference != "waiting")
    req(input$model)
    req(input$model != "waiting")
    req(input$es)
    req(df()$value)
    req(V()$value)
    
    ncp <- compute_ncp(es = input$es,
                       V = V()$value
    )
    
    return(
      list(
        value = ncp
      )
    )
  })
  
  beta <- reactive({
    req(input$design)
    req(input$design != "waiting")
    req(input$inference)
    req(input$inference != "waiting")
    req(input$model)
    req(input$model != "waiting")
    req(ncp()$value)
    req(df()$value)
    req(alpha())
    req(tails())
    
    beta <- compute_beta(
      ncp = ncp()$value, 
      df = df()$value, 
      alpha = alpha(), 
      tails = tails() 
    )
    
    return(
      list(
        value = beta
      )
    )
    
  })
  
  power <- reactive({
    req(input$design)
    req(input$design != "waiting")
    req(input$inference)
    req(input$inference != "waiting")
    req(input$model)
    req(input$model != "waiting")
    req(beta()$value)
    power <- compute_power(
      beta()$value
    )
    return(
      list(
        value = power
      )
    )
  })
  
  power_graph_data <- reactive({
    req(ncp()$value)
    req(df()$value)
    req(alpha())
    exact_graph_data(
      ncp = ncp()$value, 
      df = df()$value, 
      alpha = alpha()
    )
  })
  
  output$power_graph_plotly <- renderPlotly({
    req(power_graph_data())
    p <- exact_power_plotly(power_graph_data())
    return(p)
  })
  
  output$mdesoutput <- renderPrint({
    req(V()$value)
    req(df()$value)
    req(alpha())
    req(tails())
    req(input$beta)
    compute_mdes(
      V = V()$value, 
      df = df()$value, 
      alpha = alpha(), 
      tails = tails(), 
      beta = input$beta
    )
  })
}

ui <- fluidPage(
  
  # Application title
  titlePanel("Planner BETA"),
  
  # Sidebar 
  sidebarLayout(
    sidebarPanel(
      uiOutput("sampleMenu"),
      uiOutput("designMenu"),
      uiOutput("inferenceMenu"),
      uiOutput("modelMenu"),
      uiOutput("input_set"),
      uiOutput("alphaMenu"),
      uiOutput("tailsMenu")
    ),
    
    # Show 
    mainPanel(
      tabsetPanel(
        tabPanel("Power",
                 uiOutput("effectsizeSlider"),
                 fluidRow(
                   h1("Exact"),
                   plotlyOutput("power_graph_plotly")
                 ),
                 fluidRow(
                   h1("Range TDB")
                 )
        ),
        tabPanel("MDES",
                 fluidRow(
                   h1("Exact"),
                   uiOutput("type2ErrorSlider"),
                   verbatimTextOutput("mdesoutput")
                 ),
                 fluidRow(
                   h1("Range TBA")
                 )
        )
      )
    )
  )
)

# Run the application 
shinyApp(ui = ui, server = server)