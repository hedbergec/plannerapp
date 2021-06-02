# NOTE this code auto-written based on menuManager sheet code
blocked_fixed_nocovariate_V <- function(
	m,
	nt,
	nc,
	icc
	){
		iccbar <- 1-icc
		nbar <- 2/(1/nt+1/nc)
		V <- 1/((iccbar+nbar*iccbar*(nc+nt))/(m*nc*nt))
	return(V)
}

