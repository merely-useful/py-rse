const concatenate = (language, keys, keyToPath, getDoc) => {
  const chapters = keys
	.map(key => ({key, path: keyToPath(key)}))
	.map(({key, path}) => ({key, doc: getDoc(path)}))
	.map(({key, doc}) => transformHeadings(doc, key))
	.map(doc => doc.querySelector('div.main'))
	.map(doc => transformHrefs(doc, language))
	.map(doc => cleanup(doc))
  return chapters
}


const transformHeadings = (doc, key) => {
  // Key is empty for root (index) page.
  if (key) {
    newId = 's:' + key
    Array.from(doc.querySelectorAll('h1')).forEach(node => {
      node.setAttribute('id', newId)
    })
  }
  return doc
}


const transformHrefs = (doc, language) => {
  const upwardPat = /\.\.\/(.+)\/(#.+)?/
  const languagePat = new RegExp(`^/${language}/(.+)/`)
  Array.from(doc.querySelectorAll('a')).forEach(node => {
    const href = node.getAttribute('href')
    let fields = href.match(upwardPat)
    // no match, so try a language replacement
    if (fields === null) {
      fields = href.match(languagePat)
      if (fields) {
	node.setAttribute('href', '#s:' + fields[1])
      }
    }
    // anchored
    else if (fields[2] !== undefined) {
      node.setAttribute('href', fields[2])
    }
    // section
    else {
      node.setAttribute('href', '#s:' + fields[1])
    }
  })
  return doc
}


const patch = (oldNode, newNode) => {
  while (oldNode.childNodes.length > 0) {
    newNode.appendChild(oldNode.childNodes[0])
  }
  oldNode.parentNode.replaceChild(newNode, oldNode)
}


const cleanup = (div) => {
  div.className = 'chapter'
  for (sel of ['blockquote.disclaimer', 'div.headings']) {
    Array.from(div.querySelectorAll(sel)).forEach(node => {
      node.parentNode.removeChild(node)
    })
  }
  return div
}

if (typeof module !== 'undefined') {
  module.exports = concatenate
}
