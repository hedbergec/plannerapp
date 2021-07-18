
for (f in c("chs_7_8","ch_9","ch_10","ch_12", "ch_13")) {
  knitr::opts_chunk$set(echo = FALSE, include=FALSE)
  rmarkdown::render(
    paste0("labs/lab_",f,".Rmd"), 
    output_format = "word_document"
  )
  knitr::opts_chunk$set(echo = FALSE, include=TRUE)
  rmarkdown::render(
    paste0("labs/lab_",f,".Rmd"), 
    output_format = "html_document"
  )
}


