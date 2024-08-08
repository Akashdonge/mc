 
#include "msp430f449.h"                       ; #define controlled include file 
  ORG 0X3010 
MYSTRNG  DB   0X09 
 
  ORG 0X3020 
MYSTRNG1  DB   0X00 
 
  NAME    main                      ; module name 
 
  PUBLIC  main                      ; make the main label vissible 
                                        ; outside this module 
  ORG     0FFFEh 
  DC16    init                      ; set reset vector to 'init' label 
 
  RSEG    CSTACK                    ; pre-declaration of segment 
  RSEG    CODE                      ; place program in 'CODE' segment 
 
init:     MOV     #SFE(CSTACK), SP         ; set up stack 
 
main:     NOP                               ; main program 
  MOV.W   #WDTPW+WDTHOLD,&WDTCTL  ; Stop watchdog timer 
 
  MOV    #MYSTRNG,R4 
  MOV    @R4,R6 
  CMP    #0X00,R6 
  JGE    LOOP 
  JMP    LAST 
 
LOOP:     CMP    #0X0A,R6 
  JL     START 
  JMP    LAST 
 
START:   CLR     R5 
  ADD    #0X30,R6 
  MOV    R6,0X3020(R5) 
 
LAST:     JMP $                             ; jump to current location '$' 
    ; (endless loop) 
  END 
