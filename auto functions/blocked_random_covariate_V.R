# NOTE this code auto-written based on menuManager sheet code
blocked_random_covariate_V <- function(
	m,
	nt,
	nc,
	icc,
	R2_1,
	q,
	Q2,
	tau2
	){
		iccbar <- 1-icc
		nbar <- 2/(1/nt+1/nc)
		V <- 1/(((1-R2_1)*iccbar+(1-Q2)*nbar*tau2*iccbar*(nc+nt))/(m*nc*nt))
	return(V)
}

