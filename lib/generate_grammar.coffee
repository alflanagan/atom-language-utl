{makeRegexFromWords, makeGrammar, rule} = require('atom-syntax-tools')

keywords =  ['and', 'as', 'break', 'call', 'continue', 'default', 'each',
             'echo', 'else', 'elseif', 'end', 'exit', 'false', 'for', 'foreach',
             'if', 'is', 'include', 'macro', 'null', 'not', 'or', 'return',
             'then', 'true', 'while']

operators = ['..', '+=', '-=', '*=', '/=', '%=', '.', '*', '-', '+', '/', '%',
             '<=', '>=', '<', '>', '==', '!=', '!', '&&', '||', 'and', 'or',
             'is', 'not', '|', ':', ', ', '[', '(' ]

escapeChar = (char) ->
  switch char
    when '+', '*', '.', '|', '[', '('
      '\\' + char
    else
      char

makeRegexFrom = (a_string) ->
  (escapeChar(char) for char in a_string).join('')

grammar =
  name: 'UTL'
  scopeName: 'text.utl'
  fileTypes: [ 'utl' ]

  patterns: [
    '#utl'
    '#document'
  ]

  repository:
    reserved:
      m: '(?i)\b(?:' + keywords.join('|') + ')\b'
      n: 'reserved'
    operator:
      n: 'operator'
      m: (makeRegexFrom(op) for op in operators).join '|'
    comment:
      n: 'comment'
      m: '/\*(?:.|\n)*?\*/'

makeGrammar grammar, "CSON"
