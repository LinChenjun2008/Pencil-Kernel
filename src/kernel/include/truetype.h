#ifndef __TRUETYPE_H__
#define __TRUETYPE_H__

#include <stdint.h>

typedef uint32_t Fixed;
typedef uint32_t LONGDATETIME;

typedef struct
{
    uint32_t sfntversion;
    uint16_t numTables;
    uint16_t searchRange;
    uint16_t entrySelector;
    uint16_t rangeShift;
} TTF_FontDirectory;

typedef struct
{
    uint32_t tag;
    uint32_t checkSum;
    uint32_t offset;
    uint32_t length;
} TTF_TableEntry;

typedef struct
{
    uint64_t     Version;
    uint64_t     FontRevision;
    uint32_t     ChecksumAdjustment;
    uint32_t     MagicNumber;
    uint16_t     Flages;
    uint16_t     UnitsPerEm;
    LONGDATETIME Created;
    LONGDATETIME Modified;
    int16_t      xMin;
    int16_t      yMin;
    int16_t      xMax;
    int16_t      yMax;
    uint16_t     macType;
    uint16_t     lowestRecPPEM;
    int16_t      fondDirectionHint;
    int16_t      indexTotocFormat;
    int16_t      glyphDataFormat;
} TTF_HeadTable;


#endif