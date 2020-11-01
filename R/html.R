## This file contains modified and updated portions of code imported
## from the tufte package by Yihui Xie and JJ Allaire
##
## Copyright Yihui Xie, JJ Allaire et al
## Licensed as GPL-3
## https://cran.r-project.org/package=tufte



#' Tint Is Not Tufte -- A Tufte-Inspired HTML Format
#'
#' A template for creating html reports according to the style of
#' Edward R. Tufte and Richard Feynman, but with an updated font
#' choice. The three key functions \code{tintHtml}, \code{tintPdf}
#' and \code{tintBook} offer, respectively, support for html and
#' pdf-based shorter (\dQuote{article-length} writeups as well as
#' support for longer pdf-based content.
#'
#' @param ... Other arguments to be passed to
#' \code{\link{pdf_document}} or \code{\link{html_document}}
#'
#' \strong{Note:} For \code{tintPdf} and \code{tintBook}, you can
#' specify a custom \code{template} argument to replace the default.
#' You \emph{cannot} use the \code{theme} argument in \code{tintHHtml()}
#' because this argument has been set internally.
#'
#' @details \code{tintHtml} provides the HTML format based on the Tufte CSS
#'   \url{https://edwardtufte.github.io/tufte-css/} with fonts set according to
#' \url{https://github.com/nogginfuel/envisioned-css}.
#' \code{tintPdf} provides a similar PDF format using the same font family and
#' styling applied to the Tufte-LaTeX
#' \url{https://tufte-latex.github.io/tufte-latex/} class.
#' \code{tintBook} is a (still somewhat experimental) pdf book variant.
#'
#' @references See \url{http://rstudio.github.io/tufte} for the
#' \pkg{tufte} package this was initially derived from. See
#' \url{http://eddelbuettel.github.io/tint} for usage examples
#' from this package.
#' @seealso \link{Custom-templates}, \link{YAML-metadata}.
tintHtml <- function(...) {

  html_document2 = function(..., extra_dependencies = list()) {
    rmarkdown::html_document(
      ...,
      extra_dependencies = c(extra_dependencies, tint_html_dependency())
    )
  }
  format = html_document2(theme = NULL, ...)
  pandoc2 = pandoc2.0()

  # when fig.margin = TRUE, set fig.beforecode = TRUE so plots are moved before
  # code blocks, and they can be top-aligned
  ohooks = knitr::opts_hooks$set(fig.margin = function(options) {
    if (isTRUE(options$fig.margin)) options$fig.beforecode = TRUE
    options
  })

  # make sure the existing post processor is called first in our new processor
  post_processor = format$post_processor
  format$post_processor = function(metadata, input, output, clean, verbose) {

    if (is.function(post_processor))
      output = post_processor(metadata, input, output, clean, verbose)

    knitr::opts_hooks$restore(ohooks)

    x = readUTF8(output)
    fn_label = paste0(knitr::opts_knit$get('rmarkdown.pandoc.id_prefix'), 'fn')
    footnotes = parse_footnotes(x, fn_label)
    notes = footnotes$items
    # replace footnotes with sidenotes
    for (i in seq_along(notes)) {
      num = sprintf(
        '<a href="#%s%d" class="%s" id="%sref%d"><sup>%d</sup></a>',
        fn_label, i, if (pandoc2) 'footnote-ref' else 'footnoteRef', fn_label, i, i
      )
      con = sprintf(paste0(
        '<label for="tufte-sn-%d" class="margin-toggle sidenote-number">%d</label>',
        '<input type="checkbox" id="tufte-sn-%d" class="margin-toggle">',
        '<span class="sidenote"><span class="sidenote-number">%d</span> %s</span>'
      ), i, i, i, i, notes[i])
      x = gsub_fixed(num, con, x)
    }
    # remove footnotes at the bottom
    if (length(footnotes$range)) x = x[-footnotes$range]

    # replace citations with margin notes
    x = margin_references(x)

    # place figure captions in margin notes
    x[x == '<p class="caption">'] = '<p class="caption marginnote shownote">'

    # move </caption> to the same line as <caption>; the previous line should
    # start with <table
    for (i in intersect(grep('^<caption>', x), grep('^<table', x) + 1)) {
      j = 0
      while (!grepl('</caption>$', x[i])) {
        j = j + 1
        x[i] = paste0(x[i], x[i + j])
        x[i + j] = ''
      }
    }
    # place table captions in the margin
    r = '^<caption>(.+)</caption>$'
    for (i in grep(r, x)) {
      # the previous line should be <table> or <table class=...>
      if (!grepl('^<table( class=.+)?>$', x[i - 1])) next
      cap = gsub(r, '\\1', x[i])
      x[i] = x[i - 1]
      x[i - 1] = paste0(
        '<p><!--\n<caption>-->', '<span class="marginnote shownote">',
        cap, '</span><!--</caption>--></p>'
      )
    }

    # add an incremental number to the id of <label> and <input> for margin notes
    r = '(<label|<input type="checkbox") (id|for)(="tufte-mn)-(" )'
    m = gregexpr(r, x)
    j = 1
    regmatches(x, m) = lapply(regmatches(x, m), function(z) {
      n = length(z)
      if (n == 0) return(z)
      if (n %% 2 != 0) warning('The number of labels is different with checkboxes')
      for (i in seq(1, n, 2)) {
        if (i + 1 > n) break
        z[i + (0:1)] =  gsub(r, paste0('\\1 \\2\\3-', j, '\\4'), z[i + (0:1)])
        j <<- j + 1
      }
      z
    })

    # remove <em> tags from subtitle, author, date
    x <- gsub("^(<h3 class=\"subtitle\">)<em>(.*)</em>(</h3>)$", "\\1\\2\\3",  x)
    x <- gsub("^(<h4 class=\"author\">)<em>(.*)</em>(</h4>)$", "\\1\\2\\3",  x)
    x <- gsub("^(<h4 class=\"date\">)<em>(.*)</em>(</h4>)$", "\\1\\2\\3",  x)

    writeUTF8(x, output)
    output
  }

  if (is.null(format$knitr$knit_hooks)) format$knitr$knit_hooks = list()
  format$knitr$knit_hooks$plot = function(x, options) {
    # make sure the plot hook always generates HTML code instead of ![]()
    if (is.null(options$out.extra)) options$out.extra = ''
    fig_margin = isTRUE(options$fig.margin)
    fig_fullwd = isTRUE(options$fig.fullwidth)
    if (fig_margin || fig_fullwd) {
      if (is.null(options$fig.cap)) options$fig.cap = ' ' # empty caption
    } else if (is.null(options$fig.topcaption)) {
      # for normal figures, place captions at the top of images
      options$fig.topcaption = TRUE
    }
    res = knitr::hook_plot_md(x, options)
    if (fig_margin) {
      res = gsub_fixed('<p class="caption">', '<!--\n<p class="caption marginnote">-->', res)
      res = gsub_fixed('</p>', '<!--</p>-->', res)
      res = gsub_fixed('</div>', '<!--</div>--></span></p>', res)
      res = gsub_fixed(
        '<div class="figure">', paste0(
          '<p>', '<span class="marginnote shownote">', '<!--\n<div class="figure">-->'
        ), res
      )
    } else if (fig_fullwd) {
      res = gsub_fixed('<div class="figure">', '<div class="figure fullwidth">', res)
      res = gsub_fixed(
        '<p class="caption">', '<p class="caption marginnote shownote">', res
      )
    }
    res
  }

  knitr::knit_engines$set(marginfigure = function(options) {
    options$type = 'marginnote'
    if (is.null(options$html.tag)) options$html.tag = 'span'
    options$html.before = marginnote_html()
    eng_block = knitr::knit_engines$get('block')
    eng_block(options)
  })

  format$inherits = 'html_document'

  format
}

# ' @ import From htmltools htmlDependency
tint_html_dependency = function() {
  list(htmlDependency(
    ## tufte-css', '2015.12.29',
    'tint-css', '2015.12.29',
    ## src = template_resources('tufte_html'), stylesheet = 'tufte.css'
    src = template_resources("tintHtml"), stylesheet = "tint.css"
  ))
}

# we assume one footnote only contains one paragraph here, although it is
# possible to write multiple paragraphs in a footnote with Pandoc's Markdown
parse_footnotes = function(x, fn_label='fn') {
  i = which(x == '<div class="footnotes">')
  if (length(i) == 0) return(list(items = character(), range = integer()))
  j = which(x == '</div>')
  j = min(j[j > i])
  n = length(x)
  r = sprintf(
    '<li id="%s([0-9]+)"><p>(.+)<a href="#%sref\\1"([^>]*)>.{1,2}</a></p></li>',
    fn_label, fn_label
  )
  s = paste(x[i:j], collapse = '\n')
  list(
    items = gsub(r, '\\2', unlist(regmatches(s, gregexpr(r, s)))),
    range = i:j
  )
}

# move reference items from the bottom to the margin (as margin notes)
margin_references = function(x) {
  i = grep('^<div id="refs" class="references[^"]*">$', x)
  if (length(i) != 1) return(x)
  # link-citations: no
  if (length(grep('<a href="#ref-[^"]+"[^>]*>([^<]+)</a>', x)) == 0) return(x)
  r = '^<div id="(ref-[^"]+)"[^>]*>$'
  k = grep(r, x)
  k = k[k > i]
  n = length(k)
  if (n == 0) return(x)
  # pandoc-citeproc may generate a link on both the year and the alphabetic
  # suffix, e.g. <a href="#cite-key">2016</a><a href="#cite-key">a</a>; we need
  # to merge the two links
  x = gsub('(<a href="#[^"]+"[^>]*>)([^<]+)</a>\\1([^<]+)</a>', '\\1\\2\\3</a>', x)

  # suffix, e.g. <a href="#cite-key">2016</a><a href="#cite-key">a</a>;
  # Pandoc 2.11+ may also generate several links with parenthesis between links,
  # but this is different, e.g
  # <a href="#ref-R-rmarkdown" role="doc-biblioref">Allaire et al.</a> (<a href="#ref-R-rmarkdown" role="doc-biblioref">2020</a>)</span>
  # we need to merge the two links
  r2 = '(<a href="#ref-[^"]+"[^>]*>)([^<]+)</a>([^<]*)\\1([^<]+)</a>([^<]*)'
  i2 = grep(r2, x)
  if (length(i2) != 0L) {
    m = regmatches(x[i2], regexec(r2, x[i2]))
    m = vapply(m, function(x) paste(c(x[-1], "</a>"), collapse = ""), character(1))
    for (j in seq_along(i2)) x[i2[j]] = gsub(r2, m[j], x[i2[j]])
  }
  ids = gsub(r, '\\1', x[k])
  ids = sprintf('<a href="#%s"[^>]*>([^<]+)</a>', ids)
  ref = gsub('^<p>|</p>$', '', x[k + 1])
  # replace 3 em-dashes with author names
  dashes = paste0('^', intToUtf8(rep(8212, 3)), '[.]')
  for (j in grep(dashes, ref)) {
    ref[j] = sub(dashes, sub('^([^.]+[.])( .+)$', '\\1', ref[j - 1]), ref[j])
  }
  ref = marginnote_html(paste0('\\1<span class="marginnote">', ref, '</span>'))
  for (j in seq_len(n)) {
    x = gsub(ids[j], ref[j], x)
  }
  x[-(i:(max(k) + 3))]  # remove references at the bottom
}

marginnote_html = function(text = '', icon = '&#8853;') {
  sprintf(paste0(
    '<label for="tufte-mn-" class="margin-toggle">%s</label>',
    '<input type="checkbox" id="tufte-mn-" class="margin-toggle">%s'
  ), icon, text)
}

#' @rdname tintHtml
tint <- function(...)  {
    .Deprecated("tintHtml")
    tintHtml(...)
}
