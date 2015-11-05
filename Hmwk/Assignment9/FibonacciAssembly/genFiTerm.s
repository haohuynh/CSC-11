/*-- genFiTerm.s : generates a fibonacci term */

.data

.text

.global genFiTerm
genFiTerm:

    push {r4, r5, lr}       /* Push r4 and lr onto the stack */

    cmp r0, #2         /* compare r0 and 2 */
    bgt gt_2     	   /* if r0 > 2 then branch */
    mov r0, #1         /* if r0 <=2 then return r0 = 1 */
    bal exit

gt_2:

    mov r4, r0		  /* Copy the n value in r0 to r4*/

    sub r0, r0, #1     /* r0 = r0 - 1 , find F(n-1)*/
    bl genFiTerm

    mov r5, r0         /* Copy the F(n-1) in r0 to r4 */

    mov r0, r4 		/*Return the real n value from the beginning*/
    sub r0, r0, #2     /* r0 = r0 - 2 , find F(n-2)*/
    bl genFiTerm

    add r0, r0, r5 	   /*Return F(n-2) + F(n-1)*/

exit:
    pop {r4, r5, lr}       /* Pop lr and r4 from the stack */
    bx lr              /* Leave genFiTerm */
