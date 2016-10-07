## tint

[![Package-License](http://img.shields.io/badge/license-GPL--3-brightgreen.svg?style=flat)](http://www.gnu.org/licenses/gpl-3.0.html)
[![License](http://img.shields.io/badge/license-GPL%20%28%3E=%202%29-brightgreen.svg?style=flat)](http://www.gnu.org/licenses/gpl-2.0.html)
[![CRAN](http://www.r-pkg.org/badges/version/tint)](https://cran.r-project.org/package=tint) [![Downloads](http://cranlogs.r-pkg.org/badges/tint?color=brightgreen)](http://www.r-pkg.org/pkg/tint)

Tint is not Tufte

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

Similarly, LaTeX styles exists and the
[tufte](https://cran.r-project.org/package=tufte) supports both pdf
handouts and a book format.  Here, we also support the pdf handout
output.

### Example

A quick screenshot of the html variant is below:

![](http://eddelbuettel.github.com/tint/tint-region.png)

and the full underlying document is [available too](http://eddelbuettel.github.com/tint/).  Its sources 
are included in the packages as [skeleton.Rmd](https://github.com/eddelbuettel/tint/blob/master/inst/rmarkdown/templates/html/skeleton/skeleton.Rmd).

### Status

The package is now on [CRAN](https://cran.r-project.org/package=tint) and
supports both pdf and html output.

### Usage 

Install from [CRAN](https://cran.r-project.org) as any other package, e.g. via

```r
R> install.packages("tint")
```

and the use _e.g._ as a Markdown template via RStudio, or call `rmarkdown::render()` directly.

### Author

Dirk Eddelbuettel, borrowing heavily from JJ and Yihui in
[tufte](https://cran.r-project.org/package=tufte), Dave Liepman in the underlying
[tufte-css](https://github.com/edwardtufte/tufte-css), Jef Lippiat in
[envisioned css](https://github.com/nogginfuel/envisioned-css) and also elying on the work
of the [Tufte-LaTeX](https://tufte-latex.github.io/tufte-latex/) authors.

### License

GPL-3 for my parts and the code from [tufte](https://cran.r-project.org/package=tufte),
mostly MIT for what comes from Dave Liepman and Jef Lippiat.
