#include <iostream>
#include <fstream>
#include <cstdlib>


#include "imgcopy.h"

#include "fs/epfs/epfs.h"
#include "fs/fat16/fat16.h"

namespace imgcopy
{
	bool is_open_vhd;
	bool is_format_vhd;
}

std::fstream vhd;

int main(int argc,char* argv[])
{
	int i;;
    vhd.clear();
    //分析命令   
    for(i=1;i < argc;i++)
    {
        if(std::strcmp("-vd",argv[i])==0)
        {
            if(imgcopy::is_open_vhd)
            {
        	std::cout << argv[0] << "vhd file too more !!!" << std::endl;
        	exit(EXIT_FAILURE);
            }
            i++;//-vd的下一个参数是vhd文件名
            vhd.open(argv[i],std::ios_base::in | std::ios_base::out | std::ios_base::binary);
            if(!(vhd.is_open()))//不能打开,报错
            {
                std::cout << argv[0] << ':' << "can't open vhd file:" << argv[i] << std::endl;
                exit(EXIT_FAILURE);
            }
            imgcopy::is_open_vhd = true;//vhd文件已打开
        }
        //格式化vhd
        if(std::strcmp("-fmt",argv[i])==0)
        {
            if(!(imgcopy::is_open_vhd))//vhd未打开,不能格式化,先做标记
            {
                imgcopy::is_format_vhd = true;
            }
            //vhd已打开且要格式化
            if(imgcopy::is_open_vhd && imgcopy::is_format_vhd)
            {
                vhd_format();
            } 
        }
        //退出imgcopy
        if(std::strcmp("-exit",argv[i])==0)
        {
            std::cout << argv[0] << ":exit" << std::endl;
            exit(0);
            break;
        }
        if(std::strcmp("-info",argv[i])==0)
        {
            std::cout << "imgcopy version 00 21 4" << std::endl;
            std::cout << "(c) Lin Chenjun" << std::endl;
        }
    }
    return 0;
}



void vhd_format()
{
    index_block ib;
    ib.magic = {'E','P','F','S',' ',' ','0','1'};
    ib.TotSec = (64*1024*1024)/512;
    ib.BytesPerSec = 512;
    ib.BitmapStartSec = 1;
    //
    ib.DataStartSec = ib.BitmapStartSec + ib.BitmapSectors;
    ib.DataSectors = ib.TotSec -1 -ib.DataStartSec;
	
    vhd.seekp(512);
    vhd.write((char*)&ib,sizeof(ib));
//    std::cout << "vhd fmt: " << sizeof(ib)<< std::endl;
    return;
}
