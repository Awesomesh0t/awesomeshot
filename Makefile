PREFIX = /data/data/com.termux/files/usr
MANDIR = $(PREFIX)/share/man

all:
	@echo Run \'make install\' to install Awesomeshot.

install:
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@mkdir -p $(DESTDIR)$(MANDIR)/man1
	@cp -p awesomeshot $(DESTDIR)$(PREFIX)/bin/awesomeshot
	@cp -p awesomeshot.1 $(DESTDIR)$(MANDIR)/man1
	@chmod 755 $(DESTDIR)$(PREFIX)/bin/awesomeshot

uninstall:
	@rm -rf $(DESTDIR)$(PREFIX)/bin/awesomeshot
	@rm -rf $(DESTDIR)$(MANDIR)/man1/awesomeshot.1*
