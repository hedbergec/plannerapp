#### Setup 
#### reads functions
#### makes ui lists
#### saves environment for app
#### git push --set-upstream plannerapp master

# steppcenter@northwestern.edu

#https://canvas.northwestern.edu/courses/135809
#NetID: ehr6170 

source("support materials/makeQEDData.R")

rm(list = ls()) #clean slate
system('rm -R "./auto functions/"')
dir.create("auto functions")

library(readxl)
library(readr)
library(tidyverse)
library(shiny)
library(plotly)
library(data.table)

#### Read in manager specs from xls file

managerSheets <- excel_sheets("support materials/menuManager.xlsx")

manager <- list()

for (sheet in managerSheets) {
  manager[[paste0(sheet,"Manager")]] <- read_excel("support materials/menuManager.xlsx", sheet = sheet)
}

#### generate uis based on manager files

waitchoice = c("make choice/reset" = "waiting") #generic first option
nonechoice = c("none" = "none") #generic none option

sample_list <- manager$sampleManager %>%
  select(sample, label) %>% 
  as.matrix()

menuBank <- list( #start the menu bank list with the menu of sample and copy of manager info
  sampleMenu = selectInput(
    inputId = "sample",
    label = "What is your sample type?", 
    choices = c(waitchoice, setNames(sample_list[,1], sample_list[,2]))
  ),
  samplePicked = list(), #empty list for choices
  managerData = manager,
  functionList = list()
)

for (sample in sample_list[,1]) {
  
  design_list <- manager$designManager %>% #create named vector of designs based on selected sample
    filter(!!sym(sample)) %>%
    select(design, label) %>%
    as.matrix()
  menuBank[["samplePicked"]][[sample]] <- list( #start the menu bank list with the menu of sample
    designMenu = selectInput(
      inputId = "design",
      label = "What is your design?", 
      choices = c(waitchoice, setNames(design_list[,1], design_list[,2]))
    ),
    designPicked = list() #empty list for choices
  )
  
  for (design in design_list[,1]) { #loop over designs possible from selected sample
    model_list <- manager$modelManager %>% #create named vector of designs based on selected sample
      filter(!!sym(design)) %>%
      select(model, label) %>%
      as.matrix() #creates 2 columns, the first is the model id, the second its label
    
    inference_list <- manager$inferenceManager %>% #create named vector of inferences based on selected sample
      filter(!!sym(design)) %>%
      select(inference, label) %>%
      as.matrix() #creates 2 columns, the first is the inference id, the second its label
    
    if (nrow(inference_list) > 1) {
      choice_list_inference <- c(waitchoice, setNames(inference_list[,1], inference_list[,2]))
    }
    else {
      choice_list_inference <- c(setNames(inference_list[,1], inference_list[,2]))
    }
    
    if (nrow(model_list) > 1) {
      choice_list_model <- c(waitchoice, setNames(model_list[,1], model_list[,2]))
    }
    else {
      choice_list_model <- c(setNames(model_list[,1], model_list[,2]))
    }
    
    
    
    menuBank[["samplePicked"]][[sample]][["designPicked"]][[design]] <- list( #make the inference, model, and stat menus based on sample choices
      
      inferenceMenu = selectInput(inputId = "inference",
                                  label = "What is your inference goal?",
                                  choices = choice_list_inference
      ),
      modelMenu = selectInput(inputId = "model",
                              label = "What is your model?",
                              choices = choice_list_model
      ),
      dimPicked = list() #dim = design, inference, model
    )
    
    dim_list <- expand_grid(design = design,
                            inference = inference_list[,1],
                            model = model_list[,1]) %>% as.matrix()
    
    
    for (i in 1:nrow(dim_list)) {
      
      dim <- paste0(c(dim_list[i,]), collapse = "_")
      
      ### this sets up function files
      
      stat_list <- manager$statManager %>% #create named vector of stats based on selected sample
        filter(!!sym(design)) %>%
        select(stat, label) %>%
        as.matrix() #creates 2 columns, the first is the inference id, the second its label
      
      for (stat in stat_list[,1]) {
        input_list_inputonly <- manager$inputManager %>% #create named vector of inputs based on selected stat
          filter(!!sym(dim_list[i,"design"])) %>%
          filter(!!sym(dim_list[i,"inference"])) %>%
          filter(!!sym(dim_list[i,"model"])) %>%
          filter(!!sym(stat)) %>%
          select(input) %>%
          as.matrix()
        
        dims <- paste0(dim, "_", stat)
        
        if (nrow(input_list_inputonly) > 0) {
          menuBank[["functionList"]][[dims]] <- list(code = paste0("auto functions/",dims,".R"))
          codeFile <- file(paste0("auto functions/",dims,".R"), "w+")
          writeLines("# NOTE this code auto-written based on menuManager sheet code", con = codeFile)
          writeLines(paste0(dims," <- function("), con = codeFile)
          for (k in 1:nrow(input_list_inputonly)) {
            if (k < nrow(input_list_inputonly)) {
              writeLines(paste0("\t",input_list_inputonly[k,1],","), con = codeFile)
            }
            else {
              writeLines(paste0("\t",input_list_inputonly[k,1]), con = codeFile)
            }
            
          }
          writeLines("\t){", con = codeFile)
          
          code_list <- manager$codeManager %>% #create named vector of inputs based on selected stat
            filter(function_name == dims) %>%
            discard(~all(is.na(.x))) %>%
            as.matrix()
          
          if (length(code_list[-1]) > 0) {
            writeLines(paste0("\t\t",paste0(code_list[-1], collapse = "\n\t\t")), con = codeFile)
            writeLines(paste0("\treturn(",stat,")"), con = codeFile)
          }
          else {
            writeLines("\t\treturn(NULL)", con = codeFile)
          }
          
          writeLines("}", con = codeFile)
          writeLines("", con = codeFile)
          close(codeFile)
          
        }
        
        
      }
      
      # create input menus
      
      for (type in c("exact", "range")) {
        input_list <- manager$inputManager %>% #create named vector of inputs based on selected stat
          filter(!!sym(dim_list[i,"design"])) %>%
          filter(!!sym(dim_list[i,"inference"])) %>%
          filter(!!sym(dim_list[i,"model"])) %>%
          select(input, 
                 !!sym(paste0("label_",design)), 
                 !!sym(paste0("ui_value_",type)),
                 min,
                 max,
                 !!sym(paste0("ui_step_",type))
          ) %>%
          as.matrix() #creates 2 columns, the first is the inference id, the second its label
        if (nrow(input_list) >= 1) {
          if (type == "exact") {
            
            menuBank[["samplePicked"]][[sample]][["designPicked"]][[design]][["dimPicked"]][[dim]][["inputs"]] <- list()
            
            for (j in 1:nrow(input_list)) {
              menuBank[["samplePicked"]][[sample]][["designPicked"]][[design]][["dimPicked"]][[dim]][["inputs"]][[input_list[j,1]]]  <- 
                eval(
                  parse(
                    text = paste0( #shiny code for menu
                      "sliderInput(",
                      "inputId = '",input_list[j,1],"',",
                      "label = '", input_list[j,2],"',",
                      "value = ", input_list[j,3],",",
                      "min = ", input_list[j,4], ",",
                      "max = ", input_list[j,5], ",",
                      "step = ", input_list[j,6],")"
                    )
                  )
                )
            }
          }
          if (type == "range") {
            menuBank[["samplePicked"]][[sample]][["designPicked"]][[design]][["dimPicked"]][[dim]][["inputs"]][["ranges"]] <- list(
              rangePickMenu = selectInput(inputId = "rangePick",
                                          label = "Which input would you like to explore?",
                                          choices = c(waitchoice, nonechoice, setNames(input_list[,1], input_list[,2]))
              ),
              rangePicked = list()
            )
            for (j in 1:nrow(input_list)) {
              menuBank[["samplePicked"]][[sample]][["designPicked"]][[design]][["dimPicked"]][[dim]][["inputs"]][["ranges"]][["rangePicked"]][[input_list[j,1]]]  <- 
                eval(
                  parse(
                    text = paste0( #shiny code for menu
                      "sliderInput(",
                      "inputId = '",input_list[j,1],"',",
                      "label = '", input_list[j,2],"',",
                      "value = ", input_list[j,3],",",
                      "min = ", input_list[j,4], ",",
                      "max = ", input_list[j,5], ",",
                      "step = ", input_list[j,6],")"
                    )
                  )
                )
            }
          }
        }
      }
    }
  }
}

elements <- ls()
rm(list = elements[which(elements != "menuBank")]) #clean slate
rm(elements)

#### Source functions

for (dims in names(menuBank[["functionList"]])) {
  source(menuBank[["functionList"]][[dims]][["code"]])
  menuBank[["functionList"]][[dims]][["func"]] <- getAnywhere(dims)
  menuBank[["functionList"]][[dims]][["args"]] <- names(unlist(formals(dims), 
                                                               recursive = TRUE))
}

rm(dims)

for (ofunctions in list.files("stable functions/")) {
  source(paste0("stable functions/",ofunctions))
}

rm(ofunctions)

qed_data <- list()

for (f in list.files("Data")) {
  postdata <- data.frame(read_csv(paste0("Data/",f))) %>% 
    select(-region) %>% 
    select(-private) %>%
    select(-female)
  
  data <- postdata %>% 
    mutate(pretest = scale(pretest)) %>%
    group_by(school) %>%
    mutate(schmean = mean(pretest) > 0)
  
  set.seed(170111)
  
  qed_data[[paste0(sub(".csv","",f),"_comparelist")]] <- unique(c(
    sample(unique(data[which(data$treat == 0 & data$urban == 1),"school"])$school, 1, replace = FALSE),
    sample(unique(data[which(data$treat == 0 & data$urban == 0),"school"])$school, 1, replace = FALSE),
    sample(unique(data[which(data$treat == 0 & data$schmean == 0),"school"])$school, 4, replace = FALSE),
    sample(unique(data[which(data$treat == 0 & data$schmean == 1),"school"])$school, 1, replace = FALSE)
  )
  )
  
  qed_data[[paste0(sub(".csv","",f),"_treatlist")]] <- unique(c(
    sample(unique(data[which(data$treat == 1 & data$urban == 1),"school"])$school, 3, replace = FALSE),
    sample(unique(data[which(data$treat == 1 & data$urban == 0),"school"])$school, 1, replace = FALSE),
    sample(unique(data[which(data$treat == 1 & data$schmean == 0),"school"])$school, 3, replace = FALSE),
    sample(unique(data[which(data$treat == 1 & data$schmean == 1),"school"])$school, 1, replace = FALSE)
  )
  )
  
  
  
  qed_data[[sub(".csv","",f)]] <- postdata %>% 
    filter(treat == 0 | school %in% qed_data[[paste0(sub(".csv","",f),"_treatlist")]]) %>%
    data.frame()
  
  
  
}

qed_vars <- c("nonwhite","ses","pretest", "urban")

rm(f)
rm(data)


save.image("Planner/appData.RData")

#write.csv(cbind(names(menuBank[["functionList"]])), "functions.csv")



