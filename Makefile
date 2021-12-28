compilation_tests_inclus:
	pdflatex mf.tex
	evince mf.pdf &
permission:
	chmod 770 *.sh
clean:
	rm -f *.sh~ Makefile~ *.c~ *.tex~ *.aux *.log *.aux~ *.log~ *.pdf mf.c mf.tex mf.aux mf.log mf.pdf mf.sh mf *.txt 
clean2:
	rm -f monfichier.tex monfichier.sh monfichier.c
