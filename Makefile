CFLAGS = -Wall -Werror -Wextra

CC = gcc
DEBUG = -g
all: lexer parser tree_ dump akinator main
	$(CC) $(DEBUG) $(CFALGS) main.o lexer.o parser.o tree.o dump_tree.o Akinator.o -o Play
	rm *.o
main:
	$(CC) $(DEBUG) -c $(CFLAGS) main.c
lexer:
	$(CC) $(DEBUG) -c $(CFLAGS) lex_analysis/lexer.c
parser:
	$(CC) $(DEBUG) -c $(CFLAGS) lex_analysis/parser.c
dump:
	$(CC) $(DEBUG) -c $(CFLAGS) dump_tree/dump_tree.c
tree_:
	$(CC) $(DEBUG) -c $(CFLAGS) tree/tree.c
akinator:
	$(CC) $(DEBUG) -c $(CFLAGS) Akinator/Akinator.c
clean:
	rm -rf *.out *.o *.dot *.png vgcore.* Play