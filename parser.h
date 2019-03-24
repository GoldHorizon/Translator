#include <string>

struct lexeme {
    std::string name;	
    int line;
    int col;

    lexeme (char* n, int l, int c) {
        name = static_cast<std::string>(n);
        line = l;
        col = c - name.length();
    }
};
