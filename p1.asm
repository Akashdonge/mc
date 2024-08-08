Simple data handling programs in ALP -- Addition of 8 bit / 16 bit numbers 
 
;addition two 16 bit data 
#include "msp430f449.h"                         ; #define controlled include file 
 
 ORG   0x3010 
mystr    DW    0x4444 
 
   ORG   0x3020 
mystr1   DW    0xAAAA 
      ; outside this module 
   ORG     0FFFEh 
   DC16    init                       ; set reset vector to 'init' label 
 
   RSEG    CSTACK                    ; pre-declaration of segment 
RSEG    CODE                                ; place program in 'CODE'                                        
                                                         segment 
 
init:     MOV     #SFE(CSTACK), SP          ; set up stack 
 
main:    NOP                                ; main program 
   MOV.W   #WDTPW+WDTHOLD,&WDTCTL ; Stop watchdog timer 
 
  CLR     R5                       
MOV.W  0X3010(R5),R4             ; moving data from 0x3010                                             
address to R4 register 
MOV.W  0X3020(R5),R6            ; moving data from 0x3020  
address to R6 register 
 
   ADD.W   R4,R6 
MOV.W   R6,0X3030(R5)            ;RESULT IS STORED IN 0X3030                                                                                      
        ADDRESS 
 
   JMP $                              ; jump to current location '$' 
      ; (endless loop) 
   END 
