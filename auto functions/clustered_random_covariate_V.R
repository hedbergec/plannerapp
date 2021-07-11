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
		p <- mt/(mt+mc)
		de <- 1+(n-1)*icc-(R2_1+(n*R2_2-R2_1)*icc)
		V <- 1/(de/(p*(1-p)*(mt+mc)*n))
	return(V)
}

