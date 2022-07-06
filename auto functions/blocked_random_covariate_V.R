# NOTE this code auto-written based on menuManager sheet code
blocked_random_covariate_V <- function(
	m,
	nt,
	nc,
	icc,
	R2_1,
	R2_2,
	q,
	upsilon
	){
		#
		p <- nt/(nt+nc)
		n <- nt+nc
		V <- m*n*p*(1-p)*(1/(1+(n*p*(1-p)*upsilon)*icc-(R2_1+(n*p*(1-p)*upsilon)*R2_2-R2_1)*icc))
	return(V)
}

