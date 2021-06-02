#### Looks like Stata computes this by mc*(totaltime - 1) + mt*(pretime-1) + mt(posttime - 1) - 1, where the extra 1 is the time trend, 
#### looks like the within-cell error of a two-way anova

DF_cits_fixed_nocov <- function(dparms) { #pulls info from dparms and produces the degress of freedom
  list2env(dparms, envir=environment()) 
  result <- mc*(pretime + posttime -1) + mt*(pretime - 1) + mt*(posttime - 1) - 1
  
  return(result)
  
}


