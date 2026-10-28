// Static checks over compiled CSS, driven from test/assets/css_test.exs.
//
// Emits JSON on stdout: { invalid: [...], stackingContexts: [...] }
//
//   invalid           declarations that do not match the CSS spec grammar, e.g.
//                     `contain: size layout size`, which browsers drop whole
//   stackingContexts  every declaration that makes its element a stacking
//                     context, so that gaining or losing one shows up as a diff
//                     rather than as a silent change in paint order

import * as csstree from 'css-tree'
import { readFileSync } from 'node:fs'

const file = process.argv[2]
if (!file) {
  console.error('usage: css_check.mjs <compiled.css>')
  process.exit(2)
}

const ast = csstree.parse(readFileSync(file, 'utf8'), { positions: true })

const value = (node) => csstree.generate(node.value).trim()

// csstree's matcher bails out on these, so there is nothing to validate
const unmatchable = (val) => /\b(var|env)\(/.test(val)

const keywords = (val) => val.toLowerCase().split(/[\s,]+/).filter(Boolean)

// Properties that create a stacking context merely by having a value, i.e. any
// value other than the initial `none`/`normal`.
const whenSet = {
  filter: ['none'],
  'backdrop-filter': ['none'],
  transform: ['none'],
  translate: ['none'],
  rotate: ['none'],
  scale: ['none'],
  perspective: ['none'],
  'clip-path': ['none'],
  'mask-image': ['none'],
  mask: ['none'],
  'mix-blend-mode': ['normal'],
  'view-transition-name': ['none'],
  'container-type': ['normal'],
  isolation: ['auto'],
}

// ... and the ones that need the value inspected.
const containment = ['layout', 'paint', 'strict', 'content']
const willChange = [...Object.keys(whenSet), 'contain', 'opacity', 'z-index']

const stacking = (prop, val) => {
  const vals = keywords(val)

  if (prop in whenSet) return !whenSet[prop].includes(vals[0])
  if (prop === 'contain') return vals.some((v) => containment.includes(v))
  // `container: <name> / <type>`, where an omitted type means `normal`
  if (prop === 'container') {
    const type = val.split('/')[1]
    return type !== undefined && type.trim().toLowerCase() !== 'normal'
  }
  if (prop === 'will-change') return vals.some((v) => willChange.includes(v))
  if (prop === 'opacity') return parseFloat(val) < 1
  // only together with position/flex/grid, which the cascade cannot tell us
  // about here, so this over-reports rather than miss a case
  if (prop === 'z-index') return vals[0] !== 'auto'
  if (prop === 'position') return vals[0] === 'fixed'

  return false
}

const invalid = []
const stackingContexts = new Set()

csstree.walk(ast, {
  visit: 'Declaration',
  enter(node) {
    const prop = node.property.toLowerCase()
    const val = value(node)

    let dropped = false

    if (!unmatchable(val)) {
      const { error } = csstree.lexer.matchDeclaration(node)
      if (error) {
        dropped = true
        invalid.push({ line: node.loc.start.line, declaration: `${prop}: ${val}`, error: error.message })
      }
    }

    // a declaration browsers throw away cannot create a stacking context
    if (!dropped && stacking(prop, val)) {
      const selector = this.rule ? csstree.generate(this.rule.prelude) : '<none>'
      // @starting-style and friends have no prelude
      const prelude = this.atrule?.prelude ? ` ${csstree.generate(this.atrule.prelude)}` : ''
      const scope = this.atrule ? `@${this.atrule.name}${prelude} / ${selector}` : selector
      stackingContexts.add(`${scope}\t${prop}`)
    }
  },
})

console.log(
  JSON.stringify(
    { invalid, stackingContexts: [...stackingContexts].sort() },
    null,
    2,
  ),
)
