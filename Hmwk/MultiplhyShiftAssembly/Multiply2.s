/*
   Convert area to radius^2
   R1 -> area = 110
   R2 -> Conversion of area to radius^2 1/pi
   R0 -> radius^2
*/

.global _start 
_start: 
MOV R1, #110 @BP 0 WD 7
LDR R2, =0x517CC2 @BP -24 WD 24
MUL R0, R1, R2 @BP -24 WD 31
LSR R0, #24 @BP 0 WD 7
MOV R7, #1 
SWI 0
 
