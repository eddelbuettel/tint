
## run in the R session temp.dir. which gets cleaned
setwd(tempdir())                        

## process html -- should work everywhere
file.copy(system.file("examples", "simpleHtml.Rmd", package="tint"), "simpleHtml.Rmd")
rmarkdown::render("simpleHtml.Rmd")

## pdf requires a fairly complete latex installation so make this conditional
if (isTRUE(unname(Sys.info()["user"])=="edd")) {
    file.copy(system.file("examples", "simplePdf.Rmd", package="tint"), "simplePdf.Rmd")
    rmarkdown::render("simplePdf.Rmd")
}







