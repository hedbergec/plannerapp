plot_cards <- function(df, #data frame 
                       zero_out = NULL # which rows to blank out
                       ) {
  df$label <- ""
  df$label[setdiff(which(df$value == 1), zero_out)] <- "Intervention"
  df$label[setdiff(which(df$value == 2), zero_out)] <- "Comparison"
  df$zero <- 0
  df$value[which(df$label == "")] <- 3
  
  Person <- ggplot(df, aes(x = x, 
                                y = y, 
                                fill = factor(zero))
  ) + 
    geom_tile(color = "white", lwd = 2) +
    geom_text(aes(label=person), size=8) +
    theme_minimal() + 
    theme(legend.position="none",
          axis.title.x=element_blank(),
          axis.text.x=element_blank(),
          axis.ticks.x=element_blank(),
          axis.title.y=element_blank(),
          axis.text.y=element_blank(),
          axis.ticks.y=element_blank()) + 
    scale_y_continuous(breaks = seq(1, nrow(df))) +
    scale_fill_manual(values=c("white")) +
    theme(panel.grid = element_line(color = 0,
                                    size = 0.25,
                                    linetype = 1))
  
  Cards <- ggplot(df, aes(x = x, 
                               y = y, 
                               fill = factor(value))
  ) + 
    geom_tile(color = "white", lwd = 2) +
    theme_minimal() + 
    theme(legend.position="none",
          axis.title.x=element_blank(),
          axis.text.x=element_blank(),
          axis.ticks.x=element_blank(),
          axis.title.y=element_blank(),
          axis.text.y=element_blank(),
          axis.ticks.y=element_blank()) + 
    scale_y_continuous(breaks = seq(1, nrow(df))) +
    scale_fill_manual(values=c("red", "black","white")) +
    theme(panel.grid = element_line(color = 0,
                                    size = 0.25,
                                    linetype = 1))
  
  Labs <- ggplot(df, aes(x = x, 
                              y = y,
                              fill = factor(zero)
  )
  ) +
    geom_tile(color = "white", lwd = 2) +
    geom_text(aes(label=label), size=8) +
    theme_minimal() + 
    theme(legend.position="none",
          axis.title.x=element_blank(),
          axis.text.x=element_blank(),
          axis.ticks.x=element_blank(),
          axis.title.y=element_blank(),
          axis.text.y=element_blank(),
          axis.ticks.y=element_blank()) +
    scale_y_continuous(breaks = seq(1, nrow(df))) +
    scale_fill_manual(values=c("white")) +
    theme(panel.grid = element_line(color = 0,
                                    size = 0.25,
                                    linetype = 1))
  
  
  return(
    ggarrange(Person, Cards, Labs,
              labels = c("Person","Card", "Group"),
              ncol = 3)
  )
  
}

# df_full <- data.frame(
#   cbind(
#     y = c(10,9,8,7,6,5,4,3,2,1),
#     person = seq(1:10),
#     x = rep(1,10), 
#     value = as.vector(
#       replicate(5,
#                 sample(c(1,2),
#                        2
#                 )
#       )
#     )
#   )
# )