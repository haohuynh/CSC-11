/* -- processHumanVsComputer.s */
.data

/* The first player message */
.balign 4
human_mess: .asciz "Please enter your choice (p = Paper, r = Rock  or s = Scissors):"

/* The first player choice message*/
.balign 4
human_choice_mess: .asciz "The human choice is: "

/* The second player message */
.balign 4
computer_mess: .asciz "The computer choice is: "

/* A character format pattern for scanf */
.balign 4
c_scan_pattern : .asciz " %c"

/* The first player choice */
.balign 4
human_choice: .word 0

/* The next instruction after processHumanVsComputer */
.balign 4
return: .word 0

.text

/*
	Process a Game for Human vs Computer
*/
.global processHumanVsComputer
processHumanVsComputer:

 ldr r0, return_addr /* r0 <- &return */
 str lr, [r0] /* *r0 <- lr */
 
 /*Ask the human player for an input*/
 ldr r0, human_mess_addr 
 bl printf
 
 /*Get the human player's input*/
 ldr r0, c_scan_pattern_addr
 ldr r1, human_choice_addr
 bl scanf
 
 /*Formatting the player's input into the game code ((1 = Paper, 2 = Rock  or 3 = Scissor)) - start*/
 ldr r1, human_choice_addr
 ldr r1, [r1]
 
 cmp r1, #'p' /*p = Paper = 1*/
 bne _else_if1
	mov r1, #1
	bal _done
 _else_if1:
 
 cmp r1, #'r' /*r = Rock = 2*/
 bne _else
	mov r1, #2
	bal _done
 _else:
 
	mov r1, #3 /*The default human choice is Scissor*/
	
 _done:
 ldr r0, human_choice_addr
 str r1, [r0]
 /*Formatting the player's input into the game code ((1 = Paper, 2 = Rock  or 3 = Scissor)) - end*/
 
 /*Display the human player's choice*/
 ldr r0, human_choice_mess_addr
 bl printf
 ldr r1, human_choice_addr
 ldr r1, [r1]
 bl displayPRS
 
 /*Display a random choice of the computer*/
 ldr r0, computer_mess_addr
 bl printf
 bl getRandomPRS
 push {r1} /*Store the second player's choice*/
 bl displayPRS
 
 ldr r1, human_choice_addr /*Get the first player's choice*/
 ldr r1, [r1]
 pop {r2} /*Get the second player's choice*/
 bl findTheWinner
 
 ldr lr, return_addr /* lr <- &return */
 ldr lr, [lr] /* lr <- *lr */
 bx lr /* return from main using lr */
 
/*Addresses Referencing*/ 
human_mess_addr : .word human_mess
computer_mess_addr : .word computer_mess
c_scan_pattern_addr : .word c_scan_pattern
human_choice_addr : .word human_choice
human_choice_mess_addr: .word human_choice_mess
return_addr : .word return

/*External Functions*/
.global printf
.global scanf
.global getRandomPRS
.global displayPRS
.global findTheWinner
