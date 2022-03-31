#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "tree.h"
#include "../lex_analysis/lexer.h"
#include "../dump_tree/dump_tree.h"

struct node_t
{
    struct lexem_t lexem;
    struct node_t *left;
    struct node_t *right;
};


struct node_t *TreeCreateNode ()
{
    struct node_t *top = calloc (1, sizeof (struct node_t));
    assert (top);
    return top;
}



#ifdef DUMP_INCLUDED

void TreeDump (struct node_t *top)
{
    FILE *dotfile = fopen ("temp/dump.dot", "w");
    assert (dotfile);
    DtStart (dotfile);
    DtSetNodes (dotfile, top);
    DtSetDependencies (dotfile, top);
    DtEnd (dotfile);
    fclose (dotfile);
    system ("dot temp/dump.dot -T png -o dump.png");
}

#endif

void TreeDtor(struct node_t * top) 
{
    if (top->left)
        TreeDtor (top->left);
    if (top->right)
        TreeDtor (top->right);
    free (top->lexem.lex.str);
    free (top);
}