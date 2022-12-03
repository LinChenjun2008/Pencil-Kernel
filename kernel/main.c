#include <common.h>
#include <global.h>
#include <stdint.h>
#include <graphic.h>
#include <stdarg.h>

const char VERSION[] = "Pencil-Kernel(PKn) 0.1.1 ";
/**
    @brief 内核的主函数
    @param binfo    启动数据,由引导程序传入

    @retval         正常情况下永不返回

**/

struct BootInfo gBI;

int test_f();
uint64_t kernel_main(struct BootInfo* binfo)
{
    init_screen(&(binfo->GraphicsInfo));
    gBI = *binfo;
    struct Position Pos = {10,10};
    BltPixel col = 
    {
        .Red = 255,
        .Green = 255,
        .Blue = 255
    };
    // c.Red = 255;
    // c.Green = 255;
    // c.Blue;
    char str[128];
    sprintf(str,"%s%s \n",VERSION,__COMPILE_DATE__);
    vput_utf8_str(&(binfo->GraphicsInfo),&Pos,col,str);
    vput_utf8_str(&(binfo->GraphicsInfo),&Pos,col,"Copyright 2022 Pencil-Kernel developers. All Rights Reserved.\n");
    vput_utf8_str(&(binfo->GraphicsInfo),&Pos,col,"本系统支持utf-8字库.\n");
    sprintf(str,"分辨率:%d * %d 显存基址:%p  %p\n",binfo->GraphicsInfo.HorizontalResolution,binfo->GraphicsInfo.VerticalResolution,binfo->GraphicsInfo.FrameBufferBase);
    vput_utf8_str(&(binfo->GraphicsInfo),&Pos,col,str);
    while(1);
    return 0;
}