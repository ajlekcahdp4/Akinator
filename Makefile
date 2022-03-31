CFLAGS = -Wall -Werror -Wextra

TMP_P = temp/
CC = gcc
DEBUG = 
all: create_folder lexer parser tree_ dump akinator main
	$(CC) $(DEBUG) $(CFALGS) $(TMP_P)main.o $(TMP_P)lexer.o $(TMP_P)parser.o $(TMP_P)tree.o $(TMP_P)dump_tree.o $(TMP_P)Akinator.o -o Play
main:
	$(CC) $(DEBUG) -c $(CFLAGS) main.c -o $(TMP_P)main.o
lexer:
	$(CC) $(DEBUG) -c $(CFLAGS) lex_analysis/lexer.c -o $(TMP_P)lexer.o
parser:
	$(CC) $(DEBUG) -c $(CFLAGS) lex_analysis/parser.c -o $(TMP_P)parser.o
dump:
	$(CC) $(DEBUG) -c $(CFLAGS) dump_tree/dump_tree.c -o $(TMP_P)dump_tree.o
tree_:
	$(CC) $(DEBUG) -c $(CFLAGS) tree/tree.c -o $(TMP_P)tree.o
akinator:
	$(CC) $(DEBUG) -c $(CFLAGS) Akinator/Akinator.c -o $(TMP_P)Akinator.o
create_folder:
	chmod +x bash_scripts/mkdir.sh
	./bash_scripts/mkdir.sh $(TMP_P)
clean:
	rm -rf *.out *.o *.dot *.png vgcore.* Play $(TMP_P)