#ifndef TREE_INCLUDED
#define TREE_INCLUDED

struct node_t;

struct node_t *TreeCreateNode ();
struct node_t *TreeLeftInsert (struct node_t *top, char* data);
struct node_t *TreeRightInsert (struct node_t *top, char* data);
void TreeDump (struct node_t *top);
void TreeDtor(struct node_t * top);

#endif