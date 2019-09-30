quit:
    mov ebx, 0
    mov eax, 1
    int 80h
    ret

section .data
    format: db "Answer is: %d", 0AH, 0H
section .text 

    global main 
    extern printf

main:
    mov ecx, 999
    mov esi, 3
    mov edi, 5 
    
    mov ebx, 0 

begin:
    mov eax, ecx 
    mov edx, 0 
    div esi
    cmp edx, 0 
    je divisable

    mov eax, ecx
    mov edx, 0 
    div edi
    cmp edx, 0 
    je divisable
    jmp undivisable

divisable:
    add ebx, ecx

undivisable:
    dec ecx
    cmp ecx, 0
    jne begin

print:
    push ebp 
    mov ebp, esp 
    push ebx
    push dword format
    call printf
    mov esp, ebp 
    pop ebp 
    call quit



