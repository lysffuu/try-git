section .data
    hello db 'Hello, World!', 0

section .text
    global _start

_start:
    ; 计算字符串的长度
    mov ecx, 0
    mov esi, hello
    loop_start:
        cmp byte [esi + ecx], 0
        je loop_end
        inc ecx
        jmp loop_start
    loop_end:

    ; 调用系统调用打印字符串
    mov eax, 4
    mov ebx, 1
    mov edx, ecx
    mov ecx, hello
    int 0x80

    ; 退出程序
    mov eax, 1
    xor ebx, ebx
    int 0x80

