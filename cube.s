 #include "msp430.h"                     
; #define controlled include file
 ;*************************************************
 ORG   0x3010
 mystr DW    0x0003        
;*************************************************
 NAME    main                    
; module name
 PUBLIC  main                    
ORG     0FFFEh
 DC16    init                    
RSEG    CSTACK                  
RSEG    CODE                    
; make the main label vissible
 ; outside this module
 ; set reset vector to 'init' label
 ; pre-declaration of segment
 ; place program in 'CODE' segment
 init:   MOV     #SFE(CSTACK), SP        
; set up stack
 ;*************************************************
 main:   NOP                             
; main program
 MOV.W   #WDTPW+WDTHOLD,&WDTCTL  ; Stop watchdog timer
 CLR    R5
 MOV.W  0X3010(R5),R4
 MOV.W  R4,R8
  L1:     ADD.W  R7,R4
 JNC    L2
 INC    R6
 L2:     DEC    R8
 JNZ    L1
 MOV.W  R4,R9
 MOV.W  R7,R8
 MOV.W  R4,R7
 SUB.W  #0001,R8
 L4:    ADD.W  R7,R9
 JNC    L3
 INC    R6
 L3:    DEC    R8
 JNZ    L4
 MOV.W  R9,0X3020(R5)
 INC    R5            
;INC BECAUSE TO GET THE EVEN ADDRESS
 INC    R5
 MOV.W  R6,0X3020(R5)
 JMP $                           
END
 MOV.W  R4,R7
 MOV.W  #0000,R6
 SUB.W  #0001,R8
