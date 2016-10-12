
setwd(tempdir())
file.copy(system.file("examples", "simpleHtml.Rmd", package="tint"), "simpleHtml.Rmd")
rmarkdown::render("simpleHtml.Rmd")







