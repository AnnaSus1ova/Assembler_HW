# Проверка, является ли текст двоичным числом в 8-битном регистре
# Вход: const char* text в %rdi
# Выход: bool (1 - true, 0 - false) в %rax

.global is_binary

is_binary:
    push %rbx
    mov %rdi, %rbx        # Сохраняем указатель на текст
    
    # Проверяем длину строки (должна быть 8 символов)
    mov $0, %rcx
length_loop:
    mov (%rbx, %rcx), %al
    cmp $0, %al
    je check_length
    inc %rcx
    cmp $100, %rcx        # Защита от бесконечного цикла
    jl length_loop
    
check_length:
    cmp $8, %rcx
    jne not_binary
    
    # Проверяем, что все символы '0' или '1'
    mov $0, %rcx
check_chars:
    mov (%rbx, %rcx), %al
    cmp $0, %al
    je is_binary_true
    
    cmp $'0', %al
    je next_char
    cmp $'1', %al
    je next_char
    jmp not_binary
    
next_char:
    inc %rcx
    jmp check_chars
    
is_binary_true:
    mov $1, %rax
    jmp end_check
    
not_binary:
    mov $0, %rax
    
end_check:
    pop %rbx
    ret