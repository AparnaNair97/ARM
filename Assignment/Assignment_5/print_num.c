#include "TM4C123GH6PM.h"
void print_num(const int a)
{
	if(a==5){
			 char Msg[100];
	 char *ptr;
	sprintf(Msg, "X0 Y\n");
	 ptr = Msg ;
   while(*ptr != '\0'){
      ITM_SendChar(*ptr);
      ++ptr;
   }
	}
	else{
	 char Msg[100];
	 char *ptr;
	sprintf(Msg, "X0 X1 X2 Y\n");
	 ptr = Msg ;
   while(*ptr != '\0'){
      ITM_SendChar(*ptr);
      ++ptr;
   }
 }
}

