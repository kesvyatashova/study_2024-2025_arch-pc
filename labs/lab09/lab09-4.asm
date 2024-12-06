%include 'in_out.asm'
SECTION .data
prim db 'f(x)=10x-4',0
otv db 'Ответ: ',0
SECTION .text
GLOBAL _start
_start:
pop ecx
pop edx
sub ecx,1
mov esi,0
mov eax,prim
call sprintLF
next:
cmp ecx,0
jz _end
pop eax
call fir
add esi,eax
loop next
_end:
mov eax,otv
call sprint
mov eax,esi
call iprintLF
call  quit
fir:
mov ebx,10
mul ebx
add eax,-4
ret