#include <msp430x44x.h> 
#include <in430.h> 
#include "init_device.h" 
 
void delay(void); 
void port_init(void); 
 
unsigned int k=0; 
 
void port_init()  
{ 
 
   P5OUT=0x00;                 // Initially Apply Low to all P5 port line 
   P5DIR=0x0C;                 // P5.2 and P5.3 as a O/P 
   P5SEL=0x00;                 // Select P5.0 to P5.7 as GPIO 
} 
 
void main(void) 
 { 
   WDTCTL = WDTPW+WDTHOLD;     // WDTPW = 0x5A00 Password and WDTHOLD 
= 0x0080 Stop watchdog timer 
   init_devices(); 
   port_init();                // initialize required port lines 
   while(1) { 
 P5OUT |= (BIT2|BIT3);    // P5.2 and P5.3 are made high to turn ON LED L2 and L3 
      delay(); 
 P5OUT &= ~(BIT2|BIT3);   // P5.2 and P5.3 are made low to turn OFF LED L2 and 
L3 
      delay(); 
   } 
} 
 
void delay(void) 
 { 
   for(k=0;k<65000;k++); 
   for(k=0;k<65000;k++); 
} 
