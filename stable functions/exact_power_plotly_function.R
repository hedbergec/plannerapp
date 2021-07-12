#https://github.com/daattali/colourpicker#colourinput-features
exact_power_plotly <- function( #function to take results of exact_graph_data() and make plotly object
  exact_graph_data_obj, #exact_graph_data_obj object
  alphacol = 'rgba(0, 0, 0, 1)', #alpha default is black
  betacol = 'rgba(25, 76, 76, .5)', #beta is blueish
  powercol = 'rgba(76, 25, 34, .5)', #power is purpleish
  dotcol = 'rgba(80, 80, 80, .5)' #ncp dot is grayish
  ) {
  require(plotly) #make sure plotly is loaded
  p <- plot_ly(x = ~exact_graph_data_obj$t, #make plot based on x,y, central curve
          y = ~exact_graph_data_obj$cden, 
          type = 'scatter', 
          mode = 'lines', 
          fillcolor = 'white',
          line = list(color='rgba(0, 0, 0, 1)'),
          name = 'Central',
          hoverinfo = 'text',
          text = ~paste("alpha = ", as.character(exact_graph_data_obj$alpha))) %>%
    add_trace(x = ~c(exact_graph_data_obj$alphaR.x, exact_graph_data_obj$alphaL.x), #add trace for alpha levels
              y = ~c(exact_graph_data_obj$alphaR.y, exact_graph_data_obj$alphaL.y), 
              fill = 'tozeroy',
              mode = 'none',
              name = "alpha",
              fillcolor = alphacol,
              line = list(color='rgba(0, 0, 0, 0)'), #no line
              hoverinfo = 'text',
              text = ~paste("alpha = ",as.character(exact_graph_data_obj$alpha))) %>%
    add_trace(x = ~exact_graph_data_obj$beta.x, #add trace for beta levels
              y = ~exact_graph_data_obj$beta.y, 
              fill = 'tozeroy',
              name = 'beta',
              mode = 'lines',
              fillcolor = betacol,
              line = list(color='rgba(0, 0, 0, 0)'), #no line
              hoverinfo = 'text',
              text = ~paste("beta = ",as.character(round(exact_graph_data_obj$beta, digits = 3)))) %>%
    add_trace(x = ~exact_graph_data_obj$power.x, 
              y = ~exact_graph_data_obj$power.y, 
              fill = 'tozeroy',
              name = "Power",
              mode = 'lines',
              fillcolor = powercol,
              line = list(color='rgba(0, 0, 0, 0)'), #no line
              hoverinfo = 'text',
              text = ~paste("power = ",as.character(round(exact_graph_data_obj$power, digits = 3)))) %>%
    add_trace(x = ~exact_graph_data_obj$ncp.x, 
              y = ~exact_graph_data_obj$ncp.y, 
              type = 'scatter',
              name = "NCP",
              hoverinfo = 'text',
              marker = list(size = 12, color=dotcol),
              line = list(color='rgba(0, 0, 0, 0)'), #no line
              text = ~paste("ncp = ", as.character(round(exact_graph_data_obj$ncp, digits = 3)))) %>%
    layout(
      xaxis = list(title = paste0("Critical = ",
                                  as.character(round(exact_graph_data_obj$ct, digits = 3)),
                                  ", NCP = ",
                                  as.character(round(exact_graph_data_obj$ncp, digits = 3)),
                                  ", beta = ",
                                  as.character(round(exact_graph_data_obj$beta, digits = 3)),
                                  ", power = ",
                                  as.character(round(exact_graph_data_obj$power, digits = 3))),
                   range = exact_graph_data_obj$xrange),
      yaxis = list(title = "",
                   zeroline = FALSE,
                   showline = FALSE,
                   showticklabels = FALSE,
                   showgrid = FALSE)
    )
  return(p) #return plotly
}

