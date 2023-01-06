#include <global.h>
#include <interrupt.h>
#include <graphic.h>
#include <stdio.h>

void panic_spin(const char* file,const char* base_file,int line,const char* func,const char* condition)
{
    intr_disable();
    char str[127];
    sprintf(str,"--- Kernel Panic --- \n File: %s \n Base File: %s \n In function: %s\n Line: %d\n Condition: %s\n",file,base_file,func,(UINTN)line,condition);
    struct Position Pos = { 10,10};
    BltPixel col;
    col.Red = 127;
    col.Green = 64;
    col.Blue = 64;
    viewFill(&(gBI.GraphicsInfo),col,0,0,600,250);
    col.Red = 255;
    col.Green = 255;
    col.Blue = 255;
    vput_utf8_str(&(gBI.GraphicsInfo),&Pos,col,str);
    while(1);
}