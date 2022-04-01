CFLAGS = -Wall -Werror -Wextra

TMP_P = temp/
CC = gcc
DEBUG = 
OPTIMISATION = -O2

all: PROGRAM

PROGRAM: create_folder LEXER_T PARSER_T TREE_T DUMP_T AKINATOR_T MAIN_T
	$(CC) $(DEBUG) $(OPTIMISATION) $(TMP_P)main.o $(TMP_P)lexer.o $(TMP_P)parser.o $(TMP_P)tree.o $(TMP_P)dump_tree.o $(TMP_P)Akinator.o -o Play
	rm -rf $(TMP_P)

MAIN_T:
	$(CC) $(DEBUG) -c $(CFLAGS) $(OPTIMISATION) main.c -o $(TMP_P)main.o

LEXER_T:
	$(CC) $(DEBUG) -c $(CFLAGS) $(OPTIMISATION) lex_analysis/lexer.c -o $(TMP_P)lexer.o

PARSER_T:
	$(CC) $(DEBUG) -c $(CFLAGS) $(OPTIMISATION) lex_analysis/parser.c -o $(TMP_P)parser.o

DUMP_T:
	$(CC) $(DEBUG) -c $(CFLAGS) $(OPTIMISATION) dump_tree/dump_tree.c -o $(TMP_P)dump_tree.o

TREE_T:
	$(CC) $(DEBUG) -c $(CFLAGS) $(OPTIMISATION) tree/tree.c -o $(TMP_P)tree.o

AKINATOR_T:
	$(CC) $(DEBUG) -c $(CFLAGS) $(OPTIMISATION) Akinator/Akinator.c -o $(TMP_P)Akinator.o

create_folder:
	chmod +x bash_scripts/mkdir.sh
	./bash_scripts/mkdir.sh $(TMP_P)

clean:
	rm -rf *.out *.o *.dot *.png vgcore.* Play $(TMP_P)