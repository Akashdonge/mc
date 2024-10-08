;block exchange from one memory to another. 
;e.g 0x3010 to 0x3020 
;*********************************************************** 
#include "msp430f449.h"                       ; #define controlled include file 
 
   ORG 0X3010 
mystr1  DW 0X1111 
   DW 0X2222 
   DW 0X3333 
   DW 0X4444 
   DW 0X5555 
 
   ORG 0X3020  
mystr2  DW 0XAAAA 
   DW 0XBBBB 
   DW 0XCCCC 
   DW 0XDDDD 
   DW 0XEEEE 
 
   NAME     main                     ; module name 
   PUBLIC   main                     ; make the main label vissible 
      ; outside this module 
   ORG     0FFFEh 
  DC16    init                      ; set reset vector to 'init' label 
   RSEG    CSTACK                    ; pre-declaration of segment 
   RSEG    CODE                      ; place program in 'CODE' segment 
 
init:    MOV     #SFE(CSTACK), SP         ; set up stack 
main:       NOP                              ; main program 
   MOV.W   #WDTPW+WDTHOLD,&WDTCTL  ; Stop watchdog timer     
  CLR.W   R5 
 
L1:      MOV.W   0x3010(R5),R6 
  MOV.W   0x3020(R5),R7 
   MOV.W   R7,0x3010(R5)      
  MOV.W   R6,0x3020(R5) 
 INC     R5        ;increment R5 two times for to get 
       the even address                                      
    INC     R5 
  CMP    #0010,R5 
  JNE    L1 
 
   JMP $                             ; jump to current location '$' 
     ; (endless loop) 
   END 
