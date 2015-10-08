/*Long Multiplication : UMULL R3, R4, R1, R2*/
.global _start

_start:
MOV R1, #34 @ Testing number
MOV R2, #32 @ Testing number
MOVS R4, R1, LSR #16 @ R4 ms 16 bits of R1 
BIC R1, R1, R4, LSL #16 @ R1 is ls 16 bits 
MOV R5, R2, LSR #16 @ R5 ms 16 bits of R2 
BIC R2, R2, R5, LSL #16 @ R2 is ls 16 bits 
MUL R3, R1, R2 @ Low partial product 
MUL R2, R4, R2 @ 1st middle partial 
MUL R1, R5, R1 @ 2nd middle partial 
MULNE R4, R5, R4 @ High partial product 
ADDS R1, R1, R2 @ Add mid partial products 
ADDCS R4, R4, #0x10000 @ Add carry to high pp 
ADDS R3, R3, R1, LSL #16 @ Add middle partial 
ADC R4, R4, R1, LSR #16 @ sum lo and hi words

MOV R7, #1 @Return control to the CLI
SWI 0