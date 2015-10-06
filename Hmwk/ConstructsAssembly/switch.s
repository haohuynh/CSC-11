.global _start

_start:
MOV R1, #2	@Input: {Mon-Fri} ~ {1-5}
			@R0 - Output: A Subject {CSC11, CSC5, CIS1A, OTHERS} ~ {11,55,1,0}

CMP R1, #1	@Check if R1 == 1
BEQ _case1
CMP R1, #3	@Check if R1 == 3
BEQ _case3
CMP R1, #2	@Check if R1 == 2
BEQ _case2
CMP R1, #4	@Check if R1 == 4
BEQ _case4
CMP R1, #5	@Check if R1 == 5
BEQ _case5
BAL _default @ The default case

_case1:
_case3:
MOV R0, #11
BAL _break

_case2:
_case4:
MOV R0, #5
BAL _break

_case5:
MOV R0, #1
BAL _break

_default:
MOV R0, #0

_break:
MOV R7, #1 @Return control to the CLI
SWI 0