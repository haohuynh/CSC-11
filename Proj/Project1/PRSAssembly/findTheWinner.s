/* -- findTheWinner.s */
.data

/* The first player message */
.balign 4
frst_player_mess: .asciz "The winner is the first player.\n"

/* The second player message */
.balign 4
sec_player_mess: .asciz "The winner is the second player.\n"

/* The final rule message */
.balign 4
final_rule_mess: .asciz "A tie!!!\n"

/* The next instruction after findTheWinner */
.balign 4
return: .word 0

.text

/*
 This function find the winner of a game
 r1: the first player choice
 r2: the second player choice
*/
.global findTheWinner
findTheWinner:

 ldr r0, return_addr /* r0 <- &return */
 str lr, [r0] /* *r0 <- lr */
 
 bl isTheFormerWin
 cmp r0, #1	@Check if a winner was found
 bne _elseif
	
	ldr r0, frst_player_mess_addr /*The first player wins*/
	bl printf
 
 bal _done
 _elseif:
 
 /*swap(r1,r2)*/
 mov r0, r1
 mov r1, r2
 mov r2, r0
 
 bl isTheFormerWin
 cmp r0, #1	@Check if a winner was found
 bne _else
	
	ldr r0, sec_player_mess_addr /*The second player wins*/
	bl printf
	
 bal _done
 _else:

	ldr r0, final_rule_mess_addr /*A tie game*/
	bl printf
 
 _done:
 
 ldr lr, return_addr /* lr <- &return */
 ldr lr, [lr] /* lr <- *lr */
 bx lr /* return from main using lr */
 
/*Addresses Referencing*/ 
frst_player_mess_addr : .word frst_player_mess
sec_player_mess_addr : .word sec_player_mess
final_rule_mess_addr : .word final_rule_mess
return_addr : .word return

/*External Functions*/
.global printf
.global isTheFormerWin
