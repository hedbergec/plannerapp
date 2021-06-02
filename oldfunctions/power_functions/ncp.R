
ncp <- function(dparms) {
  list2env(dparms, envir=environment())
  ncp <- es*sqrt(1/V)
  return(ncp)
}

