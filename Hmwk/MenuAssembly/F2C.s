/* -- F2C.s */

.data

/* A welcome message */
.balign 4
welcome_mess: .asciz "Display Degree Fahrenheit to Degree Centigrade\nFahrenheit  Centigrade\n"

/* The result message */
.balign 4
result_mess: .asciz "  %d           %d\n"

/* The begin range */
.balign 4
beg_range: .word 0

/* The end range */
.balign 4
end_range: .word 0

/* The next instruction after changeF2C */
.balign 4
return: .word 0

.text


/*
Change Degree Fahrenheit to Degree Centigrade
*/
.global changeF2C
changeF2C:

 ldr r2, addr_of_return /* r2 <- &return */
 str lr, [r2] /* *r2 <- lr */
 
 ldr r2, addr_of_beg_range /* r2 <- &beg_range */
 str r0, [r2]	/* *r2 <- r0 */
 
 ldr r2, addr_of_end_range /* r2 <- &end_range */
 str r1, [r2]	/* *r2 <- r1 */
  
 ldr r0, addr_of_welcome_mess /* r0 <- &welcome_mess */
 bl printf /* call to printf */
 

 _for_loop:

 ldr r2, addr_of_beg_range /* r2 <- &beg_range */
 ldr r0, [r2]	/* r0 <- *r2 */		
	
 ldr r2, addr_of_end_range /* r2 <- &end_range */
 ldr r1, [r2]	/* r1 <- *r2 */			
	
 cmp r0, r1 /* Check if r0 > r1, then exit */
 bgt _exit
 
 mov r1, r0 /* r1 is a Fahrenheit degree*/
 sub r1, r1, #32 /* r1-32 */
 ldr r0, =0x8E38E4 /* r0 = 5.0/9.0 , BP -24 WD 24*/
 mul r2, r0, r1 /* r2 = 5.0/9.0 * (r1-32) , BP -24 WD 32*/
 lsr r2, #24 /* r2 = 5.0/9.0 * (r1-32) , BP 0 WD 8*/
 add r1, r1, #32 /* Return r1 to the initial Fahrenheit */

 ldr r0, addr_of_result_mess /* r0 <- &result_mess */
 bl printf /* call to printf */
 
 ldr r2, addr_of_beg_range /* r2 <- &beg_range */
 ldr r0, [r2]	/* r0 <- *r2 */
 add r0, r0, #1 /* r0++ */
 str r0, [r2]	/* r0 -> *r2 */
 
 bal _for_loop
 
 
 _exit: 
 ldr lr, addr_of_return /* lr <- &return */
 ldr lr, [lr] /* lr <- *lr */
 bx lr /* return from main using lr */
 
/*Addresses Referencing*/ 
addr_of_welcome_mess : .word welcome_mess 
addr_of_result_mess : .word result_mess 
addr_of_beg_range : .word beg_range
addr_of_end_range : .word end_range
addr_of_return : .word return

/* External Functions*/
.global printf
.global scanf
