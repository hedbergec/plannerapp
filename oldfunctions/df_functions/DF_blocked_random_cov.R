
####not sure this is right

DF_blocked_random_cov <- function(dparms) { #pulls info from dparms and produces the degress of freedom
  list2env(dparms, envir=environment()) 
  nbar <- 2/(1/nt+1/nc)
  result <- nbar*m - 2 - q
  
  return(result)
  
}



