# NOTE this code auto-written based on menuManager sheet code
dummyblocked_fixed_nocovariate_V <- function(
	m,
	nt,
	nc,
	icc
	){
		#
		p <- nt/(nt+nc)
		n <- nt+nc
		V <- m*n*p*(1-p)*(1/(1-icc))
	return(V)
}

