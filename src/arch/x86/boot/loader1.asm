%include "boot.inc"
org LoaderBaseAddress
[bits 16]
times (0x500 - ($ - $$)) db 0;对齐到文件起始0x500处
mov bp,loadmsg
mov cx,18;18个字符
mov ax,0x1301
mov bx,0x0007;第0页,黑底白字
mov dx,0x0100;行,列
int 0x10
loadmsg db "this is loader.bin"