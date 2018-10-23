	 AREA     fibonacci, CODE, READONLY
     EXPORT __main
     ENTRY 
	 ; answer will be at r2
__main  FUNCTION		 
        MOV r0,#16 ; load n into r0
        MOV r1,#1 ; load 1 into r1;
		MOV r2, #0;
loop    CMP r0, #0;
		ADDNE R3,R2,R1;
		MOVNE R1,R2;
		MOVNE R2,R3;
		SUBNE R0,#1;
        BGT loop ; continue for as long as ro>0
stop    B stop ; stop program
     ENDFUNC
     END 
