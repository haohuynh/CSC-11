/*
   Conversion months to years
   R1 -> Number of months (88)
   R2 -> Conversion of months to year 1/12
   R0 -> Number of years
*/

.global _start 
_start: 
MOV R1, 0b01011000 @BP 0 WD 7
MOV R2, 0x00155556 @BP -24 WD 24
MUL R0, R1, R2 @BP -24 WD 31
LSR R0, #24 @BP 0 WD 7
MOV R7, #1 
SWI 0