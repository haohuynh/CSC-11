.global _start

_start:
MOV R1, #5	@Input: {Mon-Fri} ~ {1-5}
MOV R0, #0	@Output: A Subject {CSC11, CSC5, CIS1A, OTHERS} ~ {11,55,1,0}

CMP R1, #1	@Check if R1 != 1
BNE _cont1
MOV R0, #11	@ R1 == 1 
_cont1:

CMP R1, #3	@Check if R1 != 3
BNE _cont2
MOV R0, #11	@ R1 == 3  
_cont2:

CMP R1, #2	@Check if R1 != 2
BNE _cont3
MOV R0, #5	@ R1 == 2 
_cont3:

CMP R1, #4	@Check if R1 != 4
BNE _cont4
MOV R0, #5	@ R1 == 4 
_cont4:

CMP R1, #5	@Check if R1 != 5
BNE _cont5
MOV R0, #1	@ R1 == 5
_cont5:

MOV R7, #1 @Return control to the CLI
SWI 0