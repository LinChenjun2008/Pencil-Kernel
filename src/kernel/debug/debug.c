#include <global.h>
#include <interrupt.h>
#include <thread.h>
#include <graphic.h>
#include <stdio.h>

void panic_spin(const char* file,const char* base_file,int line,const char* func,const char* condition)
{
    intr_disable();
    char str[127];
    sprintf(str,"--- Kernel Panic --- \n File: %s \n Base File: %s \n In function: %s\n Line: %d\n Condition: %s\n thread: %s",file,base_file,func,(UINTN)line,condition,running_thread()->name);
    struct Position Pos = { 10,10};
    Pos.x = gBI.GraphicsInfo.HorizontalResolution / 2 - (600 / 2);
    Pos.y = gBI.GraphicsInfo.VerticalResolution / 2 - (250 / 2);
    BltPixel col;
    col.Red = 127;
    col.Green = 64;
    col.Blue = 64;
    viewFill(&(gBI.GraphicsInfo),col,
    gBI.GraphicsInfo.HorizontalResolution / 2 - (600 / 2),
    gBI.GraphicsInfo.VerticalResolution / 2 - (250 / 2),
    gBI.GraphicsInfo.HorizontalResolution / 2 + (600 / 2),
    gBI.GraphicsInfo.VerticalResolution / 2 + (250 / 2));
    col.Red = 255;
    col.Green = 255;
    col.Blue = 255;
    vput_utf8_str(&(gBI.GraphicsInfo),&Pos,col,str,1);
    while(1);
}