#include <stdio.h>
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <string.h>
#include <ctype.h>
#include "Akinator.h"


#define MAX_STR_LEN 256

char *Greeting      (void);
char *InputAnswer   (void);
char *StdioInputStr (void);
int   AskQuestion   (struct node_t *top);
void  SaveTree      (struct node_t *top);
void  PrintNode     (FILE *f, struct node_t *top, char *prefix);   
void  ClearBuffer   (void);
struct node_t *InsertNewNode (struct node_t *leaf);





int RunAkinator (struct node_t *top)
{
    char *res = NULL;


    res = Greeting ();
    if (res == 0)
        return 0;
    while (res && strcmp (res, "y") == 0)
    {
        free (res);
        if ( AskQuestion (top) == 0)
            return 0;
        SaveTree (top);
        printf ("\nDo you want to play one more time?\n");
        res = InputAnswer ();
    }
    printf ("Okey, see you later\n");
    free (res);
    return 0;
}

struct node_t *InsertNewNode (struct node_t *leaf)
{
    char *Name = NULL;
    char *Question = NULL;
    struct node_t *new_l_leaf = calloc (1, sizeof(struct node_t));
    struct node_t *new_r_leaf = calloc (1, sizeof(struct node_t));

    new_l_leaf->lexem.kind = STR;
    new_r_leaf->lexem.kind = STR;
    new_r_leaf->lexem.lex.str = leaf->lexem.lex.str;
    printf ("Oh, no! Seems like I don't know who is it!\n");
    printf ("Who was it?\nA: ");
    Name = StdioInputStr ();
    new_l_leaf->lexem.lex.str = Name;

    printf ("How does %s differ from %s?\n A: ", Name, leaf->lexem.lex.str);
    Question = StdioInputStr (); 
    strcat (Question, "?");
    leaf->lexem.lex.str = Question;
    leaf->left = new_l_leaf;
    leaf->right = new_r_leaf;
    return leaf;
}


char *Greeting ()
{
    char *res = NULL;
    printf ("Hi there! My name is Akinator!\nLet's play the game\n\n");
    printf ("\033[01;38;05;196mI\033[01;38;05;214mm\033[01;38;05;226ma\033[01;38;05;46mg\033[01;38;05;51mi\033[01;38;05;21mn\033[01;38;05;201me\x1b[0m someone or something and I'll try to guess\n\n");
    printf ("I will ask you a questions and you must give me an answers like \"y\" (Yes) or \"n\" (No)\n");
    printf ("Want to start?\n");

    res = InputAnswer();
    if (res == 0)
        return res;
    if (strcmp (res, "y") == 0)
        printf ("Let's go!\n\n");
    return res;
}

int AskQuestion (struct node_t *top)
{
    char *answ = NULL;
    int res = 0;
    struct node_t *cur = top;
    printf ("Q: %s\n", cur->lexem.lex.str);
    answ = InputAnswer ();
    if (answ == NULL)
        return 0;
    if (strcmp (answ, "y") == 0)
    {
        free (answ);
        cur = cur->left;
        if (cur->left == NULL)
        {
            printf ("I guess, it's %s am I right?\n", top->left->lexem.lex.str);
            answ = InputAnswer ();
            if (strcmp(answ, "y") == 0)
                printf ("\nCool!\n");
            else
            {
                InsertNewNode (cur);
            }
            free(answ);
        }
        else
        {
            res = AskQuestion (cur);
            if (res == 0)
                return 0;
        }
    }
    else if (cur->right)
    {
        free(answ);
        cur = cur->right;
        if (cur->right)
        {
            res = AskQuestion (cur);
            if (res == 0)
                return 0;
        }
        else
        {
            printf ("I guess, it's %s am I right?\n", cur->lexem.lex.str);
            answ = InputAnswer ();
            if (strcmp(answ, "y") == 0)
                printf ("\nCool!\n");
            else
            {
                InsertNewNode (cur);
            }
            free (answ);
        }
    }
    else
    {
        free(answ);
        InsertNewNode(top);
    }
    return 1;
}

char *InputAnswer ()
{
    int res = 0;
    char *answ = NULL;
    while (res == 0)
    {
        printf ("A: ");
        answ = StdioInputStr ();
        if (strcmp (answ, "y") != 0 && strcmp (answ, "n") != 0 && strcmp (answ, "q") != 0)
        {
            printf ("Incorrect input. Please, answer \"y\" (yes) or \"n\" (no)\n");
            free (answ);
        }
        else
            res = 1;
    }
    if (strcmp (answ, "q") == 0)
    {
        free (answ);
        return NULL;
    }
    return answ;
}




#define START_LEN 8
char  *StdioInputStr ()
{
    char c = 0;
    size_t len = START_LEN;
    size_t i = 0;
    char *str = calloc (len, sizeof(char));
    c = getchar();
    while (c == '\n')
        c = getchar();
    while (isalpha(c) || (isspace(c) && (c != '\n')))
    {
        if (i == len)
        {
            size_t ip = len;
            len *= 2;
            str = realloc (str, (len + 1) * sizeof(char));
            while (ip < len)
            {
                str[ip] = '\0';
                ip += 1;
            }
        }
        str[i] = c;
        i++;
        c = getchar();
    }
    return str;
}
#undef START_LEN



void ClearBuffer ()
{
    while (getchar () != '\n') {;}
}


void SaveTree (struct node_t *top)
{
    FILE* f = fopen ("logs/tree.dat", "w");
    assert (f);
    PrintNode (f, top, "");
    fclose (f);
}

void PrintNode (FILE *f, struct node_t *top, char *prefix)
{
    assert (f);
    char *new_prefix = calloc (MAX_STR_LEN, sizeof (char));
    strcat (new_prefix, prefix);
    strcat (new_prefix, "\t");
    if (top->left)
    {
        fprintf (f, "%s{ %s\n", prefix, top->lexem.lex.str);
        
        PrintNode (f, top->left, new_prefix);
        PrintNode (f, top->right, new_prefix);

        fprintf(f, "%s}\n", prefix);
    }
    else
    {
        fprintf (f, "%s{ %s}\n", prefix, top->lexem.lex.str);
    }
    free (new_prefix);
}