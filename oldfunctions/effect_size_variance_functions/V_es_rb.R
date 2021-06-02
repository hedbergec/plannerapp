

V_es_rb <- function(dparms) {
  list2env(dparms, envir=environment())
  nbar <- 2/(1/nc+1/nt)
  numer <- ((1-R2_1)+(1-Q2)*nbar*tau2*iccbar)*(nc+nt)
  denom <- m*nc*nt
  return(numer/denom)
}



