#include <msp430x44x.h> 
#include <in430.h> 
#include “initdevice.h” 
 
void port_init(void); 
void delay(void); 
 
unsigned int i; 
 
 
void port_init(void) 
{ 
  P4SEL |= 0x00; 
  P4DIR |= 0x0F; 
  P4OUT |= 0x00;                
} 
 
void main(void) 
{ 
  WDTCTL = WDTPW+WDTHOLD;         // Stop watchdog timer 
     init_devices(); 
port_init(); 
  for ( i=0; i<0x3600; i++);           // Delay for reference start-up 
 
 while(1) 
 { 
   P4OUT = 0x07; 
   delay(); 
  
   P4OUT = 0x0B; 
   delay(); 
  
   P4OUT = 0x0D; 
   delay(); 
  
   P4OUT = 0x0E;  
   delay(); 
  
 } 
} 
void delay(void) 
{ 
 int i; 
 for(i=0;i<=10000;i++); 
}
