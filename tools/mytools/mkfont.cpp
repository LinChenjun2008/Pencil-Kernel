//copyright (c) 2022 LinChenjun

#include<iostream>
#include<fstream>
#include<string>
#include<cstdlib>
using namespace std;

std::fstream in;
std::fstream out;
std::fstream log;

void font_make();

int main()
{
    std::string in_name;
    std::cout << "输入文件名:";
    std::cin >> in_name;
    in.open(in_name.c_str(),std::ios_base::in);
    if(!(in.is_open()))
    {
        std::cout << std::endl << "open \'" << in_name <<"\' error";
        exit(2);
    }
    std::string out_name;
    std::cout << "输出文件名:";
    std::cin >> out_name;
    out.open(out_name.c_str(),std::ios_base::out | std::ios_base::binary);
    if(!(out.is_open()))
    {
        std::cout << std::endl << "open \'" << out_name <<"\' error";
    }
    //out << "char HZK16[17*16*94*94] = \n{\n";
    font_make();
    return 0;
}

void font_make()
{
    char buf[30];
    short o_buf = 0;
    unsigned short key[16] = {0x0080,0x0040,0x0020,0x0010,0x0008,0x0004,0x0002,0x0001,0x8000,0x4000,0x2000,0x1000,0x0800,0x0400,0x0200,0x0100};
    int i;
    while(1)
    {
    	in >> buf;
    	//std::cout << buf << std::endl; //这行用于debug
    	if(buf[0] == ';')
    	{
    		continue; //;作为注释
    	}
    	if(buf[0] == '$')
    	{
    		break; //$作为结束符
    	}
    	//std::cout << buf << std::endl; //这行用于debug
    	for(i = 0;i < 16;i++)
    	{
    		if(buf[i] == '#')
    		{
    			o_buf |= key[i];
    		}
    	}
    	out.write((char*)&o_buf,sizeof(o_buf));
    	o_buf = 0;
    }
}
