/* -- getRandomPRS.s */
.data

/* The next instruction after getMod */
.balign 4
return: .word 0

.text

/*
 Generate a random value in {1 = Paper, 2 = Rock, 3 = Scissors}
 r0 will contain the result
*/
.global getRandomPRS
getRandomPRS:

 ldr r1, return_addr /* r0 <- &return */
 str lr, [r1] /* *r1 <- lr */
 
 bl rand /*Generate a random number*/
 lsr r0, #4 /*Decrease r0 for speeding up the whole process*/
 mov r1, r0 /* r1 is the numerator of in the division process of getMod */
 mov r2, #3 /* The maximum number of choices */
 bl getMod
 
 ldr lr, return_addr /* lr <- &return */
 ldr lr, [lr] /* lr <- *lr */
 bx lr /* return from main using lr */
 
/*Addresses Referencing*/ 
return_addr : .word return

/* External Functions*/
.global rand
.global getMod
