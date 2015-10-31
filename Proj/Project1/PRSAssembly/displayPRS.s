/* -- displayPRS.s */
.data

/* The paper message */
.balign 4
paper_mess: .asciz "Paper\n"

/* The rock message */
.balign 4
rock_mess: .asciz "Rock\n"

/* The scissors message */
.balign 4
scissors_mess: .asciz "Scissors\n"

/* The next instruction after displayPRS */
.balign 4
return: .word 0

.text

/*
 This function display a player's choice by name (Paper,Rock, or Scissors)
 r1 contains the value of a choice
*/
.global displayPRS
displayPRS:

 ldr r0, return_addr /* r0 <- &return */
 str lr, [r0] /* *r0 <- lr */
 
 cmp r1, #1	/*Check if r1 != 1*/
 bne _elseif1
 ldr r0, paper_mess_addr /*Print out a choice for paper*/
 bal _done
 _elseif1: 

 cmp r1, #2	/*Check if r1 != 2*/
 bne _else
 ldr r0, rock_mess_addr /*Print out a choice for rock*/
 BAL _done
 _else:

 ldr r0, scissors_mess_addr /*Print out a choice for scissors*/

 _done:
 
 bl printf
 
 ldr lr, return_addr /* lr <- &return */
 ldr lr, [lr] /* lr <- *lr */
 bx lr /* return from main using lr */
 
/*Addresses Referencing*/ 
paper_mess_addr : .word paper_mess
rock_mess_addr : .word rock_mess
scissors_mess_addr : .word scissors_mess
return_addr : .word return

/*External Functions*/
.global printf
