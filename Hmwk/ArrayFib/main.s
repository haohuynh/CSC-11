/* -- main.s */

.data

/* The welcome message */
.balign 4
wel_mess: .asciz "\nPlease enter a position in the Fibonacci sequence [0-44]: "

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
 
 ldr r0, fArry_addr /* r0 is the pointer pointing to the beginning of fArry */
 bl getArrayFibTerm /* Call getArrayFibTerm function*/
  
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
 
 cmp r0,#45 /* check if r0 >=45*/
 bge _process_over_size
 
 ldr r1, fArry_addr /* The starting pointer of the Fibonacci Array */
 mov r2, #4 /* r2 = 4 (bytes) */
 mov r3, r0 /* r3 : the n term */
 mul r0, r3, r2 /* r0 = index * 4 (bytes) : current position in the Fibonacci Array */
 ldr r1, [r1, +r0] /* r1 contains the value */
 bal _output
 
 _process_over_size:
 mov r1, #0 /*Output 0 the over_size case */
 
 _output:
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
.global getArrayFibTerm


