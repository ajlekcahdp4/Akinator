#include <stdio.h>
#include <stdio.h>
#include <stdlib.h>
#include "tree/tree.h"
#include "dump_tree/dump_tree.h"
#include "Akinator/Akinator.h"
#include "lex_analysis/lexer.h"
#include "lex_analysis/parser.h"

void End (struct lex_array_t *lex, struct node_t *top)
{
    TreeDtor (top);
    free (lex->lexems);
    free (lex);
}



int main ()
{
    char *buf = 0;
    size_t len = LexerInput (&buf, "logs/tree.dat");
    struct lex_array_t *lex = LexString (buf, len);
    free (buf);

    PrintLex (lex);



    struct node_t *top = BuildTree (lex);
    

    TreeDump (top);



    

    End (lex, top);
    return 0;

}