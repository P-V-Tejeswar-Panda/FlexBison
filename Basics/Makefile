all: wc.out

wc.out: lex.yy.c
	gcc -lfl lex.yy.c -o wc.out
lex.yy.c:
	lex word_count.l
clean:
	rm lex.yy.c
	rm *.out