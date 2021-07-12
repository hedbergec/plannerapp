# NOTE this code auto-written based on menuManager sheet code
clustered_random_nocovariate_V <- function(
	mt,
	mc,
	n,
	icc
	){
		p <- mt/(mt+mc)
		m <- mt+mc
		V <- m*n*p*(1-p)*(1/(1+(n-1)*icc))
	return(V)
}

