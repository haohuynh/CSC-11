/*-- getArrayFibTerm.s : generates the first 45 term of the Fibonacci Sequence and stores them in an input array 
   Input: r0 is the pointer pointing to the beginning of the Fibonacci array */

.data

.text

.global getArrayFibTerm
getArrayFibTerm:

    push {r4, lr} /* Push r4 and lr onto the stack */
	
	mov r1, #0 /*Store the first Fibonacci term to the first element */
    str r1, [r0]
 
    mov r1, #1 /*Store the second Fibonacci term to the second element */
    str r1, [r0, +#4]
 
	mov r1, #2 /*r1 is now the index of a element in the Fibonacci array*/
 
	_for_loop:
 
	cmp r1, #45 /*Check if r1 == 45 : the size of the array*/
	beq _done_for_loop
 
	add r2, r0, r1, LSL #2 /* r2 <- r0 + (r1*4) */
	ldr r3, [r2, #-8] /* r3 = F(n-2) */
	ldr r4, [r2, #-4] /* r4 = F(n-1) */
 
	add r3, r3, r4 /* r3 = F(n-2) + F(n-1) */
	str r3, [r2] /*F(n) = F(n-2) + F(n-1)*/ 
 
	add r1, r1, #1 /* r1 <- r1 + 1 */
	bal _for_loop
 
	_done_for_loop:
    
    pop {r4, lr}       /* Pop lr and r4 from the stack */
    bx lr              /* Leave genFiTerm */
