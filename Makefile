PREFIX_TERMUX = /data/data/com.termux/files/usr
MANDIR_TERMUX = $(PREFIX_TERMUX)/share/man
PREFIX_LINUX = /usr
MANDIR_LINUX = $(PREFIX_LINUX)/share/man

all:
	@echo Run \'make install\' to install Awesomeshot.

install-termux:
	@mkdir -p $(DESTDIR)$(PREFIX_TERMUX)/bin
	@mkdir -p $(DESTDIR)$(MANDIR_TERMUX)/man1
	@sed -i 's/LIBRARY_PATH=""/LIBRARY_PATH="${PREFIX}\/lib\/awesomeshot"/g' awesomeshot
	@cp -p awesomeshot $(DESTDIR)$(PREFIX_TERMUX)/bin/awesomeshot
	@cp -R lib $(DESTDIR)$(PREFIX_TERMUX)/lib/awesomeshot
	@cp -p awesomeshot.1 $(DESTDIR)$(MANDIR_TERMUX)/man1
	@chmod 755 $(DESTDIR)$(PREFIX_TERMUX)/bin/awesomeshot

uninstall-termux:
	@rm -rf $(DESTDIR)$(PREFIX_TERMUX)/bin/awesomeshot
	@rm -rf $(DESTDIR)$(PREFIX_TERMUX)/lib/awesomeshot
	@rm -rf $(DESTDIR)$(MANDIR_TERMUX)/man1/awesomeshot.1

install-linux:
	@mkdir -p $(DESTDIR)$(PREFIX_LINUX)/bin
	@mkdir -p $(DESTDIR)$(MANDIR_LINUX)/man1
	@sed -i 's/LIBRARY_PATH=""/LIBRARY_PATH="\/usr\/local\/lib\/awesomeshot"/g' awesomeshot
	@cp -p awesomeshot $(DESTDIR)$(PREFIX_LINUX)/bin/awesomeshot
	@cp -R lib $(DESTDIR)$(PREFIX_LINUX)/local/lib/awesomeshot
	@cp -p awesomeshot.1 $(DESTDIR)$(MANDIR_LINUX)/man1
	@chmod 755 $(DESTDIR)$(PREFIX_LINUX)/bin/awesomeshot

uninstall-linux:
	@rm -rf $(DESTDIR)$(PREFIX_LINUX)/bin/awesomeshot
	@rm -rf $(DESTDIR)$(PREFIX_LINUX)/local/lib/awesomeshot
	@rm -rf $(DESTDIR)$(MANDIR_LINUX)/man1/awesomeshot.1