#include <msp430.h> // Specific device 
#include <intrinsics.h> // Intrinsic functions 
// ---------------------------------------------------------------------- 
// Pins for LEDs 
#define LED1 BIT2 
// ---------------------------------------------------------------------- 
void main (void) 
{ 
WDTCTL = WDTPW|WDTHOLD; // Stop watchdog timer 
P5OUT = LED1; // Preload LED1 on  
P5DIR = LED1; // Set pins with LED1  to output 
TACCR0 = 49999; // Upper limit of count for TAR 
TACCTL0 = CCIE; // Enable interrupts on Compare 0 
TACTL = MC_1|ID_3|TASSEL_2|TACLR; // Set up and start Timer A 
// "Up to CCR0" mode , divide clock by 8, clock from SMCLK , clear timer 
__enable_interrupt (); // Enable interrupts (intrinsic) 
for (;;) { // Loop forever doing nothing 
} // Interrupts do the work 
} 
// Interrupt service routine for Timer A channel 0  
#pragma vector = TIMERA0_VECTOR 
__interrupt void TA0_ISR (void) 
{ 
P5OUT ^= LED1; // Toggle LED 
} 
