#include <serial.h>
#include <io.h>
#include <stdint.h>
#include <debug.h>

void init_serial(uint16_t port)
{
    io_out8(port + 1,0x00);
    io_out8(port + 3,0x80);
    io_out8(port + 0,0x03);
    io_out8(port + 1,0x00);
    io_out8(port + 3,0x03);
    io_out8(port + 2,0xc7);
    io_out8(port + 4,0x0b);
    io_out8(port + 4,0x1e);
    // io_out8(port + 0,0xae);
    // if (io_in8(port + 0) != 0xae)
    // {
    //     PANIC("serial init fail");
    // }
    io_out8(port + 4,0x0f);
    return;
}

int is_transmit_empty(uint16_t port)
{
   return io_in8(port + 5) & 0x20;
}

void write_serial(uint16_t port,char a)
{
   while (is_transmit_empty(port) == 0);
   io_out8(port,a);
}

void pr_log(uint16_t port,const char* log)
{
    while (is_transmit_empty(port) == 0);
    if(*log != 0)
    {
        do
        {
            write_serial(port,*log);
        } while (*(log++));

    }
}