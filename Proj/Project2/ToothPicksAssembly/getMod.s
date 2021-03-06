/* -- getMod.s */
.data

.text

/*
 Find the result of R1%R2 by Shifted Division method
 R1 is the numerator and will be the remainder
 R2 is the denominator
*/
.global getMod
getMod:

 push {ip, lr} /* push return address + dummy register for alignment */
 
 mov r3, #1  @ r3 is the scalar of the original denominator
 mov r4, r2	@ r4 is a copy of the denominator
 mov r0, #0  @ r0 is the quotient

 cmp r1, r2 @ Check r1 < r2
 blt _exit

 _while_loop1:
 cmp r1, r2 @ Check r1 <= r2
 ble _cont1
 lsl r2, #1 @ R2*=2
 lsl r3, #1 @ R3*=2
 bal _while_loop1
 _cont1:


 _do_while:

 _while_loop2:
 cmp R2, R1 @ Check R2 <= R1
 ble _cont2
 lsr r2, #1 @ R2/=2
 lsr r3, #1 @ R3/=2
 bal _while_loop2
 _cont2:
 
 cmp r2, r4 @ Check r2 < r4
 blt _exit
 sub r1, r1, r2 @ r1 -= R2
 add r0, r0, r3 @ r0 += R3
 
 bal _do_while
 
 _exit:
 pop {ip, pc} @ pop return address into pc


