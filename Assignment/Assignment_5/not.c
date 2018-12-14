#include "TM4C123GH6PM.h"
void not1(const int a)
{
	 char Msg[100];
	 char *ptr;
	if (a==1){
	sprintf(Msg, "Logic Funtion: XNOR\n");
	 ptr = Msg ;
   while(*ptr != '\0'){
      ITM_SendChar(*ptr);
      ++ptr;
   }
 }
	else if (a==2){
	sprintf(Msg, "Logic Funtion: XOR\n");
	 ptr = Msg ;
   while(*ptr != '\0'){
      ITM_SendChar(*ptr);
      ++ptr;
   }
 }
	else if (a==3){
	sprintf(Msg, "Logic Funtion: AND\n");
	 ptr = Msg ;
   while(*ptr != '\0'){
      ITM_SendChar(*ptr);
      ++ptr;
   }
 }
	else if (a==4){
	sprintf(Msg, "Logic Funtion: OR\n");
	 ptr = Msg ;
   while(*ptr != '\0'){
      ITM_SendChar(*ptr);
      ++ptr;
   }
 }
	else if (a==5){
	sprintf(Msg, "Logic Funtion: NOT\n");
	 ptr = Msg ;
   while(*ptr != '\0'){
      ITM_SendChar(*ptr);
      ++ptr;
   }
 }
	else if (a==6){
	sprintf(Msg, "Logic Funtion: NAND\n");
	 ptr = Msg ;
   while(*ptr != '\0'){
      ITM_SendChar(*ptr);
      ++ptr;
   }
 }
	else if (a==7){
	sprintf(Msg, "Logic Funtion: NOR\n");
	 ptr = Msg ;
   while(*ptr != '\0'){
      ITM_SendChar(*ptr);
      ++ptr;
   }
 }
}
