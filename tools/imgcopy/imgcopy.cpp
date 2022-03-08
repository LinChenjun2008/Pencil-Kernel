#include <iostream>
#include <fstream>
#include <string>
#include <stdint.h>
#include <stdlib.h>
#include "fs/epfs.h"

#ifndef PACKED
#define PACKED __attribute__(packed);
#endif

struct part_table //分区表(16字节)
{
    uint8_t bootable;    //可否引导?
    uint8_t start_head;  //起始磁头
    uint8_t start_sector;//起始扇区
    uint8_t start_chs;   //起始磁道
    uint8_t fs_type;     //fs类型
    uint8_t end_head;    //结束磁头
    uint8_t end_sector;  //结束扇区
    uint8_t end_chs;     //结束磁道
    uint32_t start_lba;  //起始lba
    uint32_t sec_cnt;    //扇区数
} PACKED;

std::string command;  // 输入的命令
std::fstream disk;    // 虚拟磁盘文件
std::string input_path;   //虚拟磁盘中的路径
std::string output_path;
std::fstream input_file;  // 输入到虚拟磁盘中的文件
std::fstream output_file; // 从虚拟磁盘中读出的文件

void bootable(char* part);
void fdisk(char* part,char* s_lba,char* sec_cnt,char* spt);
void format(int part);
void help();

int main(int argc,char* argv[])
{
    command = argv[1];
    if(argc < 3)
    {
        if(command == "help")
        {
            help();
            return 0;
        }
        else
        {
            std::cout << "error arg:" << argv[1] << std::endl;
            exit(2);
        }
    }
    if(command == "bootable")
    {
        disk.open(argv[2],std::ios_base::in | std::ios_base::out | std::ios_base::binary);
        if(!(disk.is_open()))
        {
            std::cout << argv[2] << "打开失败或文件不存在";
            exit(2);
        }
        bootable(argv[3]);
    }
    else if(command == "fdisk")
    {
        disk.open(argv[2],std::ios_base::in | std::ios_base::out | std::ios_base::binary);
        if(!(disk.is_open()))
        {
            std::cout << argv[2] << "打开失败或文件不存在";
            exit(2);
        }

        fdisk(argv[6],argv[7],argv[8],argv[5]);
    }
    else if(command == "format")
    {
        disk.open(argv[2],std::ios_base::in | std::ios_base::out | std::ios_base::binary);
        if(!(disk.is_open()))
        {
            std::cout << argv[2] << "打开失败或文件不存在";
            exit(2);
        }
        int part = argv[3][0] - '0';
        format(part);
    }
    else if(command == "input")
    {
        std::cout << "input暂不支持";
    }
    else if(command == "output")
    {
        std::cout << "output暂不支持";
    }
    else
    {
        std::cout << "error command:" << command << std::endl;
    }
    return 0;
}

void bootable(char* part)
{
    disk.seekp(0x1be + (atoi(part) - 1) * 16);
    uint8_t bootable = 0x80;
    disk.write((char*)&bootable,1);
}

void fdisk(char* part,char* s_lba,char* sec_cnt,char* spt)
{
    part_table disk_part = {0};
    //disk.seekg(0x1be + (part - 1) * 16);
    //disk.read((char*)&disk_part,16);

    // disk_part.bootable = 0x80; //可引导
    int end_lba = atoi(s_lba) + atoi(sec_cnt);

    disk_part.start_head = (atoi(s_lba)/atoi(spt)) & 1; //lba转chs,见boot.asm
    disk_part.start_sector = (atoi(s_lba) % atoi(spt)) + 1;
    disk_part.start_chs = (atoi(s_lba)/atoi(spt)) >> 1;

    disk_part.fs_type = 0x95; //EPFS是0x95

    disk_part.end_head = (end_lba/atoi(spt)) & 1; // lba转chs
    disk_part.end_sector = (end_lba % atoi(spt)) + 1;
    disk_part.end_chs = (end_lba/atoi(spt)) >> 1;

    disk_part.start_lba = atoi(s_lba);
    disk_part.sec_cnt = atoi(sec_cnt);
    // std::cout << 0x1be + (stoi(part) - 1) * 16;
    disk.seekp(0x1be + (atoi(part) - 1) * 16); //定位输出
    disk.write((char*)&disk_part,16);
}

void format(int part)
{
    part_table disk_part;
    disk.seekg(0x1be + (part - 1) * 16);
    disk.read((char*)&disk_part,16);

    disk_part.fs_type = 0x95;

    disk.seekp(0x1be + (part - 1) * 16);
    disk.write((char*)&disk_part,16);
    //此处还有更多操作,后期完善
}

void help()
{
    std::cout << "imgcopy v0.0.1" << std::endl;
    std::cout << "虚拟磁盘(硬盘)编辑工具(仅限EPFS)" << std::endl;

    std::cout << "命令:" << std::endl;
    std::cout << "bootable (disk) (part)" << std::endl
              << "\t" << "将虚拟磁盘disk的part分区设为活动分区" << std::endl << std::endl;
    std::cout << "fdisk (disk) (cyclinders) (heads) (spt) (part) (start_lba) (sector_cnt)" << std::endl
              << "\t" << "将虚拟磁盘disk的start_lba扇区开始的sector_cnt扇区划为part分区" << std::endl << std::endl;

    std::cout << "format (disk) (part)" << std::endl
              << "\t" << "将虚拟磁盘disk的part分区格式化为EPFS(仅支持主分区)" << std::endl
              << "\t" << "示例:" << std::endl
              << "\t" << "imgcopy format a.img 1" << std::endl
              << "\t" << "此命令将a.img的第1分区格式化为EPFS" << std::endl << std::endl;

    std::cout << "input (disk) (part) (path) (file)" << std::endl
              << "\t" << "将file输入到虚拟磁盘disk中part分区的path目录中" << std::endl
              << "\t" << "示例:" << std::endl
              << "\t" << "imgcopy input a.img 1 /file/a.txt 1.txt" << std::endl
              << "\t" << "此命令将1.txt输入到虚拟磁盘a.img的第1分区中的/file/a.txt文件中";
}
