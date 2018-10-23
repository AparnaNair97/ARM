	 AREA     greatest_number, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION		 
        MOV r0,#15 ; a
        MOV r1,#5 ; b
		CMP r0, r1;
loop	SUBGT r0,r0,r1;
		SUBLT r1,r1,r0;
		CMP r0, r1;
		BNE loop; looping only when a!=b
stop    B stop ; stop program
     ENDFUNC
     END 
