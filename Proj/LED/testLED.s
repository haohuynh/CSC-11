@ testLED.s
@ based on the following C program:
@ 
/*      
#include <stdio.h>
#include <wiringPi.h>

int main (void)
{

  // Please use command "gpio readall" for more information
  const int GPIO_0 = 0;
  const int GPIO_2 = 2;
  const int GPIO_3 = 3;
  const int GPIO_7 = 7;

  printf ("Raspberry Pi LED Testing\n") ;
  
  if (wiringPiSetup() == -1) {
    printf( "Wiring Pi Set-up error !!!" );
	return 1;
  }
  
  pinMode (GPIO_0, OUTPUT) ;
  pinMode (GPIO_2, OUTPUT) ;
  pinMode (GPIO_3, OUTPUT) ;
  pinMode (GPIO_7, OUTPUT) ;

  do{
    digitalWrite (GPIO_7, HIGH) ;	// On
    delay (300) ;		// mS
    digitalWrite (GPIO_7, LOW) ;	// Off
    delay (300) ;
	
	digitalWrite (GPIO_0, HIGH) ;	// On
    delay (300) ;		// mS
    digitalWrite (GPIO_0, LOW) ;	// Off
    delay (300) ;
	
	digitalWrite (GPIO_2, HIGH) ;	// On
    delay (300) ;		// mS
    digitalWrite (GPIO_2, LOW) ;	// Off
    delay (300) ;
	
	digitalWrite (GPIO_3, HIGH) ;	// On
    delay (300) ;		// mS
    digitalWrite (GPIO_3, LOW) ;	// Off
    delay (300) ;
  } while (1);
  return 0 ;
}
*/
@  as -o blink.o blink.s 
@  gcc -o blink2 blink.o -lwiringPi 
@  sudo ./blink2 

@ ---------------------------------------
@       Data Section
@ ---------------------------------------
        
         .data
         .balign 4      
intro:   .asciz  "Raspberry Pi LED Testing\n"
errMsg:  .asciz "Wiring Pi Set-up error !!!"
gpio_0:     .int   0
gpio_2:     .int   2
gpio_3:     .int   3
gpio_7:     .int   7
delayMs: .int   300
OUTPUT   =      1
HIGH	 =		1
LOW		 = 		0        
@ ---------------------------------------
@       Code Section
@ ---------------------------------------
        
        .text
        .global main
        .extern printf
        .extern wiringPiSetup
        .extern delay
        .extern digitalWrite
        .extern pinMode
        
main:   push    {ip, lr}        @ push return address + dummy register
                                @ for alignment

@  printf( "Raspberry Pi LED Testing\n" ) ;
        ldr     r0, =intro      
        bl      printf          

@  if (wiringPiSetup() == -1) {
@     printf( "Wiring Pi Set-up error !!!" ) ;
@     return 1                                   ;
@  }
        bl      wiringPiSetup
        mov     r1,#-1
        cmp     r0, r1
        bne     init
        ldr     r0, =errMsg
        bl      printf
        bal     _done


init:
@  pinMode (GPIO_0, OUTPUT) ;
        ldr     r0, =gpio_0
        ldr     r0, [r0]
        mov     r1, #OUTPUT
        bl      pinMode

@  pinMode (GPIO_2, OUTPUT) ;
        ldr     r0, =gpio_2
        ldr     r0, [r0]
        mov     r1, #OUTPUT
        bl      pinMode
		
@  pinMode (GPIO_3, OUTPUT) ;
        ldr     r0, =gpio_3
        ldr     r0, [r0]
        mov     r1, #OUTPUT
        bl      pinMode
		
@  pinMode (GPIO_7, OUTPUT) ;
        ldr     r0, =gpio_7
        ldr     r0, [r0]
        mov     r1, #OUTPUT
        bl      pinMode		
		
_do_while_loop:
        
@		digitalWrite (GPIO_7, HIGH) ;	// On
        ldr     r0, =gpio_7
        ldr     r0, [r0]
        mov     r1, #HIGH
        bl      digitalWrite
        
@       delay(300)               ;
        ldr     r0, =delayMs
        ldr     r0, [r0]
        bl      delay

@		digitalWrite (GPIO_7, LOW) ;	// Off
        ldr     r0, =gpio_7
        ldr     r0, [r0]
        mov     r1, #LOW
        bl      digitalWrite

@       delay(300)               ;
        ldr     r0, =delayMs
        ldr     r0, [r0]
        bl      delay

@		digitalWrite (GPIO_0, HIGH) ;	// On
        ldr     r0, =gpio_0
        ldr     r0, [r0]
        mov     r1, #HIGH
        bl      digitalWrite
        
@       delay(300)               ;
        ldr     r0, =delayMs
        ldr     r0, [r0]
        bl      delay

@		digitalWrite (GPIO_0, LOW) ;	// Off
        ldr     r0, =gpio_0
        ldr     r0, [r0]
        mov     r1, #LOW
        bl      digitalWrite

@       delay(300)               ;
        ldr     r0, =delayMs
        ldr     r0, [r0]
        bl      delay		
		
@		digitalWrite (GPIO_2, HIGH) ;	// On
        ldr     r0, =gpio_2
        ldr     r0, [r0]
        mov     r1, #HIGH
        bl      digitalWrite
        
@       delay(300)               ;
        ldr     r0, =delayMs
        ldr     r0, [r0]
        bl      delay

@		digitalWrite (GPIO_2, LOW) ;	// Off
        ldr     r0, =gpio_2
        ldr     r0, [r0]
        mov     r1, #LOW
        bl      digitalWrite

@       delay(300)               ;
        ldr     r0, =delayMs
        ldr     r0, [r0]
        bl      delay		

@		digitalWrite (GPIO_3, HIGH) ;	// On
        ldr     r0, =gpio_3
        ldr     r0, [r0]
        mov     r1, #HIGH
        bl      digitalWrite
        
@       delay(300)               ;
        ldr     r0, =delayMs
        ldr     r0, [r0]
        bl      delay

@		digitalWrite (GPIO_3, LOW) ;	// Off
        ldr     r0, =gpio_3
        ldr     r0, [r0]
        mov     r1, #LOW
        bl      digitalWrite

@       delay(300)               ;
        ldr     r0, =delayMs
        ldr     r0, [r0]
        bl      delay		
		        
        bal       _do_while_loop
        
_done:   
        pop     {ip, pc}        @ pop return address into pc
