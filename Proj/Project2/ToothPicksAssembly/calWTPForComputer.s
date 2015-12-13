/* -- calWTPForComputer.s */
.data

.text

/*
 * This function calculates the number of tooth picks that will be withdrawn by a computer
 * Input R1 : current number of the tooth pick
 * Output R1 : the number of tooth picks that computer should withdraw
 */
.global calWTPForComputer
calWTPForComputer:

 push {ip, lr} /* push return address + dummy register for alignment */
 
 mov r2, #4 /* Let the denominator be 4*/
 bl getMod
 
 cmp r1, #0 /* Check if the remainder is 0*/
 bne _if_0
	mov r1, #3 /* A move that makes a potential win */ 
	bal _exit
 _if_0:
 
 cmp r1, #1 /* Check if the remainder is 1*/
 bne _if_1
	mov r1, #1 /* A move that makes a potential lose */ 
	bal _exit
 _if_1:
 
 cmp r1, #2 /* Check if the remainder is 2*/
 bne _if_2
	mov r1, #1 /* A move that makes a potential win */ 
	bal _exit
 _if_2:
 
 
 mov r1, #2 /* A move that makes a potential win */ 

 
 _exit:
 pop {ip, pc} @ pop return address into pc
 
/* External Functions*/
.global getMod 



