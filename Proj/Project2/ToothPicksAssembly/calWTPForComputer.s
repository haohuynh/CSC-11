/* -- calWTPForComputer.s */
.data

.text

/*
 Find the result of R1%R2 by Shifted Divisio method
 R1 is the numerator and will be the remainder
 R2 is the denominator
*/
.global calWTPForComputer
calWTPForComputer:

 push {ip, lr} /* push return address + dummy register for alignment */
 bl getMod
 
 pop {ip, pc} @ pop return address into pc
 
/* External Functions*/
.global getMod 



