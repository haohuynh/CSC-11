/*Dividing two 32-bit values.*/
.global _start

_start:
MOV R1, #88 @ The dividend is in R1,
MOV R2, #11 @ The divisor is in R2.
MOV R4, R2 @ Put the divisor in R4. 
CMP R4, R1, LSR #1 @ Then double it until 2 x R4 > divisor. 
Div1: 
MOVLS R4, R4, LSL #1 
CMP R4, R1, LSR #1 
BLS Div1 

MOV R3,# 0 @ Initialise the quotient 
Div2: 
CMP R1, R4 @ Can we subtract R4? 
SUBCS R1, R1, R4 @ If we can, do so 
ADC R3, R3, R3 @ Dble quotient, add new bit
MOV R4, R4, LSR #1 @ Halve R4 
CMP R4, R2 @ Loop until we’ve gone 
BHS Div2 @ past the original divisor

MOV R7, #1 @Return control to the CLI
SWI 0