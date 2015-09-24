/*
 This program 
 uses a (1 to 4) Byte integer as the numerator 
 and a (1 to 4) Byte integer as the denominator.
 Then, it applies subtraction and loops only
 to output numerator/denominator example 16/3 = 5 
 and to output numerator%denominator example 16%3 = 1.
*/

.global _start 

_start: 
MOV R1, #16 @ R1 is the numerator
MOV R2, #3  @ R2 is the denominator
MOV R3, #0  @ R3 is the quotient

CMP R1, R2 @ Check R1 < R2
BLT exit 
SUBS R1,R2
ADD R3, R3, #1

exit:
MOV R7, #1 @Return control to the CLI
SWI 0
 
