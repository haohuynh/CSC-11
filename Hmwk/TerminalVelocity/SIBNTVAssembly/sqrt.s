/* -- sqrt.s */
.data

.text

/*
 * Square root of a number by Newton's method
 * @param R1
 * @return square root of R1
 */
.global sqrt
sqrt:

 push {ip, lr}

 mov r2, #2 /* Let the denominator be 2*/
 
 push {r1,r2} /*Keep track of r1 = S*/
 bl getDivMod /* R0 is now the quotient*/
 pop {r1,r2}
 
 ldr r3, =0x00000001 /* a value of 0.5 : WD 1 BP -1*/
 
 _do_while_loop:
 mov r2, r0 /* r2 = x(n-1) */
 
 push {r1, r2, r3, r4} /* Keep track of r1 = S, r2 = x(n-1), r3 = 0.5 */
 bl getDivMod /* Find (S/x0) */
 pop {r1, r2, r3, r4}
 
 add r0, r2, r0 /*r0 = x(n-1) + S/x(n-1) */
 mul r0, r3, r0 /* 0.5 * r0 */
 lsr r0, #1
 
 cmp r0, r2
 beq _exit
 
 bal _do_while_loop
 _exit:
 pop {ip, pc}
 
 
/* External Functions*/
.global getDivMod 