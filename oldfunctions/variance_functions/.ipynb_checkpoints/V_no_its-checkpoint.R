
V_no_its<-function(T,rho,m,P) {
	numer <- 0
	numer <- numer + T
	numer <- numer + 2*rho
	numer <- numer + -T*rho

	denom <- 0
	denom <- denom + -m*rho^3
	denom <- denom + 3*m*rho^2
	denom <- denom + P*T^2*m
	denom <- denom + T*m*rho^3
	denom <- denom + -P^2*T^2*m
	denom <- denom + -3*T*m*rho^2
	denom <- denom + 2*T*m*rho
	denom <- denom + P^2*T^2*m*rho^3
	denom <- denom + -P*T^2*m*rho^3
	denom <- denom + -3*P*T^2*m*rho
	denom <- denom + -3*P^2*T^2*m*rho^2
	denom <- denom + 3*P*T^2*m*rho^2
	denom <- denom + 3*P^2*T^2*m*rho

	return(numer/denom)
}
