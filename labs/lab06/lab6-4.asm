%include 'in_out.asm' ; подключение внешнего файла
SECTION .data
msg: DB 'Ввод значения x: ',0
rem: DB 'Результат: ',0
SECTION .bss
x: RESB 80 ; значение x, вводимое нами
SECTION .text
GLOBAL _start
_start:
mov eax, msg
call sprint
mov ecx, x
mov edx, 80
call sread
mov eax,x ; eax=x
call atoi
mov ebx,31 ; ebx=31
mul ebx ; eax=eax*ebx
add eax,-5 ; eax=eax-5
add eax,10 ; eax=eax+10
mov edi,eax ; запись результата вычисления в edi
mov eax,rem ; вызов подпрограммы печати
call sprint ; сообщения 'Результат: '
mov eax,edi ; вызов подпрограммы печати значения
call iprint ; из 'edi' в виде символов
call quit ; вызов подпрограммы завершения