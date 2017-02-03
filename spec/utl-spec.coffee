fs = require('fs')

describe 'UTL grammar', ->
  grammar = null

  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage 'language-utl'

    runs ->
      grammar = atom.grammars.grammarForScopeName 'text.utl'

  it 'loads the grammar', ->
    expect(grammar).toBeTruthy()
    expect(grammar.scopeName).toBe 'text.utl'
    expect(grammar.fileTypes[0]).toBe 'utl'
    expect(grammar.name).toBe 'HTML (UTL)'

  it 'parses a file', ->
    fs.readFile 'spec/data/keywords.utl', {encoding: 'utf-8'}, (err, data) =>
      if err
         throw err
      # we did decode file, right?
      expect(typeof data).toBe 'string'
      lines = grammar.tokenizeLines(data)
      console.log lines.length

      expected_tokens = ["[%", " ", "return", " ", "5",
        ";", "return", " ", "3", " * ", "12",
        " - ", "4", ";", "return", ";", "while",
        " ", "true", ";", " ", "break", ";",
        "end", ";", "continue", ";", "%]", ""]

      for i in [0..lines.length-1]
        for j in [0..lines[i].length-1]
          token = lines[i][j]
          expect(token.value).toBe(expected_tokens[i+j])
          expect(lines[i][j].scopes).toContain("text.utl")

      expected_scopes = [
          [
            "meta.scope.code.utl",
            "entity.other.bracket.utl"
           ],
           [
               "meta.scope.code.utl"
           ],
           [
               "meta.scope.code.utl",
               "keyword.control.utl"
           ],
           [
               "meta.scope.code.utl"
           ],
           [
               "meta.scope.code.utl",
               "constant.numeric.utl"
           ],
           [
               "meta.scope.code.utl"
           ],
           [
               "meta.scope.code.utl",
               "keyword.control.utl"
           ],
           [
               "meta.scope.code.utl"
           ],
           [
               "meta.scope.code.utl",
               "constant.numeric.utl"
           ],
           [
               "meta.scope.code.utl"
           ],
           [
               "meta.scope.code.utl",
               "constant.numeric.utl"
           ],
           [
               "meta.scope.code.utl"
           ],
           [
               "meta.scope.code.utl",
               "constant.numeric.utl"
           ],
           [
                "meta.scope.code.utl"
           ],
           [
               "meta.scope.code.utl",
               "keyword.control.utl"
           ],
           [
               "meta.scope.code.utl"
           ],
           [
               "meta.scope.code.utl",
               "keyword.control.utl"
           ],
           [
               "meta.scope.code.utl"
           ],
           [
               "meta.scope.code.utl",
               "constant.language.utl"
           ],
           [
                "meta.scope.code.utl"
           ],
           [
               "meta.scope.code.utl"
           ],
           [
               "meta.scope.code.utl",
               "keyword.control.utl"
           ],
           [
               "meta.scope.code.utl"
           ],
           [
               "meta.scope.code.utl",
               "keyword.control.utl"
           ],
           [
               "meta.scope.code.utl"
           ],
           [
               "meta.scope.code.utl",
               "keyword.control.utl"
           ],
           [
               "meta.scope.code.utl"
           ],
           [
               "meta.scope.code.utl"
           ],
           [
           ]]
