#include <string.h>

// Правило 1: заменить число его дополнительным кодом
void apply_rule1(char* text) {
    for (int i = 0; i < 8; i++) {
        text[i] = (text[i] == '0') ? '1' : '0';
    }
    
    int carry = 1;
    for (int i = 7; i >= 0 && carry > 0; i--) {
        if (text[i] == '0') {
            text[i] = '1';
            carry = 0;
        } else {
            text[i] = '0';
        }
    }
}