## tint

tint is not tufte

### Motivation

The (html and pdf) styles provided by the [tufte](https://cran.r-project.org/package=tufte) package
make it very easy and convenient to create documents in the celebrated style of
[Edward Tufte](https://www.edwardtufte.com/tufte/).

The clear layout, focused use of white space and unparallel use of the margin for complementary
information, including graphs, offer a novel and very valuable resource for typsetting.

Yet at the same time, not everybody is a fan of the yellow tint, and the fonts.  I had been looking
for a while for an alternative, and somewhat recently came across
[envisioned css](https://github.com/nogginfuel/envisioned-css) by Jef Lippiat.  It gets a few things
very right: use of the beautiful [Roboto font](https://fonts.google.com/specimen/Roboto) along with
a closer-to-white background.  So I _mixed_ this with the code framework provided by JJ and Yihui to
make it an [RMarkdown](http://rmarkdown.rstudio.com/) template you can use just by installing this
package. Among the small changes I made were the removal of _italics_ in subheaders and the title.

### Example

A quick screenshot is below:

![](http://eddelbuettel.github.com/tint/tint-region.png)

and the full underlying document is [available too](http://eddelbuettel.github.com/tint/).  Its sources 
are included in the packages as [skeleton.Rmd](https://github.com/eddelbuettel/tint/blob/master/inst/rmarkdown/templates/html/skeleton/skeleton.Rmd).

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

### License

GPL-3 for my parts and the code from [tufte](https://cran.r-project.org/package=tufte),
mostly MIT for what comes from Dave Liepman and Jef Lippiat.
