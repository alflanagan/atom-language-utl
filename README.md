# atom-language-utl

Build Status:&nbsp;&nbsp; ![Image](https://travis-ci.org/alflanagan/atom-language-utl.svg?branch=master)

[Townnews](https://townnews.com)' UTL template language ([docs](http://help.bloxcms.com/knowledge-base/developers_corner/utl_template_language/article_f4479da4-65f3-11e5-89b3-73569e6ced8b.html)) support in Atom.

Adds syntax highlighting and (eventually) snippets to UTL files in Atom.

Bits and pieces may be stolen from the [PHP language support](https://github.com/atom/language-php.git) for Atom. Also see [atom-django-templates](https://github.com/benjohnson/atom-django-templates).

At this point the UTL syntax highlighting seems to be pretty functional. No snippets yet, and see [Issues](https://github.com/alflanagan/atom-language-utl/issues).

Contributions are greatly appreciated. Please fork this repository and open a pull request to add
snippets, make grammar tweaks, etc.

## Known Issues

The UTL highlighting does not work between `<style>` tags, as the parser switches context to CSS. Possibly a problem in other contexts.
