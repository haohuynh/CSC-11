/*
 This program
 uses a (1 to 4) Byte integer as the numerator
 and a (1 to 4) Byte integer as the denominator.
 Then, it applies subtraction and loops only
 to output numerator/denominator example 16/3 = 5
*/

.global _start

_start:
MOV R1, #16 @ R1 is the numerator
MOV R2, #3  @ R2 is the denominator
MOV R0, #0  @ R0 is the quotient

CMP R1, R2 @ Check R1 < R2
BLT _exit

_wloop:
ADD R0, R0, #1	@ Increase the quotient
SUB R1, R1, R2
CMP R1, R2	@ if R1 >= R2, then repeat the subtraction
BGE _wloop

_exit:
MOV R7, #1 @Return control to the CLI
SWI 0

