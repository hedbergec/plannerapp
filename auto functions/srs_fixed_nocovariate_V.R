# NOTE this code auto-written based on menuManager sheet code
srs_fixed_nocovariate_V <- function(
	nt,
	nc
	){
		p <- nt/(nt+nc)
		V <- (nt+nc)*p*(1-p)
	return(V)
}

