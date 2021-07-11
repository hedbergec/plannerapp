# NOTE this code auto-written based on menuManager sheet code
blocked_fixed_covariate_V <- function(
	m,
	nt,
	nc,
	icc,
	R2_1,
	q
	){
		iccbar <- 1-icc
		nbar <- 2/(1/nt+1/nc)
		V <-1/(((1-R2_1)*iccbar+nbar*iccbar*(nc+nt))/(m*nc*nt))
	return(V)
}

