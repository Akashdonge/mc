SQUARE 
;************************************************* 
 
#include "msp430.h"                        ; #define controlled include file 
 
  ORG   0x3010 
mystr    DW    0x1234 
 
  NAME    main                      ; module name 
 
  PUBLIC  main                      ; make the main label vissible 
    ; outside this module 
  ORG     0FFFEh 
  DC16    init                      ; set reset vector to 'init' label 
 
  RSEG    CSTACK                    ; pre-declaration of segment 
  RSEG    CODE                      ; place program in 'CODE' segment 
 
init:     MOV     #SFE(CSTACK), SP         ; set up stack 
 
main:    NOP                               ; main program 
  MOV.W   #WDTPW+WDTHOLD,&WDTCTL  ; Stop watchdog timer 
 
  CLR     R5 
  MOV.W  0X3010(R5),R4 
  MOV.W  R4,R8 
  mov.w  R4,R7 
  MOV.W  #0000,R6 
  SUB.W  #0001,R8 
L1:       ADD.W  R7,R4 
  JNC    L2 
  INC    R6 
L2:       DEC    R8 
  JNZ    L1 
  MOV.W  R6,0X3020(R5)        ;HIGHER BYTE 
  INC    R5                    ;FORN TO GET THE EVEN ADDRESS 
  INC    R5   
  MOV.W  R4,0X3020(R5)        ;LOWER BYTE 
  JMP $                             ; jump to current location '$' 
    ; (endless loop) 
  END 
