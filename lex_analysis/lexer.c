#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
#include <sys/stat.h>
#include <ctype.h>
#include "lexer.h"

#define MAX_STR_LEN 256


void PrintLexem (struct lex_array_t *lex, size_t i);
size_t StrInsert (struct lex_array_t *lex, const char *buf, size_t *i, size_t ip);
int SkeepSpaces (const char *buf, size_t len, size_t *ip);
int LexInsert (struct lex_array_t *lex,  const char *buf, size_t len, size_t *i, size_t ip);

size_t LexerInput (char **buf, char *filename)
{
    assert (filename);
    size_t len = 0;
    FILE *inputfile = 0;

    struct stat *st = calloc (1, sizeof(struct stat));
    stat(filename, st);
    len = st->st_size;
    assert (len > 0);
    free (st);

    *buf = calloc (len + 1, sizeof(char));
    assert (*buf);
    
    inputfile = fopen (filename, "r");
    len = fread (*buf, sizeof(char), len, inputfile);
    fclose (inputfile);
    
    return len;
}

void PrintLex (struct lex_array_t *lex)
{
    for (size_t i = 0; i < lex->size; i++)
        PrintLexem (lex, i);
}

void PrintLexem (struct lex_array_t *lex, size_t i)
{
    switch (lex->lexems[i].kind)
    {
    case BRACE:
        switch (lex->lexems[i].lex.b)
        {
        case LBRACE:
            printf ("LBRACE ");
            break;
        case RBRACE:
            printf ("RBRACE ");
            break;
        }
        break;
    case STR:
        printf ("\"%s\" ", lex->lexems[i].lex.str);
        break;
    }
}


size_t StrInsert (struct lex_array_t *lex, const char *buf, size_t *i, size_t ip)
{
    size_t str_len = 0;
    lex->lexems[ip].kind = STR;
    lex->lexems[ip].lex.str = calloc (MAX_STR_LEN, sizeof(char));

    str_len = sscanf (buf + *i, "%s", lex->lexems[ip].lex.str);
    assert (str_len);
    
    str_len = strlen (lex->lexems[ip].lex.str);

    return str_len;
}


int SkeepSpaces (const char *buf, size_t len, size_t *ip)
{
    while (*ip < len && (buf[*ip] == ' ' || buf[*ip] == '\t' || buf[*ip] == '\n'))
        *ip += 1;
    return buf[*ip];
}


int LexInsert (struct lex_array_t *lex,  const char *buf, size_t len, size_t *i, size_t ip)
{
    int res = 0;
    size_t str_len = 0;
    res = SkeepSpaces (buf, len, i);

    if (!res)
        return 0;
    
    if (buf[*i] == '{')
    {
        lex->size += 1;
        lex->lexems[ip].kind = BRACE;
        lex->lexems[ip].lex.b  = LBRACE;
        *i += 1;
        if (!isspace (buf[*i]))
        {
            fprintf (stderr, "SYTAX_ERROR: no space after \'{\' symbol\n");
            exit(0);
        }
    }
    else if (buf[*i] == '}')
    {
        lex->size += 1;
        lex->lexems[ip].kind = BRACE;
        lex->lexems[ip].lex.b = RBRACE;
        *i += 1;
        if (!isspace (buf[*i]) && buf[*i] != 0)
        {
            fprintf (stderr, "SYTAX_ERROR: no space after \'}\' symbol\n");
            exit(0);
        }
    }
    else
    {
        lex->size += 1;
        str_len = StrInsert (lex, buf, i, ip);
        *i += str_len;
    }
    return (int)*i;
}

struct lex_array_t *LexString (const char *buf, size_t len)
{
    size_t size = 0;
    size_t ip = 0;
    struct lex_array_t *lex = calloc (1, sizeof(struct lex_array_t));
    assert (lex);
    lex->lexems = calloc (len, sizeof(struct lexem_t));
    assert (lex->lexems);

    for (size_t i = 0; buf[i] != '\0' && buf[i] != '\r' && buf[i] != EOF; ip++)
    {
        LexInsert (lex, buf, len, &i, ip);
    }

    return lex;
}