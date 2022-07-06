# NOTE this code auto-written based on menuManager sheet code
srs_fixed_covariate_V <- function(
	nt,
	nc,
	R2_1,
	q
	){
		#
		p <- nt/(nt+nc)
		n <- nt+nc
		V <- n*p*(1-p)*(1/(1-R2_1))
	return(V)
}

