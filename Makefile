.PHONY: tags grammars clean distclean

all: tags grammars

CTAGFLAGS=-a --kinds-JavaScript=+fcmpCvg --kinds-CoffeeScript=+fcovpb --extra=+rp

tags:
# generate tags file for atom and other editors
# uses universal-ctags https://ctags.io/
# to support CoffeeScript, build ctags with
# ./configure --enable-iconv --enable-readlib
# and/or run `gem install CoffeeTags`
	rm -f tags; \
	find . -name node_modules -prune -o -name '*.js' -exec ctags $(CTAGFLAGS) '{}' \; ;\
	find . -name node_modules -prune -o -name '*.coffee' -exec ctags $(CTAGFLAGS) '{}' \;

grammars:
	$(MAKE) -C lib

clean:
	rm -f tags
	$(MAKE) -C lib clean

distclean: clean
	rm -rf node_modules
