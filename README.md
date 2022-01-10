## tint: Tint is not Tufte

[![CI](https://github.com/eddelbuettel/tint/workflows/ci/badge.svg)](https://github.com/eddelbuettel/tint/actions?query=workflow%3Aci)
[![Package-License](http://img.shields.io/badge/license-GPL--3-brightgreen.svg?style=flat)](http://www.gnu.org/licenses/gpl-3.0.html) 
[![CRAN](https://www.r-pkg.org/badges/version/tint)](https://cran.r-project.org/package=tint) 
[![Dependencies](https://tinyverse.netlify.com/badge/tint)](https://cran.r-project.org/package=tint) 
[![Downloads](http://cranlogs.r-pkg.org/badges/tint?color=brightgreen)](http://www.r-pkg.org/pkg/tint)
[![Last Commit](https://img.shields.io/github/last-commit/eddelbuettel/tint)](https://github.com/eddelbuettel/tint)

### Motivation

The (html and pdf) styles provided by the [tufte](https://cran.r-project.org/package=tufte) package
make it very easy and convenient to create documents in the celebrated style of
[Edward Tufte](https://www.edwardtufte.com/tufte/).

The clear layout, focused use of white space and unparalleled use of the margin for complementary
information, including graphs, offer a novel and very valuable resource for typesetting.

Yet at the same time, not everybody is a fan of the yellow tint, and the fonts.  I had been looking
for a while for an alternative, and came across 
[envisioned css](https://github.com/nogginfuel/envisioned-css) by Jef Lippiat.  It gets a few things
very right: use of the beautiful 
[Roboto Condensed font](https://fonts.google.com/specimen/Roboto+Condensed) along with
a closer-to-white background.  So I _mixed_ this with the code framework provided by JJ and Yihui to
make it an [RMarkdown](http://rmarkdown.rstudio.com/) template you can use just by installing this
package. Among the small changes I made were the removal of _italics_ in subheaders and the title.

Similarly, LaTeX styles exists and the
[tufte](https://cran.r-project.org/package=tufte) package supports both pdf
handouts and a book format.  We first supported the pdf handout
output only, and added support for a pdf book format in release 0.1.0.


### Example

#### HTML

A quick screenshot of the html variant is below:

![](http://eddelbuettel.github.com/tint/tintHtmlScreenshot.png)

and the full underlying document is [available too](http://eddelbuettel.github.com/tint/).  Its sources 
are included in the packages as
[html/skeleton.Rmd](https://github.com/eddelbuettel/tint/blob/master/inst/rmarkdown/templates/tintHtml/skeleton/skeleton.Rmd).

#### PDF

Another screenshot shows the pdf handout variant:

![](http://eddelbuettel.github.com/tint/tintPdfScreenshot.png)

and its underlying sources are included as 
[pdf/skeleton.Rmd](https://github.com/eddelbuettel/tint/blob/master/inst/rmarkdown/templates/tintPdf/skeleton/skeleton.Rmd).

Here is a screenshot of the book format (which was added with release 0.1.0), showing a chapter-opening page on the left:

![](http://eddelbuettel.github.com/tint/tintBookScreenshot.png)

#### PDF Font Variants

Since release 0.1.1 additional fonts can be specified in the YAML header.  Using the following lines
in the YAML header 

```yaml
latexfonts: 
  - package: newtxmath
    options: 
      - cmintegrals
      - cmbraces
  - package: ebgaramond-maths
  - package: nimbusmononarrow
```

yields output as in the following screenshot of the first two vignette pages:

![](http://eddelbuettel.github.com/tint/tintPDFGaramond.png)

A second example is using 

```yaml
latexfonts: 
  - package: lato
    options: default
  - package: FiraMono
linkcolor: "0.3,0.3,0.6"
```

which also show the `linkcolor` option resulting in

![](http://eddelbuettel.github.com/tint/tintPDFLato.png)


### Status

The package is now on [CRAN](https://cran.r-project.org/package=tint) and
supports both pdf and html output for handouts, as well as pdf format for
book-length documents.  This latter style can be used with `rmarkdown` or 
`bookdown`.

### Usage 

Install from [CRAN](https://cran.r-project.org) as any other package via

```r
R> install.packages("tint")
```

and then use as a Markdown template via RStudio, or call `rmarkdown::render()` directly.
We have also used the book-length format via `bookdown::render_book()`.

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

### See Also

#### Other RMarkdown Packages

- [binb](https://github.com/eddelbuettel/binb): Binb is not Beamer: Stylish pdf Presentations from RMarkdown
- [linl](https://github.com/eddelbuettel/linl): Linl is not Letter: LaTeX letters from RMarkdown
- [pinp](https://github.com/eddelbuettel/pinp): Pinp is not PNAS: Snazzy one-or two column short papers or vignettes 

and the [minm](https://github.com/eddelbuettel/minm) package installing all of them.

#### Sidenotes

[Gwern Branwen](https://www.gwern.net/index) has a wide-ranging overview of [sidenotes in web design](https://www.gwern.net/Sidenotes).

### Authors

Dirk Eddelbuettel and Jonathan Gilligan, borrowing heavily from JJ and Yihui in
[tufte](https://cran.r-project.org/package=tufte), Dave Liepman in the underlying
[tufte-css](https://github.com/edwardtufte/tufte-css), Jef Lippiat in
[envisioned css](https://github.com/nogginfuel/envisioned-css) and also relying on the work
of the [Tufte-LaTeX](https://tufte-latex.github.io/tufte-latex/) authors.

### License

GPL-3 for our parts and the code from [tufte](https://cran.r-project.org/package=tufte),
mostly MIT for what comes from Dave Liepman and Jef Lippiat.
