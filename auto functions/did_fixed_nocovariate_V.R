# NOTE this code auto-written based on menuManager sheet code
did_fixed_nocovariate_V <- function(
	nt,
	nc,
	ar
	){
		V <- (nt*nc)/(nt+nc)*(1/(2*(1-ar)))
	return(V)
}

