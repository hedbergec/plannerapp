# NOTE this code auto-written based on menuManager sheet code
blocked_random_nocovariate_V <- function(
	m,
	nt,
	nc,
	icc,
	upsilon
	){
		p <- nt/(nt+nc)
		n <- nt+nc
		V <- m*n*p*(1-p)*(1/(1+(n*p*(1-p)*upsilon)*icc))
	return(V)
}

