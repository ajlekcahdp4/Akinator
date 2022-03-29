#ifndef PARSER_INCLUDED
#define PARSER_INCLUDED

#include "lexer.h"

struct node_t
{
    struct lexem_t lexem;
    struct node_t *left;
    struct node_t *right;
};

struct lexer_state
{
    size_t cur;
    int braces_state;
    struct lex_array_t *lexarr;
};

struct node_t *Buildtree (struct lex_array_t *lexarr);
struct node_t *ParseS (struct lexer_state *pstate);


#endif