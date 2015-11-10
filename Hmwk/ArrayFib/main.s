/* -- main.s */

.data

/* The welcome message */
.balign 4
wel_mess: .asciz "\nPlease enter a position in the Fibonacci sequence or -1 to stop this program: "

/* The result message */
.balign 4
result_mess: .asciz "The result is: %d"

/* A numeric format pattern for scanf */
.balign 4
n_scan_pattern : .asciz "%d"

/* Where scanf will store the n th*/
.balign 4
n_term: .word 0

/* The array contains the first 45 terms in the Fibonacci Sequence*/
.balign 4
fArry: .skip 180

.text

.global main
main:

 push {r4, lr} /*Store the address of the next instruction after this main*/

 
 /*Start filling up the Fibonacci array*/
  
 ldr r1, fArry_addr /*r1 is the pointer pointing to the beginning of the Fibonacci array*/
 
 mov r2, #0 /*Store the first Fibonacci term to the first element */
 str r2, [r1]
 
 mov r2, #1 /*Store the second Fibonacci term to the second element */
 str r2, [r1, +#4]
 
 mov r2, #2 /*r2 is now the index of a element in the Fibonacci array*/
 
 _for_loop:
 
 cmp r2, #45 /*Check if r2 == 45 : the size of the array*/
 beq _done_for_loop
 
 add r3, r1, r2, LSL #2 /* r3 <- r1 + (r2*4) */
 ldr r4, [r3, #-8] /* r4 = F(n-2) */
 ldr r5, [r3, #+4] /* r5 = F(n-1) */
 
 add r4, r4, r5 /* r4 = F(n-2) + F(n-1) */
 str r4, [r3, #+4] /*F(n) = F(n-2) + F(n-1)*/ 
 
 add r2, r2, #1 /* r2 <- r2 + 1 */
 bal _for_loop
 
 _done_for_loop:
 /*End filling up the Fibonacci array*/
  
 _do_while_loop:
 
 ldr r0, wel_mess_addr /* r0 <- &wel_mess*/
 bl printf /* call to printf */	
 
 ldr r0, n_scan_pattern_addr /* r0 <- &n_scan_pattern*/
 ldr r1, n_term_addr /* r1 <- &n_term*/
 bl scanf /* call to scanf */
 
 ldr r0, n_term_addr /* r0 <- &n_term*/
 ldr r0, [r0] /* r0 <- *r0 */
 
 cmp r0,#-1 /* check if r0 <= -1*/
 ble _exit
 
 ldr r1, fArry_addr
 mov r2, #4 /* r2 = 4 (bytes) */
 mov r3, r0 /* r3 : the n term */
 mul r0, r3, r2 /* r0 = index * 4 (bytes) */
 ldr r1, [r1, +r0] /* r1 contains the value */
 ldr r0, result_mess_addr /* r0 <- &result_mess*/
 bl printf /* call to printf */	
 
 bal _do_while_loop 
  
 _exit: 
 pop {r4, lr} /*Load the address of the next instruction*/
 bx lr /* return from main using lr */
 
/*Addresses Referencing*/
wel_mess_addr : .word wel_mess
result_mess_addr : .word result_mess
n_scan_pattern_addr : .word n_scan_pattern
n_term_addr : .word n_term
fArry_addr : .word fArry

/* External Functions*/
.global printf
.global scanf



