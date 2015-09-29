/*Write an efficient Div/Mod program which performs a shifted subtraction as described:
1) Shift left until the denominator is just less than or equal to the numerator
2) Subtract shifted denominator from the numerator, increment the shifted division
3)  Shift the denominator right until just less than or equal to what is left from the numerator after subtraction
4) Repeat 2) until the increment for the shifted division is no more than 1
5) Output the results, either div or mod.
*/

.global _start

_start:
MOV R1, #45 @ R1 is the numerator
MOV R2, #6  @ R2 is the denominator
MOV R3, #1  @ R3 is the scalar of the original denominator
MOV R4, R2	@ R4 is a copy of the denominator
MOV R0, #0  @ R0 is the quotient

CMP R1, R2 @ Check R1 < R2
BLT _exit


CMP R1, R2 @ Check R1 == R2
BEQ _cont1

_while_loop1:
LSL R2, #1 @ R2*=2
LSL R3, #1 @ R3*=2
CMP R1, R2 @ Check R1 > R2
BGT _while_loop1

_cont1:


_do_while:
CMP R2, R1 @ Check R2 <= R1
BLE _cont2:

_while_loop2:
LSR R2, #1 @ R2/=2
LSR R3, #1 @ R3/=2
CMP R2, R1 @ Check R2 > R1
BGT _while_loop2

_cont2:

SUB R1, R1, R2 @ R1 -= R2
ADD R0, R0, R3 @ R0 += R3

CMP R2, R4 @ Check R2 >= R4
BGE _do_while


_exit:
MOV R7, #1 @Return control to the CLI
SWI 0