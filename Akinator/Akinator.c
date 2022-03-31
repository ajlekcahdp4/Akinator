#include <stdio.h>
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <string.h>
#include "Akinator.h"


#define MAX_STR_LEN 256

void Greeting ();
void AskQuestion (struct node_t *top);
char *InputAnswer ();
void ClearBuffer ();


int RunAkinator (struct node_t *top)
{
    Greeting ();
    AskQuestion (top);
    return 0;
}



void Greeting ()
{
    printf ("Hi there. Let's play the game\n\n");
    printf ("\033[01;38;05;196mI\033[01;38;05;214mm\033[01;38;05;226ma\033[01;38;05;46mg\033[01;38;05;51mi\033[01;38;05;21mn\033[01;38;05;201me\x1b[0m someone or something and I'll try to guess\n\n");
    printf ("I will ask you a questions and you must give me an answers like \"y\" (Yes) or \"n\" (No)\n");
    printf ("Let's go!\n\n");
}

void AskQuestion (struct node_t *top)
{
    char *answ = NULL;
    struct node_t *cur = top;
    printf ("Q: %s\n", cur->lexem.lex.str);
    answ = InputAnswer ();
    if (strcmp (answ, "y") == 0)
    {
        free (answ);
        cur = cur->left;
        if (cur->left == NULL)
        {
            printf ("I guess, it's %s am I right?\n", top->left->lexem.lex.str);
            answ = InputAnswer ();
            if (strcmp(answ, "y") == 0)
                printf ("Cool!\n");
            else
                printf ("Sorry, that all, I can do(9(\n");
            free(answ);
        }
        else
        {
            AskQuestion (cur);
        }
    }
    else if (top->right)
    {
        free(answ);
        if (top->right->right)
        {
            AskQuestion (top->right);
        }
        else
        {
            printf ("I guess, it's %s am I right?\n", top->right->lexem.lex.str);
            answ = InputAnswer ();
            if (strcmp(answ, "y") == 0)
                printf ("Cool!\n");
            else
                printf ("Sorry, that all, I can do(9(\n"    );
            free (answ);
        }
    }
    else
    {
        free(answ);
        printf ("Sorry, that all, I can do(9(\n");
    }
}

char *InputAnswer ()
{
    int res = 0;
    size_t i = 0;
    char *answ = calloc (MAX_STR_LEN, sizeof(char));
    while (res == 0)
    {
        printf ("A: ");
        scanf ("%s", answ);
        if (strcmp (answ, "y") != 0 && strcmp (answ, "n") != 0)
        {
            printf ("Incorrect input. Please, answer \"y\" (yes) or \"n\" (no)\n");
            ClearBuffer ();
            while (answ[i] != 0)
            {
                answ[i] = 0;
                i++;
            }
        }
        else
            res = 1;
    }
    return answ;
}

void ClearBuffer ()
{
    while (getchar () != '\n') {;}
}