## tint [![Build Status](https://travis-ci.org/eddelbuettel/tint.svg)](https://travis-ci.org/eddelbuettel/tint) [![Package-License](http://img.shields.io/badge/license-GPL--3-brightgreen.svg?style=flat)](http://www.gnu.org/licenses/gpl-3.0.html) [![CRAN](http://www.r-pkg.org/badges/version/tint)](https://cran.r-project.org/package=tint) [![Downloads](http://cranlogs.r-pkg.org/badges/tint?color=brightgreen)](http://www.r-pkg.org/pkg/tint)

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
very right: use of the beautiful 
[Roboto Condensed font](https://fonts.google.com/specimen/Roboto+Condensed) along with
a closer-to-white background.  So I _mixed_ this with the code framework provided by JJ and Yihui to
make it an [RMarkdown](http://rmarkdown.rstudio.com/) template you can use just by installing this
package. Among the small changes I made were the removal of _italics_ in subheaders and the title.

Similarly, LaTeX styles exists and the
[tufte](https://cran.r-project.org/package=tufte) supports both pdf
handouts and a book format.  Here, we also support the pdf handout
output.

### Example

#### HTML

A quick screenshot of the html variant is below:

![](http://eddelbuettel.github.com/tint/tintHtmlScreenshot.png)

and the full underlying document is [available too](http://eddelbuettel.github.com/tint/).  Its sources 
are included in the packages as
[html/skeleton.Rmd](https://github.com/eddelbuettel/tint/blob/master/inst/rmarkdown/templates/html/skeleton/skeleton.Rmd).

#### PDF

Another screenshot shows the pdf variant:

![](http://eddelbuettel.github.com/tint/tintPdfScreenshot.png)

and its underlying sources are included as 
[pdf/skeleton.Rmd](https://github.com/eddelbuettel/tint/blob/master/inst/rmarkdown/templates/html/skeleton/skeleton.Rmd).

### Status

The package is now on [CRAN](https://cran.r-project.org/package=tint) and
supports both pdf and html output.

### Usage 

Install from [CRAN](https://cran.r-project.org) as any other package, _e.g._, via

```r
R> install.packages("tint")
```

and the use _e.g._, as a Markdown template via RStudio, or call `rmarkdown::render()` directly.

### Requirements

Beyond the R package dependencies, a working `pandoc` binary is needed. RStudio installs
its own copy, otherwise do what is needed on your OS (_i.e._, something like `sudo apt-get
install pandoc pandoc-citeproc`).

The pdf mode requires a fairly complete LaTeX installation.  On Debian/Ubuntu, the
following packages should provide a working set:

```
texlive-base
texlive-binaries
texlive-fonts-extra
texlive-fonts-recommended
texlive-generic-recommended
texlive-humanities
texlive-latex-base
texlive-latex-extra
texlive-latex-recommended
texlive-pictures
```

### Author

Dirk Eddelbuettel, borrowing heavily from JJ and Yihui in
[tufte](https://cran.r-project.org/package=tufte), Dave Liepman in the underlying
[tufte-css](https://github.com/edwardtufte/tufte-css), Jef Lippiat in
[envisioned css](https://github.com/nogginfuel/envisioned-css) and also relying on the work
of the [Tufte-LaTeX](https://tufte-latex.github.io/tufte-latex/) authors.

### License

GPL-3 for my parts and the code from [tufte](https://cran.r-project.org/package=tufte),
mostly MIT for what comes from Dave Liepman and Jef Lippiat.
