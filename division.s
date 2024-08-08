 #include "msp430f449.h"                     
ORG    0x3010
 mystr DW     0x0004  
ORG    0x3020
 mystr1  DW     0x000F
 NAME    main                    
PUBLIC  main                    
; #define controlled include file
 ; module name
 ; make the main label vissible
 ; outside this module
 ORG     0FFFEh
 DC16    init                    
RSEG    CSTACK                  
RSEG    CODE                    
; set reset vector to 'init' label
 ; pre-declaration of segment
 ; place program in 'CODE' segment
 init:   MOV     #SFE(CSTACK), SP        
main:   NOP                             
; set up stack
 ; main program
 MOV.W   #WDTPW+WDTHOLD,&WDTCTL  ; Stop watchdog time
 CLR     R5
 mov.w 0x3010(R5),R4          
MOV.W   0x3020(R5),R7
 MOV #0000h,R6                             
L2: SUB    R4,R7 
ADD   #0001h,R6
 CMP   R4,R7               
; 16 bit or 8 bit
 ;JUMP ON LESS THAN IF R7 is less than R4 
JN    L1                  
JMP L2
 ;IS LESS THAN R4 THEN JUMP TO L1
 L1:  MOV   R7,0X3030(R5)           
INC   R5
 INC   R5
 MOV   R6,0X3030(R5)          
NOP
 NOP
 L3:  JMP L3                           
; REMINDER
 ;QUOTIENT
 ; jump to current location '$'
 ; (endless loop)
 END
