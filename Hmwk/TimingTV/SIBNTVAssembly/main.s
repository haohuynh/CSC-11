/* -- main.s */

.data

/* The velocity message */
.balign 4
velocity_mess: .asciz "The terminal velocity for a golf ball is: %d ft/sec\n"

/* The density message */
.balign 4
density_mess: .asciz "The dynamic pressure is: %d lb/ft^2\n"

/* A timer message*/
.balign 4
time_msg: .asciz "\n\n\nThe total time to run this program is: %d s\n"

/* A timer mile stone*/
.balign 4
start_time: .word 0

.text

.global main
main:

 push {ip, lr}
 
 mov r0, #0 /*Create a NULL for the time function*/
 bl time /*Load the current time in seconds to r0*/
 ldr r1,=start_time /*Save the start time of collatz function*/
 str r0, [r1] /* start_time <- the relative current time*/
  
 /* Main program start */
 
 mov r6, #4194304
 _test_time_repeat:
 
 
 ldr r1, =0x019EB851 @w: WD 28 BP -28
 lsl r1, #3 @8*w
 
 ldr r3, =0x000000C9 @pi: WD 8 BP -6
 lsr r3, #1 @ pi* cd with cd = 0.5
  
 ldr r0, =0x00000005 @ dd: WD 8 BP -8  (d^2)
 mul r2, r3, r0 @r2 = pi*cd*dd
 
 mov r3, r2
 ldr r0, =0x0000009D @c: WD 15 BP -16
 mul r2, r3, r0 @r2 = pi*cd*dd*c
 
 bl getDivMod @r0 = v^2: (8*w)/(pi*cd*dd*c) 
 push {r0, r1} @ Keep track of v^2
 
 mov r1, r0 @Find square root of v^2
 bl sqrt @r0 = v: WD 32 BP 1  
 lsl r0, #1 @r0 = v: WD 32
 
 mov r1, r0
 ldr r0, =velocity_mess 
 @bl printf /*Ignore the output to forcusing on the main process*/
 
 pop {r0, r1} @ r0 = v^2
 mov r2, r0 
 lsr r2, #1 @ 0.5* v^2
 
 ldr r0, =0x0000004E @ c: WD 15 BP -15
 mul r1, r2, r0 @0.5 * v^2 * c : WD 32 BP -13
 lsr r1, #13 @q : WD 32
 
 ldr r0, =density_mess
 @bl printf /*Ignore the output to forcusing on the main process*/
 
 
 sub r6, r6, #1
 cmp r6, #0
 bne _test_time_repeat
 
 /* Main program end */
 
 mov r0, #0 /*Create a NULL for the time function*/
 bl time /*Load the current time in seconds to r0*/
 ldr r1,=start_time /*Save the start time of collatz function*/
 ldr r1, [r1]
 sub r1, r0, r1 /*processing time = endTime - startTime*/

 ldr r0, =time_msg
 bl printf
  
 pop {ip, pc}

/* External Functions*/
.global printf
.global time
.global getDivMod
.global sqrt



