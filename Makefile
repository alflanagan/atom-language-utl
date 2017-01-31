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

CSON_FILE=grammars/html\ (utl).cson

$(CSON_FILE): lib/generate_html_utl_grammar.coffee
	coffee lib/generate_html_utl_grammar.coffee > "$@"

grammars: $(CSON_FILE)

clean:
	rm -f tags
	rm -f grammars/*.cson

distclean: clean
	rm -rf node_modules
