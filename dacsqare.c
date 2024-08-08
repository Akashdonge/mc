#include <msp430x44x.h> 
#include <in430.h> 
#include “initdevice.h” 
 
void port_init(void); 
void delay(void); 
 
unsigned int i; 
 
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
 
 while(1) 
 { 
 P2OUT = 0x00; 
 delay(); 
  
 P2OUT = 0xFF; 
 delay(); 
  
 } 
} 
void delay(void) 
{ 
 int i=0; 
 for(i=0;i<=500;i++); 
}
