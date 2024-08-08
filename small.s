 #include "msp430f449.h"                    
ORG  0X3010
 mystr
 DW   0X3333
 DW   0X1111
 DW   0X5555
 DW   0X2222
 DW   0XFFFF
 DW   0X8888
 DW   0X6666
 DW   0X7777
 NAME    main                    
PUBLIC  main                    
ORG     0FFFEh
 DC16    init                    
RSEG    CSTACK                  
segment
 init:   
RSEG    CODE                    
MOV     #SFE(CSTACK), SP        
 main:  
L3:     
L2:     
L1:     
NOP                             
; main program
 MOV.W   #WDTPW+WDTHOLD,&WDTCTL  ; Stop watchdog timer
 CLR R5
 CLR R9
 MOV.W   #0X0007,R10
 MOV.W   0X3010(R5),R6
 INC     R5
 INC     R5
 CMP     
0X3010(R5),R6
 JNC      L1
 JNE     L2
 JMP     
L1
 MOV.W   0X3010(R5),R6
 MOV.W   R6,R7
 DEC    R10
 CMP    #0X0000,R10
 JNE    L3
 MOV.W  R7,0X3020(R10)
 JMP $                           
END   
