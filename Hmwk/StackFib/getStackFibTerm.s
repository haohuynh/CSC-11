/*-- getStackFibTerm.s : generates the first 45 term of the Fibonacci Sequence and stores them in the Stack of this program */

.data

/* A return address for this function */
.balign 4
return: .word 0

.text

.global getStackFibTerm
getStackFibTerm:
	ldr r0, =return /* Save the return address*/
	str lr, [r0]
    	
	mov r0, #1 /*Store the first Fibonacci term to the first element */
    mov r1, #1 /*Store the second Fibonacci term to the second element */
    push {r0, r1}
 
	mov r0, #3 /*r0 is now the index of a element in the Fibonacci array*/
 
	_for_loop:
 
	cmp r0, #45 /*Check if r0 > 45 : the size of the array*/
	bgt _done_for_loop
 	
	pop {r1, r2}	/* r1 = F(n-1), r2 = F(n-2) */
	add r3, r1, r2 /* r3 = F(n-1) + F(n-2) */
	push {r1, r2}	/* Store F(n-1) and F(n-2) back to the stack */ 
	sub sp, sp, #4 /* Prepare 4 bytes to store the F(n) */
	str r3, [sp] /* Store r3 to the stack */
	
	
	add r0, r0, #1 /* r0 <- (r0 + 1) */
	bal _for_loop
 
	_done_for_loop:
    
    ldr lr, =return /*Load the return address*/
	ldr lr, [lr]
    bx lr              /* Leave getStackFibTerm */
	
