#ifndef __KERNEL_COMMON_H__
#define __KERNEL_COMMON_H__

#include <std/stdint.h>
#include <std/stddef.h>

#pragma pack(1)
typedef struct
{
    uintptr_t    frame_buffer_base;
    unsigned int horizontal_resolution;
    unsigned int vertical_resolution;
} graph_info_t;

typedef struct
{
    uint64_t map_size;
    void*    buffer;
    uint64_t map_key;
    uint64_t descriptor_size;
    uint32_t descriptor_version;
} memory_map_t;

// RSDP
typedef struct
{
    uint64_t Signature;
    uint8_t  Checksum;
    uint8_t  OemId[6];
    uint8_t  Revision;
    uint32_t RsdtAddress;
    uint32_t Length;
    uint64_t XsdtAddress;
    uint8_t  ExtendedChecksum;
    uint8_t  Reserved[3];
} RSDP_t;

typedef struct
{
    uintptr_t base_address;
    size_t    size;
    uint32_t  flag;
} file_table_t;


typedef struct
{
    uint64_t       magic;               // 5a 42 cb 16 13 d4 a6 2f
    memory_map_t   memory_map;          // 内存描述符
    graph_info_t   graph_info;          // 图形信息
    RSDP_t        *rsdp;
    uint8_t        loaded_files;        // 已加载的文件数
    file_table_t  *loaded_file;         // 已加载的文件
} boot_info_t;

typedef struct
{
    uint8_t    blue;
    uint8_t    green;
    uint8_t    red;
    uint8_t    alpha;
} pixel_t;
#pragma pack()

#endif