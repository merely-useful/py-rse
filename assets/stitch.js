// Utility to combine all generated HTML files into a single page.

const fs = require('fs')
const path = require('path')
const yaml = require('js-yaml')
const { JSDOM } = require('jsdom')
const concatenate = require('./concatenate')


HEADER = `---
permalink: /LANGUAGE/all/
root: true
layout: default
---
`


const main = () => {
  const [configFile, rootDir, language] = process.argv.slice(2)
  const {config, order} = getConfig(configFile)
  const allKeys = [''].concat(order.map(key => key.replace(/\//g, '')))
  const allChapters = concatenate(
    language,
    allKeys,
    key => makeSrcPath(rootDir, language, key),
    getDocFromFile
  )
  writeResult(process.stdout, language, allChapters)
}


const getConfig = (path) => {
  const config = yaml.safeLoad(fs.readFileSync(path, 'utf-8'))
  const toc = config.toc
  const order = toc.lessons.concat(toc.bib).concat(toc.extras)
  return {config, order}
}


const getDocFromFile = (path) => {
  const text = fs.readFileSync(path, 'utf-8')
  return new JSDOM(text).window.document
}


const makeSrcPath = (rootDir, language, key) => {
  return rootDir = path.join(rootDir, language, key, 'index.html')
}


const writeResult = (stream, language, chapters) => {
  stream.write(HEADER.replace('LANGUAGE', language))
  chapters.forEach(doc => {
    stream.write(doc.outerHTML)
    stream.write('\n')
  })
}


main()
