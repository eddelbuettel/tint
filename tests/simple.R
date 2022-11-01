
## run in the R session temp.dir. which gets cleaned
setwd(tempdir())

## process html -- should work everywhere
## but doesn't: CRAN's macOS and Solaris have seriously outdated pandoc binaries
## replace with test from rmarkdown itself
## old: asTRUE(unname(Sys.info()["sysname"]) %in% c("Linux","Windows"))) {
if (rmarkdown::pandoc_available("1.12.3")) {
    file.copy(system.file("examples", "simpleHtml.Rmd", package="tint"), "simpleHtml.Rmd")
    rmarkdown::render("simpleHtml.Rmd")
}

## pdf requires a fairly complete latex installation so make this conditional
#if (isTRUE(unname(Sys.info()["user"])=="edd")) {
#    file.copy(system.file("examples", "simplePdf.Rmd", package="tint"), "simplePdf.Rmd")
#    rmarkdown::render("simplePdf.Rmd")
#}
