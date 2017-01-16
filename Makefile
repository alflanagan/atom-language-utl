.PHONY: tags clean distclean

all: tags grammars

tags:
# generate tags file for atom and other editors
# uses universal-ctags https://ctags.io/
# to support CoffeeScript, build ctags with
# ./configure --enable-iconv --enable-readlib
# and/or run `gem install CoffeeTags`
	CTAGFLAGS='-a -kinds-JavaScript +fcmpCvg -kinds-CoffeeScript=+fcovpb --extra=+rp'

	rm -f tags
	find . -name node_modules -prune -o -name '*.js' -exec ctags ${CTAGFLAGS} '{}' \;
	find . -name node_modules -prune -o -name '*.coffee' -exec ctags ${CTAGFLAGS} '{}' \;

grammars/utl.cson: lib/generate_grammar.coffee
	coffee lib/generate_grammar.coffee > grammars/utl.cson

grammars: grammars/utl.cson

clean:
	rm -f tags
	rm -f grammars/utl.cson

distclean: clean
	rm -rf node_modules
