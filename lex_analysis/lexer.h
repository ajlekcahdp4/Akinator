#ifndef LEXER_INCLUDED
#define LEXER_INCLUDED

enum lexem_kind { BRACE, STR };
enum braces_t { LBRACE, RBRACE };

struct lexem_t
{
    enum lexem_kind kind;
    union
    {
        enum braces_t b;
        char *str;
    } lex;
};

struct lex_array_t 
{
    struct lexem_t *lexems;
    size_t size;
};

size_t LexerInput (char **buf, char *filename);
struct lex_array_t *LexString (const char *buf, size_t len);
void PrintLex (struct lex_array_t *lex);

#endif