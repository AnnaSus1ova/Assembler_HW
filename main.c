#include <stdio.h>
#include <string.h>
#include <ctype.h>

int check_binary_property(const char* text);
void apply_rule1(char* text);
void apply_rule2(char* text);

int main() {
    char text[101];
    
    printf("Введите текст (максимум 100 символов): ");
    if (fgets(text, sizeof(text), stdin) == NULL) {
        printf("Ошибка ввода.\n");
        return 1;
    }
    
    text[strcspn(text, "\n")] = '\0';
    
    printf("\nИсходный текст: \"%s\"\n", text);
    
    int is_binary = check_binary_property(text);
    
    if (is_binary) {
        printf("Текст является двоичным числом. Применяется правило 1.\n");
        apply_rule1(text);
    } else {
        printf("Текст не является двоичным числом. Применяется правило 2.\n");
        apply_rule2(text);
    }
    
    printf("Преобразованный текст: \"%s\"\n", text);
    
    return 0;
}

void run_tests() {
    printf("\n=== Тестирование ===\n");
    
    const char* test_cases[] = {
        "00001111",  // двоичное число
        "10101010",  // двоичное число
        "aBc123!@",  // не двоичное
        "00000000",  // двоичное число
        "11111111",  // двоичное число
        "abc123",    // не двоичное
        NULL
    };
    
    for (int i = 0; test_cases[i] != NULL; i++) {
        char text[101];
        strcpy(text, test_cases[i]);
        
        printf("\nТест %d: \"%s\"\n", i+1, text);
        
        int is_binary = check_binary_property(text);
        
        if (is_binary) {
            printf("Применяется правило 1: ");
            apply_rule1(text);
        } else {
            printf("Применяется правило 2: ");
            apply_rule2(text);
        }
        
        printf("Результат: \"%s\"\n", text);
    }
}