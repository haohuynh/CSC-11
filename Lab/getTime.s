/* -- getTimer.s */
.data

/* Timer message */
.balign 4
timer_mess: .asciz "The time is %d\n"

.balign 4
return: .word 0

.text

.global main
main:

 ldr r1, address_of_return /* r1 ? &address_of_return */
 str lr, [r1] /* *r1 ? lr */
 
 mov r7, #13	
 swi 0	
 mov r1, r0
 
 ldr r0, addr_of_timer_mess /* r0 ? &message2 */
 bl printf /* call to printf */
  
 
 ldr lr, address_of_return /* lr ? &address_of_return */
 ldr lr, [lr] /* lr ? *lr */
 bx lr /* return from main using lr */
 
addr_of_timer_mess : .word timer_mess
address_of_return : .word return

/* External */
.global printf
.global scanf