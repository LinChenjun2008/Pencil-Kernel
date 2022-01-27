/* copyright Lin Chenjun
* All rights reserved
*/
#include "interrupt.h"

void panic_spin(const char* file,int line,const char* func,const char* condition)
{
    intr_disable();
    put_str("Error\n");
    put_str("File:");put_str(file);put_char('\n');
    put_str("In function: ");put_str(func);put_char('\n');
    put_str("Line:");put_int(line);put_char('\n');
    put_str("Condition: ");put_str(condition);put_char('\n');
    while(1){;}
    return;
}
