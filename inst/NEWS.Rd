\name{NEWS}
\title{News for Package \pkg{tint}}
\newcommand{\ghpr}{\href{https://github.com/eddelbuettel/tint/pull/#1}{##1}}
\newcommand{\ghit}{\href{https://github.com/eddelbuettel/tint/issues/#1}{##1}}

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
