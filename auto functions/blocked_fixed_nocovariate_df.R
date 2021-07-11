# NOTE this code auto-written based on menuManager sheet code
blocked_fixed_nocovariate_df <- function(
	m,
	nt,
	nc
	){
		N <- m*(nt+nc)
		df <- N-2*m
	return(df)
}

