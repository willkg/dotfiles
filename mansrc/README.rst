=================
Writing man pages
=================

1. Add new page to ``manpages`` variable in ``Makefile``.
2. Edit new page in markdown.
3. Run ``make all`` which will compile the pages.
4. Run ``make install`` to compile pages and copy to ``man/man1/``.
