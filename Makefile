all:
	bison -o parser.c -d parser.y
	flex -o lexer.c lexer.l
	gcc *.c -o duckuino

clean:
	rm -f *.c *.h *.o duckuino
