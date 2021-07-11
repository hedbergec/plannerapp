
# Creation of Fake Data for Examples

library(tidyverse) #data management
library(readxl) #reading excel file
library(mnormt) #for random mvnorm data
source("stable functions/make_school_function.R")

theta_data <- read_excel("support materials/school_list.xlsx", sheet = "means") %>% 
  data.frame() %>% 
  round(digits = 2) 

school_ids <- theta_data$sch
var_names <- names(theta_data)

summ_stats <- list()

### Within-Random
# school_data <- list()
# for (j in school_ids) {
#   school_data[[j]] <- make_school(
#     id = j,
#     n = sample(2:4, 1)*theta_data[which(theta_data$sch == j),"n"], #2 to 4 times bigger than seed data
#     delta = .5,
#     x_means = theta_data[which(theta_data$sch == j),
#                          grep("stu_", var_names)],
#     x_sigma_matrix = read_excel("support materials/school_list.xlsx", 
#                                 sheet = paste0("cov",j))[,-1] %>% 
#       data.frame(),
#     w_values =  theta_data[which(theta_data$sch == j),
#                            grep("sch_", var_names)]
#   )
# }
# 
# data_together <- do.call(rbind, school_data) %>%
#   mutate(school = schid, female = stu_f_sex2, nonwhite = stu_f_urm2, ses = stu_f_ses, pretest = round(60+10*stu_c_base),
#          posttest = round(60+10*stu_c_y), region = sch_f_region, private = sch_f_sec2, urban = sch_f_urb2) %>%
#   select(school, treat, female, nonwhite, ses, pretest, posttest, region, private, urban) 
# 
# summ_stats$within_random <- summary(data_together)
# 
# write.csv(data_together, file = "Data/within_random.csv", row.names = FALSE)

### Within-biased

# school_data <- list()
# for (j in school_ids) {
#   school_data[[j]] <- make_school(
#     id = j,
#     n = sample(2:4, 1)*theta_data[which(theta_data$sch == j),"n"], #2 to 4 times bigger than seed data
#     delta = .5,
#     x_means = theta_data[which(theta_data$sch == j),
#                          grep("stu_", var_names)],
#     x_sigma_matrix = read_excel("support materials/school_list.xlsx", 
#                                 sheet = paste0("cov",j))[,-1] %>% 
#       data.frame(),
#     w_values =  theta_data[which(theta_data$sch == j),
#                            grep("sch_", var_names)],
#     t_weights = c(stu_c_base = -.25, stu_f_ses = .15, stu_f_urm2 = .05)
#   )
# }
# 
# data_together <- do.call(rbind, school_data) %>%
#   mutate(school = schid, female = stu_f_sex2, nonwhite = stu_f_urm2, ses = stu_f_ses, pretest = round(60+10*stu_c_base),
#          posttest = round(60+10*stu_c_y), region = sch_f_region, private = sch_f_sec2, urban = sch_f_urb2) %>%
#   select(school, treat, female, nonwhite, ses, pretest, posttest, region, private, urban) 
# 
# summ_stats$within_biased <- summary(data_together)
#   
#  write.csv(data_together, file = "Data/within_biased.csv", row.names = FALSE)

### cluster-Random
school_data <- list()
for (j in school_ids) {
  school_data[[j]] <- make_school(
    id = j,
    n = sample(2:4, 1)*theta_data[which(theta_data$sch == j),"n"], #2 to 4 times bigger than seed data
    delta = .5,
    x_means = theta_data[which(theta_data$sch == j),
                         grep("stu_", var_names)],
    x_sigma_matrix = read_excel("support materials/school_list.xlsx", 
                                sheet = paste0("cov",j))[,-1] %>% 
      data.frame(),
    w_values =  theta_data[which(theta_data$sch == j),
                           grep("sch_", var_names)],
    cluster_t = TRUE
  )
}

data_together <- do.call(rbind, school_data) %>%
  mutate(school = schid, female = stu_f_sex2, nonwhite = stu_f_urm2, ses = stu_f_ses, pretest = round(60+10*stu_c_base),
         posttest = round(60+10*stu_c_y), region = sch_f_region, private = sch_f_sec2, urban = sch_f_urb2) %>%
  select(school, treat, female, nonwhite, ses, pretest, posttest, region, private, urban) 

summ_stats$between_random <- summary(data_together)

 write.csv(data_together, file = "Data/between_random.csv", row.names = FALSE)

### cluster-biased-type of student
# school_data <- list()
# for (j in school_ids) {
#   school_data[[j]] <- make_school(
#     id = j,
#     n = sample(2:4, 1)*theta_data[which(theta_data$sch == j),"n"], #2 to 4 times bigger than seed data
#     delta = .5,
#     x_means = theta_data[which(theta_data$sch == j),
#                          grep("stu_", var_names)],
#     x_sigma_matrix = read_excel("support materials/school_list.xlsx", 
#                                 sheet = paste0("cov",j))[,-1] %>% 
#       data.frame(),
#     w_values =  theta_data[which(theta_data$sch == j),
#                            grep("sch_", var_names)],
#     t_weights = c(stu_c_base = -.1, stu_f_ses = .1, stu_f_urm2 = .05),
#     cluster_t = TRUE
#   )
# }
# 
# data_together <- do.call(rbind, school_data) %>%
#   mutate(school = schid, female = stu_f_sex2, nonwhite = stu_f_urm2, ses = stu_f_ses, pretest = round(60+10*stu_c_base),
#          posttest = round(60+10*stu_c_y), region = sch_f_region, private = sch_f_sec2, urban = sch_f_urb2) %>%
#   select(school, treat, female, nonwhite, ses, pretest, posttest, region, private, urban) 
# 
# summ_stats$between_biased_student <-summary(data_together)
# 
# write.csv(data_together, file = "Data/between_biased_student.csv", row.names = FALSE)


### cluster-biased-type of school
# school_data <- list()
# for (j in school_ids) {
#   school_data[[j]] <- make_school(
#     id = j,
#     n = sample(2:4, 1)*theta_data[which(theta_data$sch == j),"n"], #2 to 4 times bigger than seed data
#     delta = .5,
#     x_means = theta_data[which(theta_data$sch == j),
#                          grep("stu_", var_names)],
#     x_sigma_matrix = read_excel("support materials/school_list.xlsx", 
#                                 sheet = paste0("cov",j))[,-1] %>% 
#       data.frame(),
#     w_values =  theta_data[which(theta_data$sch == j),
#                            grep("sch_", var_names)],
#     t_weights = c( 
#                   sch_f_urb2 = .05,
#                   sch_f_sec2 = -.05),
#     cluster_t = TRUE
#   )
# }
# 
# data_together <- do.call(rbind, school_data) %>%
#   mutate(school = schid, female = stu_f_sex2, nonwhite = stu_f_urm2, ses = stu_f_ses, pretest = round(60+10*stu_c_base),
#          posttest = round(60+10*stu_c_y), region = sch_f_region, private = sch_f_sec2, urban = sch_f_urb2) %>%
#   select(school, treat, female, nonwhite, ses, pretest, posttest, region, private, urban) 
# 
# summ_stats$between_biased_school <- summary(data_together)
# 
#  write.csv(data_together, file = "Data/between_biased_school.csv", row.names = FALSE)


### cluster-biased-type of student and school
school_data <- list()
for (j in school_ids) {
  school_data[[j]] <- make_school(
    id = j,
    n = sample(2:4, 1)*theta_data[which(theta_data$sch == j),"n"], #2 to 4 times bigger than seed data
    delta = .5,
    x_means = theta_data[which(theta_data$sch == j),
                         grep("stu_", var_names)],
    x_sigma_matrix = read_excel("support materials/school_list.xlsx",
                                sheet = paste0("cov",j))[,-1] %>%
      data.frame(),
    w_values =  theta_data[which(theta_data$sch == j),
                           grep("sch_", var_names)],
    t_weights = c(
                  sch_f_urb2 = .05,
                  stu_c_base = .1, stu_f_ses = -.1,
                  stu_f_urm2 = -.05),
    cluster_t = TRUE
  )
}

data_together <- do.call(rbind, school_data) %>%
  mutate(school = schid, female = stu_f_sex2, nonwhite = stu_f_urm2, ses = stu_f_ses, pretest = round(60+10*stu_c_base),
         posttest = round(60+10*stu_c_y), region = sch_f_region, private = sch_f_sec2, urban = sch_f_urb2) %>%
  select(school, treat, female, nonwhite, ses, pretest, posttest, region, private, urban)

summ_stats$between_biased_school_student <- summary(data_together)

write.csv(data_together, file = "Data/between_biased_school_student.csv", row.names = FALSE)
# 
# summ_stats
