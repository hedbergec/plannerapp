# NOTE this code auto-written based on menuManager sheet code
blocked_fixed_covariate_df <- function(
	m,
	nt,
	nc,
	q
	){
		N <- m*(nt+nc)
		df <- N-2*m-q
	return(df)
}

