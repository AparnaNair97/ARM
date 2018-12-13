     area     appcode, CODE, READONLY
	 IMPORT printMsg
		 IMPORT printMsg2     
exp function
	   VMOV.F32 s1, #1.0;
	   VMOV.F32 s2, #1.0
	   VMOV.F32 s3,#1.0
	   VMOV.F32 s6,#1.0
loop   VCMPE.F32 s2, s5
	   VMRS APSR_nzcv, FPSCR
	   BEQ stop
	   VMOVNE.F32 s5, s2;
	   VDIVNE.F32 s4, s0,s1
	   VMULNE.F32 s3,s3,s4
	   VADDNE.F32 s2,s2,s3
	   VADDNE.F32 s1,s1,s6
	   BNE loop
stop   VMOV.F32 R0,S2	
	   BX lr
	   endfunc
	   
logic_xnor function ;1
	VMOV.F32 s13, #-1.0;bias
	VMOV.F32 s20, #5.0; w1
	VMOV.F32 s21, #20.0;w2
	VMOV.F32 s22,#-10.0;w3
	BX lr
	endfunc
	
logic_xor function ;2
	VMOV.F32 s13, #1.0;bias
	VMOV.F32 s20, #-5.0; w1
	VMOV.F32 s21, #20.0;w2
	VMOV.F32 s22,#10.0;w3
	BX lr
	endfunc
	
logic_and function ;3
	VMOV.F32 s18, #10.0; ten
	VMOV.F32 s13, #-5.0;bias
	VMOV.F32 s20, #2.0; w1
	VMOV.F32 s21, #2.0;w2
	VMOV.F32 s22,#2.0;w3
	BX lr
	endfunc
	
logic_or function ;4
	VMOV.F32 s18, #10.0; ten
	VMOV.F32 s13, #-1.0;bias
	VMOV.F32 s20, #2.0; w1
	VMOV.F32 s21, #2.0;w2
	VMOV.F32 s22,#2.0;w3
	BX lr
	endfunc
	
logic_not function ;5
	VMOV.F32 s18, #10.0; ten
	VMOV.F32 s13, #1.0;bias
	VMOV.F32 s20, #5.0; w1
	VMOV.F32 s21, #-7.0;w2
	VMOV.F32 s22,s17;w3
	BX lr
	endfunc
	
logic_nand function ;6
	VMOV.F32 s18, #10.0; ten
	VMOV.F32 s13, #5.0;bias
	VMOV.F32 s20, #-2.0; w1
	VMOV.F32 s21, #-2.0;w2
	VMOV.F32 s22,#-2.0;w3
	BX lr
	endfunc
	
logic_nor function ;7
	VMOV.F32 s18, #10.0; ten
	VMOV.F32 s13, #1.0;bias
	VMOV.F32 s20, #-2.0; w1
	VMOV.F32 s21, #-2.0;w2
	VMOV.F32 s22,#-2.0;w3
	BX lr
	endfunc
	   
sigmoid function
	   VMUL.F32 s10, s10,s20;w1
	   VMUL.F32 s11, s11, s21;w2
	   VMUL.F32 s12, s12, s22;w3
	   VADD.F32 s14, s10,s11; W1+W2
	   VADD.F32 s14,s14,s12; s14+W3
	   VADD.F32 s14,s14,s13; s14+bias
	   VMOV.F32 s0, s14;
	   VMOV.F32 s16, #-1.0; -one
	   VMUL.F32 s0, s0, s16;
	   MOV R12, R14;
	   BL exp
	   MOV R14, R12;
	   VMOV.F32 s2,r0;
	   VMOV.F32 s15, #1.0; one
	   VADD.F32 s2,s2,s15
	   VDIV.F32 s2, s15,s2
	   VCVTR.S32.F32 s2,s2
	   VMOV.F32 R0,S2
	   BX lr
	endfunc
	
main2 function
	   mov r10, r14 ; zero 100
	   VMOV.F32 s17, r1; zero 100
	   VMOV.F32 s10, #1.0; in1
	   mov r0,#1;
	   bl printMsg;
	   VMOV.F32 s11, s17;in2
	   mov r0,#0;
	   bl printMsg;
	   VMOV.F32 s12,s17;in3
	   mov r0,#0;
	   bl printMsg;
	   ;MOV R14, R15;
;	   MRS r10, APSR_nzvc ;
;	   bx r4;
	   blx r4 ;function sets the weight for each gate.
	   BL sigmoid ;function predicts the output.
       BL printMsg2; Refer to ARM Procedure calling standards.
	   
	   VMOV.F32 s17, r1; zero 101
	   VMOV.F32 s10, #1.0; in1
	   mov r0,#1;
	   bl printMsg;
	   VMOV.F32 s11, s17;in2
	   mov r0,#0;
	   bl printMsg;
	   VMOV.F32 s12,#1.0;in3
	   mov r0,#1;
	   bl printMsg;
	   ;MOV R14, R15;
;	   MRS r10, APSR_nzvc ;
;	   bx r4;
	   blx r4 ;function sets the weight for each gate.
	   BL sigmoid ;function predicts the output.
       BL printMsg2; Refer to ARM Procedure calling standards.
	   
	   VMOV.F32 s17, r1; zero 110
	   VMOV.F32 s10, #1.0; in1
	   mov r0,#1;
	   bl printMsg;
	   VMOV.F32 s11, #1.0;in2
	   mov r0,#1;
	   bl printMsg;
	   VMOV.F32 s12,s17;in3
	   mov r0,#0;
	   bl printMsg;
	   ;MOV R14, R15;
;	   MRS r10, APSR_nzvc ;
;	   bx r4;
	   blx r4 ;function sets the weight for each gate.
	   BL sigmoid ;function predicts the output.
       BL printMsg2; Refer to ARM Procedure calling standards.
	   
	   VMOV.F32 s17, r1; zero 111
	   VMOV.F32 s10, #1.0; in1
	   mov r0,#1;
	   bl printMsg;
	   VMOV.F32 s11, #1.0;in2
	   mov r0,#1;
	   bl printMsg;
	   VMOV.F32 s12,#1.0;in3
	   mov r0,#1;
	   bl printMsg;
	   ;MOV R14, R15;
;	   MRS r10, APSR_nzvc ;
;	   bx r4;
	   blx r4 ;function sets the weight for each gate.
	   BL sigmoid ;function predicts the output.
       BL printMsg2; Refer to ARM Procedure calling standards.
	   MOV r14, r10
	   BX lr;
	endfunc	
	
	 export __main	
	 ENTRY 
__main  function
	   LDR r1, = 0x00000000 ; cannot load 0.0 using
	   LDR r4, =logic_xnor;
	   MOV r0, #1;
	   BL printMsg2
	   BL main2
	   
	   LDR r4, =logic_xor;
	   MOV r0, #2;
	   BL printMsg2
	   BL main2
	   
	   LDR r4, =logic_and;
	   MOV r0, #3;
	   BL printMsg2
	   BL main2
	   
	   LDR r4, =logic_or;
	   MOV r0, #4;
	   BL printMsg2
	   BL main2
	   
	   LDR r4, =logic_not; //not of second input.
	   MOV r0, #5;
	   BL printMsg2
	   BL main2
	   
	   LDR r4, =logic_nand;
	   MOV r0, #6;
	   BL printMsg2
	   BL main2
	   
	   LDR r4, =logic_nor;
	   MOV r0, #7;
	   BL printMsg2
	   BL main2
fullstop    B  fullstop ; stop program	   
     endfunc
     end
     
     ;the number signifies various gates.
     ;1 - XNOR
     ;2 - XOR
     ;3 - AND
     ;4 - OR
     ;5 - NOT
     ;6 - NAND
     ;7 - NOR
