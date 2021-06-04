compute_beta <- function( #function to compute type II error on t dist based on df, NCP, alpha, and tails
  ncp, #non-central parameter (from compute_ncp)
  df, #degrees of freedom
  alpha = .05, #sig level
  tails = 2 #tails, default is 2
) {
  beta <- (pt(qt(alpha/tails,df, lower.tail = FALSE),df,ncp) - 
             pt(-qt(alpha/tails,df, lower.tail = FALSE),df,ncp))
  return(beta)
  
}