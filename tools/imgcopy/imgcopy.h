#ifndef __IMGCOPY_H_
#define __IMGCOPY_H_

#include "stdint.h"

#ifndef _MAX_NAME_LEN_
    #define MAX_NAME_LEN 15
#endif

struct file_desc              //64B
{
    char name[MAX_NAME_LEN];  //15B
    uint8_t f_type;           // 1B
    uint32_t f_size;          // 4B
    uint32_t sectors[11];     //44B
};

struct index_block
{
    uint32_t sectors[128];    //4*128=512B
};

#endif /* __IMGCOPY_H_ */
