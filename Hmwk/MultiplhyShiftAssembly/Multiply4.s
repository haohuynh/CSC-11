/*
   Calculate area given the radius
   R1 -> SQR(Radius) 6^2
   R2 -> Conversion : pi
   R0 -> Area
*/

.global _start 
_start: 
MOV R1, #36 @BP 0 WD 6 sqr(radius)
LDR R2, =0x3243f7 @BP -20 WD 22
MUL R0, R1, R2 @BP -20 WD 28
LSR R0, #20 @BP 0 WD 8
MOV R7, #1 
SWI 0
 
