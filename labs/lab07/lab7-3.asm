%include 'in_out.asm'
section .data
 a:   dd 24
 b:   dd 98
 c:   dd 15
 a1:  db 'Наименьшее число 24', 0
 b1:  db 'Наименьшее число 98', 0
 c1:  db 'Наименьшее число 15', 0
section .bss
section .text
 global _start
_start:
 mov  eax, a
 mov  ebx, b
 mov  ecx, c
 cmp  eax, ecx
 jl   _cc
 mov  eax, a1
 jmp  _end


_bb:
 cmp  eax, ebx
 jl   _cc
 mov  eax, b1
 jmp  _end


_cc:
 mov  eax, c1

_end:
 call sprintLF
 call quit
