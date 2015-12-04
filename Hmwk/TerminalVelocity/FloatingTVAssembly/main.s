/* -- main.s */

.data

/* dd = d^2 */
.balign 4
dd: .float 0.0196

.balign 4
w: .float 0.10125;

.balign 4
cd: .float 0.5;

.balign 4
c: .float 0.0023769;

.balign 4
pi: .float 3.141592654;

.balign 4
half: .float 0.5;

.balign 4
eight: .float 8.0;

/* The velocity message */
.balign 4
velocity_mess: .asciz "The terminal velocity for a golf ball is: %f ft/sec\n"

/* The density message */
.balign 4
density_mess: .asciz "The dynamic pressure is: %f lb/ft^2\n"

.text

.global main
main:

 push {ip, lr}
 
 ldr r0, =eight
 vldr s0, [r0]
 ldr r0, =w   
 vldr s1, [r0]
 vmul.f32 s2, s0, s1 @ 8*w
 
 ldr r0, =pi
 vldr s0, [r0]
 ldr r0, =c
 vldr s1, [r0]
 vmul.f32 s3, s0, s1 @ pi*c
 
 vmov s0, s3
 ldr r0, =dd
 vldr s1, [r0]
 vmul.f32 s3, s0, s1 @ pi*c*dd
 
 vmov s0, s3
 ldr r0, =cd
 vldr s1, [r0]
 vmul.f32 s3, s0, s1 @ pi*c*dd*cd
 
 vdiv.f32 s1, s2, s3 @(8*w)/(pi*c*d*d*cd)
 vpush {s0, s1}
 
 vsqrt.f32 s0, s1
 vcvt.f64.f32 d0, s0
 ldr r0, =velocity_mess
 vmov r2, r3, d0
 bl printf
 
 vpop {s0, s1}
 ldr r0, =c
 vldr s0, [r0]
 vmul.f32 s2, s0, s1 @ c*v^2
 ldr r0, =half
 vldr s1, [r0]
 vmul.f32 s0, s1, s2 @ .5*c*v^2
 
 vcvt.f64.f32 d0, s0
 ldr r0, =density_mess
 vmov r2, r3, d0
 bl printf
 
 pop {ip, pc}


/* External Functions*/
.global printf


