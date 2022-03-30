#include <stdio.h>
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <string.h>
#include "Akinator.h"


// Example of colorised printf ("\x1b[31mTest\x1b[0m\n");

void Greeting ();


int RunAkinator (struct node_t *top)
{
    Greeting ();

}



void Greeting ()
{
    printf ("Hi there. Let's play the game\n\n");
    printf ("\x1b[31mI\x1b[33mm\x1b[1;33ma\x1b[32mg\x1b[36mi\x1b[34mn\x1b[35me\x1b[0m someone or something and I'll to guess\n\n");
    printf ("I will ask you a questions and you must give me an answers like \"y\" (Yes) or \"n\" (No)\n");
    printf ("Let's go!\n\n");
}