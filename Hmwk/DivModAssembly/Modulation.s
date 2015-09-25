/*
 This program
 uses a (1 to 4) Byte integer as the numerator
 and a (1 to 4) Byte integer as the denominator.
 Then, it applies subtraction and loops only
 to output numerator%denominator example 16%3 = 1.
*/

.global _start

_start:
MOV R0, #16 @ R0 is the numerator and will be the reminder
MOV R1, #3  @ R2 is the denominator

CMP R0, R1 @ Check R0 < R1
BLT _exit

_wloop:
SUB R0, R0, R1
CMP R0, R1	@ if R0 >= R1, then repeat the subtraction
BGE _wloop

_exit:
MOV R7, #1 @Return control to the CLI
SWI 0

