	 AREA     exp1, CODE, READONLY
     EXPORT __main
     ENTRY 
	 ; answer will be at s2
__main  FUNCTION
       VMOV.F s0, #1.0
	   VMOV.F s1, #1.0;
	   VMOV.F s2, #1.0
	   VMOV.F s3,#1.0
	   VMOV.F s6,#1.0
loop   VCMPE.F s2, s5
	   VMRS APSR_nzcv, FPSCR
	   BEQ stop
	   VMOVNE.F s5, s2;
	   VDIVNE.F s4, s0,s1
	   VMULNE.F s3,s3,s4
	   VADDNE.F s2,s2,s3
	   VADDNE.F s1,s1,s6
	   BNE loop
stop    B stop ; stop program
     ENDFUNC
     END 
