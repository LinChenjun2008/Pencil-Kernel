#include <iostream>
#include <fstream>
#include <cstdlib>


#include "imgcopy.h"

std::fstream vhd;

int main(int argc,char* argv[])
{
    openvhd(argc,argv);
    return 0;
}

void openvhd(int argc,char* argv[])
{
    int i;
    for(i=1;i < argc;i++)
    {
        if(std::strcmp(argv[i],"-vd")==0)
        {
            i++;
            break;
        }
    }
    if(i >= argc)
    {
        std::cerr << argv[0] << ':' << "not have  vhd file" << std::endl;
        exit();
    }
    global::vhd.open(argv[i],std::ios_base::in | std::ios_base::out | std::ios_base::binary);
    if(!(global::vhd.is_open()))
    {
        std::cerr << argv[0] << ':' << "can't open vhd file" << std::endl;
        exit();
    }
    std::cout << "open vhd file:" << argv[i] << std::endl;
}
