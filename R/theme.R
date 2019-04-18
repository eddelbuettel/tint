## Imported from the ggtufte package by Jeffrey Arnold which is (currently)
## not on CRAN so we importd the code also removing font settings which
## conflict with the tint settings
##
## Copyright Jeffey Arnold
## Licensed as GPL-3
## https://cran.r-project.org/package=tufte


##' A 'Tufte'-inspired 'ggplot2' theme for the 'tint' package
##'
##' This theme is borrows heavily from a similar theme in \pkg{ggtufte}
##' by Jeffrey Arnold (but removes his font processing as it conflicts
##' with ours).
##' @title A 'Tufte'-inspired 'ggplot2' theme
##' @param base_size An integer value for the base tick size, default
##' is 11.
##' @param ticks A logical value indicating if ticks should be drawn,
##' default is \code{TRUE}.
##' @return A modified theme for ggplot2 use
##' @author Dirk Eddelbuettel modifying earlier work by Jeffrey Arnold
theme_tint <- function(base_size = 11, ticks = TRUE) {
    ret <- ggplot2::theme_bw(base_size = base_size) +
        ggplot2::theme(plot.caption = ggplot2::element_text(hjust = 0),
                       legend.background = ggplot2::element_blank(),
                       legend.key = ggplot2::element_blank(),
                       panel.background = ggplot2::element_blank(),
                       panel.border = ggplot2::element_blank(),
                       strip.background = ggplot2::element_blank(),
                       plot.background = ggplot2::element_blank(),
                       axis.line = ggplot2::element_blank(),
                       panel.grid = ggplot2::element_blank(),
                       legend.position = "bottom")
    if (!ticks) {
        ret <- ret + ggplot2::theme(axis.ticks = ggplot2::element_blank())
    }
    ret
}
