# NOTE this code auto-written based on menuManager sheet code
dummyblocked_fixed_covariate_V <- function(
	m,
	nt,
	nc,
	icc,
	R2_1,
	q
	){
		#
		p <- nt/(nt+nc)
		n <- nt+nc
		V <- m*n*p*(1-p)*(1/(1-icc))*(1/(1-R2_1))
	return(V)
}

