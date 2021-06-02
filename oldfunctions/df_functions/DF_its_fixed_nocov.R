#### Looks like Stata computes this by m*(T*P - 1) + m*(T-T*P-1) - 1, where the extra 1 is the time trend, 
#### looks like the within-cell error of a two-way anova

DF_its_fixed_nocov <- function(dparms) { 
  list2env(dparms, envir=environment())
  result <- m*(pretime-1) + m*(posttime - 1) - 1
  
  return(result)
  
}


