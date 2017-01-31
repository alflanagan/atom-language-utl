{makeRegexFromWords, makeGrammar, rule} = require('atom-syntax-tools')

keywords =  ['[%', '%]', '[%-', '-%]']


escapeChar = (char) ->
  switch char
    when '+', '*', '.', '|', '[', '('
      '\\' + char
    else
      char

makeRegexFrom = (a_string) ->
  (escapeChar(char) for char in a_string).join('')

grammar =
  name: 'HTML (UTL)'
  scopeName: 'text.html'
  fileTypes: [ 'utl' ]

  patterns: [
    '#html'
    '#utl'
  ]

  repository:
    utl_doc:
      b: /\[%-?/
      c: 'utl_doc.begin'
      e: /-?%]/
      p: [ "#utl" ]
      
makeGrammar grammar, "CSON"
