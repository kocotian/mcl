PREFIX = /usr/local
MANPREFIX = ${PREFIX}/share/man

install: mcl mcl.1
	mkdir -p ${DESTDIR}${PREFIX}/bin
	install -Dm 755 mcl ${DESTDIR}${PREFIX}/bin
	mkdir -p ${DESTDIR}${MANPREFIX}/man1
	install -Dm 644 mcl.1 ${DESTDIR}${MANPREFIX}/man1/

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/mcl \
		${DESTDIR}${MANPREFIX}/man1/mcl.1 \
