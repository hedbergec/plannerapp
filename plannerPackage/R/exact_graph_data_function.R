exact_graph_data <- function( #function to take alpha, df, and ncp and return data to draw curves
  ncp, #non-central parameter
  df, #df
  alpha, #sig level
  tails = 2, #tails (2 is default)
  points = 50, #points on curves, 50 is default, fewer points will increase speed
  xrange = c(-5,5) #range of x-axis, default is -5 to 5
) { 
  retList <- list() #initialize return list
  
  critR <- qt(alpha/tails, df, lower.tail = FALSE) #critical right
  retList$t <- seq(xrange[1], xrange[2], length = points) #x-axis is t-dist 
  retList$cden <- dt(seq(xrange[1], xrange[2], length = points), df) #find density
  retList$alphaR.x <- c(critR, seq(critR, xrange[2], 0.01), xrange[2]) #alpha right t values
  retList$alphaR.y <- c(0, dt(seq(critR, xrange[2], 0.01), df), 0) #alpha right density
  
  if (tails == 2) { #for default 2-tails
    critL <- qt(alpha/tails, df, lower.tail = TRUE) #critical left
    retList$alphaL.x <- c(critL, seq(xrange[1], critL, 0.01), critL) #alpha left t values
    retList$alphaL.y <- c(0, dt(seq(xrange[1], critL, 0.01), df), 0) #alpha left density
    retList$beta.x <- c(critL, seq(critL, critR, 0.01), critR) #beta t values
    retList$beta.y <- c(0, dt(seq(critL, critR, 0.01), df, ncp), 0) #beta density
  }
  else { #one tail defaults to right critical, low left is taken from range
    critL <- xrange[1] #critical left
    retList$alphaL.x <- c(critL, seq(xrange[1], critL, 0.01), critL) #alpha left t values
    retList$alphaL.y <- c(0, dt(seq(xrange[1], critL, 0.01), df), 0)
    retList$beta.x <- c(xrange[1], seq(xrange[1], critR, 0.01), critR) #beta t values
    retList$beta.y <- c(0, dt(seq(xrange[1], critR, 0.01), df, ncp), 0) #beta density
  }
  
  retList$power.x <- c(critR, seq(critR, xrange[2], 0.01), xrange[2]) #power t values
  retList$power.y <- c(0, dt(seq(critR, xrange[2], 0.01), df, ncp), 0) #power density
  retList$tails <- tails
  retList$ncp.x <- ncp #ncp point t value
  retList$ncp.y <- dt(ncp, df, ncp) #ncp point density value
  retList$alpha <- alpha
  beta <- (pt(qt(alpha/tails,df, lower.tail = FALSE),df,ncp) - 
             pt(-qt(alpha/tails,df, lower.tail = FALSE),df,ncp)) #compute beta
  retList$beta <- beta
  retList$power <- 1-beta #compute power
  retList$ct <- qt(alpha/tails, df, lower.tail = FALSE) #compute critical
  retList$ncp <- ncp #ncp 
  retList$xrange <- xrange #return xrange
  
  return(retList) #return object
}


