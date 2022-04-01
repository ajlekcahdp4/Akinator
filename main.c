#include <stdio.h>
#include <stdio.h>
#include <stdlib.h>
#include "tree/tree.h"
#include "dump_tree/dump_tree.h"
#include "Akinator/Akinator.h"
#include "lex_analysis/lexer.h"
#include "lex_analysis/parser.h"


int main (int argc, char **argv)
{

    char *buf = 0;
    size_t len = LexerInput (&buf, "logs/tree.dat");
    //==================Lexer====================
    struct lex_array_t *lex = LexString (buf, len);
    free (buf);
    //==================Parser===================
    struct node_t *top = BuildTree (lex);
    free (lex->lexems);
    free (lex);
    //=================Akinator==================
    RunAkinator (top);
    //===================End=====================
    CondDump (argv[argc - 1], top);
    TreeDtor (top);
    return 0;

}