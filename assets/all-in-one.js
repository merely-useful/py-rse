const mergeAll = () => {
  const language = document.currentScript.getAttribute('LANG')
  const allKeys = [''].concat(
    Array.from(document.querySelectorAll('a.toc'))
      .map(link => link.getAttribute('href'))
      .map(target => target.split('/'))
      .map(fields => fields.filter(x => x))
      .map(fields => fields.slice(-1)[0])
  )
  const allChapters = concatenate(
    language,
    allKeys,
    key => makeUrl(language, key),
    getDocFromUrl
  )
  fillInPage(allChapters)
}

const makeUrl = (language, key) => {
  const i = window.location.href.indexOf('all')
  let url = window.location.href.substring(0, i)
  if (key) {
    url += key + '/'
  }
  return url
}

const getDocFromUrl = (url) => {
  const request = new XMLHttpRequest()
  request.open('GET', url, false) // force blocking
  request.send(null)
  const element = document.createElement('html')
  element.innerHTML = request.responseText
  return element
}

const MAIN_FRAME = `<div class="row">
  <div class="col-md-10 offset-md-1 main">
  </div>
</div>`

const fillInPage = (chapters) => {
  const container = document.querySelector('div.container-fluid')
  while (container.firstChild) {
    container.removeChild(container.firstChild)
  }
  container.innerHTML = MAIN_FRAME
  const main = container.querySelector('div.main')
  chapters.forEach(ch => main.appendChild(ch))
}

mergeAll()
