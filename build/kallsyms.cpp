#include <iostream>
#include <fstream>

std::fstream input;
std::fstream output;

int main(int argc,char* argv[])
{
    if(argc != 3)
    {
        std::cout << "Useage: " << argv[0] << " input output" << std::endl;
        return -1;
    }
    input.open(argv[1],std::ios_base::in);
    if(!input.is_open())
    {
        std::cout << "Error: open file" << argv[1] << " failed" << std::endl;
    }
    output.open(argv[2],std::ios_base::out);
    if(!output.is_open())
    {
        std::cout << "Error: open file" << argv[2] << " failed" << std::endl;
    }
    // read symbols
    char s[128];
    char symbol_type;
    unsigned long long address;
    output << "struct symbol_entry\n{\n\tunsigned long long int Address;\n\tchar* name;\n};\n";
    output << "struct symbol_entry symbol_table[] =\n{\n";
    int symbols = 0;
    while(!input.eof())
    {
        if(!(input >> std::hex >> address))
        {
            input.getline(s,128);
        }
        symbols++;
        input >> symbol_type;
        input.getline(s,128);
        output << "\t" << "{" << std::hex << std::showbase << address << ",\"" << &s[1] << "\"}," << std::endl;
    }
    output << "};\n";
    output << "int symbols = " << std::dec << symbols << ";";
    input.close();
    output.close();
    return 0;
}