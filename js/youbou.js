let pageIsRoot = document.currentScript.getAttribute('ROOT') != ''
$(document).ready(function() {

  // Set the path to the root directory based on the script parameter.
  let prefix = pageIsRoot ? '.' : '..'

  // Stripe all tables.
  $('table').addClass('table table-striped')

  // Change URLs of special internal references.
  $('a').each(function() {
    let target = $(this).attr('href')
    let text = $(this).text()

    // Glossary entries.
    if (target.startsWith('#g:')) {
      $(this).attr('href', prefix + '/gloss/' + target)
      $(this).addClass('glossref')
    }

    // Bibliography citations.
    else if (target == '#CITE') {
      $(this).attr('href', prefix + '/bib/#' + text)
    }

    // Appendix references.
    else if (target == '#APPENDIX') {
      $(this).attr('href', prefix + '/' + CROSSREF[text]['slug'] + '/')
      $(this).text('Appendix ' + CROSSREF[text]['number'])
    }

    // Chapter references.
    else if (target == '#CHAPTER') {
      $(this).attr('href', prefix + '/' + CROSSREF[text]['slug'] + '/')
      $(this).text('Chapter ' + CROSSREF[text]['number'])
    }

    // Figure references.
    else if (target == '#FIGURE') {
      $(this).attr('href', prefix + '/' + CROSSREF[text]['slug'] + '/#' + text)
      $(this).text('Figure ' + CROSSREF[text]['number'])
    }

    // Section references.
    else if (target == '#SECTION') {
      $(this).attr('href', prefix + '/' + CROSSREF[text]['slug'] + '/#' + text)
      $(this).text('Section ' + CROSSREF[text]['number'])
    }
  })

  // Add "Figure A.B" to the title of every figure.
  $('figcaption').each(function() {
    let ident = $(this).attr('id')
    let text = $(this).text()
    console.log(ident, text)
    $(this).text('Figure ' + CROSSREF[ident]['number'] + ': ' + text)
  })
})
