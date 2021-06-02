
V_blocked <- function(dparms) {
  
  list2env(as.list(dparms), envir=environment())
  
  numer <- ((1-R2_1)*iccbar+(1-Q2)*nbar*tau2*iccbar)*(nc+nt)
  denom <- m*nc*nt
  
  return(numer/denom)
  
}



