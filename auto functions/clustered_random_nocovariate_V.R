# NOTE this code auto-written based on menuManager sheet code
clustered_random_nocovariate_V <- function(
	mt,
	mc,
	n,
	icc
	){
		p <- mt/(mt+mc)
		de <- 1+(n-1)*icc
		V <- 1/(de/(p*(1-p)*(mt+mc)*n))
	return(V)
}

