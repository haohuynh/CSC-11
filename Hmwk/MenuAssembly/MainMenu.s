/* -- MainMenu.s */

.data

/* The range message */
.balign 4
range_mess: .asciz "Input beginning and end of temperature range:\n"

/* The Centigrade input message */
.balign 4
cent_input_mess: .asciz "If range is degree Centigrade input 1:\n"

/* The Fahrenheit input message */
.balign 4
fahr_input_mess: .asciz "If range is degree Fahrenheit input 2:\n"

/* A format pattern for scanf */
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

/* The next instruction after main */
.balign 4
return: .word 0

.text

.global main
main:

 ldr r1, addr_of_return /* r1 <- &addr_of_return */
 str lr, [r1] /* *r1 <- lr */
 

 
 _do_while_loop:
 
 ldr r0, addr_of_range_mess /* r0 <- &range_mess */
 bl printf /* call to printf */
 
 ldr r0, addr_of_scan_pattern /* r0 <- &scan_pattern */
 ldr r1, addr_of_begin_range /* r1 <- &beg_range */
 bl scanf /* call to scanf */
 
 ldr r0, addr_of_scan_pattern /* r0 <- &scan_pattern */
 ldr r1, addr_of_end_range /* r1 <- &end_range */
 bl scanf /* call to scanf */
 
 
 ldr r0, addr_of_cent_input_mess /* r0 <- &cent_input_mess */
 bl printf /* call to printf */
 
 ldr r0, addr_of_fahr_input_mess /* r0 <- &fahr_input_mess */
 bl printf /* call to printf */
 
 ldr r0, addr_of_scan_pattern /* r0 <- &scan_pattern */
 ldr r1, addr_of_choice /* r1 <- &choice */
 bl scanf /* call to scanf */

 ldr r0, addr_of_choice /* r0 <- &choice */
 ldr r0, [r0] /* r0 <- *r0 */
 
 /*Switching by the choice*/
 cmp r0, #1
 beq _case1
 cmp r0, #2
 beq _case2
 bal _exit /*Exit in case of there is no valid choice*/
 
 _case1:
 ldr r0, addr_of_begin_range /* r0 <- &beg_range */
 ldr r0, [r0] /* r0 <- *r0 */
 ldr r1, addr_of_end_range /* r1 <- &end_range */
 ldr r1, [r1] /* r1 <- *r1 */
 bl changeC2F /* Display Degree Centigrade to Degree Fahrenheit*/
 bal _break 
 
 _case2:
 ldr r0, addr_of_begin_range /* r0 <- &beg_range */
 ldr r0, [r0] /* r0 <- *r0 */
 ldr r1, addr_of_end_range /* r1 <- &end_range */
 ldr r1, [r1] /* r1 <- *r1 */
 bl changeF2C /* Display Degree Fahrenheit to Degree Centigrade */ 
 
 _break:
   
 bal _do_while_loop
  
 
 _exit:
 ldr lr, addr_of_return /* lr <- &addr_of_return */
 ldr lr, [lr] /* lr <- *lr */
 bx lr /* return from main using lr */
 
/*Addresses Referencing*/
addr_of_range_mess : .word range_mess
addr_of_cent_input_mess : .word cent_input_mess
addr_of_fahr_input_mess : .word fahr_input_mess
addr_of_scan_pattern : .word scan_pattern
addr_of_begin_range : .word beg_range
addr_of_end_range : .word end_range
addr_of_choice : .word choice
addr_of_return : .word return

/* External Functions*/
.global printf
.global scanf
.global changeC2F
.global changeF2C