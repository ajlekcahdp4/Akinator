CFLAGS = -Wall -Werror -Wextra

CC = gcc
DEBUG = -g
all:


main: lexer parser tree_ dump akinator
	$(CC) $(DEBUG) $(CFALGS) main.c lexer.o parser.o tree.o dump_tree.o Akinator.o -o main.out

lexer:
	$(CC) $(DEBUG) -c $(CFALGS) lex_analysis/lexer.c
parser:
	$(CC) $(DEBUG) -c $(CFLAGS) lex_analysis/parser.c
dump:
	$(CC) $(DEBUG) -c $(CFLAGS) dump_tree/dump_tree.c
tree_:
	$(CC) $(DEBUG) -c $(CFLAGS) tree/tree.c
akinator:
	$(CC) $(DEBUG) -c $(CFLAGS) Akinator/Akinator.c
clean:
	rm -rf *.out *.o *.dot *.png vgcore.*