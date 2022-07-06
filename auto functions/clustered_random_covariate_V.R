# NOTE this code auto-written based on menuManager sheet code
clustered_random_covariate_V <- function(
	mt,
	mc,
	n,
	icc,
	R2_1,
	R2_2,
	q
	){
		#
		p <- mt/(mt+mc)
		m <- mt+mc
		V <- m*n*p*(1-p)*(1/(1+(n-1)*icc-(R2_1+(n*R2_2-R2_1)*icc)))
	return(V)
}

