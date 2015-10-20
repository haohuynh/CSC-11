
.data

/* Welcome message */
.balign 4
wel_message: .asciz "Display Degree Centigrade to Degree Fahrenheit\nCentigrade  Fahrenheit\n"

/* Result message */
.balign 4
re_message: .asciz "   %d          %d\n"

.balign 4
return: .word 0

.text


/*
Display Degree Centigrade to Degree Fahrenheit
*/
.global c2F
c2F:

 ldr r2, address_of_return /* r2 <- &address_of_return */
 str lr, [r2] /* *r2 -> lr */
 
 ldr r0, address_of_wel_message /* r0 <- &wel_message */
 bl printf /* call to printf */
 
_for_loop:
 cmp r1, r3 @ Check if r1 > r3
 bgt _exit
 
 ldr r0, =0x1CCCCC /*r0 = 9.0/5.0 , BP -20 WD 24*/
 mul r2, r0, r1 /*r2 = 9.0/5.0 * r1 , BP -20 WD 32*/
 lsr r2, #20 /*r2 = 9.0/5.0 * r1 , BP 0 WD 12*/
 add r2, r2, # 32	/*r2 = 9.0/5.0 * r1 + 32 */

 ldr r0, address_of_re_message /* r0 <- &message2 */
 bl printf /* call to printf */
 
 add r1, r1, #1 @ r1++
 bal _for_loop
 
 
_exit: 
 ldr lr, address_of_return /* lr ? &address_of_return */
 ldr lr, [lr] /* lr ? *lr */
 bx lr /* return from main using lr */
 
address_of_wel_message : .word wel_message 
address_of_re_message : .word re_message 
address_of_return : .word return

/* External */
.global printf
.global scanf