# NOTE this code auto-written based on menuManager sheet code
blocked_random_nocovariate_df <- function(
	m,
	nt,
	nc
	){
		nbar <- 2/(1/nt+1/nc)
		df <- result <- nbar*m - 2
	return(df)
}

