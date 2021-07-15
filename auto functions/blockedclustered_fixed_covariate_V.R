# NOTE this code auto-written based on menuManager sheet code
blockedclustered_fixed_covariate_V <- function(
	k,
	mt,
	mc,
	n,
	icc,
	R2_1,
	q
	){
		#expression 30 in Hedges and Rhoads
		p <- mt/(mt+mc)
		m <- mt+mc
		V <- k*m*n*p*(1-p)*(1/(1+(n-1)*icc-(R2_1+(n*R2_2-R2_1)*icc)))
	return(V)
}

