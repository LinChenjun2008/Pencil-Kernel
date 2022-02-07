;Pencil-Kernel(PKn) loader.asm

%include "boot.inc"
org LoaderBaseAddress
[bits 16]
%include "protect.inc" ;保护模式相关(GDT等)
%include "page.inc"    ;分页机制相关

GDT_BASE: SEGMDESC 0,0,0
SectionCode32:     SEGMDESC 0x00000000,0xfffff,AR_CODE32 ;32位代码段
SectionData32:     SEGMDESC 0x00000000,0xfffff,AR_DATA32 ;32位数据段
SectionVideo:      SEGMDESC 0x000b8000,0x00007,AR_DATA32 ;文字显存
SectionColorVideo: SEGMDESC 0x000a0000,0x0000e,AR_DATA32 ;彩色显存

GDT_SIZE equ ($ - GDT_BASE)
GDT_LIMIT equ GDT_SIZE - 1

times 60 dq 0;预留60个描述符

;段选择子
SelectorCode32     equ (0x0001 << 3 | TI_GDT | RPL0)
SelectorData32     equ (0x0002 << 3 | TI_GDT | RPL0)
SelectorVideo      equ (0x0003 << 3 | TI_GDT | RPL0)
SelectorColorVideo equ (0x0004 << 3 | TI_GDT | RPL0)

;gdt指针
gdt_ptr dw GDT_LIMIT
        dd GDT_BASE

;这里预留16个ards结构的空间
;就是20*16 = 320 = 0x140字节

ards_buf times 0x140 db 0

ards_nr dw 0 ;获取到的ards数量

LoadStartMsg db "Loader";6
MemErrMsg db "Get total memory bytes error!";29
MemSuccessMsg db "Get total memory bytes success!";31
LoadKernelMsg db "Loading Kernel...";17
LoadKernelSuccessMsg db "Load Kernel success!";20
times (LoaderOffsetAddress - ($ - $$)) db 0;将start对齐到文件起始LoaderOffsetAddress处

;loader从此处开始执行
Start:
    ;显示一条信息,证明loader在执行
    mov bp,LoadStartMsg
    mov cx,6;6个字符
    mov ax,0x1301
    mov bx,0x0007;第0页,黑底白字
    mov dx,0x0100;1行,0列
    int 0x10

    GetTotalMemoryBytes:
        ; int 0x15 eax=0xe820 edx=0x534d4150:获取内存布局
        xor ebx,ebx            ;将ebx清零
        mov edx,0x534d4150     ;edx = "SMAP"
        mov di,ards_buf
        .e820_memory_get_loop:
            mov ax,0xe820      ;int 0x15子功能号e820
            mov ecx,20         ;ards结构大小是20字节
            int 0x15
            jc .try_e801       ;cf为1表示有错误,尝试e801模式
            add di,cx          ;使di指向下一个ards结构
            inc word [ards_nr] ;让ards_nr自增1
            cmp ebx,0
            jnz .e820_memory_get_loop
        ;寻找内存容量,就是最大的那一块内存
        mov cx,[ards_nr]
        mov ebx,ards_buf
        xor edx,edx       ;edx先清零
        .find_max_memory: ;冒泡排序
            mov eax,[ebx]
            add eax,[ebx + 8]
            add ebx,20
            cmp edx,eax
            jge .next_ards
            mov edx,eax   ;edx是内存总大小
        .next_ards:
            loop .find_max_memory
            jmp .memory_get_success

        ;int 0x15 ax=0xe801:获取内存布局,最大4GB
        ;返回值:
        ;ax == cx,以KB为单位
        ;bx == dx,以64kb为单位
        .try_e801:
            mov ax,0xe801
            int 0x15
            jc .try_88    ;有错误,尝试0x88功能
                        ;把以KB为单位的低15MB内存的容量转换为以字节为单位
            mov cx,0x400  ;ax和cx是一样的,所以用cx做乘数与ax相乘
            mul cx        ;ax*cx,结果是以字节为单位的内存容量
            shl edx,16
            and eax,0x0000ffff
            or edx,eax
            add edx,0x100000 ;ax只是第15MB,所以总内存要加上1MB
            mov esi,edx      ;先备份edx
            ;将16MB以上内存的容量转为以字节为单位
            xor eax,eax ;eax清零
            mov ax,bx
            mov ecx,0x1000 ;64kb
            mul ecx        ;eax*ecx,积的高32位在edx,低32位在eax
            add esi,eax    ;只能获取4GB内存,所以只要低32位就够了
            mov edx,esi
            jmp .memory_get_success

        ;int 0x15 ah=0x88 :获取内存容量,只能获取64MB以内
        ;返回值:
        ;ax:以MB为单位的内存容量
        .try_88:
            mov ah,0x88
            int 0x15
            jc .get_memory_error ;无法获取内存容量,启动终止
            and eax,0x0000ffff
            mov cx,0x400
            mul cx
            shl edx,16
            or edx,eax
            add edx,0x100000     ;加上1MB,是实际内存容量
            jmp .memory_get_success
            .get_memory_error:
                mov bp,MemErrMsg
                mov cx,0x1d;29个字符
                mov ax,0x1301
                mov bx,0x0084;第0页,黑底红字闪烁
                mov dx,0x0200;2行,0列
                int 0x10
                jmp $        ;在此处死循环,停止启动
        .memory_get_success:
            mov dword [TotalMem_l],edx ;保存内存容量
            mov dword [TotalMem_h],0
            ;显示一条信息,证明内存容量获取成功
            mov bp,MemSuccessMsg
            mov cx,31;31个字符
            mov ax,0x1301
            mov bx,0x0002;第0页,黑底绿字
            mov dx,0x0200;2行,0列
            int 0x10
    LoadKernel:
        ;下一步:加载内核
        ;内核要加载到1MB内存处
        ;因为要在实模式下用int 0x13读取磁盘,
        ;而实模式不能直接访问1MB以上内存.
        ;所以要进入Unreal Mode在实模式下访问1MB以上内存空间
        ;和正常进入保护模式的过程差不多,只是要让段寄存器缓存保护模式的描述符
        ;就能在实模式下访问1MB以上内存空间了
        ;进入Unreal Mode的基本过程:
        ;打开a20地址线 -> 加载GDT -> 向段寄存器加载段描述符 -> 退出保护模式
        ;注:内核目前在前1MB内存里.(详细信息看include/boot.inc)
        mov bp,LoadKernelMsg
        mov cx,17;17个字符
        mov ax,0x1301
        mov bx,0x0007;第0页,黑底白字
        mov dx,0x0300;3行,0列
        int 0x10
        mov eax,KernelStartSec
        mov cx,20
        mov bx,KernelBaseAddress
        call ReadSector
        .kernel_load_success:
            mov bp,LoadKernelSuccessMsg
            mov cx,20;20个字符
            mov ax,0x1301
            mov bx,0x0002;第0页,黑底绿字
            mov dx,0x0400;4行,0列
            int 0x10
    ;设置显示模式
    SetDisplayMode:
        %ifdef __UI_TEXT__
            mov ax,0x4f02
            mov bx,0xc108 ; or 0x4108?
            int 0x10
            mov dword [DisplayMode],0     ;文本模式
            mov dword [Vram_l],0x000b8000 ;显存地址(虚拟地址)
            mov dword [Vram_h],0
            mov dword [ScrnX],80
            mov dword [ScrnY],25
        %endif
        %ifdef __UI_GRAPHIC__
            ;打算尝试三种显示模式
            ;检查VBE是否存在
            mov ax,0x0050
            mov es,ax ;eax左移4位后是0x500
            mov di,0 ;es:di是存放VBE信息的地方,这里是0x500~0x6ff(别忘了基址会被左移4位)
            mov ax,0x4f00
            int 0x10
            cmp ax,0x004f ;如果有VBE,ax会变成0x004f
            jne .without_vbe ;没有vbe(jne: jump if not equals,不等于时跳转)
            ;检查VBE版本号
            mov ax,[es:di + 4] ;这里是VBE版本号
            cmp ax,0x0200
            jb .vbe_version_too_old ;如果ax小于0x0200,跳转到.vbe_version_too_old
            ;设置VBE模式
            .try_Mode1:
                mov cx,VBE_MODE1
                call Checking_VBE_Mode
                jcxz .try_Mode2 ;jcxz: jump if cx is zero?,cx等于0则跳转
                ;VBE模式切换
                mov bx,VBE_MODE1 + 0x4000 ;0x4000:使用线性帧缓存区
                jmp .set_vbe_mode
            .try_Mode2:
                mov cx,VBE_MODE2
                call Checking_VBE_Mode
                jcxz .try_Mode3
                ;VBE模式切换
                mov bx,VBE_MODE2 + 0x4000 ;0x4000:使用线性帧缓存区
                jmp .set_vbe_mode
            .try_Mode3:
                mov cx,VBE_MODE3
                call Checking_VBE_Mode
                jcxz .err
                ;VBE模式切换
                mov bx,VBE_MODE3 + 0x4000 ;0x4000:使用线性帧缓存区
                jmp .set_vbe_mode
            .without_vbe:
            .vbe_version_too_old:
            .err:
                jmp $ ;悬停,暂时先这样
            .set_vbe_mode:
                mov ax,0x4f02
                int 0x10
                mov dword [DisplayMode],1
                mov eax,0
                mov ax,[es:di + 0x12]
                mov dword [ScrnX],eax
                mov ax,[es:di + 0x14]
                mov dword [ScrnY],eax
                mov eax,[es:di + 0x28]
                mov dword [Vram_l],eax
                mov dword [Vram_h],0
                jmp .set_display_mode_next
        %endif
    .set_display_mode_next:
    ;要向内核传递的其他参数
    mov eax,0
    mov byte al,[0x475]
    mov dword [DiskNum],eax
    ;进入32位模式
    SetProtectMode:
        cli ;关闭中断
        ;1. 打开a20地址线
        in al,0x92
        or al,0x02
        out 0x92,al
        ;2. 加载GDT
        lgdt [gdt_ptr]
        ;3. 置cr0寄存器第0位为1
        mov eax,cr0
        or eax,0x00000001
        mov cr0,eax
        ;使用跳转指令清空流水线
        jmp dword SelectorCode32:ProtectModeStart
;16位函数定义部分:

;检查画面模式的函数
; cx:模式号
; es:di :vbe画面信息存放处
; 如果成功,cx不变
; 失败,cx变为0
Checking_VBE_Mode:
    mov ax,0x4f01
    int 0x10
    cmp ax,0x004f
    jne .fail
    ;检查画面模式
    cmp byte [es:di + 0x19],32 ;32位色彩
    jne .fail
    mov ax,[es:di + 0x00]
    and ax,0x0080 ;检查线性帧缓冲是否有效
    jz .fail
    cmp byte [es:di + 0x1b],0x06 ;Direct Color模式
    jne .fail
    ret
    .fail:
        mov cx,0
        ret

;下面的内容来自boot:
;Function: ReadSector
;参数 (Input):
;eax   :扇区号(Sector Number)
;cx    :要读取的扇区数
;es:bx :读取到的数据存放处
;dl    :驱动器号,0x00~0x7f:软盘 0x80~0xff:硬盘
ReadSector:
    ;为物理机准备的版本:
    %ifdef __BOOT_ON_PHY_MACHINE__
        .ReadOneSector:
            ;备份寄存器
            push dword eax
            push bx
            push dx
            push es
            mov word  [DiskAddressPacket + 2],1  ;一次一扇区
            mov word  [DiskAddressPacket + 4],bx ;看ReadSector和DiskAddressPacket的说明
            mov word  [DiskAddressPacket + 6],es ;同上
            mov dword [DiskAddressPacket + 8],eax;同上
            mov dl,DrvNum ;驱动器号
            mov ah,0x42
            mov si,DiskAddressPacket
            int 0x13
            ;恢复寄存器
            pop es
            pop dx
            pop bx
            pop dword eax
            inc eax
            add bx,512 ;下512字节
            loop .ReadOneSector
            ret
    %endif
    ;为虚拟机准备的版本
    %ifdef __BOOT_ON_VIR_MACHINE__
        push bp
        mov bp,sp
        sub esp,2
        mov byte [bp - 2],cl ;要读入的扇区数
        push bx ;备份
        ;将LBA模式转换为CHS模式
        ;LBA扇区号/每磁道扇区数
        ;商 >> 1 = 柱面(磁道)号
        ;商 & 1 = 磁头号
        ;余数 + 1 = 扇区号
        mov bl,SecPerCyc
        div bl    ;被除数:ax,除数:bl,商:al,余数:ah
        inc ah    ;余数 + 1 = 扇区号
        mov cl,ah ;cl是扇区号
        mov dh,al ;暂时用dh保存商
        shr al,1  ;商 >> 1 = 柱面(磁道)号
        mov ch,al ;ch是柱面(磁道)号
        and dh,1  ;商 & 1 = 磁头号
        pop bx    ;恢复bx
        mov dl,DrvNum;驱动器号
        .readloop:
            mov ah,0x02
            mov al, byte [bp - 2]
            int 0x13
            jc .readloop
        add esp,2
        pop bp
        ret
    %endif

[bits 32]

    ProtectModeStart:
        ;进入32位模式
        ;向段寄存器加载段选择子
        mov ax,SelectorData32
        mov ds,ax
        mov es,ax
        mov ss,ax
        mov esp,LoaderStackTop
        mov ax,SelectorVideo
        mov gs,ax
        mov byte [gs:((160*5)+ 0)],'P'
        mov byte [gs:((160*5)+ 2)],'r'
        mov byte [gs:((160*5)+ 4)],'o'
        mov byte [gs:((160*5)+ 6)],'t'
        mov byte [gs:((160*5)+ 8)],'e'
        mov byte [gs:((160*5)+10)],'c'
        mov byte [gs:((160*5)+12)],'t'
    ;开启分页
    SetPagingMode:
        call SetupPage
        ;先保存gdt地址,开启分页后重新加载
        sgdt [gdt_ptr]
        ;将gdt段描述符中的显存段加上0xc0000000
        mov ebx,[gdt_ptr + 2]
        or dword [ebx + 0x18 + 4],0xc0000000;显存段是第3个段描述符,每个描述符8字节,3*8 = 0x18

        add dword [gdt_ptr + 2],0xc0000000
        add esp,0xc0000000
        ;页目录表赋值给cr3
        mov eax,PAGE_DIR_TABLE_POS
        mov cr3,eax

        ;打开cr0的pg位
        mov eax,cr0
        or eax,0x80000000
        mov cr0,eax

        ;重新加载gdt
        lgdt [gdt_ptr]
        mov byte [gs:((160*6)+ 0)],'P'
        mov byte [gs:((160*6)+ 2)],'a'
        mov byte [gs:((160*6)+ 4)],'g'
        mov byte [gs:((160*6)+ 6)],'i'
        mov byte [gs:((160*6)+ 8)],'n'
        mov byte [gs:((160*6)+10)],'g'
        mov byte [gs:((160*6)+12)],' '
        mov byte [gs:((160*6)+14)],'M'
        mov byte [gs:((160*6)+16)],'o'
        mov byte [gs:((160*6)+18)],'d'
        mov byte [gs:((160*6)+20)],'e'
        jmp 0xc0000000+KernelBaseAddress
SetupPage:
    ;1. 先将页目录表所用的内存空间清零
    mov ecx,4096
    mov esi,0
    .clear_pagedir:
        mov byte [PAGE_DIR_TABLE_POS + esi],0
        inc esi
        loop .clear_pagedir
    ;2. 创建页目录项
    .create_pde:
        mov eax,PAGE_DIR_TABLE_POS
        add eax,0x1000 ;eax存第一个页表的位置和属性
        mov ebx,eax    ;为创建页表项做准备

        ;将页目录0和0xc00存入第一个页表的地址
        or eax,PG_US_U | PG_RW_W | PG_P      ;用户属性,所有特权级都可以访问
        mov [PAGE_DIR_TABLE_POS + 0x000],eax ;写入第一个页目录项
        mov [PAGE_DIR_TABLE_POS + 0xc00],eax ;写入最后一个个页目录项

        sub eax,0x1000
        mov [PAGE_DIR_TABLE_POS + 0x1000],eax ;最后一个页目录指向页表本身
    ;3. 创建页表项
    mov ecx,256 ;低端1MB内存里有256页
    mov esi,0
    mov edx,PG_US_U | PG_RW_W | PG_P
    .create_pte:
        mov [ebx + esi * 4],edx ;ebx是第一个页表地址
        add edx,4096
        inc esi
        loop .create_pte
    ;4. 创建内核其他页表的页目录项
    mov eax,PAGE_DIR_TABLE_POS
    add eax,0x2000 ;第二个页表
    or eax,PG_US_U | PG_RW_W | PG_P
    mov ebx,PAGE_DIR_TABLE_POS
    mov ecx,254 ;769~1022的页目录项指向内核
    mov esi,769 ;
    .create_kernel_pde:
        mov [ebx + esi * 4],eax
        inc esi
        add eax,0x1000
        loop .create_kernel_pde
    ret
