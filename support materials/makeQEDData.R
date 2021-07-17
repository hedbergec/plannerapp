
# Creation of Fake Data for Examples

library(tidyverse) #data management
library(readxl) #reading excel file
library(mnormt) #for random mvnorm data
source("stable functions/make_school_function.R")

set.seed(170123)

theta_data <- read_excel("support materials/school_list.xlsx", sheet = "means") %>% 
  data.frame() %>% 
  round(digits = 2) 

school_ids <- theta_data$sch
var_names <- names(theta_data)

reps <- 1

school_data <- list()
for (j in school_ids) {
  for (rep in 1:reps*3) {
    school_data[[max(school_ids)*rep+j-max(school_ids)]] <- make_school(
      id = max(school_ids)*rep+j-max(school_ids),
      n = sample(5:6, 1)*theta_data[which(theta_data$sch == j),"n"], #5 to 6 times bigger than seed data
      delta = .5,
      x_means = theta_data[which(theta_data$sch == j),
                           grep("stu_", var_names)],
      x_sigma_matrix = read_excel("support materials/school_list.xlsx",
                                  sheet = paste0("cov",j))[,-1] %>%
        data.frame(),
      w_values =  theta_data[which(theta_data$sch == j),
                             grep("sch_", var_names)],
      t_weights = c(cons = -.05),
      cluster_t = TRUE
    )
  }
}

data_together <- do.call(rbind, school_data) %>%
  mutate(school = schid, female = stu_f_sex2, nonwhite = stu_f_urm2, ses = stu_f_ses, pretest = round(60+10*stu_c_base),
         posttest = round(60+10*stu_c_y), region = sch_f_region, private = sch_f_sec2, urban = sch_f_urb2) %>%
  select(school, treat, female, nonwhite, ses, pretest, posttest, region, private, urban)

write.csv(data_together, file = "Data/between_random.csv", row.names = FALSE)

set.seed(170111)

school_data <- list()
for (j in school_ids) {
  for (rep in 1:reps) {
    school_data[[max(school_ids)*rep+j-max(school_ids)]] <- make_school(
      id = max(school_ids)*rep+j-max(school_ids),
      n = sample(5:6, 1)*theta_data[which(theta_data$sch == j),"n"], #5 to 6 times bigger than seed data
      delta = .5,
      x_means = theta_data[which(theta_data$sch == j),
                           grep("stu_", var_names)],
      x_sigma_matrix = read_excel("support materials/school_list.xlsx",
                                  sheet = paste0("cov",j))[,-1] %>%
        data.frame(),
      w_values =  theta_data[which(theta_data$sch == j),
                             grep("sch_", var_names)],
      t_weights = c(cons = -.05, stu_c_base = .2),
      cluster_t = TRUE
    )
  }
}

data_together <- do.call(rbind, school_data) %>%
  mutate(school = schid, female = stu_f_sex2, nonwhite = stu_f_urm2, ses = stu_f_ses, pretest = round(60+10*stu_c_base),
         posttest = round(60+10*stu_c_y), region = sch_f_region, private = sch_f_sec2, urban = sch_f_urb2) %>%
  select(school, treat, female, nonwhite, ses, pretest, posttest, region, private, urban)

write.csv(data_together, file = "Data/between_biased.csv", row.names = FALSE)

