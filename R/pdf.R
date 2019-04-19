## This file contains modified and updated portions of code imported
## from the tufte package by Yihui Xie and JJ Allaire
##
## Copyright Yihui Xie, JJ Allaire et al
## Licensed as GPL-3
## https://cran.r-project.org/package=tufte

#' Customizing PDF document styles
#'
#' Using YAML metadata to customize PDF documents.
#'
#' You can easily customize fonts and a few other style attributes of
#' PDF documents (\code{tintPdf} and \code{tintBook}) with
#' YAML metadata
#'
#' @section Changing the fonts:
#'
#' You can use the fonts from the default \code{tufte} styles by setting
#' \code{defaultfonts: true}
#'
#' You can choose custom LaTeX font packages using \code{latexfonts}:
#' \preformatted{
#' latexfonts: "bera"
#' }
#' will use Bera Serif fonts. You can also specify multiple fonts
#' (for instance serif, sans-serif, and typewriter families)
#' \preformatted{
#' latexfonts:
#'   - "bera"
#'   - "FiraSans"
#'   - "FiraSansMono"
#' }
#' will use the Bera Serif font for regular text, Fira Sans Regular for
#' sans serif, and Fira Sans Mono for typewriter.
#'
#' You can also pass options to the packages:
#' \preformatted{
#' latexfonts:
#'   - package: newtxmath
#'     options:
#'       - cmintegrals
#'       - cmbraces
#'   - package: ebgaramond-maths
#'   - package: nimbusmononarrow
#' }
#' will use EB Garamond, with matching maths fonts from the \code{newtxmath}
#' package, and Nimbus Mono Narrow for the typewriter font.
#'
#' If you want to specify a sans-serif font for the main text, many
#' packages allow you to do this with options:
#' The default for tint is to use the equivalent of
#' \preformatted{
#' latexfonts:
#'   - package: roboto
#'     options:
#'       - sfdefault
#'       - condensed
#' }
#' where \code{sfdefault} specifies that the default text font should be Roboto.
#' Other packages use different options, such as Lato, another sans-serif
#' font, which you would specify as the main font like this:
#' \preformatted{
#' latexfonts:
#'   - package: lato
#'     options: default
#' }
#'
#'
#' @section Link Color:
#'
#' Changing the link color
#'
#' By default, tint uses a grayish-blue color for hyperlinks. If you want to
#' change this, you can use the YAML \code{linkcolor} variable either as a
#' string with three numbers (red, green, and blue) separated by commas:
#' \preformatted{
#' linkcolor: "0.3,0.3,0.6"
#' }
#' which gives a subtler bluish-gray,
#' or as a list of three colors:
#' \preformatted{
#' linkcolor:
#'   - 0.5
#'   - 0.2
#'   - 0.5
#' }
#' which gives a mauve color.
#'
#' @seealso \link{Custom-templates}
#' @name YAML-metadata
NULL

#' Custom document templates
#'
#' Using custom document templates
#'
#' If you want to make more significant changes to the document styles,
#' you can make custom Pandoc templates, using the examples provided with
#' this package.
#'
#' You will need to have some expertise with LaTeX to do this, but you
#' can take the templates, such as \code{tintPdf-template.tex}
#' or \code{tintBook-template.tex}, which you can locate on your computer with
#' \preformatted{
#' system.file("rmarkdown", "templates", "tintPdf", "resources",
#'             "tintPdf-template.tex", package="tint")
#' }
#' and
#' \preformatted{
#' system.file("rmarkdown", "templates", "tintBook", "resources",
#'             "tintBook-template.tex", package="tint")
#' }
#'
#' Copy those files to the folder where your RMarkdown file is located and edit them and then
#' tell tint to use your custom template instead of its built-in ones by using
#' the YAML attribute \code{template} in your \code{output} block:
#' \preformatted{
#' output:
#'   tint::tintPdf:
#'     template: "my-custom-template.tex"
#' }
#'
#' @seealso \link{YAML-metadata}
#' @name Custom-templates
NULL


#' @inheritParams rmarkdown::pdf_document
#' @rdname tintHtml
tintPdf <- function(fig_width = 4, fig_height = 2.5, fig_crop = TRUE,
                    dev = 'pdf', highlight = 'tango',
                    citation_package = 'natbib', latex_engine = 'pdflatex', ...) {
    tintPdfCreate('tufte-handout', fig_width, fig_height, fig_crop,
                  dev, highlight, citation_package,
                  latex_engine = latex_engine, ...)
}

#' @inheritParams rmarkdown::pdf_document
#' @rdname tintHtml
tintBook <- function(fig_width = 4, fig_height = 2.5, fig_crop = TRUE,
                    dev = 'pdf', highlight = 'tango',
                    citation_package = 'natbib', latex_engine = 'pdflatex', ...) {
    # The manipulation of the ellipsis argument below allows us to
    # inject a default template argument if one is not present, but
    # to use an optional supplied argument.
    args = list(...)
    if (! "template" %in% names(args)) {
        args$template = template_resources('tintBook', 'tintBook-template.tex')
    }
    args = c(list(documentclass = "tufte-book", fig_width = fig_width,
                  fig_height = fig_height, fig_crop = fig_crop,
                  dev = dev, highlight = highlight,
                  citation_package = citation_package,
                  latex_engine = latex_engine),
             args)
    do.call(tintPdfCreate, args)
}


tintPdfCreate <- function(documentclass = c('tufte-handout', 'tufte-book'),
                          fig_width = 4, fig_height = 2.5, fig_crop = TRUE,
                          dev = 'pdf', highlight = 'default',
                          citation_package = 'natbib', latex_engine = "pdflatex",
                          template = template_resources('tintPdf', 'tintPdf-template.tex'), ...) {

    ## resolve default highlight
    if (identical(highlight, 'default')) highlight = 'pygments'

    # The template argument can either be a filename or a string specifying a
    # function call.
    # To decide which it is, we decide that it's a function call if both:
    # There's no file at that path;
    # The string looks like a legal function call: starts with a lexically
    # legal name followed by an open parenthesis, some stuff, and then ends with
    # a closing parenthesis.
    if (!file.exists(template) &&
        grepl("^[a-zA-Z_.][a-zA-Z0-9_.:]+\\(.*\\)$", template)) {
        template = eval(parse(text = template))
    }

    ## call the base pdf_document format with the appropriate options
    format <- rmarkdown::pdf_document(fig_width = fig_width, fig_height = fig_height,
                                      fig_crop = fig_crop, dev = dev, highlight = highlight,
                                      citation_package = citation_package,
                                      latex_engine = latex_engine,
                                      template = template, ...)

    ## LaTeX document class
    documentclass = match.arg(documentclass)
    format$pandoc$args <- c(
        format$pandoc$args, '--variable', paste0('documentclass:', documentclass),
        if (documentclass == 'tufte-book') "--top-level-division=chapter"
    )

    knitr::knit_engines$set(marginfigure = function(options) {
        options$type = 'marginfigure'
        eng_block = knitr::knit_engines$get('block')
        eng_block(options)
    })

    ## create knitr options (ensure opts and hooks are non-null)
    knitr_options <- rmarkdown::knitr_options_pdf(fig_width, fig_height, fig_crop, dev)
    if (is.null(knitr_options$opts_knit))  knitr_options$opts_knit = list()
    if (is.null(knitr_options$knit_hooks)) knitr_options$knit_hooks = list()

    ## set options
    knitr_options$opts_chunk$tidy = FALSE   ## TRUE implied formatR use
    knitr_options$opts_knit$width = 45

    ## set hooks for special plot output
    knitr_options$knit_hooks$plot <- function(x, options) {

        ## determine figure type
        if (isTRUE(options$fig.margin)) {
            options$fig.env = 'marginfigure'
            if (is.null(options$fig.cap)) options$fig.cap = ''
        } else if (isTRUE(options$fig.fullwidth)) {
            options$fig.env = 'figure*'
            if (is.null(options$fig.cap)) options$fig.cap = ''
        }

        knitr::hook_plot_tex(x, options)
    }

    ## override the knitr settings of the base format and return the format
    format$knitr <- knitr_options
    format$inherits <- 'pdf_document'
    format
}
