#include <string.h>
#include <ctype.h>

// Проверяет, является ли текст записью двоичного числа в 8-битном регистре
// Возвращает 1 если да, 0 если нет
int check_binary_property(const char* text) {
    // Проверка длины строки (должна быть 8 символов)
    if (strlen(text) != 8) {
        return 0;
    }
    
    for (int i = 0; i < 8; i++) {
        if (text[i] != '0' && text[i] != '1') {
            return 0;
        }
    }
    
    return 1;
}