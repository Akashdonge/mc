#include <msp430x44x.h> 
#include <in430.h> 
#include “initdevice.h” 
 
void port_init(void 
 
unsigned int i; 
 char count; 
 
void port_init(void) 
{ 
 
  P2SEL |= 0x00; 
  P2DIR |= 0xFF; 
  P2OUT |= 0x00; 
 
} 
 
 
void main(void) 
{ 
 WDTCTL = WDTPW+WDTHOLD;         // Stop watchdog timer 
     init_devices(); 
port_init(); 
  for ( i=0; i<0x3600; i++);           // Delay for reference start-up 
 
  count = 0; 
 while(1) 
 { 
  for(count=0;count<=0x3F;count++) 
  { 
   P2OUT = count ; 
  } 
   
   P2OUT = 0X00; 
   
  
 } 
}
