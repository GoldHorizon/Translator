%{
    #include <iostream>
    #include "tokens.h"

    int _line = 1;
    int _col = 0;
%}

%option noyywrap
%option nounput

%%
def						{ _col += yyleng; return _define; }
==						{ _col += yyleng; return _equals; }
\.\.					{ _col += yyleng; return _list; }
[+\-*/<>.,:;{}()=]		{ _col += yyleng; return yytext[0]; }
[[:alpha:]][[:alnum:]]*	{ _col += yyleng; return _identifier; }
[[:digit:]]+			{ _col += yyleng; return _integer; }
0x[:xdigit:]+			{ _col += yyleng; return _hex; }
\".*\"					{ _col += yyleng; return _string; }
'.'						{ _col += yyleng; return _char; }
"//".*					{ } /* Comment */
[ \t]					{ _col++; } /* White space */
\n						{ _line++; _col = 0; }
.						{ std::cerr << "Lexical error line " << _line << ": " << yytext << std::endl; }
%%

