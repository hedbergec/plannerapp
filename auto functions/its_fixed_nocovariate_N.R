# NOTE this code auto-written based on menuManager sheet code
its_fixed_nocovariate_N <- function(
	m,
	pretime,
	posttime
	){
		N <- m*(pretime+posttime)
	return(N)
}

