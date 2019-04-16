
## run in the R session temp.dir. which gets cleaned
setwd(tempdir())

## process html -- should work everywhere
## but doesn't: CRAN's macOS and Solaris have seriously outdated pandoc binaries
if (isTRUE(unname(Sys.info()["sysname"]) %in% c("Linux","Windows"))) {
    file.copy(system.file("examples", "simpleHtml.Rmd", package="tint"), "simpleHtml.Rmd")
    rmarkdown::render("simpleHtml.Rmd")
}

## pdf requires a fairly complete latex installation so make this conditional
#if (isTRUE(unname(Sys.info()["user"])=="edd")) {
#    file.copy(system.file("examples", "simplePdf.Rmd", package="tint"), "simplePdf.Rmd")
#    rmarkdown::render("simplePdf.Rmd")
#}
