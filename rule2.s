# Правило 2: все символы, не являющиеся латинскими буквами, заменить пробелами
# Вход: char* text в %rdi

.global apply_rule2

apply_rule2:
    push %rbx
    mov %rdi, %rbx        # Сохраняем указатель на текст
    
    mov $0, %rcx          # Счетчик
process_loop:
    mov (%rbx, %rcx), %al
    cmp $0, %al
    je end_process
    
    # Проверяем, является ли символ латинской буквой
    cmp $'A', %al
    jl replace
    cmp $'Z', %al
    jle next_char
    cmp $'a', %al
    jl replace
    cmp $'z', %al
    jle next_char
    
replace:
    mov $' ', (%rbx, %rcx)
    
next_char:
    inc %rcx
    jmp process_loop
    
end_process:
    pop %rbx
    ret