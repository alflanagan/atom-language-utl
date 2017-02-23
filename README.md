# atom-language-utl
[Townnews](https://townnews.com)' UTL template language ([docs](http://help.bloxcms.com/knowledge-base/developers_corner/utl_template_language/article_f4479da4-65f3-11e5-89b3-73569e6ced8b.html)) support in Atom.

Adds syntax highlighting and (eventually) snippets to UTL files in Atom.

Bits and pieces may be stolen from the [PHP language support](https://github.com/atom/language-php.git) for Atom.

Note that this project is in a **very** early stage and I don't really know what I'm doing yet.

Contributions are greatly appreciated. Please fork this repository and open a pull request to add
snippets, make grammar tweaks, etc.

## Known Issues

The highlighting does not work between &lt;style&gt; tags, as the parser switches context to CSS. Possibly a problem in other contexts.
