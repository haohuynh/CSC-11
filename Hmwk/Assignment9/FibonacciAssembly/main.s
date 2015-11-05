/* -- main.s */

.data

/* The welcome message */
.balign 4
wel_mess: .asciz "\nPlease enter a position in the Fibonacci sequence or -1 stop this program: "

/* The result message */
.balign 4
result_mess: .asciz "The result is: %d"

/* A numeric format pattern for scanf */
.balign 4
n_scan_pattern : .asciz "%d"

/* Where scanf will store a menu option*/
.balign 4
n_term: .word 0

.text

.global main
main:

 push {r4, lr}	
 
 _do_while_loop:
 
 ldr r0, wel_mess_addr /* r0 <- &wel_mess*/
 bl printf /* call to printf */	
 
 ldr r0, n_scan_pattern_addr /* r0 <- &n_scan_pattern*/
 ldr r1, n_term_addr /* r1 <- &n_term*/
 bl scanf /* call to scanf */
 
 ldr r0, n_term_addr /* r0 <- &n_term*/
 ldr r0, [r0] /* r0 <- *r0 */
 
 cmp r0,#-1 /* check if r0 == -1*/
 beq _exit
 
 /*bl genFiTerm /* find the value at the position n_term in the Fibonacci sequence */
 
 mov r1, #-1 /* r1 contains the value */
 ldr r0, result_mess_addr /* r0 <- &result_mess*/
 bl printf /* call to printf */	
 
 bal _do_while_loop 
  
 _exit: 
 pop {r4, lr}
 bx lr /* return from main using lr */
 
/*Addresses Referencing*/
wel_mess_addr : .word wel_mess
result_mess_addr : .word result_mess
n_scan_pattern_addr : .word n_scan_pattern
n_term_addr : .word n_term

/* External Functions*/
.global printf
.global scanf
@.global genFiTerm


