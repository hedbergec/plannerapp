compute_mdes <- function( #function to iteratively find MDES, returns exact result and range searched
  V, #variance factor 
  df, #degrees of freedom
  alpha = .05, #alpha
  tails = 2, #tails, default is 2
  beta = .2 #type ii error, default is .2
) {
  
  starter_es <- ( #typical approx
    qt(
    1-beta,
    df
  ) -
    qt(
      alpha/tails,
      df
    )
  )*sqrt(1/V)
  
  ncp_start <- es*sqrt(V)
  
  beta_start <- (pt(qt(alpha/tails,df, lower.tail = FALSE),df,ncp) - 
                   pt(-qt(alpha/tails,df, lower.tail = FALSE),df,ncp))
  
  if (beta < beta_start) { #if beta is too big
    es_search_caliper <- (1-beta)/(1-beta_start)*(1-1/1e10) #10 is likely overkill
    test_string <- "<"
    
  }
  if (beta > beta_start) { #if beta is too small
    es_search_caliper <- (1-beta)/(1-beta_start)/(1-1/1e10) 
    test_string <- ">"
    
  }
  
  ##loop
  
  mdes <- starter_es
  beta_check <- beta_start
  
  while(eval(parse(text = paste0("beta",test_string,"beta_check")))) {
    mdes <- mdes * es_search_caliper
    ncp_next <- compute_ncp(
      es = mdes,
      V = V
    )
    beta_check <- compute_beta(
      ncp = ncp_next,
      df = df,
      alpha = alpha, 
      tails = tails
    )
  }
  
  return( #return restults
    list(
      #starter_es = starter_es,
      #starter_power = compute_power(beta_start),
      mdes = mdes,
      exact_power = compute_power(beta_check)
    )
  )
}