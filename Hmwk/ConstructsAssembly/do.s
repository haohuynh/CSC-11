.global _start

_start:
MOV R1, #10 @The number of elements in a array that needs summing
MOV R2, #1 	@The counter
MOV R0, #0	@The result

_do_while_loop:
ADD R0, R0, R2 @ R0 += R2
ADD R2, R2, #1 @ R2++
CMP R2, R1	   @ Check if R2 <= R1
BLE _do_while_loop

_exit:
MOV R7, #1 @Return control to the CLI
SWI 0