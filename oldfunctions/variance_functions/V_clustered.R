
V_clustered <- function(dparms) {
  
  list2env(as.list(dparms), envir=environment())
  
  de <- 1+(n-1)*icc-(R2_1+(n*R2_2-R2_1)*icc)
  
  result <- de/(G*(1-G)*mtotal*n)
  
  return(result)
  
}
