# NOTE this code auto-written based on menuManager sheet code
blockedclustered_fixed_nocovariate_V <- function(
	k,
	mt,
	mc,
	n,
	icc
	){
		#expression 30 in Hedges and Rhoads
		p <- mt/(mt+mc)
		m <- mt+mc
		V <- k*m*n*p*(1-p)*(1/(1+(n-1)*icc))
	return(V)
}

