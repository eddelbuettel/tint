\name{NEWS}
\title{News for Package \pkg{tint}}
\newcommand{\ghpr}{\href{https://github.com/eddelbuettel/tint/pull/#1}{##1}}
\newcommand{\ghit}{\href{https://github.com/eddelbuettel/tint/issues/#1}{##1}}

\section{Changes in tint version 0.1.6 (2025-09-25)}{
  \itemize{
    \item An additional LaTeX command needed by \pkg{pandoc} (>= 3.2.1) has
    been defined for the two pdf variants.
  }
}

\section{Changes in tint version 0.1.5 (2025-03-27)}{
  \itemize{
    \item Standard package maintenance for continuous integration, URL
    updates, and packaging conventions
    \item Correct two minor nags in the Rd file
  }
}

\section{Changes in tint version 0.1.4 (2022-11-01)}{
  \itemize{
    \item Added continuous integration at GitHub using \code{run.sh} 
    \item Non-margin reference in html mode now have an improved display
    (David Selby and Dirk in \ghpr{47})
    \item The LaTeX package \code{array} is now installed for improved
    table support (Dirk addressing \ghit{48})
    \item Minor updates made the package directory and README.md 
    \item GitHub Actions were updated to checkout version 3.
    \item Several http:// URLs were updated to https://
  }
}

\section{Changes in tint version 0.1.3 (2020-07-18)}{
  \itemize{
    \item A new minimal demo was added showing inline references (Dirk
    addressing \ghit{42}).
    \item Code for margin notes and reference in html mode was updated
    with thanks to \pkg{tufte} (Dirk in \ghpr{43} and \ghpr{44}
    addressing \ghit{40}).
    \item The README.md was updated with a new 'See Also' section and a
    new badge.
  }
}

\section{Changes in tint version 0.1.2 (2019-04-19)}{
  \itemize{
    \item Two new shorter html and pdf vignettes have been added (with
    references to the longer vignettes) reducing package size.
    \item New helper function 'theme_tint' based on a similar function
    in package 'ggtufte'.
  }
}

\section{Changes in tint version 0.1.1 (2019-03-30)}{
  \itemize{
    \item The two pdf styles have been extended allowing more flexible
    LaTeX customization particularly for fonts but also link colour.
    (Jonathan in \ghpr{30})
    \item Two example documents where added pre-rendered (and not as
    vignettes to keep processing lighter)
    \item Documentation for the HTML style was updates (Jonathan in
    \ghpr{30}).
  }
}

\section{Changes in tint version 0.1.0 (2018-04-08)}{
  \itemize{
    \item A new template \code{tintBook} was added (\ghpr{25}).
    \item The pdf variants now default to \code{tango} as the
    highlighting style.
  }
}

\section{Changes in tint version 0.0.5 (2018-01-05)}{
  \itemize{
    \item Only run html rendering regression test on Linux or Windows as
    the pandoc versions on CRAN are too old elsewhere.
    \item Vignette figures reworked so that the \pkg{mgcv} package is
    not required avoiding a spurious dependency [CRAN request]
  }
}

\section{Changes in tint version 0.0.4 (2017-11-02)}{
  \itemize{
    \item Skeleton files are also installed as vignettes (\ghpr{20}).
    \item A reference to the Tufte source file now points to tint (Ben
    Marwick in \ghpr{19}, later extended to other Rmd files).
    \item Several spelling and grammar errors were corrected too
    (\ghpr{13} and \ghpr{16} by R. Mark Sharp and Matthew Henderson)
  }
}

\section{Changes in tint version 0.0.3 (2016-10-15)}{
  \itemize{
    \item Correct pdf mode to no use italics in table of contents
    (\ghpr{9} fixing \ghit{8}); also added color support for links etc
    \item Added (basic) Travis CI support (\ghpr{10})
  }
}

\section{Changes in tint version 0.0.2 (2016-10-06)}{
  \itemize{
    \item In html mode, correct use of italics and bold
    \item Html function renamed to \code{tintHtml}
    Roboto fonts with (string) formats and locales; this allow for
    adding formats; (PRs \ghpr{6} and \ghpr{7})
    \item Added pdf mode with new function \code{tintPdf()}; added
    appropriate resources (PR \ghpr{5})
    \item Updated resource files
  }
}

\section{Changes in tint version 0.0.1 (2016-09-24)}{
  \itemize{
    \item Initial (non-CRAN) release to ghrr drat
  }
}
