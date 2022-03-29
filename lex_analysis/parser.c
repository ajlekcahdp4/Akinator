#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
#include "parser.h"

//Gramar:
//S   -> BRACE | STR
//BRACE  -> { | }
//STR -> string

#define START_STATE -1 

struct node_t *ParseS (struct lexer_state *pstate);
struct lexem_t Current (struct lexer_state *pstate);


struct node_t *Buildtree (struct lex_array_t *lexarr)
{
    struct node_t *top = 0;
    struct lexer_state *pstate = calloc (1, sizeof(struct lexer_state));
    pstate->lexarr = lexarr;
    pstate->braces_state = START_STATE;
    

    top = ParseS (pstate);
    return top;
}

struct node_t *ParseS (struct lexer_state *pstate)
{
    struct node_t *top = NULL;
    struct node_t *lhs = NULL;
    struct node_t *rhs = NULL;

    if (pstate->braces_state == -1)
        pstate->braces_state = 0;
    else if (pstate->braces_state == 0)
        return top;//exit value
    
    if (IsBrace (pstate))
    {
        top = ParseBrace(pstate);
        return top;
    }
    else if (IsStr (pstate))
    {
        top = ParseStr (pstate);
        return top;
    }

    fprintf (stderr, "ERROR: Unknown type of lexem kind (don't even know how it is possible)\n");
    exit(0);
}

struct node_t *ParseBrace (struct lexer_state *pstate)
{
    struct node_t *top = NULL;
    struct node_t *lhs = NULL;
    struct node_t *rhs = NULL;
    
    top = calloc (1, sizeof(struct node_t));
    top->lexem.kind  = BRACE;
    if (IsRBrace (pstate))
    {
        top->lexem.lex.b = RBRACE;
        pstate->braces_state -= 1;
    }
    else
    {
        top->lexem.lex.b = LBRACE;
        pstate->braces_state += 1;
    }
    pstate->cur += 1;

    lhs = ParseS (pstate);
    rhs = ParseS (pstate);

    top->left = lhs;
    top->right = rhs;
    return top;
}

struct node_t *ParseStr (struct lexer_state *pstate)
{
    //TODO: My code here
}

struct lexem_t Current (struct lexer_state *pstate)
{
    return pstate->lexarr->lexems[pstate->cur];
}

int IsStr (struct node_t *pstate)
{
    struct lexem_t cur = Current (pstate);
    if (cur.kind != STR)
        return 0;
    return 1;
}

int IsBrace (struct lexer_state *pstate)
{
    struct lexem_t cur = Current (pstate);
    if (cur.kind != BRACE)
        return 0;
    return 1;
}

int IsRBrace (struct lexer_state *pstate)
{
    struct lexem_t cur = Current (pstate);
    if (cur.kind != BRACE)
        return 0;
    if (cur.lex.b != RBRACE)
        return 0;
    return 1;
}