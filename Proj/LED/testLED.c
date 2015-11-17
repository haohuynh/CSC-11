/* 
 * File:   testLED.c
 * Author: HaoHuynh
 *
 * Created on November 12, 2015, 8:48 AM
 *
 * This program blinks GPIO_0, GPIO_2, GPIO_3, and GPIO_7 on and off, infinitely.
 */
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
