manpages = git-cleanup.1
all: $(manpages)

$(manpages): %.1: %.1.md

%.1 : %.1.md
	pandoc $@.md -s -t man -o $@

install : $(manpages)
	mkdir -p ../dotfiles/man/man1
	cp *.1 ../dotfiles/man/man1

clean:
	-rm *.1
