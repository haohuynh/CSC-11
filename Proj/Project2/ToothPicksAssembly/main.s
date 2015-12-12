/* -- main.s */

.data

/* The welcome message */
.balign 4
wel_mess: .asciz "\n\n**********The game of ToothPicks!**********\nPlease enter the total number (>= 23) of tooth picks for a game:"

/* The value reassingment message */
.balign 4
v_reass_mess: .asciz "Reassigned the total to 23"

/* The user message */
.balign 4
user_mess: .asciz "\nThe current toothpicks are: %d\nPlease enter the number of toothpicks you want to withdraw (1 to 3): "

/* The user message */
.balign 4
computer_mess: .asciz "Computer withdraws: %d toothpicks\n"

/* The error message */
.balign 4
error_mess: .asciz "Input error !!! Please do it again\n"

/* The win message */
.balign 4
win_mess: .asciz "You win !!!"

/* The lose message */
.balign 4
lose_mess: .asciz "You lose!"

/* The lose message */
.balign 4
replay_mess: .asciz "\nWould you like to continues (y or n)? "

/* A numeric format pattern for scanf */
.balign 4
n_scan_pattern : .asciz "%d"

/* A numeric format pattern for scanf */
.balign 4
c_scan_pattern : .asciz " %c"

/* Where scanf will store the current number of tooth picks*/
.balign 4
crNbTPks: .word 0

/* Where scanf will store the number of tooth picks that will be withdrawn by a player*/
.balign 4
nWiTPks: .word 0

/* Where scanf will store a player's request to continue the game*/
.balign 4
player_request: .word 0

.text

.global main
main:

 push {ip, lr} /* push return address + dummy register for alignment */
 
 _restart:
 
 ldr r0, =wel_mess /* r0 <- &wel_mess*/
 bl printf /* call to printf */

 ldr r0, =n_scan_pattern /* r0 <- &n_scan_pattern*/
 ldr r1, =crNbTPks /* r1 <- &crNbTPks*/
 bl scanf /* call to scanf */
 
 ldr r1, =crNbTPks /* accesss the address of crNbTPks */
 ldr r1, [r1] /* load the value of crNbTPks to r1*/

 cmp r1, #23 /*Check if r1 < 23*/
 bge _pass_lower_limit
 ldr r0, =v_reass_mess /* Show v_reass_mess */
 bl printf
 ldr r2, =crNbTPks /* accesss the address of crNbTPks*/
 mov r3, #23 /* r3 = 23 */
 str r3, [r2] /* crNbTPks = 23 */
 _pass_lower_limit:
 
 
 ldr r7, =crNbTPks /* accesss the address of crNbTPks */
 ldr r7, [r7] /* load the value of crNbTPks to r7*/
 
 
 _while_true_loop:
 
	/* User's move */
	_reinput:
	
	ldr r0, =user_mess /* r0 =&user_mess*/
	mov r1, r7 /*Show crNbTPks*/
	bl printf
	
	ldr r0, =n_scan_pattern /* r0 <- &n_scan_pattern*/
	ldr r1, =nWiTPks /* r1 <- &nWiTPks*/
	bl scanf /* call to scanf */
 
	ldr r6, =nWiTPks /* accesss the address of nWiTPks */
    ldr r6, [r6] /* load the value of nWiTPks to r6*/
 
	cmp r6, #1 /* Check if nWiTPks < MIN_WITHDRAW_TOOTHPICK*/
	bge _pass_min_limit
		ldr r0, =error_mess
		bl printf
		bal _reinput
	_pass_min_limit:
	
	cmp r6, #3 /* Check if nWiTPks > MAX_WITHDRAW_TOOTHPICK*/
	ble _pass_max_limit
		ldr r0, =error_mess
		bl printf
		bal _reinput
	_pass_max_limit:
	
	cmp r6, r7 /* Check if nWiTPks > crNbTPks*/
	ble _pass_total_limit
		ldr r0, =error_mess
		bl printf
		bal _reinput
	_pass_total_limit:
	
	sub r7, r7, r6 /*crNbTPks -= nWiTPks*/
	
	cmp r7, #1	/*Check if crNbTPks == MIN_WITHDRAW_TOOTHPICK*/
	bne _win_if
		ldr r0, =win_mess
		bl printf
		bal _break
	_win_if:

	cmp r7, #0	/*Check if crNbTPks == 0*/
	bne _lose_if
		ldr r0, =lose_mess
		bl printf
		bal _break
	_lose_if:	


	/*Computer's move*/
	cmp r7, #4 /*Check if crNbTPks > TOOTH_PICK_PARTITION*/
	ble _else
	
		mov r1, r7 /* r1 = crNbTPks*/
		bl calWTPForComputer /*  r1 = nWiTPkC = calWTPForComputer(crNbTPks) */
		sub r7, r7, r1 /* crNbTPks -= nWiTPkC */
			
		ldr r0, =computer_mess
		bl printf	
			
		bal _done
		
	_else:
		sub r1, r7, #1 /*nWiTPkC = (crNbTPks - MIN_WITHDRAW_TOOTHPICK)*/
		ldr r0, =computer_mess
		bl printf
		
		ldr r0, =lose_mess
		bl printf
		
		bal _break
		
	_done:
	
 bal _while_true_loop
 _break:
 
 ldr r0, =replay_mess /* r0 =&replay_mess*/
 bl printf
	
 ldr r0, =c_scan_pattern /* r0 <- &c_scan_pattern*/ 
 ldr r1, =player_request /* r1 <- &player_request*/
 bl scanf /* call to scanf */
 
 ldr r1, =player_request /* r1 = &player_request*/
 ldr r1, [r1] /* r1 = player_request*/
 
 cmp r1, #'y'
 beq _restart
 
 pop {ip, pc} @ pop return address into pc

/* External Functions*/
.global printf
.global scanf
.global calWTPForComputer


