## tint

tint is not tufte

### Example

A quick screenshot is below:

![](http://eddelbuettel.github.com/tint/tint-region.png)

and the full underlying document is [available too](http://eddelbuettel.github.com/tint/).  Its sources 
are included in the packages as [skeleton.Rmd](https://github.com/eddelbuettel/tint/blob/master/inst/rmarkdown/templates/tint/skeleton/skeleton.Rmd).

### Status

Fully working but still somewhat preliminary. May get added to the [tufte](https://cran.r-project.org/package=tufte) package.

### Usage 

Install as a package, e.g. via

```r
R> if (!requireNamespace("drat", quietly=TRUE)) install.packages("drat")
R> drat::addRepo("ghrr")                 # make drat repo known
R> install.packages("tint")
```

and the use _e.g._ as a Markdown template via RStudio, or call `rmarkdown::render()` directly.

### Author

Dirk Eddelbuettel, borrowing heavily from JJ and Yihui in 
[tufte](https://cran.r-project.org/package=tufte), Dave Liepman in the underlying [tufte-css](https://github.com/edwardtufte/tufte-css) and Jef Lippiat in 
[envisioned css](https://github.com/nogginfuel/envisioned-css).