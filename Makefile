CFLAGS = -Wall -Werror -Wextra

CC = gcc
DEBUG = -g
all:


main: lexer
	$(CC) $(DEBUG) $(CFALGS) main.c lexer.o -o main.out

lexer:
	$(CC) $(DEBUG) -c $(CFALGS) lex_analysis/lexer.c
