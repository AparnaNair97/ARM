#include "TM4C123GH6PM.h"
void printMsg2(const int a)
{
	 char Msg[100];
	 char *ptr;
	 sprintf(Msg, "%x\n", a);
	 ptr = Msg ;
   while(*ptr != '\0'){
      ITM_SendChar(*ptr);
      ++ptr;
   }
}
