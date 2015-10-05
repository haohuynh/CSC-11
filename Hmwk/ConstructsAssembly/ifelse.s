.global _start

_start:
MOV R1, #1	@Input: {Mon-Fri} ~ {1-5}
			@R0 - Output: A Subject {CSC11, CSC5, CIS1A, OTHERS} ~ {11,55,1,0}

CMP R1, #1	@Check if R1 != 1
BNE _elseif1
MOV R0, #11	@ R1 == 1 
BAL _done
_elseif1:

CMP R1, #3	@Check if R1 != 3
BNE _elseif2
MOV R0, #11	@ R1 == 3  
BAL _done
_elseif2:

CMP R1, #2	@Check if R1 != 2
BNE _elseif3
MOV R0, #5	@ R1 == 2 
BAL _done
_elseif3:

CMP R1, #4	@Check if R1 != 4
BNE _elseif4
MOV R0, #5	@ R1 == 4 
BAL _done
_elseif4:

CMP R1, #5	@Check if R1 != 5
BNE _else
MOV R0, #1	@ R1 == 5
BAL _done
_else:

MOV R2, #0

_done:

MOV R7, #1 @Return control to the CLI
SWI 0