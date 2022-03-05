#include <iostream>
#include <fstream>
#include <string>
#include <stdint.h>
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
}PACKED;

part_table part; // 当前分区

std::string command;  // 输入的命令
std::fstream disk;    // 虚拟磁盘文件
std::string input_path;   //虚拟磁盘中的路径
std::string output_path;
std::fstream input_file;  // 输入到虚拟磁盘中的文件
std::fstream output_file; // 从虚拟磁盘中读出的文件

void format();
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
			std::cout << "error" << std::endl;
			exit(2);
		}
	}
	if(command == "format")
	{
		disk.open(argv[2],std::ios_base::in | std::ios_base::out | std::ios_base::binary);
		if(!(disk.is_open()))
		{
			std::cout << argv[2] << "打开失败或文件不存在";
			exit(2);
		}
		format();
	}
	else if(command == "input")
	{
		std::cout << "input";
	}
	else if(command == "output")
	{
		std::cout << "output";
	}

}

void format(){}

void help()
{
	std::cout << "imgcopy 0.0.1" << std::endl;
	std::cout << "虚拟磁盘文件编辑工具(仅限EPFS)" << std::endl;

	std::cout << "命令:" << std::endl;

	std::cout << "format (disk) (part)" << std::endl;
	std::cout << "\t" << "将虚拟磁盘disk的part分区格式化为EPFS(仅支持主分区)" << std::endl;
	std::cout << "\t" << "示例:" << std::endl
	          << "\t" << "imgcopy format a.img 1" << std::endl
	          << "\t" << "此命令将a.img的第1分区格式化为EPFS" << std::endl;

	std::cout << "input (disk) (part) (path) (file)" << std::endl
	          << "\t" << "将file输入到虚拟磁盘disk中part分区的path目录中" << std::endl
	          << "\t" << "示例:" << std::endl
	          << "\t" << "imgcopy input a.img 1 /file/a.txt 1.txt" << std::endl
	          << "\t" << "此命令将1.txt输入到虚拟磁盘a.img的第1分区中的/file/a.txt文件中";
}
