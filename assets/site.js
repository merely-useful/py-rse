// Pull all H2's into div.headings, or delete div.headings.
const makeTableOfContents = () => {
  const container = document.querySelector('div.headings')
  if (! container) {
    return
  }
  const headings = Array.from(document.querySelectorAll('h2'))
	.filter(h => (h.id !== null) && h.id.startsWith('s:'))
  if (headings.length === 0) {
    container.parentNode.removeChild(container)
  }
  const items = headings
        .map(h => '<li><a href="#' + h.id + '">' + h.innerHTML + '</a></li>')
        .join('\n')
  container.innerHTML = '<h2>Contents</h2><ul>\n' + items + '</ul>'
}

// Add Bootstrap striped table classes to all tables and narrow the rows.
const fixTables = () => {
  Array.from(document.querySelectorAll('table'))
    .forEach(t => t.classList.add('table', 'table-striped', 'table-sm'))
}

// Fix glossary reference URLs.
const fixGlossRefs = () => {
  const bibStem = './gloss.html'
  Array.from(document.querySelectorAll('a'))
    .filter(e => e.getAttribute('href').startsWith('#g:'))
    .forEach(e => {
      e.setAttribute('href', bibStem + e.getAttribute('href'))
      e.classList.add('gloss')
    })
}

// Convert bibliography citation links.
const fixBibRefs = () => {
  const bibStem = './bib.html#b:'
  Array.from(document.querySelectorAll('a'))
    .filter(e => e.getAttribute('href') == '#BIB')
    .forEach(e => {
      const cites = e.textContent
	    .split(',')
	    .filter(c => c.length > 0)
	    .map(c => '<a href="' + bibStem + c + '" class="citation">' + c + '</a>')
      const newNode = document.createElement('span')
      newNode.innerHTML = '[' + cites.join(',') + ']'
      e.parentNode.replaceChild(newNode, e)
    })
}

// Fix cross-reference links.
const fixCrossRefs = () => {
  const crossref = JSON.parse(document.currentScript.getAttribute('CROSSREF'))
  Array.from(document.querySelectorAll('a'))
    .filter(e => {
      const href = e.getAttribute('href')
      return (href == '#REF') || (href == '#FIG') || (href == '#TBL')
    })
    .forEach(e => {
      const key = e.textContent
      const entry = crossref[key]
      const link = './' + entry.slug + '.html#' + key
      const text = entry.text + '&nbsp;' + entry.value
      e.setAttribute('href', link)
      e.innerHTML = text
    })
}

// Fix figure captions.
const fixFigureCaptions = () => {
  const crossref = JSON.parse(document.currentScript.getAttribute('CROSSREF'))
  Array.from(document.querySelectorAll('figure'))
    .forEach(e => {
      const figureId = e.getAttribute('id')
      const figureNum = crossref[figureId].value
      const caption = e.querySelector('figcaption')
      caption.innerHTML = `Figure ${figureNum}: ` + caption.innerHTML
    })
}

// Fix table captions.
const fixTableCaptions = () => {
  const crossref = JSON.parse(document.currentScript.getAttribute('CROSSREF'))
  Array.from(document.querySelectorAll('table'))
    .filter(e => e.hasAttribute('title'))
    .forEach(e => {
      const tableId = e.getAttribute('id')
      const tableNum = crossref[tableId].value
      const title = e.getAttribute('title')
      const caption = document.createElement('caption')
      caption.innerHTML = `Table ${tableNum}: ${title}`
      e.insertBefore(caption, e.childNodes[0])
    })
}

// Fix up solutions.
const fixSolutions = () => {
  Array.from(document.querySelectorAll('aside'))
    .forEach((e, i) => {
      const solutionId = `solution-${i}`
      e.setAttribute('id', solutionId)
      e.style.display = 'none'
      const button = document.createElement('p')
      button.innerHTML = '<span class="solution">solution</span>'
      button.classList.add('solution')
      button.setAttribute('onclick', `showHideSolutions('${solutionId}')`)
      e.parentNode.insertBefore(button, e)
    })
}

// Show/hide solutions when button clicked.
const showHideSolutions = (id) => {
  const e = document.getElementById(id)
  if (e.style.display == 'none') {
    e.style.display = 'block'
  } else {
    e.style.display = 'none'
  }
}

// Perform transformations on load (which is why this script is included at the
// bottom of the page).
(function(){
  makeTableOfContents()
  fixTables()
  fixBibRefs()
  fixGlossRefs()
  fixCrossRefs()
  fixFigureCaptions()
  fixTableCaptions()
  fixSolutions()
})()
