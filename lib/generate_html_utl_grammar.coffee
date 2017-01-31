{makeRegexFromWords, makeGrammar, rule} = require('atom-syntax-tools')

grammar =
  name: 'HTML (UTL)'
  scopeName: 'text.html'
  fileTypes: [ 'utl' ]

  patterns: [
    {
      'comment': 'Since html is valid in UTL include the html patterns'
      'include': 'text.html.basic'
    }
    {
      'begin': '(\\[%-?)'
      'captures':
        '1':
          'name': 'entity.other.utl.utlbracket'
      'end': '(-?%\\])'
      'name': 'meta.scope.utl.templatetag'
      'patterns': [
        {
          'match': '\\b()\\b'
          'name': 'keyword.control.utl.template'
        }
        {
          'match': '\\b(and|or|not|in|by|as)\\b'
          'name': 'keyword.operator.django.template'
        }
      ]
    }
  ]
          
makeGrammar grammar, "CSON"
