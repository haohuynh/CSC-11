/* -- main.s */

.data

/* The velocity message */
.balign 4
velocity_mess: .asciz "The terminal velocity for a golf ball is: %d ft/sec\n"

/* The density message */
.balign 4
density_mess: .asciz "The dynamic pressure is: %d lb/ft^2\n"

.text

.global main
main:

 push {ip, lr}
 
 ldr r1, =0x019EB851 @w: WD 28 BP -28
 mov r0, #8
 mul r1, r1, r0 @8*w 

 ldr r3, =0x000000C9 @pi: WD 8 BP -6
 ldr r0, =0x00000001 @cd: WD 1 BP -1
 mul r2, r3, r0 @r2 = pi*cd
 
 mov r3, r2
 ldr r0, =0x00000005 @ dd: WD 8 BP -8  (d^2)
 mul r2, r3, r0 @r2 = pi*cd*dd
 
 mov r3, r2
 ldr r0, =0x0000004E @c: WD 15 BP -15
 mul r2, r3, r0 @r2 = pi*cd*dd*c
 
 bl getDivMod @r0 = v^2: (8*w)/(pi*cd*dd*c) 
 push {r0, r1} @ Keep track of v^2
 
 mov r1, r0 @Find square root of v^2
 bl sqrt @r0 = v: WD 32 BP 1  
 lsl r0, #1 @r0 = v: WD 32
 
 mov r1, r0
 ldr r0, =velocity_mess 
 bl printf
 
 pop {r2, r1} @ r2 = v^2
 ldr r0, =0x00000001 @ 0.5 : WD 1 BP -1
 mul r1, r2, r0 @0.5 * v^2
 
 mov r2, r1
 ldr r0, =0x0000004E @ c: WD 15 BP -15
 mul r1, r2, r0 @0.5 * v^2 * c : WD 32 BP -14
 lsr r1, #14 @q : WD 32
 
 ldr r0, =density_mess
 bl printf
 
 pop {ip, pc}


/* External Functions*/
.global printf
.global getDivMod
.global sqrt



