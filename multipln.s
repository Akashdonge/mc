 #include "msp430.h"                     
ORG   0x3010
 mystr DW    0x1234  
ORG   0x3020
 mystr1  DW    0xabcd 
NAME    main                    
PUBLIC  main                    
ORG     0FFFEh
 DC16    init                    
RSEG    CSTACK                  
RSEG    CODE                    
init:   MOV     #SFE(CSTACK), SP        
main:   NOP                             
; #define controlled include file
 ; module name
 ; make the main label vissible
 ; outside this module
 ; set reset vector to 'init' label
 ; pre-declaration of segment
 ; place program in 'CODE' segment
 ; set up stack
 ; main program
 MOV.W   #WDTPW+WDTHOLD,&WDTCTL  ; Stop watchdog timer
 CLR     R5
 MOV.W   0X3010(R5),R4           
MOV.W   0X3020(R5),R9
 MOV.W   #0000,R8   
  MOV.W   R4,R6
 SUB.W   #0001,R6
 MOV.W   R9,R7
 L1:   ADD.W     R7,R9
 JNC   
    L2
 ADD     #0001,R8      
L2:  
  DEC.W     R6
 JNZ    
 L1
 MOV.W   R8,0X3030(R5)
 INC    
 R5
 INC    
 R5
 MOV.W   R9,0X3030(R5)        
JMP $                       
END
