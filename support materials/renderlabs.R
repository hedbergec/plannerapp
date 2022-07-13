

for (f in list.files("labs/")) {
  if (!grepl("md$",f)) {
    file.remove(paste0("labs/",f))
  }
}

for (f in c(1:7)) {
  rmarkdown::render(
    paste0("labs/lab",f,".Rmd"),
    output_format = "word_document"
  )
  
  rmarkdown::render(
    paste0("labs/lab",f,".Rmd"),
    output_format = "html_document"
  )

  rmarkdown::render(
    paste0("labs/lab",f,".Rmd"),
    output_format = "pdf_document"
  )
}


