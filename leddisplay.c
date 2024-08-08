#include <msp430x44x.h> 
#include "init_device.h" 
#include "lcd.h" 
#include <in430.h> 
/* LCD rel variables */ 
unsigned char str1[]="ALS, R&D Section"; 
unsigned char str2[]="    Bangalore-58"; 
unsigned char *ptr; 
unsigned char temp;  
unsigned int j; 
 
void port_init() 
{ 
    P6OUT=0x00; 
  P6SEL=0x00; 
  P6DIR=0xFC;                       //lcd0-->lcd3,RS,EN as o/p 
} 
//interrupt handlers  
//main code entry point 
void main(void) 
{ 
  WDTCTL = WDTPW + WDTHOLD;           // Stop watchdog timer 
  init_devices(); 
  port_init(); 
  for(j=0;j<5000;j++);                // Power ON delay(15ms)for lcd 
  for(j=0;j<5000;j++); 
  for(j=0;j<5000;j++); 
  for(j=0;j<5000;j++); 
  lcd_init(); 
  while(1) 
  { /* display first string on LCD line one */ 
      ptr = str1; 
      temp = 0x80; 
      lcd_comm() 
      while(*ptr != '\0') { 
        temp = *ptr; 
        lcd_data(); 
        ptr++; 
   }  /* display second string on LCD line two */ 
      ptr = str2;  
      temp = 0xc0; 
      lcd_comm(); 
      while(*ptr != '\0') { 
        temp = *ptr; 
        lcd_data(); 
        ptr++; 
      } 
      for(j=0;j<5000;j++);                // Power ON delay(15ms)for lcd 
  } 
}
