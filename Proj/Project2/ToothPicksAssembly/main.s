/* -- main.s */

.data

/* The welcome message */
.balign 4
wel_mess: .asciz "**********The Paper-Rock-Scissors game**********\nPaper covers rock.\nRock break scissors.\nScissors cut paper.\nA tie!\n"

/* The menu option message */
.balign 4
menu_opt_mess: .asciz "\nSelecting an option for playing the game:\n1.Human Player vs Computer Bot.\n2.Two Computer Bots.\n"

/* The replay request message */
.balign 4
replay_mess: .asciz "You want to replay Paper-Rock-Scissors game (y/n)? "

/* A numeric format pattern for scanf */
.balign 4
n_scan_pattern : .asciz "%d"

/* A numeric format pattern for scanf */
.balign 4
c_scan_pattern : .asciz " %c"

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

 push {ip, lr} /* push return address + dummy register for alignment */
 
 bl calWTPForComputer
 
 pop {ip, pc} @ pop return address into pc

/* External Functions*/
.global printf
.global scanf
.global calWTPForComputer


