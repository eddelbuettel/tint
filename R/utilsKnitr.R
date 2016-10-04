
# excludes can be a vector of 'markdown', 'epub', etc
is_html_output <- function(fmt = pandoc_to(), excludes = NULL) {
    if (length(fmt) == 0) return(FALSE)
    if (grepl('^markdown', fmt)) fmt = 'markdown'
    if (fmt == 'epub3') fmt = 'epub'
    fmts = c('markdown', 'epub', 'html', 'html5', 'revealjs', 's5', 'slideous', 'slidy')
    fmt %in% setdiff(fmts, excludes)
}

is_latex_output <- function() {
    out_format('latex') || pandoc_to(c('latex', 'beamer'))
}

out_format <- function (x) {
    fmt <- knitr::opts_knit$get("out.format")
    if (missing(x))
        fmt
    else !is.null(fmt) && (fmt %in% x)
}

# rmarkdown sets an option for the Pandoc output format from markdown
pandoc_to <- function(x) {
    fmt <- knitr::opts_knit$get('rmarkdown.pandoc.to')
    if (missing(x)) fmt else !is.null(fmt) && (fmt %in% x)
}


