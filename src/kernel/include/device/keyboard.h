#ifndef __KEYBOARD_H__
#define __KEYBOARD_H__

#include <kernel/global.h>
#include <std/stdint.h>

#define KEYBOARD_BUF_PORT 0x60
#define KEYBOARD_WRITE_MD 0x60
#define KEYBOARD_STA_PORT 0x64
#define KEYBOARD_CMD_PORT 0x64
#define KEYBOARD_NOTREADY 0x02

/* 不可见字符 */
#define esc '\033'
#define backspace '\b'
#define tab '\t'
#define enter '\r'
#define delete '\177'

#define ctrl_l 0
#define ctrl_r 0
#define shift_l 0
#define shift_r 0
#define alt_l 0
#define alt_r 0
#define casplock 0

#define shift_l_m 0x2a
#define shift_r_m 0x36
#define alt_l_m 0x38
#define alt_r_m 0xe038
#define alt_r_b 0xe0b8
#define ctrl_l_m 0x1d
#define ctrl_r_m 0xe01d
#define ctrl_r_b 0xe09d
#define casplock_m 0x3a

// extern struct FIFO keybuf;

PUBLIC void wait_keyboard_ready();
PUBLIC void init_keyboard();
void intr0x21_handler(void);

#endif