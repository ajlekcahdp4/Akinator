CFLAGS = -Wall -Werror -Wextra

TMP_P = temp/
CC = gcc
DEBUG = 

all: PROGRAM

PROGRAM: create_folder LEXER PARSER TREE DUMP AKINATOR MAIN
	$(CC) $(DEBUG) $(CFALGS) $(TMP_P)main.o $(TMP_P)lexer.o $(TMP_P)parser.o $(TMP_P)tree.o $(TMP_P)dump_tree.o $(TMP_P)Akinator.o -o Play

MAIN:
	$(CC) $(DEBUG) -c $(CFLAGS) main.c -o $(TMP_P)main.o

LEXER:
	$(CC) $(DEBUG) -c $(CFLAGS) lex_analysis/lexer.c -o $(TMP_P)lexer.o

PARSER:
	$(CC) $(DEBUG) -c $(CFLAGS) lex_analysis/parser.c -o $(TMP_P)parser.o

DUMP:
	$(CC) $(DEBUG) -c $(CFLAGS) dump_tree/dump_tree.c -o $(TMP_P)dump_tree.o

TREE:
	$(CC) $(DEBUG) -c $(CFLAGS) tree/tree.c -o $(TMP_P)tree.o

AKINATOR:
	$(CC) $(DEBUG) -c $(CFLAGS) Akinator/Akinator.c -o $(TMP_P)Akinator.o

create_folder:
	chmod +x bash_scripts/mkdir.sh
	./bash_scripts/mkdir.sh $(TMP_P)

clean:
	rm -rf *.out *.o *.dot *.png vgcore.* Play $(TMP_P)