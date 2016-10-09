
setwd(tempdir())
file.copy(system.file("examples", "simple.Rmd", package="tint"), "simple.Rmd")
rmarkdown::render("simple.Rmd")







