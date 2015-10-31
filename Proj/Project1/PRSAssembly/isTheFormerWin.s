/* -- isTheFormerWin.s */
.data

/* The first rule message */
.balign 4
frst_rule_mess: .asciz "Apply rule: Paper covers rock.\n"

/* The second rule message */
.balign 4
sec_rule_mess: .asciz "Apply rule: Rock breaks scissor.\n"

/* The third rule message */
.balign 4
thrd_rule_mess: .asciz "Apply rule: Scissor cuts paper.\n"

/* The next instruction after isTheFormerWin */
.balign 4
return: .word 0

.text

/*
 This function checks if the fromer choice can win the game
 r1: the former choice
 r2: the latter choice
 r0: is a returned flag (1=true, 0=false)
*/
.global isTheFormerWin
isTheFormerWin:

 ldr r0, return_addr /* r0 <- &return */
 str lr, [r0] /* *r0 <- lr */
 
 cmp r1, #1	@Check if r1 != paper
 bne _outer_cont1
 
	cmp r2, #2	@Check if r2 != rock
	bne _inner_cont1
		
		ldr r0, frst_rule_mess_addr	
		bl printf		
		mov r0, #1 /*The former wins the game by the first rule*/
		bal _exit
		
	_inner_cont1:
	
 _outer_cont1:

 cmp r1, #2	@Check if r1 != rock
 bne _outer_cont2
 
	cmp r2, #3	@Check if r2 != scissors
	bne _inner_cont2
		
		ldr r0, sec_rule_mess_addr
		bl printf		
		mov r0, #1 /*The former wins the game by the second rule*/
		bal _exit
		
	_inner_cont2:
	
 _outer_cont2:
  
 cmp r1, #3	@Check if r1 != scissors
 bne _outer_cont3
 
	cmp r2, #1	@Check if r2 != paper
	bne _inner_cont3
		
		ldr r0, thrd_rule_mess_addr
		bl printf		
		mov r0, #1 /*The former wins the game by the third rule*/
		bal _exit
		
	_inner_cont3:
	
 _outer_cont3: 
  
  
 mov r0, #0 /*The former loses the game*/
 
 _exit:
 ldr lr, return_addr /* lr <- &return */
 ldr lr, [lr] /* lr <- *lr */
 bx lr /* return from main using lr */
 
/*Addresses Referencing*/ 
frst_rule_mess_addr	: .word frst_rule_mess
sec_rule_mess_addr : .word sec_rule_mess
thrd_rule_mess_addr : .word thrd_rule_mess
return_addr : .word return

/*External Functions*/
.global printf

