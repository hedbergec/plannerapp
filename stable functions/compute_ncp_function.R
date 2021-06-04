compute_ncp <- function( #function to compute expected test from effect size and variance factor
  es, #effect size
  V #variance factor
) {
  ncp <- es*sqrt(V)
  return(ncp)
}