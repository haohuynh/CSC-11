/*
   Convert area to radius^2
   R1 -> area = 113.4
   R2 -> Conversion of area to radius^2 1/pi
   R0 -> radius^2
*/

.global _start 
_start: 
LDR R1, =0x7167 @BP -8 WD 15
LDR R2, =0x517D @BP-16 WD 16
MUL R0, R1, R2 @BP -24 WD 31
LSR R0, #24 @BP 0 WD 7
MOV R7, #1 
SWI 0
 
