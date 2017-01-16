describe 'UTL grammar', ->
  grammar = null

  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage 'language-utl'

    runs ->
      grammar = atom.grammars.grammarForScopeName 'text.utl'

  it 'parses the grammar', ->
    expect(grammar).toBeTruthy()
    expect(grammar.scopeName).toBe 'text.html.utl'
