#include <keyboard.h>
#include <io.h>
#include <interrupt.h>
#include <graphic.h>

PUBLIC void wait_keyboard_ready()
{
    while (1)
    {
        if ((io_in8(KEYBOARD_STA_PORT) & KEYBOARD_NOTREADY) == 0)
        {
            break;
        }
    }
}

PUBLIC void init_keyboard()
{
    wait_keyboard_ready();
    io_out8(KEYBOARD_CMD_PORT,KEYBOARD_WRITE_MD);
    wait_keyboard_ready();
    io_out8(KEYBOARD_BUF_PORT,0x47);
    register_handle(0x21,intr0x21_handler);
    return;
}

PUBLIC void intr0x21_handler()
{
    io_out8(PIC_M_CTRL,0x20);
    io_in8(KEYBOARD_BUF_PORT);
    return;
}