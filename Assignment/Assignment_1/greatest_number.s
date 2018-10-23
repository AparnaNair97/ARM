	 AREA     greatest_number, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION		 
        MOV r0,#15 ; a
        MOV r1,#200 ; b
		MOV r2, #100; c
		CMP r0, r1; comparing a and b
		MOVLT r0,r1; moving largest number to a
		MOV r1,r2; moving other number to b
		CMP r0, r1; comparing a and b
		MOVLT r0,r1; moving largest number to a
stop    B stop ; stop program
     ENDFUNC
     END 
