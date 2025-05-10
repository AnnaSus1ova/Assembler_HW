# Правило 1: заменить двоичное число его дополнительным кодом
# Вход: char* text в %rdi

.global apply_rule1

apply_rule1:
    push %rbx
    push %r12
    mov %rdi, %rbx        # Сохраняем указатель на текст
    
    # Преобразуем строку в число
    mov $0, %rax          # Результат
    mov $0, %rcx          # Счетчик
convert_loop:
    mov (%rbx, %rcx), %dl
    cmp $0, %dl
    je end_convert
    
    shl $1, %rax
    cmp $'1', %dl
    jne skip_add
    or $1, %rax
skip_add:
    inc %rcx
    jmp convert_loop
    
end_convert:
    # Вычисляем дополнительный код
    neg %al
    
    # Преобразуем обратно в строку
    mov $7, %rcx
write_back_loop:
    mov %al, %r12b
    shr %cl, %r12b
    and $1, %r12b
    add $'0', %r12b
    mov %r12b, (%rbx, %rcx)
    dec %rcx
    cmp $0, %rcx
    jge write_back_loop
    
    pop %r12
    pop %rbx
    ret