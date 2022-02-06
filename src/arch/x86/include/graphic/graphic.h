#ifndef __GRAPHIC_H__
#define __GRAPHIC_H__

#define rgb(R,G,B) ((uint32_t)(0x00000000 |( R << 16 | G << 8 | B << 0 )))
#define rgba(R,G,B,A) ((uint32_t)(0x00000000 |( A << 24 | R << 16 | G << 8 | B << 0 )))

#endif /* __GRAPHIC_H__ */
