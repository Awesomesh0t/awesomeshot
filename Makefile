PREFIX = /usr
MANDIR = $(PREFIX)/share/man

all:
	@echo Run \'make install\' to install Awesomeshot.

install:
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@mkdir -p $(DESTDIR)$(MANDIR)/man1
	@cp -p awesomeshot awesomeshot-bin
	@sed -i 's/LIBRARY_PATH=""/LIBRARY_PATH="\/usr\/local\/lib\/awesomeshot"/g' awesomeshot-bin
	@cp -p awesomeshot-bin $(DESTDIR)$(PREFIX)/bin/awesomeshot
	@rm awesomeshot-bin
	@cp -R lib $(DESTDIR)$(PREFIX)/local/lib/awesomeshot
	@cp -p awesomeshot.1 $(DESTDIR)$(MANDIR)/man1
	@chmod 755 $(DESTDIR)$(PREFIX)/bin/awesomeshot

uninstall:
	@rm -rf $(DESTDIR)$(PREFIX)/bin/awesomeshot
	@rm -rf $(DESTDIR)$(PREFIX)/local/lib/awesomeshot
	@rm -rf $(DESTDIR)$(MANDIR)/man1/awesomeshot.1