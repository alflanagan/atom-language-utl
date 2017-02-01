{makeRegexFromWords, makeGrammar, rule} = require('atom-syntax-tools')

keywords = makeRegexFromWords """
  and
  as
  break
  call
  continue
  default
  each
  echo
  else
  elseif
  end
  exit
  for
  foreach
  if
  is
  include
  macro
  not
  or
  return
  then
  while
"""

keyword_constants = makeRegexFromWords """
  false
  null
  true
"""

operators = makeRegexFromWords """
  \.\.
  \+=
  -=
  \*=
  /=
  %=
  \.
  \*
  -
  \+
  /
  %
  <=
  >=
  <
  >
  ==
  !=
  !
  &&
  \|\|
  and
  or
  is
  not
  \|
  :
  ,
  [
  (
"""

grammar =
  name: 'HTML (UTL)'
  scopeName: 'text.utl'
  fileTypes: [ 'utl' ]
  macros:
    identifier: /[a-zA-Z_][a-zA-Z_0-9]*/
  patterns: [
    {
      comment: 'Since html is valid in UTL include the html patterns'
      include: 'text.html.basic'
    }
    {
      begin: /(\[%-?)/
      captures:
        1:
          name: 'entity.other.bracket'
      end: /(-?%\])/
      name: 'meta.scope.code'
      patterns: [
        {
          begin: /\/\*/
          end: /\*\//
          name: 'comment.block'
        }
        {
          begin: /('|")/
          end: /\1/
          name: 'string.quoted'
        }
        {
          match: '\\b' + keywords + '\\b'
          name: 'keyword.control'
        }
        {
          match: '\\b' + operators + '\\b'
          name: 'keyword.operator'
        }
        {
           match: '\\b' + keyword_constants + '\\b'
           name: 'constant.language'
        }
        {
          # identifier -- any match for identifier in context (macro name, parameter, etc.) should
          # come first.
          match: '\\b{identifier}(?:\\.{identifier})\\*'
          name: 'variable.other'
        }
        {
          match: /\b\d+(\.\d+)?\b/
          name: 'constant.numeric'
        }
      ]
    }
  ]

makeGrammar grammar, "CSON"
