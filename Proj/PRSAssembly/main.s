/* -- main.s */

.data

/* The welcome message */
.balign 4
wel_mess: .asciz "**********The Paper-Rock-Scissor game**********\nPaper covers rock.\nRock break scissors.\nScissors cut paper.\nA tie!\n"

/* The menu option message */
.balign 4
menu_opt_mess: .asciz "\nSelecting an option for playing the game:\n1.Human Player vs Computer Bot.\n2.Two Computer Bots.\n"

/* The replay request message */
.balign 4
replay_mess: .asciz "You want to replay Paper-Rock-Scissor game (Y/N) ?"

/* A numeric format pattern for scanf */
.balign 4
n_scan_pattern : .asciz "%d"

/* A character format pattern for scanf */
.balign 4
c_scan_pattern : .asciz "%c"

/* Where scanf will store a menu option*/
.balign 4
player_option: .word 0

/* Where scanf will store a player's request to continue the game*/
.balign 4
player_request: .word 0

/* The next instruction after main */
.balign 4
return: .word 0

.text

.global main
main:

 ldr r1, return_addr /* r1 <- &addr_of_return */
 str lr, [r1] /* *r1 <- lr */
 
 mov r0, #0 /*Create a NULL for the time function*/
 bl time /*get the current time in seconds*/
 bl srand /*seeding a value for the random process*/
  
 ldr r0, wel_mess_addr /* r0 <- &wel_mess*/
 bl printf /* call to printf */	
 
 
 _do_while_loop:
 
 ldr r0, menu_opt_mess_addr /* r0 <- &menu_opt_mess*/
 bl printf /* call to printf */	
 
 ldr r0, n_scan_pattern_addr /* r0 <- &n_scan_pattern*/
 ldr r1, player_option_addr /* r1 <- &player_option*/
 bl scanf /* call to scanf */
 
 ldr r0, player_option_addr /* r0 <- &player_option*/
 ldr r0, [r0] /* r0 <- *r0 */
 
 /*Switching by the option*/
 cmp r0, #1
 beq _case1
 cmp r0, #2
 beq _case2
 bal _break /* In case of there is no valid choice, ask for replaying the game*/
 
 _case1:
 /*Process a Game for Human vs Computer*/
 bal _break 
 
 _case2:
  /*Process a Game for 2 Computer Bots*/
 _break:
   
 ldr r0, replay_mess_addr /* r0 <- &replay_mess*/
 bl printf /* call to printf */	  
   
 ldr r0, c_scan_pattern_addr /* r0 <- &c_scan_pattern*/
 ldr r1, player_request_addr /* r1 <- &player_request*/
 bl scanf /* call to scanf */  
 
 ldr r0, player_request_addr /* r0 <- &player_request*/
 ldr r0, [r0] /* r0 <- *r0 */
 
 cmp r0, #121 /* r0 == 'y' */
 beq _do_while_loop
 cmp r0, #89 /* r0 == 'Y' */
 beq _do_while_loop 
  
 ldr lr, return_addr /* lr <- &addr_of_return */
 ldr lr, [lr] /* lr <- *lr */
 bx lr /* return from main using lr */
 
/*Addresses Referencing*/
wel_mess_addr : .word wel_mess
menu_opt_mess_addr : .word menu_opt_mess
replay_mess_addr : .word replay_mess
n_scan_pattern_addr : .word n_scan_pattern
c_scan_pattern_addr : .word c_scan_pattern
player_option_addr : .word player_option
player_request_addr : .word player_request
return_addr : .word return

/* External Functions*/
.global printf
.global scanf
.global srand
.global time