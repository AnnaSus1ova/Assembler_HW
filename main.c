#include <stdio.h>
#include <string.h>
#include <stdbool.h>

// Объявления ассемблерных функций
extern bool is_binary(const char* text);
extern void apply_rule1(char* text);
extern void apply_rule2(char* text);

int main() {
    char text[101];
    char original_text[101];
    
    printf("Введите текст (не более 100 символов): ");
    fgets(text, sizeof(text), stdin);
    
    // Удаляем символ новой строки, если он есть
    size_t len = strlen(text);
    if (len > 0 && text[len-1] == '\n') {
        text[len-1] = '\0';
    }
    
    // Сохраняем оригинальный текст
    strcpy(original_text, text);
    
    // Выводим исходный текст
    printf("\nИсходный текст: \"%s\"\n", original_text);
    
    // Проверяем свойство текста
    bool is_bin = is_binary(text);
    
    if (is_bin) {
        printf("Текст является двоичным числом в 8-битном регистре\n");
        printf("Применяем Правило 1: заменяем число его дополнительным кодом\n");
        apply_rule1(text);
    } else {
        printf("Текст НЕ является двоичным числом в 8-битном регистре\n");
        printf("Применяем Правило 2: все символы, не являющиеся латинскими буквами, заменяем пробелами\n");
        apply_rule2(text);
    }
    
    // Выводим преобразованный текст
    printf("Преобразованный текст: \"%s\"\n", text);
    
    return 0;
}

// Функция для автоматического тестирования
void test_automation() {
    struct TestCase {
        const char* input;
        bool expected_binary;
        const char* expected_output;
    };
    
    struct TestCase test_cases[] = {
        {"00001111", true, "11110001"},
        {"11111111", true, "00000001"},
        {"10000000", true, "10000000"},
        {"aX_1*(v c", false, "aX 1  v c"},
        {"Hello123", false, "Hello   "},
        {"01010101", true, "10101011"},
        {"abcdefgh", false, "abcdefgh"},
        {"00112233", false, "  11  33"}
    };
    
    int num_tests = sizeof(test_cases) / sizeof(test_cases[0]);
    int passed = 0;
    
    for (int i = 0; i < num_tests; i++) {
        char buffer[101];
        strcpy(buffer, test_cases[i].input);
        
        bool is_bin = is_binary(buffer);
        
        if (is_bin != test_cases[i].expected_binary) {
            printf("Тест %d не пройден: неверное определение свойства (ожидалось %d, получено %d)\n",
                   i+1, test_cases[i].expected_binary, is_bin);
            continue;
        }
        
        if (is_bin) {
            apply_rule1(buffer);
        } else {
            apply_rule2(buffer);
        }
        
        if (strcmp(buffer, test_cases[i].expected_output) != 0) {
            printf("Тест %d не пройден: неверный результат преобразования\n", i+1);
            printf("Вход: %s\nОжидалось: %s\nПолучено: %s\n",
                   test_cases[i].input, test_cases[i].expected_output, buffer);
            continue;
        }
        
        passed++;
    }
    
    printf("Результаты тестирования: %d/%d тестов пройдено\n", passed, num_tests);
}