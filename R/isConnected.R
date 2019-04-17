## borrowed from our dang package, but made internal here, in order to not have
## to declare a dependency for just these few lines of code
##
## Copyright Dirk Eddelbuettel
## Licensed as GPL (>= 2)
## https://cran.r-project.org/package=dang

.isConnected <- function(site="https://www.google.com") {
    uoc <- function(site) {
        con <- url(site)                # need to assign so that we can close
        open(con)                       # in case of success we have a connection
        close(con)                      # ... so we need to clean up
    }
    suppressWarnings(!inherits(try(uoc(site), silent=TRUE), "try-error"))
}
