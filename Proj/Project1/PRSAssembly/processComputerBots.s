/* -- processComputerBots.s */
.data

/* The first player message */
.balign 4
frst_player_mess: .asciz "The first player's choice is: "

/* The second player message */
.balign 4
sec_player_mess: .asciz "The second player's choice is: "

/* The next instruction after processComputerBots */
.balign 4
return: .word 0

.text

/*
	Process a Game for two computer bots
*/
.global processComputerBots
processComputerBots:

 ldr r0, return_addr /* r0 <- &return */
 str lr, [r0] /* *r0 <- lr */
 
 /*Display the first player's choice*/
 ldr r0, frst_player_mess_addr
 bl printf
 
 bl getRandomPRS
 push {r1} /*Store the first player's choice*/
 bl displayPRS
 
 
 /*Display the second player's choice*/
 ldr r0, sec_player_mess_addr
 bl printf
 
 bl getRandomPRS
 push {r1} /*Store the second player's choice*/
 bl displayPRS
 
 
 pop {r2} /*Load the second player's choice*/
 pop {r1} /*Load the first player's choice*/
 bl findTheWinner
 
 ldr lr, return_addr /* lr <- &return */
 ldr lr, [lr] /* lr <- *lr */
 bx lr /* return from main using lr */
 
/*Addresses Referencing*/ 
frst_player_mess_addr : .word frst_player_mess
sec_player_mess_addr : .word sec_player_mess
return_addr : .word return

/*External Functions*/
.global printf
.global scanf
.global getRandomPRS
.global displayPRS
.global findTheWinner
