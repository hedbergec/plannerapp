# NOTE this code auto-written based on menuManager sheet code
blockedclustered_fixed_nocovariate_V <- function(
	m,
	kt,
	kc,
	n,
	icc
	){
		#expression 30 in Hedges and Rhoads, k here is p in that paper
		p <- kt/(kt+kc)
		k <- kt+kc
		V <- m*k*n*p*(1-p)*(1/(1+(n-1)*icc))
	return(V)
}

