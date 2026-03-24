
library(plotly)
library(tidyverse)
library(data.table)
library(shinythemes)
library(ggplot2)
library(ggpubr)
library(shiny)

server <- function(input, output) {
  
  load(system.file("app/appData.RData", package = "plannerPackage"))
  
  
  #### AUTO Generated Menus ####
  
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
  
  ##inference menu currently does not add, made reactive. the above is not rendured
  
  input_inference <- reactive({
    req(input$sample)

    req(input$design)

    inference <- "waiting"
    if (input$sample != "waiting" & input$design != "waiting") {
      inference <-  strsplit(menuBank[["samplePicked"]][[input$sample]][["designPicked"]][[input$design]][["inferenceMenu"]][["children"]][[2]][["children"]][[1]][["children"]][[1]],'"')[[1]][2]
    }
    return(
      inference     
      )
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
      ]][[paste0(input$design,"_",input_inference(),"_",input$model)
      ]][["inputs"]]
    )
    set_list_drop <- length(set_list) #remove "ranges," the last element
    return(menuBank$samplePicked[[input$sample
    ]][["designPicked"
    ]][[input$design
    ]][["dimPicked"
    ]][[paste0(input$design,"_",input_inference(),"_",input$model)
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
  
  #### POWER, MDES, alpha sliders ####
  
  tails <- reactive({
    return(2)
  })
  
  output$effectsizeSlider <- renderUI({
    req(input$design)
    req(input$design != "waiting")
    req(input_inference())
    req(input_inference() != "waiting")
    req(input$model)
    req(input$model != "waiting")
    sliderInput("es",
                "Select expected effect size", 
                value = .3,
                min = .05, 
                max = 1.5, 
                step = .01)
  })
  
  output$starterPowerSlider <- renderUI({
    req(input$design)
    req(input$design != "waiting")
    req(input_inference())
    req(input_inference() != "waiting")
    req(input$model)
    req(input$model != "waiting")
    sliderInput("starterpower",
                "Select desired power", 
                value = .8,
                min = .5, 
                max = .99, 
                step = .01)
  })
  
  output$alphaMenu <- renderUI({
    req(input$design)
    req(input$design != "waiting")
    req(input_inference())
    req(input_inference() != "waiting")
    req(input$model)
    req(input$model != "waiting")
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
  
  
  #### N ####
  
  N <- reactive({
    req(input$design)
    req(input$design != "waiting")
    req(input_inference())
    req(input_inference() != "waiting")
    req(input$model)
    req(input$model != "waiting")
    
    dim_N <- paste0(input$design,"_",input_inference(),"_",input$model,"_N")
    
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
  
  #### df ####
  
  df <- reactive({
    req(input$design)
    req(input$design != "waiting")
    req(input_inference())
    req(input_inference() != "waiting")
    req(input$model)
    req(input$model != "waiting")
    
    dim_df <- paste0(input$design,"_",input_inference(),"_",input$model,"_df")
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
  
  #### V factor ####
  
  V <- reactive({
    req(input$design)
    req(input$design != "waiting")
    req(input_inference())
    req(input_inference() != "waiting")
    req(input$model)
    req(input$model != "waiting")
    
    dim_V <- paste0(input$design,"_",input_inference(),"_",input$model,"_V")
    
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
  
  #### NCP ####
  
  ncp <- reactive({
    req(input$design)
    req(input$design != "waiting")
    req(input_inference())
    req(input_inference() != "waiting")
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
  
  #### beta ####
  
  beta <- reactive({
    req(input$design)
    req(input$design != "waiting")
    req(input_inference())
    req(input_inference() != "waiting")
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
  
  #### power ####
  
  power <- reactive({
    req(input$design)
    req(input$design != "waiting")
    req(input_inference())
    req(input_inference() != "waiting")
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
  
  
  #### mdes ####
  
  exact_mdes <- reactive({
    req(V()$value)
    req(df()$value)
    req(alpha())
    req(tails())
    req(input$starterpower)
    compute_mdes(
      V = V()$value, 
      df = df()$value, 
      alpha = alpha(), 
      tails = tails(), 
      beta = 1-input$starterpower
    )
  })
  
  output$mdes_round <- renderUI({
    numericInput("mdesdigits", "digits for mdes", value = 2, step = 1)
  })
  
  output$exact_mdes_report <- renderUI({
    req(V()$value)
    req(df()$value)
    req(alpha())
    req(tails())
    req(input$starterpower)
    if (is.null(input$mdesdigits)) {
      digits <- 2
    }
    else {
      digits <- input$mdesdigits
    }
    text_make <- paste0("The minimum detectable effect size for this design is ",
                        round(exact_mdes(), digits = digits),
                        " standard deviations. The total sample size of this design is ",
                        N()$value,
                        ".")
    h4(text_make)
  })
  
  #### QED MATCHING ####
  
  output$qedScenarioMenu <- renderUI({
    selectInput("qedScenario",
                "Pick the Selection Scenario",
                choices = c(
                  "make choice/reset" = "waiting",
                  "Random Selection of Schools to treatment" = "between_random",
                  "Systematic Selection of Schools to treatment" = "between_biased"
                )
    )
    
  })
  
  output$selectionTitle <- renderUI({
    req(input$qedScenario != "waiting")
    h3("Select Schools")
  })
  
  qedData <- reactive({
    req(input$qedScenario != "waiting")
    data <- qed_data[[input$qedScenario]] %>% select(-posttest) %>% data.frame()
    return(data)
  })
  
  #### QED Treatment Stats
  
  # qedData_stats_treat <- reactive({
  #   req(qedData())
  #   data <- qedData() %>% 
  #     filter(treat == 1) %>% 
  #     select(-treat) %>%
  #     group_by(school) %>%
  #     mutate(N = n()) %>%
  #     summarise_all(c("mean","sd")) %>%
  #     mutate(N = N_mean) %>%
  #     select(-c(N_mean, N_sd)) %>%
  #     relocate(c(school,N)) %>%
  #     data.frame() %>% round(digits = 2)
  #   return(data)
  # })
  # 
  # output$qedTableTreat <- renderDataTable({
  #   req(qedData_stats_treat())
  #   qedData_stats_treat() %>% 
  #     select(-ends_with("_sd")) %>% 
  #     rename_with(~gsub("_mean","",.x))
  # },options = list(
  #   columnDefs = list(list(className = 'dt-center', targets = 5)),
  #   pageLength = 10,
  #   lengthMenu = c(10, 15, 20, 50, 100)
  # )
  # )
  # 
  # output$qedTableTreatUI <- renderUI({
  #   req(qedData_stats_treat())
  #   dataTableOutput("qedTableTreat")
  # })
  # 
  # 
  # output$qedTableTreatTitle <- renderUI({
  #   req(qedData_stats_treat())
  #   h3("Treatment Schools")
  # })
  # 
  # #### QED Treatment PICK ####
  # 
  # output$treatPick <- renderUI({
  #   req(qedData_stats_treat())
  #   selectizeInput("treatpicked", 
  #                  "Select treatment schools",
  #                  choices = qedData_stats_treat()$school,
  #                  select = qed_data[[paste0(input$qedScenario, "_treatlist")]],
  #                  multiple = TRUE)
  #   
  # })
  # 
  # 
  # #### QED Picked Treatment M and S for M-D ####
  # 
  # qed_mahalanobis_center <- reactive({
  #   req(input$treatpicked)
  #   center_vector <- qedData() %>% 
  #     filter(school %in% input$treatpicked) %>% 
  #     select(-contains(c("school","treat"))) %>% 
  #     summarise_all(mean) %>%
  #     as.matrix()
  #   
  #   
  # })
  # 
  # qed_mahalanobis_Sigma <- reactive({
  #   req(input$treatpicked)
  #   
  #   Sigma <- qedData() %>% 
  #     filter(school %in% input$treatpicked) %>% 
  #     select(-contains(c("school","treat"))) %>% 
  #     data.frame() %>%
  #     cov()
  # })
  # 
  # 
  # #### QED Compare Stats ####
  # 
  # qedData_stats_compare <- reactive({
  #   req(qedData())
  #   req(qed_mahalanobis_center())
  #   req(qed_mahalanobis_Sigma())
  #   
  #   data <- qedData() %>% 
  #     filter(treat == 0)
  #   
  #   data$d <- mahalanobis(data %>%
  #                           select(-contains(c("school","treat"))) %>% 
  #                           data.frame()
  #                         ,center = qed_mahalanobis_center(), 
  #                         cov = qed_mahalanobis_Sigma()) 
  #   data <- data %>% 
  #     select(-treat) %>%
  #     group_by(school) %>%
  #     mutate(N = n()) %>%
  #     summarise_all(c("mean","sd")) %>%
  #     mutate(N = N_mean) %>%
  #     mutate(Mahalanobis_Distance = d_mean) %>%
  #     select(-c(N_mean, N_sd, d_mean, d_sd)) %>%
  #     relocate(c(school,N)) %>%
  #     data.frame() 
  #   
  #   data <- data %>% 
  #     relocate(c(school, N, Mahalanobis_Distance)) %>% 
  #     data.frame() %>% round(digits = 2) 
  #   
  #   return(data)
  # })
  # 
  # output$qedTableCompare <- renderDataTable({
  #   req(qedData_stats_compare())
  #   qedData_stats_compare() %>% 
  #     select(-ends_with("_sd")) %>% 
  #     rename_with(~gsub("_mean","",.x))
  # }, options = list(
  #   columnDefs = list(list(className = 'dt-center', targets = 5)),
  #   pageLength = 5,
  #   lengthMenu = c(5, 10, 15, 20, 50, 100)
  # )
  # )
  # 
  # output$qedTableCompareUI <- renderUI({
  #   req(qedData_stats_compare())
  #   dataTableOutput("qedTableCompare")
  # })
  # 
  # 
  # output$qedTableCompareTitle <- renderUI({
  #   req(qedData_stats_compare())
  #   h3("Comparison Schools")
  # })
  # 
  # output$qedDescribeTitle <- renderUI({
  #   req(qedData_stats_compare())
  #   h3("All Descriptive Data")
  # })
  # 
  # 
  # #### QED Compare Pick ####
  # 
  # output$comparePick <- renderUI({
  #   req(qedData_stats_compare())
  #   selectizeInput("comparepicked", 
  #                  "Select comparison schools",
  #                  choices = qedData_stats_compare()$school,
  #                  select = qed_data[[paste0(input$qedScenario, "_comparelist")]],
  #                  multiple = TRUE)
  # })
  # 
  # qed_made_data <- reactive({
  #   req(input$treatpicked)
  #   req(input$comparepicked)
  #   data <- rbind(
  #     qedData() %>% filter(school %in% input$treatpicked) %>% mutate(treat = 1) %>% data.frame(),
  #     qedData() %>% filter(school %in% input$comparepicked) %>% mutate(treat = 0) %>% data.frame()
  #   )
  #   return(data)
  # })
  # 
  # 
  # sumstats <- reactive({
  #   req(qed_made_data())
  #   sumstats <- qed_made_data() %>% 
  #     select(-school) %>%
  #     group_by(treat) %>% 
  #     mutate(n = n()) %>%
  #     summarise_all(c("mean", "sd"), na.rm = TRUE) %>%
  #     ungroup() %>%
  #     mutate(n = n_mean) %>%
  #     select(-c(n_mean, n_sd)) %>%
  #     relocate(c(treat, n)) %>%
  #     data.frame()
  #   
  #   return(sumstats)
  #   
  # })
  # 
  # balancestats <- reactive({
  #   req(sumstats()) 
  #   results<- list()
  #   for (v in qed_vars) {
  #     n_c <- sumstats()[1,"n"]
  #     n_i <- sumstats()[2,"n"]
  #     sd_c <- sumstats()[1,paste0(v,"_sd")]
  #     sd_i <- sumstats()[2,paste0(v,"_sd")]
  #     m_c <- sumstats()[1,paste0(v,"_mean")]
  #     m_i <- sumstats()[2,paste0(v,"_mean")]
  #     
  #     if (v == "pretest") {
  #       results[[v]] <- (1-(3/(4*(n_i+n_c)-9)))*((m_i-m_c)/(sqrt((sd_c^2*(n_c-1)+sd_i^2*(n_i-1))/(n_c+n_i-2)))
  #       )
  #     }
  #     else {
  #       results[[v]] <- (1-(3/(4*(n_i+n_c)-9)))*log((m_i*(1-m_c))/(m_c*(1-m_i)))/1.65
  #     }
  #     
  #     results[["Mahalanobis_Distance"]] <- qed_made_data() %>% 
  #       filter(treat == 0) %>%
  #       select(-c(school,treat)) %>%
  #       data.frame() %>% 
  #       mahalanobis(center = qed_mahalanobis_center(), 
  #                   cov = qed_mahalanobis_Sigma()) %>% 
  #       mean() %>% sqrt()
  #     
  #     
  #   }
  #   result <- do.call(data.frame,results) %>% 
  #     relocate(Mahalanobis_Distance) %>% data.frame()
  #   return(result)
  #   
  # })
  # 
  # output$sum_stats_table <- renderTable({
  #   req(sumstats())
  #   sumstats() %>%
  #     select(-contains("_sd")) %>%
  #     rename_with(~gsub("_mean","",.x))
  #   
  # }, options = list(
  #   columnDefs = list(list(className = 'dt-center', targets = 5)),
  #   pageLength = 5,
  #   lengthMenu = c(5, 10, 15, 20)
  # )
  # )
  # 
  # output$sum_stats_tableUI <- renderUI({
  #   req(sumstats())
  #   tableOutput("sum_stats_table")
  #   
  # })
  # 
  # output$sum_stats_tableTitle <- renderUI({
  #   req(sumstats())
  #   h3("Means across Students by Treatment and Control")
  #   
  # })
  # 
  # output$balance_stats_table <- renderTable({
  #   req(balancestats())
  #   balancestats()
  #   
  #   
  # })
  # 
  # output$balance_stats_tableUI <- renderUI({
  #   req(balancestats())
  #   tableOutput("balance_stats_table")
  #   
  # })
  # 
  # output$balance_stats_tableTitle <- renderUI({
  #   req(balancestats())
  #   h3("Balance Statistics between Treatment and Control")
  #   
  # })
  # 
  # output$explorepanels <- renderUI({
  #   req(input$qedScenario != "waiting")
  #   tabsetPanel(
  #     tabPanel(
  #       "Explore Comparison Schools",
  #       fluidRow(
  #         uiOutput("qedTableCompareTitle"),
  #         uiOutput("qedTableCompareUI")
  #       )
  #     ),
  #     tabPanel(
  #       "Explore Treatment Schools",
  #       fluidRow(
  #         uiOutput("qedTableTreatTitle"),
  #         uiOutput("qedTableTreatUI")
  #       )
  #     )
  #     
  #   )
  # })
  
  
  #### Randomization ####
  
  output$chooseASeed <- renderUI({
    selectInput("choose_a_seed",
                "Would you like to set a seed for randomization?",
                c("Yes","No"),
                "No")
  })
  
  output$setTheSeed <- renderUI({
    req(input$choose_a_seed)
    if (input$choose_a_seed == "Yes") {
      numericInput("the_set_seed",
                   "Type a number",
                   value = 123456)
    }
  })
  
  output$howManyRandomizeSlider <- renderUI({
    req(input$choose_a_seed)
    sliderInput("howManyRandomize",
                label = "How many units should we randomize?",
                min = 6, 
                max = 24,
                value = 10,
                step = 2)
  })
  
  output$howManyTreatmentSlider <- renderUI({
    req(input$choose_a_seed)
    req(input$howManyRandomize)
    sliderInput("howManyTreatment",
                label = "How many units should we assign treatment?",
                min = 2, 
                max = input$howManyRandomize-2,
                value = input$howManyRandomize/2,
                step = 1)
  })
  
  
  dataToRandomize <- reactive({
    req(input$howManyRandomize)
    req(input$howManyTreatment)
    req(input$choose_a_seed)
    req(input$rerandomize)
    if (input$choose_a_seed == "Yes") {
      if (!is.null(input$the_set_seed)) {
        set.seed(input$the_set_seed)
      }
      else {
        set.seed(round(runif(1,1,999999)))
      }
    }
    if (input$choose_a_seed == "No") {
      set.seed(round(runif(1,1,999999)))
    }
    
    the_assignments <- rep(2,input$howManyRandomize)
    the_assignments[sample(
      seq(to = input$howManyRandomize, from = 1),
      size = input$howManyTreatment
    )] <- 1
    return(
      data.frame(
        cbind(
          y = seq(from = input$howManyRandomize, to = 1),
          person = seq(to = input$howManyRandomize, from = 1),
          x = rep(1,input$howManyRandomize), 
          value = the_assignments
        )
      )
    )
  })
  
  chooseStatement <- reactive({
    req(input$howManyRandomize)
    req(input$howManyTreatment)
    phrase <- paste0(
      "There are ",
      prettyNum(choose(input$howManyRandomize,input$howManyTreatment), big.mark = ",", scientific = FALSE),
      " ways to randomize ",
      input$howManyTreatment,
      " units to treatment from a set of ",
      input$howManyRandomize,"."
      
    )
    return(phrase)
  })
  
  output$theChooseStatement <- renderUI({
    req(input$howManyRandomize)
    req(input$howManyTreatment)
    req(chooseStatement())
    h4(chooseStatement())
  })
  
  the_randomization_plot <- reactive({
    if (length(dataToRandomize())==0) {
      return(
        ggplot() + geom_blank()
      )
    }
    else {
      return(
        plot_cards(
          dataToRandomize()
        )
      )
    }
  })
  
  output$plotOfRandomize <- renderPlot({
    req(input$howManyRandomize)
    req(input$howManyTreatment)
    req(dataToRandomize())
    the_randomization_plot()
  },height = 750)
  
  
  
}


#### UI #####

ui <- fluidPage(
  theme = shinytheme("paper"),
  # Application title
  titlePanel(
    "Planner BETA"
  ),
  tabsetPanel(
    tabPanel(
      "Randomization",
      fluid = TRUE,
      fluidPage(
        sidebarLayout(
          sidebarPanel(
            uiOutput("howManyRandomizeSlider"),
            uiOutput("howManyTreatmentSlider"),
            actionButton("rerandomize", "Randomization/re-randomization "),
            uiOutput("chooseASeed"),
            uiOutput("setTheSeed"),
            uiOutput("theChooseStatement")
          ),
          mainPanel(
            plotOutput("plotOfRandomize")
          )
        )
        
      )
    ),
    tabPanel(
      "Power and MDES", 
      fluid = TRUE,
      sidebarLayout(
        sidebarPanel(
          uiOutput("sampleMenu"),
          uiOutput("designMenu"),
          uiOutput("modelMenu"),
          uiOutput("input_set"),
          h6("other settings; typical defaults"),
          uiOutput("alphaMenu"),
          #uiOutput("inferenceMenu"),
          uiOutput("tailsMenu")
          
        ),
        
        # Show 
        mainPanel(
          tabsetPanel(
            tabPanel(
              "MDES",
              fluidRow(
                uiOutput("starterPowerSlider"),
                uiOutput("exact_mdes_report"),
                tabsetPanel (
                  tabPanel("Hide output controls"),
                  tabPanel("Adjust output",
                           uiOutput("mdes_round")
                           )
                )
                
              )
            ),
            tabPanel(
              "Power",
              uiOutput("effectsizeSlider"),
              fluidRow(
                plotlyOutput("power_graph_plotly")
              )
            )
          )
        )
      )
    ) #,
    # tabPanel(
    #   "QED Selection",
    #   fluid = TRUE,
    #   fluidPage(
    #     uiOutput("qedScenarioMenu"),
    #     mainPanel(
    #       fluidRow(
    #         uiOutput("balance_stats_tableTitle"),
    #         uiOutput("balance_stats_tableUI"),
    #         uiOutput("sum_stats_tableTitle"),
    #         uiOutput("sum_stats_tableUI")
    #       ),
    #       fluidRow(
    #         uiOutput("selectionTitle"),
    #         column(6,
    #                uiOutput("comparePick")
    #         ),
    #         column(6,
    #                uiOutput("treatPick")
    #         )
    #       ),
    #       uiOutput("explorepanels")
    #     )
    #   )
    # )
  )
)

# Run the application 
shinyApp(ui = ui, server = server)

