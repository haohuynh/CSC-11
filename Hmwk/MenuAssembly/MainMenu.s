/* -- MainMenu.s */

.data
/* First message */
.balign 4
message1: .asciz "Input beginning and end of temperature range:\n"

/* Second message */
.balign 4
message2: .asciz "If range is degree Centigrade input 1:\n"

/* Third message */
.balign 4
message3: .asciz "If range is degree Fahrenheit input 2:\n"

/* Format pattern for scanf */
.balign 4
scan_pattern : .asciz "%d"

/* Where scanf will store the begin range*/
.balign 4
beg_range: .word 0

/* Where scanf will store the end range */
.balign 4
end_range: .word 0

/* Where scanf will store the choice */
.balign 4
choice: .word 0

.balign 4
return: .word 0

.text

.global main
main:

 ldr r1, address_of_return /* r1 ? &address_of_return */
 str lr, [r1] /* *r1 ? lr */
 
 
 _do_while_loop:
 
 ldr r0, address_of_message1 /* r0 ? &message1 */
 bl printf /* call to printf */
 
 ldr r0, address_of_scan_pattern /* r0 ? &scan_pattern */
 ldr r1, address_of_beg_range /* r1 ? &beg_range */
 bl scanf /* call to scanf */
 
 ldr r0, address_of_scan_pattern /* r0 ? &scan_pattern */
 ldr r1, address_of_end_range /* r1 ? &end_range */
 bl scanf /* call to scanf */
 
 
 
 ldr r0, address_of_message2 /* r0 ? &message2 */
 bl printf /* call to printf */
 
 ldr r0, address_of_message3 /* r0 ? &message3 */
 bl printf /* call to printf */
 
 ldr r0, address_of_scan_pattern /* r0 ? &scan_pattern */
 ldr r1, address_of_choice /* r1 ? &choice */
 bl scanf /* call to scanf */

 ldr r0, address_of_choice /* r1 ? &choice */
 ldr r0, [r0] /* r0 = *r0 */
 
 cmp r0, #1
 beq _case1
 cmp r0, #2
 beq _case2
 bal _exit
 
 _case1:
 ldr r0, address_of_beg_range /* r1 ? &beg_range */
 ldr r0, [r0] /* r1 ? *r1 */
 ldr r1, address_of_end_range /* r1 ? &end_range */
 ldr r1, [r1] /* r1 ? *r1 */
 bl c2F /* Display Degree Centigrade to Degree Fahrenheit*/
 bal _break 
 
 _case2:
 ldr r0, address_of_beg_range /* r1 ? &beg_range */
 ldr r0, [r0] /* r1 ? *r1 */
 ldr r1, address_of_end_range /* r1 ? &end_range */
 ldr r1, [r1] /* r1 ? *r1 */
 bl f2C /* Display Degree Centigrade to Degree Fahrenheit*/ 
 
 
 _break:
 
  
 bal _do_while_loop
  
 
 _exit:
 
 ldr lr, address_of_return /* lr ? &address_of_return */
 ldr lr, [lr] /* lr ? *lr */
 bx lr /* return from main using lr */
 
address_of_message1 : .word message1
address_of_message2 : .word message2
address_of_message3 : .word message3
address_of_scan_pattern : .word scan_pattern
address_of_beg_range : .word beg_range
address_of_end_range : .word end_range
address_of_choice : .word choice
address_of_return : .word return

/* External */
.global printf
.global scanf
.global c2F
.global f2C