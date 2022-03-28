#include <stdio.h>
#include <stdio.h>
#include <assert.h>
#include "tree.h"
#include "../dump_tree/dump_tree.h"

struct node_t
{
    char *data;
    size_t size;
    struct node_t *left;
    struct node_t *right;
};


struct node_t *TreeCreateNode ()
{
    struct node_t *top = calloc (1, sizeof (struct node_t));
    assert (top);
    return top;
}

struct node_t *TreeLeftInsert (struct node_t *top, char* data)
{
    top->left = TreeCreateNode ();
    top->left->data = data;
    return top->left;
}

struct node_t *TreeRightInsert (struct node_t *top, char* data)
{
    top->right = TreeCreateNode ();
    top->right->data = data;
    return top->right;
}

#ifdef DUMP_INCLUDED

void TreeDump (struct node_t *top)
{
    FILE *dotfile = fopen ("dump.dot", "w");
    DtStart (dotfile);
    DtSetNodes (dotfile, top);
    DtSetDependencies (dotfile, top);
    DtEnd (dotfile);
    fclose (dotfile);
    system ("dot dump.dot -T png -o dump.png");
}

#endif

void TreeDtor(struct node_t * top) 
{
    if (top->left)
        TreeDtor (top->left);
    if (top->right)
        TreeDtor (top->right);
    free (top);
}