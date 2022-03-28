#include <stdio.h>
#include <stdlib.h>
#include "dump_tree.h"


struct node_t {
    char *data;
    struct node_t *left;
    struct node_t *right;
};



void DtStart (FILE* dotfile)
{
    fprintf (dotfile, "digraph G {\n");
    fprintf (dotfile, "rankdir = TB\n");
}

void DtSetNode (FILE* dotfile, struct node_t *node)
{
    fprintf (dotfile, "Node%p [style=filled, fillcolor = \"palegreen\" ,label=\"%s\"];\n", node, node->data);
}

void DtSetNodes (FILE *dotfile, struct node_t *top)
{
    DtSetNode (dotfile, top);
    if (top->left)
        DtSetNodes (dotfile, top->left);
    if (top->right)
        DtSetNodes (dotfile, top->right);
}

void DtSetDependencies (FILE *dotfile, struct node_t *top)
{
    if (top->left)
    {
        fprintf (dotfile, "Node%p->Node%p\n", top, top->left);
        DtSetDependencies (dotfile, top->left);
    }
    if (top->right)
    {
        fprintf (dotfile, "Node%p->Node%p\n", top, top->right);
        DtSetDependencies (dotfile, top->right);
    }
    fprintf (dotfile, "\n");
}

void DtEnd (FILE* dotfile)
{
    fprintf (dotfile, "}\n");
} 

