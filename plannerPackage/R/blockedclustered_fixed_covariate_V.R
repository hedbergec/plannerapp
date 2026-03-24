# NOTE this code auto-written based on menuManager sheet code
blockedclustered_fixed_covariate_V <- function(
	m,
	kt,
	kc,
	n,
	icc,
	R2_1,
	R2_2,
	q
	){
		#expression 30 in Hedges and Rhoads, k here is p in that paper
		p <- kt/(kt+kc)
		k <- kt+kc
		V <- m*k*n*p*(1-p)*(1/(1+(n-1)*icc-(R2_1+(n*R2_2-R2_1)*icc)))
	return(V)
}

