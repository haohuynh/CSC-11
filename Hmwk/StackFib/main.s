/* -- main.s */

.data

/* The welcome message */
.balign 4
wel_mess: .asciz "\nPlease enter a position in the Fibonacci sequence [1-45]: "

/* The result message */
.balign 4
result_mess: .asciz "The result is: %d"

/* A numeric format pattern for scanf */
.balign 4
n_scan_pattern : .asciz "%d"

/* Where scanf will store the n th*/
.balign 4
n_term: .word 0

.text

.global main
main:

 push {r4, lr} /*Store the address of the next instruction after this main*/
 
 bl getStackFibTerm /* Call getStackFibTerm function*/
  
 _do_while_loop:
 
 ldr r0, wel_mess_addr /* r0 <- &wel_mess*/
 bl printf /* call to printf */	
 
 ldr r0, n_scan_pattern_addr /* r0 <- &n_scan_pattern*/
 ldr r1, n_term_addr /* r1 <- &n_term*/
 bl scanf /* call to scanf */
 
 ldr r0, n_term_addr /* r0 <- &n_term*/
 ldr r0, [r0] /* r0 <- *r0 */
 
 cmp r0,#0 /* check if r0 <= 0*/
 ble _exit
 
 cmp r0,#45 /* check if r0 >=45*/
 bgt _process_over_size
  
 mov r2, #4 /* r2 = 4 (bytes) */
 mov r3, #45 /* r3 : the max index value in the Fibonacci Sequence */
 sub r3, r3, r0 /* r3 : the (n-1) term counting backward from (45 + 1) */
 add r3, r3, #1 /* r3 : the n term counting backward from (45 + 1) */
 mul r0, r3, r2 /* r0 = backward-index * 4 (bytes) : current position in the Fibonacci Array */
 ldr r1, [sp, +r0] /* Adjust the stack pointer to the n position, then r1 contains the value */
 bal _output
 
 _process_over_size:
 mov r1, #0 /*Output 0 the over_size case */
 
 _output:
 ldr r0, result_mess_addr /* r0 <- &result_mess*/
 bl printf /* call to printf */	
 
 bal _do_while_loop 
	
	
 _exit: 	
 /* Clean up the stack before exiting the program */	
 add sp, sp, #184	/* 46 elements * 4 bytes = 186 bytes */
 
 pop {r4, lr} /*Load the address of the next instruction*/
 bx lr /* return from main using lr */
 
/*Addresses Referencing*/
wel_mess_addr : .word wel_mess
result_mess_addr : .word result_mess
n_scan_pattern_addr : .word n_scan_pattern
n_term_addr : .word n_term

/* External Functions*/
.global printf
.global scanf
.global getStackFibTerm


