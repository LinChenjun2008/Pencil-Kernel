/* copyright Lin Chenjun
* All rights reserved
*/
#include "interrupt.h"

void panic_spin(const char* file,int line,const char* func,const char* condition)
{
    intr_disable();
    put_string_xy("Error    ",0,0,0x4,0x0);
    put_string_xy("File: ",1,0,0x4,0x0);put_string_xy(file,1,6,0x4,0x0);
    put_string_xy("In function: ",2,0,0x4,0x0);put_string_xy(func,2,13,0x4,0x0);
    put_string_xy("Condition: ",3,0,0x4,0x0);put_string_xy(condition,3,11,0x4,0x0);
    while(1){;}
    return;
}
