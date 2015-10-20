
.data

/* Welcome message */
.balign 4
wel_message: .asciz "Display Degree Fahrenheit to Degree Centigrade\nFahrenheit  Centigrade"

/* Result message */
.balign 4
re_Message: .asciz "   %d          %d\n"


.balign 4
return: .word 0

.text


/*
Display Degree Fahrenheit to Degree Centigrade
*/
.global f2C
f2C:
 ldr r1, address_of_return /* r1 ? &address_of_return */
 str lr, [r1] /* *r1 ? lr */
 
 add r0, r0, r0, LSL #2 /* r0 ? r0 + 4*r0 */
 
 ldr lr, address_of_return /* lr ? &address_of_return */
 ldr lr, [lr] /* lr ? *lr */
 bx lr /* return from main using lr */
 
address_of_wel_message : .word wel_message 
address_of_re_message : .word re_message  
address_of_return : .word return
