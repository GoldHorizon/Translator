#include <iostream>
#include <iomanip>

#include "parser.h"
#include "tokens.h"

extern int yylex();
extern char* yytext;

extern int _line;
extern int _col;

int main (int argc, char** argv) {

    int result;

    result = yylex();

    while (result != 0) {

        lexeme* temp = new lexeme(yytext, _line, _col);

        std::cout << "Result: " 	<< std::setw(5) << std::left << result 
            << " - Line: " 	<< std::setw(5) << std::right << temp->line 
            << " : " 			<< std::setw(5) << std::left << temp->col
            << " - \"" 		<< temp->name << "\"\n";

        // Currently just storing in a lexeme to test 
        // the structure for future lookahead lexeme(s)
        delete temp;

        result = yylex();
    }

    return 0;
}
