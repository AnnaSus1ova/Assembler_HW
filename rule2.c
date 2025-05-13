#include <ctype.h>

// Правило 2: все символы, не являющиеся латинскими буквами, заменить пробелами
void apply_rule2(char* text) {
    for (int i = 0; text[i] != '\0'; i++) {
        if (!isalpha(text[i])) {
            text[i] = ' ';
        }
    }
}