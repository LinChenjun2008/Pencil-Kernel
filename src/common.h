#ifndef __KERNEL_COMMON_H__
#define __KERNEL_COMMON_H__

#include <stdint.h>
#include <stddef.h>

typedef struct
{
    uintptr_t frame_buffer_base;
    int       horizontal_resolution;
    int       vertical_resolution;
    // struct
    // {
    //     uint32_t    RedMask;
    //     uint32_t    GreenMask;
    //     uint32_t    BlueMask;
    //     uint32_t    ReservedMask;
    // }PixelBitMask;
} graph_info_t;

typedef struct
{
    uint64_t map_size;
    void*    buffer;
    uint64_t map_key;
    uint64_t descriptor_size;
    uint32_t descriptor_version;
} memory_map_t;

typedef struct
{
    uintptr_t base_address;
    size_t    size;
    uint8_t   flag;
} loaded_file_t;


typedef struct
{
    uint8_t        magic[8];            // 5a 42 cb 16 13 d4 a6 2f
    uint64_t       kernel_base_address; // 内核加载地址
    uint64_t       typeface_base;       // 点阵字体加载地址
    uint64_t       ttf_base;            // TrueType字体加载地址
    memory_map_t   memory_map;          // 内存描述符
    graph_info_t   graph_info;          // 图形信息
    uint8_t        loaded_files;        // 已加载的文件数
    loaded_file_t *loaded_file;         // 已加载的文件
} boot_info_t;

typedef struct
{
    uint8_t    blue;
    uint8_t    green;
    uint8_t    red;
    uint8_t    reserved;
} pixel_t;

#endif