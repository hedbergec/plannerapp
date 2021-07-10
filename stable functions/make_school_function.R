make_school <- function( #function to create a school based on summary stats
  id, #id for school
  n, #size
  delta, #average treatment impact
  x_means, #named vector of normal means, with proportion converted into dummies in returned student file
  x_sigma_matrix, #correlation matrix of underlying relations among stu vars, including y
  w_values, #school-level values pasted on
  t_weights = NULL, #(NULL is RA), otherwise named slopes/means in probit metric of x predicting treatment, 0 is no impact, set baseline with cons
  cluster_t = FALSE #if true, t assignment is school-level based on rounded
) {
  require(mnormt) #needed for randm mvnorm
  require(tidyverse)
  data <- rmnorm(n = n, #make data bsed on means and multivariate normal
                 mean = x_means %>% as.matrix(), 
                 varcov = x_sigma_matrix %>% as.matrix()
  )
  data <- cbind(data, w_values) #attach school values
  for (v in names(data)) { #replace with dummies
    if (grepl("stu_f_",v)==TRUE) {
      data[,v] <- rbinom(nrow(data),1,pnorm(data[,v]))
    }
  }
  tw <- rep(0,1+length(names(data)))
  names(tw) <- c("cons", names(data))
  for (b in names(t_weights)) { #will not loop if no weights are given
    tw[b] <- t_weights[b]
  }
  data$treat <- rbinom(
    nrow(data),
    1,
    pnorm(cbind(cons = 1, data) %>% as.matrix() %*% tw) #if no weights are given, this is a bunch of .5s
  )
  if (cluster_t) { #cluster assignment is rounded mean of treat
    data$treat <- round(mean(data$treat))
  }
  data[,grep("_y",names(data))] <- data[,grep("_y",names(data))] + delta*data$treat #add treatment impact to outcome
  
  data$schid <- id #put id in data
  
  return(data) #return
}





