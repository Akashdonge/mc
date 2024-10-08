;block move from one mem location to the other , from 0x3010 to 0x3020 
;*********************************************************************** 
 
#include "msp430f449.h"                       ; #define controlled include file 
 
  ORG  0X3010 
mystr1    DW   0X1122  
  DW   0X3344 
   DW   0X5566 
  DW   0X7788 
  DW   0X99AA 
 
   ORG  0X3020 
mystr2   DS    10      
 
  NAME    main                      ; module name 
 
  PUBLIC  main                      ; make the main label vissible 
    ; outside this module 
  ORG     0FFFEh 
   DC16    init                      ; set reset vector to 'init' label 
 
  RSEG    CSTACK                     ; pre-declaration of segment 
  RSEG    CODE                      ; place program in 'CODE' segment 
 
 
init:    MOV     #SFE(CSTACK), SP         ; set up stack 
 
main:    NOP                               ; main program 
  MOV.W   #WDTPW+WDTHOLD,&WDTCTL  ; Stop watchdog time 
 
  CLR.W   R5                         
 
 
L1:       MOV.W   0x3010(R5),0x3020(R5)      
  INC     R5                          ; increment two times for to get  
                                                                                   even address  
  INC     R5 
  CMP     #0010,R5                   
  JNE     L1 
 
 
  JMP $                             ; jump to current location '$' 
    ; (endless loop) 
  END 
