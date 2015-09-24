/*
   Calculate area given the radius
   R1 -> SQR(Radius) (6.5)^2
   R2 -> Conversion : pi
   R0 -> Area
*/

.global _start 
_start: 
LDR R1, =0x02A4 @BP -4 WD 10 sqr(radius)
LDR R2, =0x3244 @BP -12 WD 14
MUL R0, R1, R2 @BP -16 WD 24
LSR R0, #16 @BP 0 WD 8
MOV R7, #1 
SWI 0
 
