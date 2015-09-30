.global _start 
_start: 
MOV R1, #1
MOV R2, #1
TST R1, R2
BEQ _set

MOV R0, #0
BAL _exit

_set:
MOV R0, #1

_exit:
MOV R7, #1 
SWI 0
