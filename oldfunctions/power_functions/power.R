

power <- function(dparms) {
  list2env(dparms, envir=environment()) 
  beta <- pt(critical,dof,ncp) - pt(-critical,dof,ncp)
  power <- 1-beta
  return(power)
}




