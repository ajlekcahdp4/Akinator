#include <stdio.h>
#include <stdio.h>
#include <stdlib.h>
#include "tree/tree.h"
#include "dump_tree/dump_tree.h"
#include "Akinator/Akinator.h"
#include "lex_analysis/lexer.h"
#include "lex_analysis/parser.h"

#define DUMP

void End (struct lex_array_t *lex, struct node_t *top)
{
    TreeDtor (top);
    free (lex->lexems);
    free (lex);
}


int main (int argc, char **argv)
{

    char *buf = 0;
    size_t len = LexerInput (&buf, "logs/tree.dat");
    //==================Lexer====================
    struct lex_array_t *lex = LexString (buf, len);
    free (buf);
    //==================Parser===================
    struct node_t *top = BuildTree (lex);
    //=================Akinator==================
    RunAkinator (top);
    //===================End=====================
    CondDump (argv[argc - 1], top);
    End (lex, top);
    return 0;

}