
build/kernel.o:     file format elf32-i386


Disassembly of section .text:

c0007f00 <_start>:
c0007f00:	66 b8 18 00          	mov    ax,0x18
c0007f04:	8e e8                	mov    gs,eax
c0007f06:	65 c6 05 60 04 00 00 	mov    BYTE PTR gs:0x460,0x4b
c0007f0d:	4b 
c0007f0e:	65 c6 05 62 04 00 00 	mov    BYTE PTR gs:0x462,0x65
c0007f15:	65 
c0007f16:	65 c6 05 64 04 00 00 	mov    BYTE PTR gs:0x464,0x72
c0007f1d:	72 
c0007f1e:	65 c6 05 66 04 00 00 	mov    BYTE PTR gs:0x466,0x6e
c0007f25:	6e 
c0007f26:	65 c6 05 68 04 00 00 	mov    BYTE PTR gs:0x468,0x65
c0007f2d:	65 
c0007f2e:	65 c6 05 6a 04 00 00 	mov    BYTE PTR gs:0x46a,0x6c
c0007f35:	6c 
c0007f36:	66 b8 10 00          	mov    ax,0x10
c0007f3a:	8e d8                	mov    ds,eax
c0007f3c:	8e c0                	mov    es,eax
c0007f3e:	8e d0                	mov    ss,eax
c0007f40:	8e e0                	mov    fs,eax
c0007f42:	bc 00 7b 00 c0       	mov    esp,0xc0007b00
c0007f47:	0f 01 15 d0 97 00 c0 	lgdtd  ds:0xc00097d0
c0007f4e:	e9 3e 03 00 00       	jmp    c0008291 <kernel_main>
c0007f53:	e9 fb ff ff ff       	jmp    c0007f53 <_start+0x53>

c0007f58 <k_thread_a>:
c0007f58:	55                   	push   ebp
c0007f59:	89 e5                	mov    ebp,esp
c0007f5b:	56                   	push   esi
c0007f5c:	53                   	push   ebx
c0007f5d:	8b 1d 1c 7c 00 00    	mov    ebx,DWORD PTR ds:0x7c1c
c0007f63:	83 ec 0c             	sub    esp,0xc
c0007f66:	68 1c b9 00 c0       	push   0xc000b91c
c0007f6b:	e8 8c 15 00 00       	call   c00094fc <get_time>
c0007f70:	83 c4 10             	add    esp,0x10
c0007f73:	83 eb 22             	sub    ebx,0x22
c0007f76:	8b 15 1c 7c 00 00    	mov    edx,DWORD PTR ds:0x7c1c
c0007f7c:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c0007f81:	51                   	push   ecx
c0007f82:	8b 35 1c b9 00 c0    	mov    esi,DWORD PTR ds:0xc000b91c
c0007f88:	51                   	push   ecx
c0007f89:	8d 4a f5             	lea    ecx,[edx-0xb]
c0007f8c:	83 ea 29             	sub    edx,0x29
c0007f8f:	51                   	push   ecx
c0007f90:	8d 48 f6             	lea    ecx,[eax-0xa]
c0007f93:	2d d4 00 00 00       	sub    eax,0xd4
c0007f98:	51                   	push   ecx
c0007f99:	52                   	push   edx
c0007f9a:	50                   	push   eax
c0007f9b:	68 ff ff ff 00       	push   0xffffff
c0007fa0:	68 34 b9 00 c0       	push   0xc000b934
c0007fa5:	e8 c6 07 00 00       	call   c0008770 <RectangleFill>
c0007faa:	a1 30 b9 00 c0       	mov    eax,ds:0xc000b930
c0007faf:	83 c4 14             	add    esp,0x14
c0007fb2:	25 00 f0 00 00       	and    eax,0xf000
c0007fb7:	c1 e8 0c             	shr    eax,0xc
c0007fba:	83 c0 30             	add    eax,0x30
c0007fbd:	50                   	push   eax
c0007fbe:	6a 00                	push   0x0
c0007fc0:	53                   	push   ebx
c0007fc1:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c0007fc6:	2d ca 00 00 00       	sub    eax,0xca
c0007fcb:	50                   	push   eax
c0007fcc:	68 34 b9 00 c0       	push   0xc000b934
c0007fd1:	e8 04 09 00 00       	call   c00088da <put_char_graphic>
c0007fd6:	a1 30 b9 00 c0       	mov    eax,ds:0xc000b930
c0007fdb:	83 c4 14             	add    esp,0x14
c0007fde:	25 00 0f 00 00       	and    eax,0xf00
c0007fe3:	c1 e8 08             	shr    eax,0x8
c0007fe6:	83 c0 30             	add    eax,0x30
c0007fe9:	50                   	push   eax
c0007fea:	6a 00                	push   0x0
c0007fec:	53                   	push   ebx
c0007fed:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c0007ff2:	2d c0 00 00 00       	sub    eax,0xc0
c0007ff7:	50                   	push   eax
c0007ff8:	68 34 b9 00 c0       	push   0xc000b934
c0007ffd:	e8 d8 08 00 00       	call   c00088da <put_char_graphic>
c0008002:	a1 30 b9 00 c0       	mov    eax,ds:0xc000b930
c0008007:	83 c4 14             	add    esp,0x14
c000800a:	25 f0 00 00 00       	and    eax,0xf0
c000800f:	c1 e8 04             	shr    eax,0x4
c0008012:	83 c0 30             	add    eax,0x30
c0008015:	50                   	push   eax
c0008016:	6a 00                	push   0x0
c0008018:	53                   	push   ebx
c0008019:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c000801e:	2d b6 00 00 00       	sub    eax,0xb6
c0008023:	50                   	push   eax
c0008024:	68 34 b9 00 c0       	push   0xc000b934
c0008029:	e8 ac 08 00 00       	call   c00088da <put_char_graphic>
c000802e:	a1 30 b9 00 c0       	mov    eax,ds:0xc000b930
c0008033:	83 c4 14             	add    esp,0x14
c0008036:	83 e0 0f             	and    eax,0xf
c0008039:	83 c0 30             	add    eax,0x30
c000803c:	50                   	push   eax
c000803d:	6a 00                	push   0x0
c000803f:	53                   	push   ebx
c0008040:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c0008045:	2d ac 00 00 00       	sub    eax,0xac
c000804a:	50                   	push   eax
c000804b:	68 34 b9 00 c0       	push   0xc000b934
c0008050:	e8 85 08 00 00       	call   c00088da <put_char_graphic>
c0008055:	83 c4 14             	add    esp,0x14
c0008058:	6a 2f                	push   0x2f
c000805a:	6a 00                	push   0x0
c000805c:	53                   	push   ebx
c000805d:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c0008062:	2d a2 00 00 00       	sub    eax,0xa2
c0008067:	50                   	push   eax
c0008068:	68 34 b9 00 c0       	push   0xc000b934
c000806d:	e8 68 08 00 00       	call   c00088da <put_char_graphic>
c0008072:	a1 2c b9 00 c0       	mov    eax,ds:0xc000b92c
c0008077:	83 c4 14             	add    esp,0x14
c000807a:	25 f0 00 00 00       	and    eax,0xf0
c000807f:	c1 e8 04             	shr    eax,0x4
c0008082:	83 c0 30             	add    eax,0x30
c0008085:	50                   	push   eax
c0008086:	6a 00                	push   0x0
c0008088:	53                   	push   ebx
c0008089:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c000808e:	2d 98 00 00 00       	sub    eax,0x98
c0008093:	50                   	push   eax
c0008094:	68 34 b9 00 c0       	push   0xc000b934
c0008099:	e8 3c 08 00 00       	call   c00088da <put_char_graphic>
c000809e:	a1 2c b9 00 c0       	mov    eax,ds:0xc000b92c
c00080a3:	83 c4 14             	add    esp,0x14
c00080a6:	83 e0 0f             	and    eax,0xf
c00080a9:	83 c0 30             	add    eax,0x30
c00080ac:	50                   	push   eax
c00080ad:	6a 00                	push   0x0
c00080af:	53                   	push   ebx
c00080b0:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c00080b5:	2d 8e 00 00 00       	sub    eax,0x8e
c00080ba:	50                   	push   eax
c00080bb:	68 34 b9 00 c0       	push   0xc000b934
c00080c0:	e8 15 08 00 00       	call   c00088da <put_char_graphic>
c00080c5:	83 c4 14             	add    esp,0x14
c00080c8:	6a 2f                	push   0x2f
c00080ca:	6a 00                	push   0x0
c00080cc:	53                   	push   ebx
c00080cd:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c00080d2:	2d 84 00 00 00       	sub    eax,0x84
c00080d7:	50                   	push   eax
c00080d8:	68 34 b9 00 c0       	push   0xc000b934
c00080dd:	e8 f8 07 00 00       	call   c00088da <put_char_graphic>
c00080e2:	a1 28 b9 00 c0       	mov    eax,ds:0xc000b928
c00080e7:	83 c4 14             	add    esp,0x14
c00080ea:	25 f0 00 00 00       	and    eax,0xf0
c00080ef:	c1 e8 04             	shr    eax,0x4
c00080f2:	83 c0 30             	add    eax,0x30
c00080f5:	50                   	push   eax
c00080f6:	6a 00                	push   0x0
c00080f8:	53                   	push   ebx
c00080f9:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c00080fe:	83 e8 7a             	sub    eax,0x7a
c0008101:	50                   	push   eax
c0008102:	68 34 b9 00 c0       	push   0xc000b934
c0008107:	e8 ce 07 00 00       	call   c00088da <put_char_graphic>
c000810c:	a1 28 b9 00 c0       	mov    eax,ds:0xc000b928
c0008111:	83 c4 14             	add    esp,0x14
c0008114:	83 e0 0f             	and    eax,0xf
c0008117:	83 c0 30             	add    eax,0x30
c000811a:	50                   	push   eax
c000811b:	6a 00                	push   0x0
c000811d:	53                   	push   ebx
c000811e:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c0008123:	83 e8 70             	sub    eax,0x70
c0008126:	50                   	push   eax
c0008127:	68 34 b9 00 c0       	push   0xc000b934
c000812c:	e8 a9 07 00 00       	call   c00088da <put_char_graphic>
c0008131:	83 c4 14             	add    esp,0x14
c0008134:	6a 20                	push   0x20
c0008136:	6a 00                	push   0x0
c0008138:	53                   	push   ebx
c0008139:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c000813e:	83 e8 66             	sub    eax,0x66
c0008141:	50                   	push   eax
c0008142:	68 34 b9 00 c0       	push   0xc000b934
c0008147:	e8 8e 07 00 00       	call   c00088da <put_char_graphic>
c000814c:	a1 24 b9 00 c0       	mov    eax,ds:0xc000b924
c0008151:	83 c4 14             	add    esp,0x14
c0008154:	25 f0 00 00 00       	and    eax,0xf0
c0008159:	c1 e8 04             	shr    eax,0x4
c000815c:	83 c0 30             	add    eax,0x30
c000815f:	50                   	push   eax
c0008160:	6a 00                	push   0x0
c0008162:	53                   	push   ebx
c0008163:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c0008168:	83 e8 5c             	sub    eax,0x5c
c000816b:	50                   	push   eax
c000816c:	68 34 b9 00 c0       	push   0xc000b934
c0008171:	e8 64 07 00 00       	call   c00088da <put_char_graphic>
c0008176:	a1 24 b9 00 c0       	mov    eax,ds:0xc000b924
c000817b:	83 c4 14             	add    esp,0x14
c000817e:	83 e0 0f             	and    eax,0xf
c0008181:	83 c0 30             	add    eax,0x30
c0008184:	50                   	push   eax
c0008185:	6a 00                	push   0x0
c0008187:	53                   	push   ebx
c0008188:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c000818d:	83 e8 52             	sub    eax,0x52
c0008190:	50                   	push   eax
c0008191:	68 34 b9 00 c0       	push   0xc000b934
c0008196:	e8 3f 07 00 00       	call   c00088da <put_char_graphic>
c000819b:	83 c4 14             	add    esp,0x14
c000819e:	6a 3a                	push   0x3a
c00081a0:	6a 00                	push   0x0
c00081a2:	53                   	push   ebx
c00081a3:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c00081a8:	83 e8 48             	sub    eax,0x48
c00081ab:	50                   	push   eax
c00081ac:	68 34 b9 00 c0       	push   0xc000b934
c00081b1:	e8 24 07 00 00       	call   c00088da <put_char_graphic>
c00081b6:	a1 20 b9 00 c0       	mov    eax,ds:0xc000b920
c00081bb:	83 c4 14             	add    esp,0x14
c00081be:	25 f0 00 00 00       	and    eax,0xf0
c00081c3:	c1 e8 04             	shr    eax,0x4
c00081c6:	83 c0 30             	add    eax,0x30
c00081c9:	50                   	push   eax
c00081ca:	6a 00                	push   0x0
c00081cc:	53                   	push   ebx
c00081cd:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c00081d2:	83 e8 3e             	sub    eax,0x3e
c00081d5:	50                   	push   eax
c00081d6:	68 34 b9 00 c0       	push   0xc000b934
c00081db:	e8 fa 06 00 00       	call   c00088da <put_char_graphic>
c00081e0:	a1 20 b9 00 c0       	mov    eax,ds:0xc000b920
c00081e5:	83 c4 14             	add    esp,0x14
c00081e8:	83 e0 0f             	and    eax,0xf
c00081eb:	83 c0 30             	add    eax,0x30
c00081ee:	50                   	push   eax
c00081ef:	6a 00                	push   0x0
c00081f1:	53                   	push   ebx
c00081f2:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c00081f7:	83 e8 34             	sub    eax,0x34
c00081fa:	50                   	push   eax
c00081fb:	68 34 b9 00 c0       	push   0xc000b934
c0008200:	e8 d5 06 00 00       	call   c00088da <put_char_graphic>
c0008205:	83 c4 14             	add    esp,0x14
c0008208:	6a 3a                	push   0x3a
c000820a:	6a 00                	push   0x0
c000820c:	53                   	push   ebx
c000820d:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c0008212:	83 e8 2a             	sub    eax,0x2a
c0008215:	50                   	push   eax
c0008216:	68 34 b9 00 c0       	push   0xc000b934
c000821b:	e8 ba 06 00 00       	call   c00088da <put_char_graphic>
c0008220:	a1 1c b9 00 c0       	mov    eax,ds:0xc000b91c
c0008225:	83 c4 14             	add    esp,0x14
c0008228:	25 f0 00 00 00       	and    eax,0xf0
c000822d:	c1 e8 04             	shr    eax,0x4
c0008230:	83 c0 30             	add    eax,0x30
c0008233:	50                   	push   eax
c0008234:	6a 00                	push   0x0
c0008236:	53                   	push   ebx
c0008237:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c000823c:	83 e8 20             	sub    eax,0x20
c000823f:	50                   	push   eax
c0008240:	68 34 b9 00 c0       	push   0xc000b934
c0008245:	e8 90 06 00 00       	call   c00088da <put_char_graphic>
c000824a:	a1 1c b9 00 c0       	mov    eax,ds:0xc000b91c
c000824f:	83 c4 14             	add    esp,0x14
c0008252:	83 e0 0f             	and    eax,0xf
c0008255:	83 c0 30             	add    eax,0x30
c0008258:	50                   	push   eax
c0008259:	6a 00                	push   0x0
c000825b:	53                   	push   ebx
c000825c:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c0008261:	83 e8 16             	sub    eax,0x16
c0008264:	50                   	push   eax
c0008265:	68 34 b9 00 c0       	push   0xc000b934
c000826a:	e8 6b 06 00 00       	call   c00088da <put_char_graphic>
c000826f:	83 c4 20             	add    esp,0x20
c0008272:	eb 10                	jmp    c0008284 <k_thread_a+0x32c>
c0008274:	83 ec 0c             	sub    esp,0xc
c0008277:	68 1c b9 00 c0       	push   0xc000b91c
c000827c:	e8 7b 12 00 00       	call   c00094fc <get_time>
c0008281:	83 c4 10             	add    esp,0x10
c0008284:	39 35 1c b9 00 c0    	cmp    DWORD PTR ds:0xc000b91c,esi
c000828a:	74 e8                	je     c0008274 <k_thread_a+0x31c>
c000828c:	e9 e5 fc ff ff       	jmp    c0007f76 <k_thread_a+0x1e>

c0008291 <kernel_main>:
c0008291:	55                   	push   ebp
c0008292:	89 e5                	mov    ebp,esp
c0008294:	83 ec 08             	sub    esp,0x8
c0008297:	e8 04 07 00 00       	call   c00089a0 <init_all>
c000829c:	e8 70 09 00 00       	call   c0008c11 <intr_enable>
c00082a1:	83 ec 0c             	sub    esp,0xc
c00082a4:	68 ec b5 00 c0       	push   0xc000b5ec
c00082a9:	e8 62 0e 00 00       	call   c0009110 <put_str>
c00082ae:	c7 04 24 50 00 00 00 	mov    DWORD PTR [esp],0x50
c00082b5:	e8 7a 0e 00 00       	call   c0009134 <put_char>
c00082ba:	c7 04 24 4b 00 00 00 	mov    DWORD PTR [esp],0x4b
c00082c1:	e8 6e 0e 00 00       	call   c0009134 <put_char>
c00082c6:	c7 04 24 6e 00 00 00 	mov    DWORD PTR [esp],0x6e
c00082cd:	e8 62 0e 00 00       	call   c0009134 <put_char>
c00082d2:	c7 04 24 20 00 00 00 	mov    DWORD PTR [esp],0x20
c00082d9:	e8 56 0e 00 00       	call   c0009134 <put_char>
c00082de:	c7 04 24 28 00 00 00 	mov    DWORD PTR [esp],0x28
c00082e5:	e8 4a 0e 00 00       	call   c0009134 <put_char>
c00082ea:	c7 04 24 63 00 00 00 	mov    DWORD PTR [esp],0x63
c00082f1:	e8 3e 0e 00 00       	call   c0009134 <put_char>
c00082f6:	c7 04 24 29 00 00 00 	mov    DWORD PTR [esp],0x29
c00082fd:	e8 32 0e 00 00       	call   c0009134 <put_char>
c0008302:	c7 04 24 20 00 00 00 	mov    DWORD PTR [esp],0x20
c0008309:	e8 26 0e 00 00       	call   c0009134 <put_char>
c000830e:	c7 04 24 4c 00 00 00 	mov    DWORD PTR [esp],0x4c
c0008315:	e8 1a 0e 00 00       	call   c0009134 <put_char>
c000831a:	c7 04 24 69 00 00 00 	mov    DWORD PTR [esp],0x69
c0008321:	e8 0e 0e 00 00       	call   c0009134 <put_char>
c0008326:	c7 04 24 6e 00 00 00 	mov    DWORD PTR [esp],0x6e
c000832d:	e8 02 0e 00 00       	call   c0009134 <put_char>
c0008332:	c7 04 24 43 00 00 00 	mov    DWORD PTR [esp],0x43
c0008339:	e8 f6 0d 00 00       	call   c0009134 <put_char>
c000833e:	c7 04 24 68 00 00 00 	mov    DWORD PTR [esp],0x68
c0008345:	e8 ea 0d 00 00       	call   c0009134 <put_char>
c000834a:	c7 04 24 65 00 00 00 	mov    DWORD PTR [esp],0x65
c0008351:	e8 de 0d 00 00       	call   c0009134 <put_char>
c0008356:	c7 04 24 6e 00 00 00 	mov    DWORD PTR [esp],0x6e
c000835d:	e8 d2 0d 00 00       	call   c0009134 <put_char>
c0008362:	c7 04 24 6a 00 00 00 	mov    DWORD PTR [esp],0x6a
c0008369:	e8 c6 0d 00 00       	call   c0009134 <put_char>
c000836e:	c7 04 24 75 00 00 00 	mov    DWORD PTR [esp],0x75
c0008375:	e8 ba 0d 00 00       	call   c0009134 <put_char>
c000837a:	c7 04 24 6e 00 00 00 	mov    DWORD PTR [esp],0x6e
c0008381:	e8 ae 0d 00 00       	call   c0009134 <put_char>
c0008386:	c7 04 24 50 00 00 00 	mov    DWORD PTR [esp],0x50
c000838d:	68 ff ff ff 00       	push   0xffffff
c0008392:	6a 14                	push   0x14
c0008394:	6a 14                	push   0x14
c0008396:	68 34 b9 00 c0       	push   0xc000b934
c000839b:	e8 3a 05 00 00       	call   c00088da <put_char_graphic>
c00083a0:	83 c4 14             	add    esp,0x14
c00083a3:	6a 4b                	push   0x4b
c00083a5:	68 ff ff ff 00       	push   0xffffff
c00083aa:	6a 14                	push   0x14
c00083ac:	6a 1e                	push   0x1e
c00083ae:	68 34 b9 00 c0       	push   0xc000b934
c00083b3:	e8 22 05 00 00       	call   c00088da <put_char_graphic>
c00083b8:	83 c4 14             	add    esp,0x14
c00083bb:	6a 6e                	push   0x6e
c00083bd:	68 ff ff ff 00       	push   0xffffff
c00083c2:	6a 14                	push   0x14
c00083c4:	6a 28                	push   0x28
c00083c6:	68 34 b9 00 c0       	push   0xc000b934
c00083cb:	e8 0a 05 00 00       	call   c00088da <put_char_graphic>
c00083d0:	83 c4 14             	add    esp,0x14
c00083d3:	6a 20                	push   0x20
c00083d5:	68 ff ff ff 00       	push   0xffffff
c00083da:	6a 14                	push   0x14
c00083dc:	6a 32                	push   0x32
c00083de:	68 34 b9 00 c0       	push   0xc000b934
c00083e3:	e8 f2 04 00 00       	call   c00088da <put_char_graphic>
c00083e8:	83 c4 14             	add    esp,0x14
c00083eb:	6a 28                	push   0x28
c00083ed:	68 ff ff ff 00       	push   0xffffff
c00083f2:	6a 14                	push   0x14
c00083f4:	6a 3c                	push   0x3c
c00083f6:	68 34 b9 00 c0       	push   0xc000b934
c00083fb:	e8 da 04 00 00       	call   c00088da <put_char_graphic>
c0008400:	83 c4 14             	add    esp,0x14
c0008403:	6a 63                	push   0x63
c0008405:	68 ff ff ff 00       	push   0xffffff
c000840a:	6a 14                	push   0x14
c000840c:	6a 46                	push   0x46
c000840e:	68 34 b9 00 c0       	push   0xc000b934
c0008413:	e8 c2 04 00 00       	call   c00088da <put_char_graphic>
c0008418:	83 c4 14             	add    esp,0x14
c000841b:	6a 29                	push   0x29
c000841d:	68 ff ff ff 00       	push   0xffffff
c0008422:	6a 14                	push   0x14
c0008424:	6a 50                	push   0x50
c0008426:	68 34 b9 00 c0       	push   0xc000b934
c000842b:	e8 aa 04 00 00       	call   c00088da <put_char_graphic>
c0008430:	83 c4 14             	add    esp,0x14
c0008433:	6a 20                	push   0x20
c0008435:	68 ff ff ff 00       	push   0xffffff
c000843a:	6a 14                	push   0x14
c000843c:	6a 5a                	push   0x5a
c000843e:	68 34 b9 00 c0       	push   0xc000b934
c0008443:	e8 92 04 00 00       	call   c00088da <put_char_graphic>
c0008448:	83 c4 14             	add    esp,0x14
c000844b:	6a 4c                	push   0x4c
c000844d:	68 ff ff ff 00       	push   0xffffff
c0008452:	6a 14                	push   0x14
c0008454:	6a 64                	push   0x64
c0008456:	68 34 b9 00 c0       	push   0xc000b934
c000845b:	e8 7a 04 00 00       	call   c00088da <put_char_graphic>
c0008460:	83 c4 14             	add    esp,0x14
c0008463:	6a 69                	push   0x69
c0008465:	68 ff ff ff 00       	push   0xffffff
c000846a:	6a 14                	push   0x14
c000846c:	6a 6e                	push   0x6e
c000846e:	68 34 b9 00 c0       	push   0xc000b934
c0008473:	e8 62 04 00 00       	call   c00088da <put_char_graphic>
c0008478:	83 c4 14             	add    esp,0x14
c000847b:	6a 6e                	push   0x6e
c000847d:	68 ff ff ff 00       	push   0xffffff
c0008482:	6a 14                	push   0x14
c0008484:	6a 78                	push   0x78
c0008486:	68 34 b9 00 c0       	push   0xc000b934
c000848b:	e8 4a 04 00 00       	call   c00088da <put_char_graphic>
c0008490:	83 c4 14             	add    esp,0x14
c0008493:	6a 43                	push   0x43
c0008495:	68 ff ff ff 00       	push   0xffffff
c000849a:	6a 14                	push   0x14
c000849c:	68 82 00 00 00       	push   0x82
c00084a1:	68 34 b9 00 c0       	push   0xc000b934
c00084a6:	e8 2f 04 00 00       	call   c00088da <put_char_graphic>
c00084ab:	83 c4 14             	add    esp,0x14
c00084ae:	6a 68                	push   0x68
c00084b0:	68 ff ff ff 00       	push   0xffffff
c00084b5:	6a 14                	push   0x14
c00084b7:	68 8c 00 00 00       	push   0x8c
c00084bc:	68 34 b9 00 c0       	push   0xc000b934
c00084c1:	e8 14 04 00 00       	call   c00088da <put_char_graphic>
c00084c6:	83 c4 14             	add    esp,0x14
c00084c9:	6a 65                	push   0x65
c00084cb:	68 ff ff ff 00       	push   0xffffff
c00084d0:	6a 14                	push   0x14
c00084d2:	68 96 00 00 00       	push   0x96
c00084d7:	68 34 b9 00 c0       	push   0xc000b934
c00084dc:	e8 f9 03 00 00       	call   c00088da <put_char_graphic>
c00084e1:	83 c4 14             	add    esp,0x14
c00084e4:	6a 6e                	push   0x6e
c00084e6:	68 ff ff ff 00       	push   0xffffff
c00084eb:	6a 14                	push   0x14
c00084ed:	68 a0 00 00 00       	push   0xa0
c00084f2:	68 34 b9 00 c0       	push   0xc000b934
c00084f7:	e8 de 03 00 00       	call   c00088da <put_char_graphic>
c00084fc:	83 c4 14             	add    esp,0x14
c00084ff:	6a 6a                	push   0x6a
c0008501:	68 ff ff ff 00       	push   0xffffff
c0008506:	6a 14                	push   0x14
c0008508:	68 aa 00 00 00       	push   0xaa
c000850d:	68 34 b9 00 c0       	push   0xc000b934
c0008512:	e8 c3 03 00 00       	call   c00088da <put_char_graphic>
c0008517:	83 c4 14             	add    esp,0x14
c000851a:	6a 75                	push   0x75
c000851c:	68 ff ff ff 00       	push   0xffffff
c0008521:	6a 14                	push   0x14
c0008523:	68 b4 00 00 00       	push   0xb4
c0008528:	68 34 b9 00 c0       	push   0xc000b934
c000852d:	e8 a8 03 00 00       	call   c00088da <put_char_graphic>
c0008532:	83 c4 14             	add    esp,0x14
c0008535:	6a 6e                	push   0x6e
c0008537:	68 ff ff ff 00       	push   0xffffff
c000853c:	6a 14                	push   0x14
c000853e:	68 be 00 00 00       	push   0xbe
c0008543:	68 34 b9 00 c0       	push   0xc000b934
c0008548:	e8 8d 03 00 00       	call   c00088da <put_char_graphic>
c000854d:	83 c4 20             	add    esp,0x20
c0008550:	6a 00                	push   0x0
c0008552:	68 58 7f 00 c0       	push   0xc0007f58
c0008557:	6a 1f                	push   0x1f
c0008559:	68 f9 b5 00 c0       	push   0xc000b5f9
c000855e:	e8 53 0f 00 00       	call   c00094b6 <thread_start>
c0008563:	83 c4 10             	add    esp,0x10
c0008566:	eb fe                	jmp    c0008566 <kernel_main+0x2d5>

c0008568 <bitmap_init>:
c0008568:	55                   	push   ebp
c0008569:	89 e5                	mov    ebp,esp
c000856b:	83 ec 0c             	sub    esp,0xc
c000856e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0008571:	ff 30                	push   DWORD PTR [eax]
c0008573:	6a 00                	push   0x0
c0008575:	ff 70 04             	push   DWORD PTR [eax+0x4]
c0008578:	e8 77 0d 00 00       	call   c00092f4 <memset>
c000857d:	83 c4 10             	add    esp,0x10
c0008580:	c9                   	leave  
c0008581:	c3                   	ret    

c0008582 <bitmap_scan_test>:
c0008582:	55                   	push   ebp
c0008583:	89 e5                	mov    ebp,esp
c0008585:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
c0008588:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
c000858b:	5d                   	pop    ebp
c000858c:	8b 52 04             	mov    edx,DWORD PTR [edx+0x4]
c000858f:	89 c8                	mov    eax,ecx
c0008591:	83 e1 07             	and    ecx,0x7
c0008594:	c1 e8 03             	shr    eax,0x3
c0008597:	0f b6 04 02          	movzx  eax,BYTE PTR [edx+eax*1]
c000859b:	ba 01 00 00 00       	mov    edx,0x1
c00085a0:	d3 e2                	shl    edx,cl
c00085a2:	21 d0                	and    eax,edx
c00085a4:	c3                   	ret    

c00085a5 <bitmap_alloc>:
c00085a5:	55                   	push   ebp
c00085a6:	89 e5                	mov    ebp,esp
c00085a8:	57                   	push   edi
c00085a9:	56                   	push   esi
c00085aa:	31 f6                	xor    esi,esi
c00085ac:	53                   	push   ebx
c00085ad:	83 ec 1c             	sub    esp,0x1c
c00085b0:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c00085b3:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
c00085b6:	eb 01                	jmp    c00085b9 <bitmap_alloc+0x14>
c00085b8:	46                   	inc    esi
c00085b9:	80 3c 30 ff          	cmp    BYTE PTR [eax+esi*1],0xff
c00085bd:	75 04                	jne    c00085c3 <bitmap_alloc+0x1e>
c00085bf:	3b 33                	cmp    esi,DWORD PTR [ebx]
c00085c1:	72 f5                	jb     c00085b8 <bitmap_alloc+0x13>
c00085c3:	3b 33                	cmp    esi,DWORD PTR [ebx]
c00085c5:	72 19                	jb     c00085e0 <bitmap_alloc+0x3b>
c00085c7:	68 00 b6 00 c0       	push   0xc000b600
c00085cc:	68 4c b6 00 c0       	push   0xc000b64c
c00085d1:	6a 2e                	push   0x2e
c00085d3:	68 24 b6 00 c0       	push   0xc000b624
c00085d8:	e8 ef 00 00 00       	call   c00086cc <panic_spin>
c00085dd:	83 c4 10             	add    esp,0x10
c00085e0:	8b 13                	mov    edx,DWORD PTR [ebx]
c00085e2:	83 c8 ff             	or     eax,0xffffffff
c00085e5:	39 d6                	cmp    esi,edx
c00085e7:	74 72                	je     c000865b <bitmap_alloc+0xb6>
c00085e9:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
c00085ec:	31 c9                	xor    ecx,ecx
c00085ee:	bf 01 00 00 00       	mov    edi,0x1
c00085f3:	89 75 e4             	mov    DWORD PTR [ebp-0x1c],esi
c00085f6:	89 55 dc             	mov    DWORD PTR [ebp-0x24],edx
c00085f9:	8a 04 30             	mov    al,BYTE PTR [eax+esi*1]
c00085fc:	eb 01                	jmp    c00085ff <bitmap_alloc+0x5a>
c00085fe:	41                   	inc    ecx
c00085ff:	89 fe                	mov    esi,edi
c0008601:	d3 e6                	shl    esi,cl
c0008603:	89 f2                	mov    edx,esi
c0008605:	84 d0                	test   al,dl
c0008607:	75 f5                	jne    c00085fe <bitmap_alloc+0x59>
c0008609:	8b 75 e4             	mov    esi,DWORD PTR [ebp-0x1c]
c000860c:	83 7d 0c 01          	cmp    DWORD PTR [ebp+0xc],0x1
c0008610:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
c0008613:	8d 0c f1             	lea    ecx,[ecx+esi*8]
c0008616:	89 c8                	mov    eax,ecx
c0008618:	74 41                	je     c000865b <bitmap_alloc+0xb6>
c000861a:	8d 3c d5 00 00 00 00 	lea    edi,[edx*8+0x0]
c0008621:	be 01 00 00 00       	mov    esi,0x1
c0008626:	29 cf                	sub    edi,ecx
c0008628:	8d 51 01             	lea    edx,[ecx+0x1]
c000862b:	eb 27                	jmp    c0008654 <bitmap_alloc+0xaf>
c000862d:	50                   	push   eax
c000862e:	46                   	inc    esi
c000862f:	50                   	push   eax
c0008630:	52                   	push   edx
c0008631:	53                   	push   ebx
c0008632:	89 55 e0             	mov    DWORD PTR [ebp-0x20],edx
c0008635:	e8 48 ff ff ff       	call   c0008582 <bitmap_scan_test>
c000863a:	83 c4 10             	add    esp,0x10
c000863d:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
c0008640:	85 c0                	test   eax,eax
c0008642:	74 02                	je     c0008646 <bitmap_alloc+0xa1>
c0008644:	31 f6                	xor    esi,esi
c0008646:	3b 75 0c             	cmp    esi,DWORD PTR [ebp+0xc]
c0008649:	75 07                	jne    c0008652 <bitmap_alloc+0xad>
c000864b:	29 f2                	sub    edx,esi
c000864d:	8d 42 01             	lea    eax,[edx+0x1]
c0008650:	eb 09                	jmp    c000865b <bitmap_alloc+0xb6>
c0008652:	4f                   	dec    edi
c0008653:	42                   	inc    edx
c0008654:	85 ff                	test   edi,edi
c0008656:	75 d5                	jne    c000862d <bitmap_alloc+0x88>
c0008658:	83 c8 ff             	or     eax,0xffffffff
c000865b:	8d 65 f4             	lea    esp,[ebp-0xc]
c000865e:	5b                   	pop    ebx
c000865f:	5e                   	pop    esi
c0008660:	5f                   	pop    edi
c0008661:	5d                   	pop    ebp
c0008662:	c3                   	ret    

c0008663 <bitmap_set>:
c0008663:	55                   	push   ebp
c0008664:	89 e5                	mov    ebp,esp
c0008666:	57                   	push   edi
c0008667:	56                   	push   esi
c0008668:	53                   	push   ebx
c0008669:	83 ec 0c             	sub    esp,0xc
c000866c:	8a 5d 10             	mov    bl,BYTE PTR [ebp+0x10]
c000866f:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
c0008672:	8b 7d 0c             	mov    edi,DWORD PTR [ebp+0xc]
c0008675:	80 fb 01             	cmp    bl,0x1
c0008678:	76 19                	jbe    c0008693 <bitmap_set+0x30>
c000867a:	68 31 b6 00 c0       	push   0xc000b631
c000867f:	68 5c b6 00 c0       	push   0xc000b65c
c0008684:	6a 65                	push   0x65
c0008686:	68 24 b6 00 c0       	push   0xc000b624
c000868b:	e8 3c 00 00 00       	call   c00086cc <panic_spin>
c0008690:	83 c4 10             	add    esp,0x10
c0008693:	89 fa                	mov    edx,edi
c0008695:	89 f9                	mov    ecx,edi
c0008697:	c1 ea 03             	shr    edx,0x3
c000869a:	83 e1 07             	and    ecx,0x7
c000869d:	84 db                	test   bl,bl
c000869f:	74 06                	je     c00086a7 <bitmap_set+0x44>
c00086a1:	fe cb                	dec    bl
c00086a3:	75 1e                	jne    c00086c3 <bitmap_set+0x60>
c00086a5:	eb 10                	jmp    c00086b7 <bitmap_set+0x54>
c00086a7:	03 56 04             	add    edx,DWORD PTR [esi+0x4]
c00086aa:	b8 01 00 00 00       	mov    eax,0x1
c00086af:	d3 e0                	shl    eax,cl
c00086b1:	f7 d0                	not    eax
c00086b3:	20 02                	and    BYTE PTR [edx],al
c00086b5:	eb 0c                	jmp    c00086c3 <bitmap_set+0x60>
c00086b7:	03 56 04             	add    edx,DWORD PTR [esi+0x4]
c00086ba:	b8 01 00 00 00       	mov    eax,0x1
c00086bf:	d3 e0                	shl    eax,cl
c00086c1:	08 02                	or     BYTE PTR [edx],al
c00086c3:	8d 65 f4             	lea    esp,[ebp-0xc]
c00086c6:	5b                   	pop    ebx
c00086c7:	5e                   	pop    esi
c00086c8:	5f                   	pop    edi
c00086c9:	5d                   	pop    ebp
c00086ca:	c3                   	ret    
	...

c00086cc <panic_spin>:
c00086cc:	55                   	push   ebp
c00086cd:	89 e5                	mov    ebp,esp
c00086cf:	83 ec 08             	sub    esp,0x8
c00086d2:	e8 26 05 00 00       	call   c0008bfd <intr_disable>
c00086d7:	83 ec 0c             	sub    esp,0xc
c00086da:	68 67 b6 00 c0       	push   0xc000b667
c00086df:	e8 2c 0a 00 00       	call   c0009110 <put_str>
c00086e4:	c7 04 24 6e b6 00 c0 	mov    DWORD PTR [esp],0xc000b66e
c00086eb:	e8 20 0a 00 00       	call   c0009110 <put_str>
c00086f0:	5a                   	pop    edx
c00086f1:	ff 75 08             	push   DWORD PTR [ebp+0x8]
c00086f4:	e8 17 0a 00 00       	call   c0009110 <put_str>
c00086f9:	c7 04 24 0a 00 00 00 	mov    DWORD PTR [esp],0xa
c0008700:	e8 2f 0a 00 00       	call   c0009134 <put_char>
c0008705:	c7 04 24 74 b6 00 c0 	mov    DWORD PTR [esp],0xc000b674
c000870c:	e8 ff 09 00 00       	call   c0009110 <put_str>
c0008711:	59                   	pop    ecx
c0008712:	ff 75 10             	push   DWORD PTR [ebp+0x10]
c0008715:	e8 f6 09 00 00       	call   c0009110 <put_str>
c000871a:	c7 04 24 0a 00 00 00 	mov    DWORD PTR [esp],0xa
c0008721:	e8 0e 0a 00 00       	call   c0009134 <put_char>
c0008726:	c7 04 24 82 b6 00 c0 	mov    DWORD PTR [esp],0xc000b682
c000872d:	e8 de 09 00 00       	call   c0009110 <put_str>
c0008732:	58                   	pop    eax
c0008733:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
c0008736:	e8 12 0b 00 00       	call   c000924d <put_int>
c000873b:	c7 04 24 0a 00 00 00 	mov    DWORD PTR [esp],0xa
c0008742:	e8 ed 09 00 00       	call   c0009134 <put_char>
c0008747:	c7 04 24 88 b6 00 c0 	mov    DWORD PTR [esp],0xc000b688
c000874e:	e8 bd 09 00 00       	call   c0009110 <put_str>
c0008753:	58                   	pop    eax
c0008754:	ff 75 14             	push   DWORD PTR [ebp+0x14]
c0008757:	e8 b4 09 00 00       	call   c0009110 <put_str>
c000875c:	c7 04 24 0a 00 00 00 	mov    DWORD PTR [esp],0xa
c0008763:	e8 cc 09 00 00       	call   c0009134 <put_char>
c0008768:	83 c4 10             	add    esp,0x10
c000876b:	eb fe                	jmp    c000876b <panic_spin+0x9f>
c000876d:	00 00                	add    BYTE PTR [eax],al
	...

c0008770 <RectangleFill>:
c0008770:	55                   	push   ebp
c0008771:	89 e5                	mov    ebp,esp
c0008773:	57                   	push   edi
c0008774:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
c0008777:	56                   	push   esi
c0008778:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
c000877b:	53                   	push   ebx
c000877c:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c000877f:	83 3d 0c 7c 00 00 01 	cmp    DWORD PTR ds:0x7c0c,0x1
c0008786:	75 30                	jne    c00087b8 <RectangleFill+0x48>
c0008788:	89 ca                	mov    edx,ecx
c000878a:	81 e2 00 00 00 ff    	and    edx,0xff000000
c0008790:	81 fa 00 00 00 ff    	cmp    edx,0xff000000
c0008796:	75 16                	jne    c00087ae <RectangleFill+0x3e>
c0008798:	eb 1e                	jmp    c00087b8 <RectangleFill+0x48>
c000879a:	8b 7b 04             	mov    edi,DWORD PTR [ebx+0x4]
c000879d:	8b 33                	mov    esi,DWORD PTR [ebx]
c000879f:	0f af f8             	imul   edi,eax
c00087a2:	01 d7                	add    edi,edx
c00087a4:	42                   	inc    edx
c00087a5:	89 0c be             	mov    DWORD PTR [esi+edi*4],ecx
c00087a8:	3b 55 18             	cmp    edx,DWORD PTR [ebp+0x18]
c00087ab:	7e ed                	jle    c000879a <RectangleFill+0x2a>
c00087ad:	40                   	inc    eax
c00087ae:	3b 45 1c             	cmp    eax,DWORD PTR [ebp+0x1c]
c00087b1:	7f 05                	jg     c00087b8 <RectangleFill+0x48>
c00087b3:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
c00087b6:	eb f0                	jmp    c00087a8 <RectangleFill+0x38>
c00087b8:	5b                   	pop    ebx
c00087b9:	5e                   	pop    esi
c00087ba:	5f                   	pop    edi
c00087bb:	5d                   	pop    ebp
c00087bc:	c3                   	ret    

c00087bd <init_Rectangle>:
c00087bd:	55                   	push   ebp
c00087be:	89 e5                	mov    ebp,esp
c00087c0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c00087c3:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
c00087c6:	89 10                	mov    DWORD PTR [eax],edx
c00087c8:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
c00087cb:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
c00087ce:	8b 55 14             	mov    edx,DWORD PTR [ebp+0x14]
c00087d1:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
c00087d4:	8b 55 18             	mov    edx,DWORD PTR [ebp+0x18]
c00087d7:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
c00087da:	8b 55 1c             	mov    edx,DWORD PTR [ebp+0x1c]
c00087dd:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
c00087e0:	5d                   	pop    ebp
c00087e1:	c3                   	ret    

c00087e2 <init_screen>:
c00087e2:	55                   	push   ebp
c00087e3:	89 e5                	mov    ebp,esp
c00087e5:	53                   	push   ebx
c00087e6:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c00087e9:	83 3d 0c 7c 00 00 01 	cmp    DWORD PTR ds:0x7c0c,0x1
c00087f0:	0f 85 df 00 00 00    	jne    c00088d5 <init_screen+0xf3>
c00087f6:	a1 1c 7c 00 00       	mov    eax,ds:0x7c1c
c00087fb:	8b 15 18 7c 00 00    	mov    edx,DWORD PTR ds:0x7c18
c0008801:	c7 43 0c 00 00 00 00 	mov    DWORD PTR [ebx+0xc],0x0
c0008808:	c7 43 10 00 00 00 00 	mov    DWORD PTR [ebx+0x10],0x0
c000880f:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
c0008812:	89 53 04             	mov    DWORD PTR [ebx+0x4],edx
c0008815:	a1 1c 7c 00 00       	mov    eax,ds:0x7c1c
c000881a:	c7 03 00 00 00 fe    	mov    DWORD PTR [ebx],0xfe000000
c0008820:	83 e8 33             	sub    eax,0x33
c0008823:	50                   	push   eax
c0008824:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c0008829:	48                   	dec    eax
c000882a:	50                   	push   eax
c000882b:	6a 00                	push   0x0
c000882d:	6a 00                	push   0x0
c000882f:	68 84 84 00 00       	push   0x8484
c0008834:	53                   	push   ebx
c0008835:	e8 36 ff ff ff       	call   c0008770 <RectangleFill>
c000883a:	a1 1c 7c 00 00       	mov    eax,ds:0x7c1c
c000883f:	8d 50 ff             	lea    edx,[eax-0x1]
c0008842:	83 e8 33             	sub    eax,0x33
c0008845:	52                   	push   edx
c0008846:	8b 15 18 7c 00 00    	mov    edx,DWORD PTR ds:0x7c18
c000884c:	4a                   	dec    edx
c000884d:	52                   	push   edx
c000884e:	50                   	push   eax
c000884f:	6a 00                	push   0x0
c0008851:	68 c6 c6 c6 00       	push   0xc6c6c6
c0008856:	53                   	push   ebx
c0008857:	e8 14 ff ff ff       	call   c0008770 <RectangleFill>
c000885c:	a1 1c 7c 00 00       	mov    eax,ds:0x7c1c
c0008861:	83 c4 30             	add    esp,0x30
c0008864:	8d 50 f8             	lea    edx,[eax-0x8]
c0008867:	83 e8 26             	sub    eax,0x26
c000886a:	52                   	push   edx
c000886b:	6a 2b                	push   0x2b
c000886d:	50                   	push   eax
c000886e:	6a 0d                	push   0xd
c0008870:	68 84 84 84 00       	push   0x848484
c0008875:	53                   	push   ebx
c0008876:	e8 f5 fe ff ff       	call   c0008770 <RectangleFill>
c000887b:	a1 1c 7c 00 00       	mov    eax,ds:0x7c1c
c0008880:	8d 50 f5             	lea    edx,[eax-0xb]
c0008883:	83 e8 29             	sub    eax,0x29
c0008886:	52                   	push   edx
c0008887:	6a 28                	push   0x28
c0008889:	50                   	push   eax
c000888a:	6a 0a                	push   0xa
c000888c:	68 ff ff ff 00       	push   0xffffff
c0008891:	53                   	push   ebx
c0008892:	e8 d9 fe ff ff       	call   c0008770 <RectangleFill>
c0008897:	a1 1c 7c 00 00       	mov    eax,ds:0x7c1c
c000889c:	83 c4 30             	add    esp,0x30
c000889f:	8d 50 f8             	lea    edx,[eax-0x8]
c00088a2:	83 e8 26             	sub    eax,0x26
c00088a5:	52                   	push   edx
c00088a6:	6a 3a                	push   0x3a
c00088a8:	50                   	push   eax
c00088a9:	6a 35                	push   0x35
c00088ab:	68 84 84 84 00       	push   0x848484
c00088b0:	53                   	push   ebx
c00088b1:	e8 ba fe ff ff       	call   c0008770 <RectangleFill>
c00088b6:	a1 1c 7c 00 00       	mov    eax,ds:0x7c1c
c00088bb:	8d 50 f5             	lea    edx,[eax-0xb]
c00088be:	83 e8 29             	sub    eax,0x29
c00088c1:	52                   	push   edx
c00088c2:	6a 37                	push   0x37
c00088c4:	50                   	push   eax
c00088c5:	6a 32                	push   0x32
c00088c7:	68 ff ff ff 00       	push   0xffffff
c00088cc:	53                   	push   ebx
c00088cd:	e8 9e fe ff ff       	call   c0008770 <RectangleFill>
c00088d2:	83 c4 30             	add    esp,0x30
c00088d5:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
c00088d8:	c9                   	leave  
c00088d9:	c3                   	ret    

c00088da <put_char_graphic>:
c00088da:	55                   	push   ebp
c00088db:	89 e5                	mov    ebp,esp
c00088dd:	57                   	push   edi
c00088de:	56                   	push   esi
c00088df:	53                   	push   ebx
c00088e0:	31 db                	xor    ebx,ebx
c00088e2:	83 ec 08             	sub    esp,0x8
c00088e5:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
c00088e8:	0f be 55 18          	movsx  edx,BYTE PTR [ebp+0x18]
c00088ec:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
c00088ef:	8b 3e                	mov    edi,DWORD PTR [esi]
c00088f1:	c1 e2 04             	shl    edx,0x4
c00088f4:	81 c2 d8 97 00 c0    	add    edx,0xc00097d8
c00088fa:	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
c00088fd:	89 75 ec             	mov    DWORD PTR [ebp-0x14],esi
c0008900:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
c0008903:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
c0008906:	8b 75 f0             	mov    esi,DWORD PTR [ebp-0x10]
c0008909:	01 da                	add    edx,ebx
c000890b:	0f af 51 04          	imul   edx,DWORD PTR [ecx+0x4]
c000890f:	0f be 0c 1e          	movsx  ecx,BYTE PTR [esi+ebx*1]
c0008913:	03 55 0c             	add    edx,DWORD PTR [ebp+0xc]
c0008916:	f6 c1 80             	test   cl,0x80
c0008919:	8d 14 97             	lea    edx,[edi+edx*4]
c000891c:	74 02                	je     c0008920 <put_char_graphic+0x46>
c000891e:	89 02                	mov    DWORD PTR [edx],eax
c0008920:	f6 c1 40             	test   cl,0x40
c0008923:	74 03                	je     c0008928 <put_char_graphic+0x4e>
c0008925:	89 42 04             	mov    DWORD PTR [edx+0x4],eax
c0008928:	f6 c1 20             	test   cl,0x20
c000892b:	74 03                	je     c0008930 <put_char_graphic+0x56>
c000892d:	89 42 08             	mov    DWORD PTR [edx+0x8],eax
c0008930:	f6 c1 10             	test   cl,0x10
c0008933:	74 03                	je     c0008938 <put_char_graphic+0x5e>
c0008935:	89 42 0c             	mov    DWORD PTR [edx+0xc],eax
c0008938:	f6 c1 08             	test   cl,0x8
c000893b:	74 03                	je     c0008940 <put_char_graphic+0x66>
c000893d:	89 42 10             	mov    DWORD PTR [edx+0x10],eax
c0008940:	f6 c1 04             	test   cl,0x4
c0008943:	74 03                	je     c0008948 <put_char_graphic+0x6e>
c0008945:	89 42 14             	mov    DWORD PTR [edx+0x14],eax
c0008948:	f6 c1 02             	test   cl,0x2
c000894b:	74 03                	je     c0008950 <put_char_graphic+0x76>
c000894d:	89 42 18             	mov    DWORD PTR [edx+0x18],eax
c0008950:	80 e1 01             	and    cl,0x1
c0008953:	74 03                	je     c0008958 <put_char_graphic+0x7e>
c0008955:	89 42 1c             	mov    DWORD PTR [edx+0x1c],eax
c0008958:	43                   	inc    ebx
c0008959:	83 fb 10             	cmp    ebx,0x10
c000895c:	75 a2                	jne    c0008900 <put_char_graphic+0x26>
c000895e:	58                   	pop    eax
c000895f:	5a                   	pop    edx
c0008960:	5b                   	pop    ebx
c0008961:	5e                   	pop    esi
c0008962:	5f                   	pop    edi
c0008963:	5d                   	pop    ebp
c0008964:	c3                   	ret    

c0008965 <put_str_graphic>:
c0008965:	55                   	push   ebp
c0008966:	89 e5                	mov    ebp,esp
c0008968:	57                   	push   edi
c0008969:	8b 7d 14             	mov    edi,DWORD PTR [ebp+0x14]
c000896c:	56                   	push   esi
c000896d:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
c0008970:	53                   	push   ebx
c0008971:	8b 5d 18             	mov    ebx,DWORD PTR [ebp+0x18]
c0008974:	eb 17                	jmp    c000898d <put_str_graphic+0x28>
c0008976:	0f be c0             	movsx  eax,al
c0008979:	50                   	push   eax
c000897a:	57                   	push   edi
c000897b:	ff 75 10             	push   DWORD PTR [ebp+0x10]
c000897e:	56                   	push   esi
c000897f:	83 c6 0a             	add    esi,0xa
c0008982:	ff 75 08             	push   DWORD PTR [ebp+0x8]
c0008985:	e8 50 ff ff ff       	call   c00088da <put_char_graphic>
c000898a:	83 c4 14             	add    esp,0x14
c000898d:	43                   	inc    ebx
c000898e:	8a 43 ff             	mov    al,BYTE PTR [ebx-0x1]
c0008991:	84 c0                	test   al,al
c0008993:	75 e1                	jne    c0008976 <put_str_graphic+0x11>
c0008995:	8d 65 f4             	lea    esp,[ebp-0xc]
c0008998:	5b                   	pop    ebx
c0008999:	5e                   	pop    esi
c000899a:	5f                   	pop    edi
c000899b:	5d                   	pop    ebp
c000899c:	c3                   	ret    
c000899d:	00 00                	add    BYTE PTR [eax],al
	...

c00089a0 <init_all>:
c00089a0:	55                   	push   ebp
c00089a1:	89 e5                	mov    ebp,esp
c00089a3:	83 ec 08             	sub    esp,0x8
c00089a6:	e8 10 02 00 00       	call   c0008bbb <init_idt>
c00089ab:	e8 f8 0b 00 00       	call   c00095a8 <init_pit>
c00089b0:	e8 a3 05 00 00       	call   c0008f58 <init_memory>
c00089b5:	83 ec 0c             	sub    esp,0xc
c00089b8:	68 34 b9 00 c0       	push   0xc000b934
c00089bd:	e8 20 fe ff ff       	call   c00087e2 <init_screen>
c00089c2:	83 c4 10             	add    esp,0x10
c00089c5:	c9                   	leave  
c00089c6:	c3                   	ret    
	...

c00089d0 <asm_intr0x20_handler>:
c00089d0:	06                   	push   es
c00089d1:	1e                   	push   ds
c00089d2:	60                   	pusha  
c00089d3:	89 e0                	mov    eax,esp
c00089d5:	50                   	push   eax
c00089d6:	66 8c d0             	mov    ax,ss
c00089d9:	8e d8                	mov    ds,eax
c00089db:	8e c0                	mov    es,eax
c00089dd:	e8 de 0b 00 00       	call   c00095c0 <intr0x20_handler>
c00089e2:	58                   	pop    eax
c00089e3:	61                   	popa   
c00089e4:	1f                   	pop    ds
c00089e5:	07                   	pop    es
c00089e6:	cf                   	iret   
	...

c00089e8 <init_pic>:
c00089e8:	55                   	push   ebp
c00089e9:	ba 21 00 00 00       	mov    edx,0x21
c00089ee:	89 e5                	mov    ebp,esp
c00089f0:	b8 ff 00 00 00       	mov    eax,0xff
c00089f5:	ee                   	out    dx,al
c00089f6:	b2 a1                	mov    dl,0xa1
c00089f8:	ee                   	out    dx,al
c00089f9:	b2 20                	mov    dl,0x20
c00089fb:	b0 11                	mov    al,0x11
c00089fd:	ee                   	out    dx,al
c00089fe:	b2 21                	mov    dl,0x21
c0008a00:	b0 20                	mov    al,0x20
c0008a02:	ee                   	out    dx,al
c0008a03:	b0 04                	mov    al,0x4
c0008a05:	ee                   	out    dx,al
c0008a06:	b0 01                	mov    al,0x1
c0008a08:	ee                   	out    dx,al
c0008a09:	b2 a0                	mov    dl,0xa0
c0008a0b:	b0 11                	mov    al,0x11
c0008a0d:	ee                   	out    dx,al
c0008a0e:	b2 a1                	mov    dl,0xa1
c0008a10:	b0 28                	mov    al,0x28
c0008a12:	ee                   	out    dx,al
c0008a13:	b0 02                	mov    al,0x2
c0008a15:	ee                   	out    dx,al
c0008a16:	b0 01                	mov    al,0x1
c0008a18:	ee                   	out    dx,al
c0008a19:	b2 21                	mov    dl,0x21
c0008a1b:	b0 fe                	mov    al,0xfe
c0008a1d:	ee                   	out    dx,al
c0008a1e:	b2 a1                	mov    dl,0xa1
c0008a20:	b0 ff                	mov    al,0xff
c0008a22:	ee                   	out    dx,al
c0008a23:	5d                   	pop    ebp
c0008a24:	c3                   	ret    

c0008a25 <idt_desc_init>:
c0008a25:	55                   	push   ebp
c0008a26:	31 c0                	xor    eax,eax
c0008a28:	89 e5                	mov    ebp,esp
c0008a2a:	c7 05 58 a8 00 c0 d0 	mov    DWORD PTR ds:0xc000a858,0xc00089d0
c0008a31:	89 00 c0 
c0008a34:	8b 0c 85 d8 a7 00 c0 	mov    ecx,DWORD PTR [eax*4-0x3fff5828]
c0008a3b:	8d 14 c5 3c ba 00 c0 	lea    edx,[eax*8-0x3fff45c4]
c0008a42:	66 c7 42 02 08 00    	mov    WORD PTR [edx+0x2],0x8
c0008a48:	c6 42 04 00          	mov    BYTE PTR [edx+0x4],0x0
c0008a4c:	c6 42 05 8e          	mov    BYTE PTR [edx+0x5],0x8e
c0008a50:	66 89 0c c5 3c ba 00 	mov    WORD PTR [eax*8-0x3fff45c4],cx
c0008a57:	c0 
c0008a58:	40                   	inc    eax
c0008a59:	c1 e9 10             	shr    ecx,0x10
c0008a5c:	83 f8 2f             	cmp    eax,0x2f
c0008a5f:	66 89 4a 06          	mov    WORD PTR [edx+0x6],cx
c0008a63:	75 cf                	jne    c0008a34 <idt_desc_init+0xf>
c0008a65:	5d                   	pop    ebp
c0008a66:	c3                   	ret    

c0008a67 <set_gatedesc>:
c0008a67:	55                   	push   ebp
c0008a68:	89 e5                	mov    ebp,esp
c0008a6a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0008a6d:	53                   	push   ebx
c0008a6e:	8b 4d 14             	mov    ecx,DWORD PTR [ebp+0x14]
c0008a71:	8b 5d 10             	mov    ebx,DWORD PTR [ebp+0x10]
c0008a74:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
c0008a77:	88 48 05             	mov    BYTE PTR [eax+0x5],cl
c0008a7a:	66 89 58 02          	mov    WORD PTR [eax+0x2],bx
c0008a7e:	89 cb                	mov    ebx,ecx
c0008a80:	66 89 10             	mov    WORD PTR [eax],dx
c0008a83:	c1 fb 08             	sar    ebx,0x8
c0008a86:	c1 ea 10             	shr    edx,0x10
c0008a89:	88 58 04             	mov    BYTE PTR [eax+0x4],bl
c0008a8c:	66 89 50 06          	mov    WORD PTR [eax+0x6],dx
c0008a90:	5b                   	pop    ebx
c0008a91:	5d                   	pop    ebp
c0008a92:	c3                   	ret    

c0008a93 <general_intr_handler>:
c0008a93:	55                   	push   ebp
c0008a94:	b8 20 00 00 00       	mov    eax,0x20
c0008a99:	89 e5                	mov    ebp,esp
c0008a9b:	89 c2                	mov    edx,eax
c0008a9d:	56                   	push   esi
c0008a9e:	53                   	push   ebx
c0008a9f:	8a 5d 08             	mov    bl,BYTE PTR [ebp+0x8]
c0008aa2:	ee                   	out    dx,al
c0008aa3:	b2 a0                	mov    dl,0xa0
c0008aa5:	ee                   	out    dx,al
c0008aa6:	83 ec 0c             	sub    esp,0xc
c0008aa9:	0f b6 f3             	movzx  esi,bl
c0008aac:	68 94 b6 00 c0       	push   0xc000b694
c0008ab1:	e8 5a 06 00 00       	call   c0009110 <put_str>
c0008ab6:	89 34 24             	mov    DWORD PTR [esp],esi
c0008ab9:	e8 8f 07 00 00       	call   c000924d <put_int>
c0008abe:	c7 04 24 20 00 00 00 	mov    DWORD PTR [esp],0x20
c0008ac5:	e8 6a 06 00 00       	call   c0009134 <put_char>
c0008aca:	83 c4 10             	add    esp,0x10
c0008acd:	80 fb 14             	cmp    bl,0x14
c0008ad0:	77 15                	ja     c0008ae7 <general_intr_handler+0x54>
c0008ad2:	8b 04 b5 80 b9 00 c0 	mov    eax,DWORD PTR [esi*4-0x3fff4680]
c0008ad9:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
c0008adc:	8d 65 f8             	lea    esp,[ebp-0x8]
c0008adf:	5b                   	pop    ebx
c0008ae0:	5e                   	pop    esi
c0008ae1:	5d                   	pop    ebp
c0008ae2:	e9 29 06 00 00       	jmp    c0009110 <put_str>
c0008ae7:	8d 65 f8             	lea    esp,[ebp-0x8]
c0008aea:	5b                   	pop    ebx
c0008aeb:	5e                   	pop    esi
c0008aec:	5d                   	pop    ebp
c0008aed:	c3                   	ret    

c0008aee <exception_init>:
c0008aee:	55                   	push   ebp
c0008aef:	89 e5                	mov    ebp,esp
c0008af1:	c7 05 80 b9 00 c0 9a 	mov    DWORD PTR ds:0xc000b980,0xc000b69a
c0008af8:	b6 00 c0 
c0008afb:	c7 05 84 b9 00 c0 ab 	mov    DWORD PTR ds:0xc000b984,0xc000b6ab
c0008b02:	b6 00 c0 
c0008b05:	c7 05 88 b9 00 c0 bf 	mov    DWORD PTR ds:0xc000b988,0xc000b6bf
c0008b0c:	b6 00 c0 
c0008b0f:	c7 05 8c b9 00 c0 cd 	mov    DWORD PTR ds:0xc000b98c,0xc000b6cd
c0008b16:	b6 00 c0 
c0008b19:	c7 05 90 b9 00 c0 e6 	mov    DWORD PTR ds:0xc000b990,0xc000b6e6
c0008b20:	b6 00 c0 
c0008b23:	c7 05 94 b9 00 c0 fd 	mov    DWORD PTR ds:0xc000b994,0xc000b6fd
c0008b2a:	b6 00 c0 
c0008b2d:	c7 05 98 b9 00 c0 20 	mov    DWORD PTR ds:0xc000b998,0xc000b720
c0008b34:	b7 00 c0 
c0008b37:	c7 05 9c b9 00 c0 3d 	mov    DWORD PTR ds:0xc000b99c,0xc000b73d
c0008b3e:	b7 00 c0 
c0008b41:	c7 05 a0 b9 00 c0 60 	mov    DWORD PTR ds:0xc000b9a0,0xc000b760
c0008b48:	b7 00 c0 
c0008b4b:	c7 05 a4 b9 00 c0 7b 	mov    DWORD PTR ds:0xc000b9a4,0xc000b77b
c0008b52:	b7 00 c0 
c0008b55:	c7 05 a8 b9 00 c0 97 	mov    DWORD PTR ds:0xc000b9a8,0xc000b797
c0008b5c:	b7 00 c0 
c0008b5f:	c7 05 ac b9 00 c0 b1 	mov    DWORD PTR ds:0xc000b9ac,0xc000b7b1
c0008b66:	b7 00 c0 
c0008b69:	c7 05 b0 b9 00 c0 c9 	mov    DWORD PTR ds:0xc000b9b0,0xc000b7c9
c0008b70:	b7 00 c0 
c0008b73:	c7 05 b4 b9 00 c0 e3 	mov    DWORD PTR ds:0xc000b9b4,0xc000b7e3
c0008b7a:	b7 00 c0 
c0008b7d:	c7 05 b8 b9 00 c0 04 	mov    DWORD PTR ds:0xc000b9b8,0xc000b804
c0008b84:	b8 00 c0 
c0008b87:	c7 05 bc b9 00 c0 1d 	mov    DWORD PTR ds:0xc000b9bc,0xc000b81d
c0008b8e:	b8 00 c0 
c0008b91:	c7 05 c0 b9 00 c0 26 	mov    DWORD PTR ds:0xc000b9c0,0xc000b826
c0008b98:	b8 00 c0 
c0008b9b:	c7 05 c4 b9 00 c0 47 	mov    DWORD PTR ds:0xc000b9c4,0xc000b847
c0008ba2:	b8 00 c0 
c0008ba5:	c7 05 c8 b9 00 c0 65 	mov    DWORD PTR ds:0xc000b9c8,0xc000b865
c0008bac:	b8 00 c0 
c0008baf:	c7 05 cc b9 00 c0 81 	mov    DWORD PTR ds:0xc000b9cc,0xc000b881
c0008bb6:	b8 00 c0 
c0008bb9:	5d                   	pop    ebp
c0008bba:	c3                   	ret    

c0008bbb <init_idt>:
c0008bbb:	55                   	push   ebp
c0008bbc:	89 e5                	mov    ebp,esp
c0008bbe:	83 ec 10             	sub    esp,0x10
c0008bc1:	e8 5f fe ff ff       	call   c0008a25 <idt_desc_init>
c0008bc6:	e8 1d fe ff ff       	call   c00089e8 <init_pic>
c0008bcb:	b8 3c ba 00 c0       	mov    eax,0xc000ba3c
c0008bd0:	c1 e0 10             	shl    eax,0x10
c0008bd3:	0d 77 01 00 00       	or     eax,0x177
c0008bd8:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
c0008bdb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
c0008be2:	e8 07 ff ff ff       	call   c0008aee <exception_init>
c0008be7:	0f 01 5d f8          	lidtd  [ebp-0x8]
c0008beb:	c9                   	leave  
c0008bec:	c3                   	ret    

c0008bed <intr_get_status>:
c0008bed:	55                   	push   ebp
c0008bee:	89 e5                	mov    ebp,esp
c0008bf0:	9c                   	pushf  
c0008bf1:	58                   	pop    eax
c0008bf2:	f6 c4 02             	test   ah,0x2
c0008bf5:	0f 95 c0             	setne  al
c0008bf8:	0f b6 c0             	movzx  eax,al
c0008bfb:	5d                   	pop    ebp
c0008bfc:	c3                   	ret    

c0008bfd <intr_disable>:
c0008bfd:	55                   	push   ebp
c0008bfe:	89 e5                	mov    ebp,esp
c0008c00:	e8 e8 ff ff ff       	call   c0008bed <intr_get_status>
c0008c05:	31 d2                	xor    edx,edx
c0008c07:	48                   	dec    eax
c0008c08:	75 03                	jne    c0008c0d <intr_disable+0x10>
c0008c0a:	fa                   	cli    
c0008c0b:	b2 01                	mov    dl,0x1
c0008c0d:	89 d0                	mov    eax,edx
c0008c0f:	5d                   	pop    ebp
c0008c10:	c3                   	ret    

c0008c11 <intr_enable>:
c0008c11:	55                   	push   ebp
c0008c12:	89 e5                	mov    ebp,esp
c0008c14:	e8 d4 ff ff ff       	call   c0008bed <intr_get_status>
c0008c19:	ba 01 00 00 00       	mov    edx,0x1
c0008c1e:	48                   	dec    eax
c0008c1f:	74 03                	je     c0008c24 <intr_enable+0x13>
c0008c21:	fb                   	sti    
c0008c22:	30 d2                	xor    dl,dl
c0008c24:	89 d0                	mov    eax,edx
c0008c26:	5d                   	pop    ebp
c0008c27:	c3                   	ret    

c0008c28 <intr_set_status>:
c0008c28:	55                   	push   ebp
c0008c29:	89 e5                	mov    ebp,esp
c0008c2b:	83 7d 08 01          	cmp    DWORD PTR [ebp+0x8],0x1
c0008c2f:	75 06                	jne    c0008c37 <intr_set_status+0xf>
c0008c31:	5d                   	pop    ebp
c0008c32:	e9 da ff ff ff       	jmp    c0008c11 <intr_enable>
c0008c37:	5d                   	pop    ebp
c0008c38:	e9 c0 ff ff ff       	jmp    c0008bfd <intr_disable>
c0008c3d:	00 00                	add    BYTE PTR [eax],al
	...

c0008c40 <list_init>:
c0008c40:	55                   	push   ebp
c0008c41:	89 e5                	mov    ebp,esp
c0008c43:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0008c46:	8d 50 08             	lea    edx,[eax+0x8]
c0008c49:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
c0008c4f:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
c0008c52:	89 40 08             	mov    DWORD PTR [eax+0x8],eax
c0008c55:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [eax+0xc],0x0
c0008c5c:	5d                   	pop    ebp
c0008c5d:	c3                   	ret    

c0008c5e <list_in>:
c0008c5e:	55                   	push   ebp
c0008c5f:	89 e5                	mov    ebp,esp
c0008c61:	56                   	push   esi
c0008c62:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
c0008c65:	53                   	push   ebx
c0008c66:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
c0008c69:	e8 8f ff ff ff       	call   c0008bfd <intr_disable>
c0008c6e:	8b 13                	mov    edx,DWORD PTR [ebx]
c0008c70:	89 5e 04             	mov    DWORD PTR [esi+0x4],ebx
c0008c73:	89 16                	mov    DWORD PTR [esi],edx
c0008c75:	8b 13                	mov    edx,DWORD PTR [ebx]
c0008c77:	89 33                	mov    DWORD PTR [ebx],esi
c0008c79:	89 72 04             	mov    DWORD PTR [edx+0x4],esi
c0008c7c:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
c0008c7f:	5b                   	pop    ebx
c0008c80:	5e                   	pop    esi
c0008c81:	5d                   	pop    ebp
c0008c82:	e9 a1 ff ff ff       	jmp    c0008c28 <intr_set_status>

c0008c87 <list_push>:
c0008c87:	55                   	push   ebp
c0008c88:	89 e5                	mov    ebp,esp
c0008c8a:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
c0008c8d:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
c0008c90:	8b 52 04             	mov    edx,DWORD PTR [edx+0x4]
c0008c93:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
c0008c96:	89 55 0c             	mov    DWORD PTR [ebp+0xc],edx
c0008c99:	5d                   	pop    ebp
c0008c9a:	e9 bf ff ff ff       	jmp    c0008c5e <list_in>

c0008c9f <list_append>:
c0008c9f:	55                   	push   ebp
c0008ca0:	89 e5                	mov    ebp,esp
c0008ca2:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
c0008ca5:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
c0008ca8:	8b 52 08             	mov    edx,DWORD PTR [edx+0x8]
c0008cab:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
c0008cae:	89 55 0c             	mov    DWORD PTR [ebp+0xc],edx
c0008cb1:	5d                   	pop    ebp
c0008cb2:	e9 a7 ff ff ff       	jmp    c0008c5e <list_in>

c0008cb7 <list_remove>:
c0008cb7:	55                   	push   ebp
c0008cb8:	89 e5                	mov    ebp,esp
c0008cba:	53                   	push   ebx
c0008cbb:	50                   	push   eax
c0008cbc:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c0008cbf:	e8 39 ff ff ff       	call   c0008bfd <intr_disable>
c0008cc4:	8b 13                	mov    edx,DWORD PTR [ebx]
c0008cc6:	85 d2                	test   edx,edx
c0008cc8:	74 1c                	je     c0008ce6 <list_remove+0x2f>
c0008cca:	8b 4b 04             	mov    ecx,DWORD PTR [ebx+0x4]
c0008ccd:	85 c9                	test   ecx,ecx
c0008ccf:	74 15                	je     c0008ce6 <list_remove+0x2f>
c0008cd1:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
c0008cd4:	8b 4b 04             	mov    ecx,DWORD PTR [ebx+0x4]
c0008cd7:	c7 43 04 00 00 00 00 	mov    DWORD PTR [ebx+0x4],0x0
c0008cde:	89 11                	mov    DWORD PTR [ecx],edx
c0008ce0:	c7 03 00 00 00 00    	mov    DWORD PTR [ebx],0x0
c0008ce6:	83 ec 0c             	sub    esp,0xc
c0008ce9:	50                   	push   eax
c0008cea:	e8 39 ff ff ff       	call   c0008c28 <intr_set_status>
c0008cef:	89 d8                	mov    eax,ebx
c0008cf1:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
c0008cf4:	c9                   	leave  
c0008cf5:	c3                   	ret    

c0008cf6 <list_pop>:
c0008cf6:	55                   	push   ebp
c0008cf7:	89 e5                	mov    ebp,esp
c0008cf9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0008cfc:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
c0008cff:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
c0008d02:	5d                   	pop    ebp
c0008d03:	e9 af ff ff ff       	jmp    c0008cb7 <list_remove>

c0008d08 <list_find>:
c0008d08:	55                   	push   ebp
c0008d09:	89 e5                	mov    ebp,esp
c0008d0b:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
c0008d0e:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
c0008d11:	8b 42 04             	mov    eax,DWORD PTR [edx+0x4]
c0008d14:	83 c2 08             	add    edx,0x8
c0008d17:	eb 07                	jmp    c0008d20 <list_find+0x18>
c0008d19:	39 c8                	cmp    eax,ecx
c0008d1b:	74 0b                	je     c0008d28 <list_find+0x20>
c0008d1d:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
c0008d20:	39 d0                	cmp    eax,edx
c0008d22:	75 f5                	jne    c0008d19 <list_find+0x11>
c0008d24:	31 c0                	xor    eax,eax
c0008d26:	eb 05                	jmp    c0008d2d <list_find+0x25>
c0008d28:	b8 01 00 00 00       	mov    eax,0x1
c0008d2d:	5d                   	pop    ebp
c0008d2e:	c3                   	ret    

c0008d2f <list_traversal>:
c0008d2f:	55                   	push   ebp
c0008d30:	89 e5                	mov    ebp,esp
c0008d32:	57                   	push   edi
c0008d33:	56                   	push   esi
c0008d34:	53                   	push   ebx
c0008d35:	83 ec 0c             	sub    esp,0xc
c0008d38:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
c0008d3b:	8b 7d 10             	mov    edi,DWORD PTR [ebp+0x10]
c0008d3e:	8b 5e 04             	mov    ebx,DWORD PTR [esi+0x4]
c0008d41:	83 c6 08             	add    esi,0x8
c0008d44:	eb 11                	jmp    c0008d57 <list_traversal+0x28>
c0008d46:	52                   	push   edx
c0008d47:	52                   	push   edx
c0008d48:	57                   	push   edi
c0008d49:	53                   	push   ebx
c0008d4a:	ff 55 0c             	call   DWORD PTR [ebp+0xc]
c0008d4d:	83 c4 10             	add    esp,0x10
c0008d50:	85 c0                	test   eax,eax
c0008d52:	75 07                	jne    c0008d5b <list_traversal+0x2c>
c0008d54:	8b 5b 04             	mov    ebx,DWORD PTR [ebx+0x4]
c0008d57:	39 f3                	cmp    ebx,esi
c0008d59:	75 eb                	jne    c0008d46 <list_traversal+0x17>
c0008d5b:	8d 65 f4             	lea    esp,[ebp-0xc]
c0008d5e:	5b                   	pop    ebx
c0008d5f:	5e                   	pop    esi
c0008d60:	5f                   	pop    edi
c0008d61:	5d                   	pop    ebp
c0008d62:	c3                   	ret    

c0008d63 <list_len>:
c0008d63:	55                   	push   ebp
c0008d64:	31 c0                	xor    eax,eax
c0008d66:	89 e5                	mov    ebp,esp
c0008d68:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
c0008d6b:	8b 51 04             	mov    edx,DWORD PTR [ecx+0x4]
c0008d6e:	83 c1 08             	add    ecx,0x8
c0008d71:	eb 04                	jmp    c0008d77 <list_len+0x14>
c0008d73:	8b 52 04             	mov    edx,DWORD PTR [edx+0x4]
c0008d76:	40                   	inc    eax
c0008d77:	39 ca                	cmp    edx,ecx
c0008d79:	75 f8                	jne    c0008d73 <list_len+0x10>
c0008d7b:	5d                   	pop    ebp
c0008d7c:	c3                   	ret    

c0008d7d <list_empty>:
c0008d7d:	55                   	push   ebp
c0008d7e:	89 e5                	mov    ebp,esp
c0008d80:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0008d83:	5d                   	pop    ebp
c0008d84:	8d 50 08             	lea    edx,[eax+0x8]
c0008d87:	39 50 04             	cmp    DWORD PTR [eax+0x4],edx
c0008d8a:	0f 94 c0             	sete   al
c0008d8d:	0f b6 c0             	movzx  eax,al
c0008d90:	c3                   	ret    
c0008d91:	00 00                	add    BYTE PTR [eax],al
	...

c0008d94 <init_memmam>:
c0008d94:	55                   	push   ebp
c0008d95:	89 e5                	mov    ebp,esp
c0008d97:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0008d9a:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
c0008da0:	c7 40 04 00 00 00 00 	mov    DWORD PTR [eax+0x4],0x0
c0008da7:	c7 40 08 00 00 00 00 	mov    DWORD PTR [eax+0x8],0x0
c0008dae:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [eax+0xc],0x0
c0008db5:	5d                   	pop    ebp
c0008db6:	c3                   	ret    

c0008db7 <TotalFreeSize>:
c0008db7:	55                   	push   ebp
c0008db8:	31 d2                	xor    edx,edx
c0008dba:	89 e5                	mov    ebp,esp
c0008dbc:	31 c0                	xor    eax,eax
c0008dbe:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
c0008dc1:	53                   	push   ebx
c0008dc2:	8b 19                	mov    ebx,DWORD PTR [ecx]
c0008dc4:	eb 05                	jmp    c0008dcb <TotalFreeSize+0x14>
c0008dc6:	03 44 d1 14          	add    eax,DWORD PTR [ecx+edx*8+0x14]
c0008dca:	42                   	inc    edx
c0008dcb:	39 da                	cmp    edx,ebx
c0008dcd:	75 f7                	jne    c0008dc6 <TotalFreeSize+0xf>
c0008dcf:	5b                   	pop    ebx
c0008dd0:	5d                   	pop    ebp
c0008dd1:	c3                   	ret    

c0008dd2 <mem_alloc>:
c0008dd2:	55                   	push   ebp
c0008dd3:	89 e5                	mov    ebp,esp
c0008dd5:	57                   	push   edi
c0008dd6:	56                   	push   esi
c0008dd7:	53                   	push   ebx
c0008dd8:	51                   	push   ecx
c0008dd9:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
c0008ddc:	31 c9                	xor    ecx,ecx
c0008dde:	8b 02                	mov    eax,DWORD PTR [edx]
c0008de0:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
c0008de3:	eb 42                	jmp    c0008e27 <mem_alloc+0x55>
c0008de5:	8b 74 ca 14          	mov    esi,DWORD PTR [edx+ecx*8+0x14]
c0008de9:	3b 75 0c             	cmp    esi,DWORD PTR [ebp+0xc]
c0008dec:	72 38                	jb     c0008e26 <mem_alloc+0x54>
c0008dee:	8d 59 02             	lea    ebx,[ecx+0x2]
c0008df1:	8b 7d 0c             	mov    edi,DWORD PTR [ebp+0xc]
c0008df4:	8b 04 da             	mov    eax,DWORD PTR [edx+ebx*8]
c0008df7:	2b 75 0c             	sub    esi,DWORD PTR [ebp+0xc]
c0008dfa:	01 c7                	add    edi,eax
c0008dfc:	85 f6                	test   esi,esi
c0008dfe:	89 3c da             	mov    DWORD PTR [edx+ebx*8],edi
c0008e01:	89 74 da 04          	mov    DWORD PTR [edx+ebx*8+0x4],esi
c0008e05:	75 27                	jne    c0008e2e <mem_alloc+0x5c>
c0008e07:	8b 5d f0             	mov    ebx,DWORD PTR [ebp-0x10]
c0008e0a:	4b                   	dec    ebx
c0008e0b:	89 1a                	mov    DWORD PTR [edx],ebx
c0008e0d:	eb 11                	jmp    c0008e20 <mem_alloc+0x4e>
c0008e0f:	41                   	inc    ecx
c0008e10:	8b 74 ca 10          	mov    esi,DWORD PTR [edx+ecx*8+0x10]
c0008e14:	8b 7c ca 14          	mov    edi,DWORD PTR [edx+ecx*8+0x14]
c0008e18:	89 74 ca 08          	mov    DWORD PTR [edx+ecx*8+0x8],esi
c0008e1c:	89 7c ca 0c          	mov    DWORD PTR [edx+ecx*8+0xc],edi
c0008e20:	39 d9                	cmp    ecx,ebx
c0008e22:	72 eb                	jb     c0008e0f <mem_alloc+0x3d>
c0008e24:	eb 08                	jmp    c0008e2e <mem_alloc+0x5c>
c0008e26:	41                   	inc    ecx
c0008e27:	3b 4d f0             	cmp    ecx,DWORD PTR [ebp-0x10]
c0008e2a:	75 b9                	jne    c0008de5 <mem_alloc+0x13>
c0008e2c:	31 c0                	xor    eax,eax
c0008e2e:	5a                   	pop    edx
c0008e2f:	5b                   	pop    ebx
c0008e30:	5e                   	pop    esi
c0008e31:	5f                   	pop    edi
c0008e32:	5d                   	pop    ebp
c0008e33:	c3                   	ret    

c0008e34 <mem_alloc_page>:
c0008e34:	55                   	push   ebp
c0008e35:	89 e5                	mov    ebp,esp
c0008e37:	c1 65 0c 0c          	shl    DWORD PTR [ebp+0xc],0xc
c0008e3b:	5d                   	pop    ebp
c0008e3c:	e9 91 ff ff ff       	jmp    c0008dd2 <mem_alloc>

c0008e41 <mem_free>:
c0008e41:	55                   	push   ebp
c0008e42:	31 c9                	xor    ecx,ecx
c0008e44:	89 e5                	mov    ebp,esp
c0008e46:	57                   	push   edi
c0008e47:	56                   	push   esi
c0008e48:	53                   	push   ebx
c0008e49:	83 ec 10             	sub    esp,0x10
c0008e4c:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
c0008e4f:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
c0008e52:	8b 75 10             	mov    esi,DWORD PTR [ebp+0x10]
c0008e55:	8b 02                	mov    eax,DWORD PTR [edx]
c0008e57:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
c0008e5a:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
c0008e5d:	eb 07                	jmp    c0008e66 <mem_free+0x25>
c0008e5f:	39 5c ca 10          	cmp    DWORD PTR [edx+ecx*8+0x10],ebx
c0008e63:	77 06                	ja     c0008e6b <mem_free+0x2a>
c0008e65:	41                   	inc    ecx
c0008e66:	3b 4d ec             	cmp    ecx,DWORD PTR [ebp-0x14]
c0008e69:	75 f4                	jne    c0008e5f <mem_free+0x1e>
c0008e6b:	85 c9                	test   ecx,ecx
c0008e6d:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
c0008e70:	74 60                	je     c0008ed2 <mem_free+0x91>
c0008e72:	8d 79 01             	lea    edi,[ecx+0x1]
c0008e75:	8b 44 fa 04          	mov    eax,DWORD PTR [edx+edi*8+0x4]
c0008e79:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
c0008e7c:	03 04 fa             	add    eax,DWORD PTR [edx+edi*8]
c0008e7f:	39 d8                	cmp    eax,ebx
c0008e81:	75 4f                	jne    c0008ed2 <mem_free+0x91>
c0008e83:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
c0008e86:	01 f0                	add    eax,esi
c0008e88:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
c0008e8b:	89 44 fa 04          	mov    DWORD PTR [edx+edi*8+0x4],eax
c0008e8f:	31 c0                	xor    eax,eax
c0008e91:	3b 4d ec             	cmp    ecx,DWORD PTR [ebp-0x14]
c0008e94:	0f 83 a9 00 00 00    	jae    c0008f43 <mem_free+0x102>
c0008e9a:	01 de                	add    esi,ebx
c0008e9c:	8d 59 02             	lea    ebx,[ecx+0x2]
c0008e9f:	39 34 da             	cmp    DWORD PTR [edx+ebx*8],esi
c0008ea2:	0f 85 9b 00 00 00    	jne    c0008f43 <mem_free+0x102>
c0008ea8:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
c0008eab:	03 44 da 04          	add    eax,DWORD PTR [edx+ebx*8+0x4]
c0008eaf:	89 44 fa 04          	mov    DWORD PTR [edx+edi*8+0x4],eax
c0008eb3:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
c0008eb6:	48                   	dec    eax
c0008eb7:	89 02                	mov    DWORD PTR [edx],eax
c0008eb9:	eb 11                	jmp    c0008ecc <mem_free+0x8b>
c0008ebb:	41                   	inc    ecx
c0008ebc:	8b 74 ca 10          	mov    esi,DWORD PTR [edx+ecx*8+0x10]
c0008ec0:	8b 7c ca 14          	mov    edi,DWORD PTR [edx+ecx*8+0x14]
c0008ec4:	89 74 ca 08          	mov    DWORD PTR [edx+ecx*8+0x8],esi
c0008ec8:	89 7c ca 0c          	mov    DWORD PTR [edx+ecx*8+0xc],edi
c0008ecc:	39 c1                	cmp    ecx,eax
c0008ece:	72 eb                	jb     c0008ebb <mem_free+0x7a>
c0008ed0:	eb 1d                	jmp    c0008eef <mem_free+0xae>
c0008ed2:	3b 4d ec             	cmp    ecx,DWORD PTR [ebp-0x14]
c0008ed5:	73 1c                	jae    c0008ef3 <mem_free+0xb2>
c0008ed7:	8d 3c 33             	lea    edi,[ebx+esi*1]
c0008eda:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
c0008edd:	8d 79 02             	lea    edi,[ecx+0x2]
c0008ee0:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
c0008ee3:	39 04 fa             	cmp    DWORD PTR [edx+edi*8],eax
c0008ee6:	75 0b                	jne    c0008ef3 <mem_free+0xb2>
c0008ee8:	01 74 fa 04          	add    DWORD PTR [edx+edi*8+0x4],esi
c0008eec:	89 1c fa             	mov    DWORD PTR [edx+edi*8],ebx
c0008eef:	31 c0                	xor    eax,eax
c0008ef1:	eb 50                	jmp    c0008f43 <mem_free+0x102>
c0008ef3:	81 7d ec 9f 0f 00 00 	cmp    DWORD PTR [ebp-0x14],0xf9f
c0008efa:	76 15                	jbe    c0008f11 <mem_free+0xd0>
c0008efc:	eb 3a                	jmp    c0008f38 <mem_free+0xf7>
c0008efe:	8b 74 c2 08          	mov    esi,DWORD PTR [edx+eax*8+0x8]
c0008f02:	8b 7c c2 0c          	mov    edi,DWORD PTR [edx+eax*8+0xc]
c0008f06:	89 74 c2 10          	mov    DWORD PTR [edx+eax*8+0x10],esi
c0008f0a:	89 7c c2 14          	mov    DWORD PTR [edx+eax*8+0x14],edi
c0008f0e:	40                   	inc    eax
c0008f0f:	eb 06                	jmp    c0008f17 <mem_free+0xd6>
c0008f11:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
c0008f14:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
c0008f17:	39 c8                	cmp    eax,ecx
c0008f19:	7f e3                	jg     c0008efe <mem_free+0xbd>
c0008f1b:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
c0008f1e:	8b 75 f0             	mov    esi,DWORD PTR [ebp-0x10]
c0008f21:	40                   	inc    eax
c0008f22:	39 42 04             	cmp    DWORD PTR [edx+0x4],eax
c0008f25:	89 02                	mov    DWORD PTR [edx],eax
c0008f27:	73 03                	jae    c0008f2c <mem_free+0xeb>
c0008f29:	89 42 04             	mov    DWORD PTR [edx+0x4],eax
c0008f2c:	83 c1 02             	add    ecx,0x2
c0008f2f:	89 1c ca             	mov    DWORD PTR [edx+ecx*8],ebx
c0008f32:	89 74 ca 04          	mov    DWORD PTR [edx+ecx*8+0x4],esi
c0008f36:	eb b7                	jmp    c0008eef <mem_free+0xae>
c0008f38:	ff 42 0c             	inc    DWORD PTR [edx+0xc]
c0008f3b:	b8 01 00 00 00       	mov    eax,0x1
c0008f40:	01 72 08             	add    DWORD PTR [edx+0x8],esi
c0008f43:	83 c4 10             	add    esp,0x10
c0008f46:	5b                   	pop    ebx
c0008f47:	5e                   	pop    esi
c0008f48:	5f                   	pop    edi
c0008f49:	5d                   	pop    ebp
c0008f4a:	c3                   	ret    

c0008f4b <mem_free_page>:
c0008f4b:	55                   	push   ebp
c0008f4c:	89 e5                	mov    ebp,esp
c0008f4e:	c1 65 10 0c          	shl    DWORD PTR [ebp+0x10],0xc
c0008f52:	5d                   	pop    ebp
c0008f53:	e9 e9 fe ff ff       	jmp    c0008e41 <mem_free>

c0008f58 <init_memory>:
c0008f58:	55                   	push   ebp
c0008f59:	89 e5                	mov    ebp,esp
c0008f5b:	56                   	push   esi
c0008f5c:	53                   	push   ebx
c0008f5d:	8b 35 00 7c 00 00    	mov    esi,DWORD PTR ds:0x7c00
c0008f63:	8d 9e 00 e0 ef ff    	lea    ebx,[esi-0x102000]
c0008f69:	d1 eb                	shr    ebx,1
c0008f6b:	53                   	push   ebx
c0008f6c:	29 de                	sub    esi,ebx
c0008f6e:	68 00 20 10 00       	push   0x102000
c0008f73:	81 c3 00 20 10 00    	add    ebx,0x102000
c0008f79:	68 e4 32 02 c0       	push   0xc00232e4
c0008f7e:	e8 c8 ff ff ff       	call   c0008f4b <mem_free_page>
c0008f83:	56                   	push   esi
c0008f84:	53                   	push   ebx
c0008f85:	68 b4 bb 00 c0       	push   0xc000bbb4
c0008f8a:	e8 bc ff ff ff       	call   c0008f4b <mem_free_page>
c0008f8f:	68 00 00 10 00       	push   0x100000
c0008f94:	6a 00                	push   0x0
c0008f96:	68 d4 b5 01 c0       	push   0xc001b5d4
c0008f9b:	e8 ab ff ff ff       	call   c0008f4b <mem_free_page>
c0008fa0:	83 c4 24             	add    esp,0x24
c0008fa3:	68 ff ff ff 3d       	push   0x3dffffff
c0008fa8:	68 00 00 00 c0       	push   0xc0000000
c0008fad:	68 d4 b5 01 c0       	push   0xc001b5d4
c0008fb2:	e8 94 ff ff ff       	call   c0008f4b <mem_free_page>
c0008fb7:	83 c4 0c             	add    esp,0xc
c0008fba:	8d 65 f8             	lea    esp,[ebp-0x8]
c0008fbd:	5b                   	pop    ebx
c0008fbe:	5e                   	pop    esi
c0008fbf:	5d                   	pop    ebp
c0008fc0:	c3                   	ret    

c0008fc1 <pde_ptr>:
c0008fc1:	55                   	push   ebp
c0008fc2:	89 e5                	mov    ebp,esp
c0008fc4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0008fc7:	5d                   	pop    ebp
c0008fc8:	c1 e8 16             	shr    eax,0x16
c0008fcb:	8d 04 85 00 f0 ff ff 	lea    eax,[eax*4-0x1000]
c0008fd2:	c3                   	ret    

c0008fd3 <pte_ptr>:
c0008fd3:	55                   	push   ebp
c0008fd4:	89 e5                	mov    ebp,esp
c0008fd6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0008fd9:	5d                   	pop    ebp
c0008fda:	89 c2                	mov    edx,eax
c0008fdc:	25 00 f0 3f 00       	and    eax,0x3ff000
c0008fe1:	81 e2 00 00 c0 ff    	and    edx,0xffc00000
c0008fe7:	c1 ea 0a             	shr    edx,0xa
c0008fea:	c1 e8 0a             	shr    eax,0xa
c0008fed:	8d 84 02 00 00 c0 ff 	lea    eax,[edx+eax*1-0x400000]
c0008ff4:	c3                   	ret    

c0008ff5 <page_table_add>:
c0008ff5:	55                   	push   ebp
c0008ff6:	89 e5                	mov    ebp,esp
c0008ff8:	57                   	push   edi
c0008ff9:	56                   	push   esi
c0008ffa:	53                   	push   ebx
c0008ffb:	83 ec 0c             	sub    esp,0xc
c0008ffe:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0009001:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
c0009004:	50                   	push   eax
c0009005:	89 c7                	mov    edi,eax
c0009007:	e8 c7 ff ff ff       	call   c0008fd3 <pte_ptr>
c000900c:	c1 ef 16             	shr    edi,0x16
c000900f:	f6 04 bd 00 f0 ff ff 	test   BYTE PTR [edi*4-0x1000],0x1
c0009016:	01 
c0009017:	5b                   	pop    ebx
c0009018:	89 c3                	mov    ebx,eax
c000901a:	74 0c                	je     c0009028 <page_table_add+0x33>
c000901c:	f6 00 01             	test   BYTE PTR [eax],0x1
c000901f:	75 3c                	jne    c000905d <page_table_add+0x68>
c0009021:	83 ce 07             	or     esi,0x7
c0009024:	89 30                	mov    DWORD PTR [eax],esi
c0009026:	eb 35                	jmp    c000905d <page_table_add+0x68>
c0009028:	6a 01                	push   0x1
c000902a:	83 ce 07             	or     esi,0x7
c000902d:	68 e4 32 02 c0       	push   0xc00232e4
c0009032:	e8 fd fd ff ff       	call   c0008e34 <mem_alloc_page>
c0009037:	83 ec 0c             	sub    esp,0xc
c000903a:	83 c8 07             	or     eax,0x7
c000903d:	89 04 bd 00 f0 ff ff 	mov    DWORD PTR [edi*4-0x1000],eax
c0009044:	89 d8                	mov    eax,ebx
c0009046:	68 00 10 00 00       	push   0x1000
c000904b:	25 00 f0 ff ff       	and    eax,0xfffff000
c0009050:	6a 00                	push   0x0
c0009052:	50                   	push   eax
c0009053:	e8 9c 02 00 00       	call   c00092f4 <memset>
c0009058:	83 c4 20             	add    esp,0x20
c000905b:	89 33                	mov    DWORD PTR [ebx],esi
c000905d:	8d 65 f4             	lea    esp,[ebp-0xc]
c0009060:	5b                   	pop    ebx
c0009061:	5e                   	pop    esi
c0009062:	5f                   	pop    edi
c0009063:	5d                   	pop    ebp
c0009064:	c3                   	ret    

c0009065 <page_alloc>:
c0009065:	55                   	push   ebp
c0009066:	89 e5                	mov    ebp,esp
c0009068:	57                   	push   edi
c0009069:	56                   	push   esi
c000906a:	53                   	push   ebx
c000906b:	83 ec 1c             	sub    esp,0x1c
c000906e:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
c0009071:	83 7d 08 01          	cmp    DWORD PTR [ebp+0x8],0x1
c0009075:	c7 45 e4 b4 bb 00 c0 	mov    DWORD PTR [ebp-0x1c],0xc000bbb4
c000907c:	75 07                	jne    c0009085 <page_alloc+0x20>
c000907e:	c7 45 e4 e4 32 02 c0 	mov    DWORD PTR [ebp-0x1c],0xc00232e4
c0009085:	56                   	push   esi
c0009086:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
c0009089:	e8 a6 fd ff ff       	call   c0008e34 <mem_alloc_page>
c000908e:	59                   	pop    ecx
c000908f:	5f                   	pop    edi
c0009090:	85 c0                	test   eax,eax
c0009092:	89 c3                	mov    ebx,eax
c0009094:	89 c7                	mov    edi,eax
c0009096:	75 25                	jne    c00090bd <page_alloc+0x58>
c0009098:	eb 2b                	jmp    c00090c5 <page_alloc+0x60>
c000909a:	6a 01                	push   0x1
c000909c:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
c000909f:	e8 90 fd ff ff       	call   c0008e34 <mem_alloc_page>
c00090a4:	59                   	pop    ecx
c00090a5:	5a                   	pop    edx
c00090a6:	85 c0                	test   eax,eax
c00090a8:	74 19                	je     c00090c3 <page_alloc+0x5e>
c00090aa:	52                   	push   edx
c00090ab:	4e                   	dec    esi
c00090ac:	52                   	push   edx
c00090ad:	50                   	push   eax
c00090ae:	57                   	push   edi
c00090af:	81 c7 00 10 00 00    	add    edi,0x1000
c00090b5:	e8 3b ff ff ff       	call   c0008ff5 <page_table_add>
c00090ba:	83 c4 10             	add    esp,0x10
c00090bd:	85 f6                	test   esi,esi
c00090bf:	75 d9                	jne    c000909a <page_alloc+0x35>
c00090c1:	eb 02                	jmp    c00090c5 <page_alloc+0x60>
c00090c3:	31 db                	xor    ebx,ebx
c00090c5:	8d 65 f4             	lea    esp,[ebp-0xc]
c00090c8:	89 d8                	mov    eax,ebx
c00090ca:	5b                   	pop    ebx
c00090cb:	5e                   	pop    esi
c00090cc:	5f                   	pop    edi
c00090cd:	5d                   	pop    ebp
c00090ce:	c3                   	ret    

c00090cf <get_kernel_page>:
c00090cf:	55                   	push   ebp
c00090d0:	89 e5                	mov    ebp,esp
c00090d2:	53                   	push   ebx
c00090d3:	83 ec 1c             	sub    esp,0x1c
c00090d6:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c00090d9:	53                   	push   ebx
c00090da:	6a 01                	push   0x1
c00090dc:	e8 84 ff ff ff       	call   c0009065 <page_alloc>
c00090e1:	83 c4 10             	add    esp,0x10
c00090e4:	85 c0                	test   eax,eax
c00090e6:	74 16                	je     c00090fe <get_kernel_page+0x2f>
c00090e8:	c1 e3 0c             	shl    ebx,0xc
c00090eb:	52                   	push   edx
c00090ec:	53                   	push   ebx
c00090ed:	6a 00                	push   0x0
c00090ef:	50                   	push   eax
c00090f0:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
c00090f3:	e8 fc 01 00 00       	call   c00092f4 <memset>
c00090f8:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
c00090fb:	83 c4 10             	add    esp,0x10
c00090fe:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
c0009101:	c9                   	leave  
c0009102:	c3                   	ret    
	...

c0009110 <put_str>:
c0009110:	53                   	push   ebx
c0009111:	51                   	push   ecx
c0009112:	31 c9                	xor    ecx,ecx
c0009114:	8b 5c 24 0c          	mov    ebx,DWORD PTR [esp+0xc]

c0009118 <put_str.goon>:
c0009118:	8a 0b                	mov    cl,BYTE PTR [ebx]
c000911a:	80 f9 00             	cmp    cl,0x0
c000911d:	74 12                	je     c0009131 <put_str.str_over>
c000911f:	51                   	push   ecx
c0009120:	e8 0f 00 00 00       	call   c0009134 <put_char>
c0009125:	81 c4 04 00 00 00    	add    esp,0x4
c000912b:	43                   	inc    ebx
c000912c:	e9 e7 ff ff ff       	jmp    c0009118 <put_str.goon>

c0009131 <put_str.str_over>:
c0009131:	59                   	pop    ecx
c0009132:	5b                   	pop    ebx
c0009133:	c3                   	ret    

c0009134 <put_char>:
c0009134:	60                   	pusha  
c0009135:	66 b8 18 00          	mov    ax,0x18
c0009139:	8e e8                	mov    gs,eax
c000913b:	66 ba d4 03          	mov    dx,0x3d4
c000913f:	b0 0e                	mov    al,0xe
c0009141:	ee                   	out    dx,al
c0009142:	66 ba d5 03          	mov    dx,0x3d5
c0009146:	ec                   	in     al,dx
c0009147:	88 c4                	mov    ah,al
c0009149:	66 ba d4 03          	mov    dx,0x3d4
c000914d:	b0 0f                	mov    al,0xf
c000914f:	ee                   	out    dx,al
c0009150:	66 ba d5 03          	mov    dx,0x3d5
c0009154:	ec                   	in     al,dx
c0009155:	66 89 c3             	mov    bx,ax
c0009158:	8b 4c 24 24          	mov    ecx,DWORD PTR [esp+0x24]
c000915c:	80 f9 0d             	cmp    cl,0xd
c000915f:	74 42                	je     c00091a3 <put_char.is_carriage_return>
c0009161:	80 f9 0a             	cmp    cl,0xa
c0009164:	74 3d                	je     c00091a3 <put_char.is_carriage_return>
c0009166:	80 f9 08             	cmp    cl,0x8
c0009169:	74 05                	je     c0009170 <put_char.is_backspace>
c000916b:	e9 19 00 00 00       	jmp    c0009189 <put_char.put_other>

c0009170 <put_char.is_backspace>:
c0009170:	66 4b                	dec    bx
c0009172:	66 d1 e3             	shl    bx,1
c0009175:	65 67 c6 07 20       	mov    BYTE PTR gs:[bx],0x20
c000917a:	66 43                	inc    bx
c000917c:	65 67 c6 07 07       	mov    BYTE PTR gs:[bx],0x7
c0009181:	66 d1 eb             	shr    bx,1
c0009184:	e9 64 00 00 00       	jmp    c00091ed <put_char.set_cursor>

c0009189 <put_char.put_other>:
c0009189:	66 d1 e3             	shl    bx,1
c000918c:	65 67 88 0f          	mov    BYTE PTR gs:[bx],cl
c0009190:	66 43                	inc    bx
c0009192:	65 67 c6 07 07       	mov    BYTE PTR gs:[bx],0x7
c0009197:	66 d1 eb             	shr    bx,1
c000919a:	66 43                	inc    bx
c000919c:	66 81 fb d0 07       	cmp    bx,0x7d0
c00091a1:	7c 4a                	jl     c00091ed <put_char.set_cursor>

c00091a3 <put_char.is_carriage_return>:
c00091a3:	66 31 d2             	xor    dx,dx
c00091a6:	66 89 d8             	mov    ax,bx
c00091a9:	66 be 50 00          	mov    si,0x50
c00091ad:	66 f7 f6             	div    si
c00091b0:	66 29 d3             	sub    bx,dx

c00091b3 <put_char.is_carriage_return_end>:
c00091b3:	66 81 c3 50 00       	add    bx,0x50
c00091b8:	66 81 fb d0 07       	cmp    bx,0x7d0

c00091bd <put_char.is_line_feed_end>:
c00091bd:	7c 2e                	jl     c00091ed <put_char.set_cursor>

c00091bf <put_char.roll_screen>:
c00091bf:	fc                   	cld    
c00091c0:	b9 c0 03 00 00       	mov    ecx,0x3c0
c00091c5:	be a0 80 0b c0       	mov    esi,0xc00b80a0
c00091ca:	bf 00 80 0b c0       	mov    edi,0xc00b8000
c00091cf:	f3 a5                	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
c00091d1:	bb 00 0f 00 00       	mov    ebx,0xf00
c00091d6:	b9 50 00 00 00       	mov    ecx,0x50

c00091db <put_char.cls>:
c00091db:	65 66 c7 03 20 07    	mov    WORD PTR gs:[ebx],0x720
c00091e1:	81 c3 02 00 00 00    	add    ebx,0x2
c00091e7:	e2 f2                	loop   c00091db <put_char.cls>
c00091e9:	66 bb 80 07          	mov    bx,0x780

c00091ed <put_char.set_cursor>:
c00091ed:	66 ba d4 03          	mov    dx,0x3d4
c00091f1:	b0 0e                	mov    al,0xe
c00091f3:	ee                   	out    dx,al
c00091f4:	66 ba d5 03          	mov    dx,0x3d5
c00091f8:	88 f8                	mov    al,bh
c00091fa:	ee                   	out    dx,al
c00091fb:	66 ba d4 03          	mov    dx,0x3d4
c00091ff:	b0 0f                	mov    al,0xf
c0009201:	ee                   	out    dx,al
c0009202:	66 ba d5 03          	mov    dx,0x3d5
c0009206:	88 d8                	mov    al,bl
c0009208:	ee                   	out    dx,al

c0009209 <put_char.put_char_done>:
c0009209:	61                   	popa   
c000920a:	c3                   	ret    

c000920b <cls_screen>:
c000920b:	60                   	pusha  
c000920c:	66 b8 18 00          	mov    ax,0x18
c0009210:	8e e8                	mov    gs,eax
c0009212:	bb 00 00 00 00       	mov    ebx,0x0
c0009217:	b9 d0 07 00 00       	mov    ecx,0x7d0

c000921c <cls_screen.cls>:
c000921c:	65 66 c7 03 20 07    	mov    WORD PTR gs:[ebx],0x720
c0009222:	81 c3 02 00 00 00    	add    ebx,0x2
c0009228:	e2 f2                	loop   c000921c <cls_screen.cls>
c000922a:	bb 00 00 00 00       	mov    ebx,0x0

c000922f <cls_screen.set_cursor>:
c000922f:	66 ba d4 03          	mov    dx,0x3d4
c0009233:	b0 0e                	mov    al,0xe
c0009235:	ee                   	out    dx,al
c0009236:	66 ba d5 03          	mov    dx,0x3d5
c000923a:	88 f8                	mov    al,bh
c000923c:	ee                   	out    dx,al
c000923d:	66 ba d4 03          	mov    dx,0x3d4
c0009241:	b0 0f                	mov    al,0xf
c0009243:	ee                   	out    dx,al
c0009244:	66 ba d5 03          	mov    dx,0x3d5
c0009248:	88 d8                	mov    al,bl
c000924a:	ee                   	out    dx,al
c000924b:	61                   	popa   
c000924c:	c3                   	ret    

c000924d <put_int>:
c000924d:	60                   	pusha  
c000924e:	89 e5                	mov    ebp,esp
c0009250:	8b 45 24             	mov    eax,DWORD PTR [ebp+0x24]
c0009253:	89 c2                	mov    edx,eax
c0009255:	bf 07 00 00 00       	mov    edi,0x7
c000925a:	b9 08 00 00 00       	mov    ecx,0x8
c000925f:	bb 94 a8 00 c0       	mov    ebx,0xc000a894

c0009264 <put_int.16based_4bits>:
c0009264:	81 e2 0f 00 00 00    	and    edx,0xf
c000926a:	81 fa 09 00 00 00    	cmp    edx,0x9
c0009270:	7f 0b                	jg     c000927d <put_int.is_A2F>
c0009272:	81 c2 30 00 00 00    	add    edx,0x30
c0009278:	e9 0c 00 00 00       	jmp    c0009289 <put_int.store>

c000927d <put_int.is_A2F>:
c000927d:	81 ea 0a 00 00 00    	sub    edx,0xa
c0009283:	81 c2 41 00 00 00    	add    edx,0x41

c0009289 <put_int.store>:
c0009289:	88 14 3b             	mov    BYTE PTR [ebx+edi*1],dl
c000928c:	4f                   	dec    edi
c000928d:	c1 e8 04             	shr    eax,0x4
c0009290:	89 c2                	mov    edx,eax
c0009292:	e2 d0                	loop   c0009264 <put_int.16based_4bits>

c0009294 <put_int.ready_to_print>:
c0009294:	47                   	inc    edi

c0009295 <put_int.skip_prefix_0>:
c0009295:	81 ff 08 00 00 00    	cmp    edi,0x8
c000929b:	74 12                	je     c00092af <put_int.full0>

c000929d <put_int.go_on_skip>:
c000929d:	8a 8f 94 a8 00 c0    	mov    cl,BYTE PTR [edi-0x3fff576c]
c00092a3:	47                   	inc    edi
c00092a4:	80 f9 30             	cmp    cl,0x30
c00092a7:	74 ec                	je     c0009295 <put_int.skip_prefix_0>
c00092a9:	4f                   	dec    edi
c00092aa:	e9 02 00 00 00       	jmp    c00092b1 <put_int.put_each_num>

c00092af <put_int.full0>:
c00092af:	b1 30                	mov    cl,0x30

c00092b1 <put_int.put_each_num>:
c00092b1:	51                   	push   ecx
c00092b2:	e8 7d fe ff ff       	call   c0009134 <put_char>
c00092b7:	81 c4 04 00 00 00    	add    esp,0x4
c00092bd:	47                   	inc    edi
c00092be:	8a 8f 94 a8 00 c0    	mov    cl,BYTE PTR [edi-0x3fff576c]
c00092c4:	81 ff 08 00 00 00    	cmp    edi,0x8
c00092ca:	7c e5                	jl     c00092b1 <put_int.put_each_num>
c00092cc:	61                   	popa   
c00092cd:	c3                   	ret    

c00092ce <set_cursor>:
c00092ce:	60                   	pusha  
c00092cf:	66 8b 5c 24 24       	mov    bx,WORD PTR [esp+0x24]
c00092d4:	66 ba d4 03          	mov    dx,0x3d4
c00092d8:	b0 0e                	mov    al,0xe
c00092da:	ee                   	out    dx,al
c00092db:	66 ba d5 03          	mov    dx,0x3d5
c00092df:	88 f8                	mov    al,bh
c00092e1:	ee                   	out    dx,al
c00092e2:	66 ba d4 03          	mov    dx,0x3d4
c00092e6:	b0 0f                	mov    al,0xf
c00092e8:	ee                   	out    dx,al
c00092e9:	66 ba d5 03          	mov    dx,0x3d5
c00092ed:	88 d8                	mov    al,bl
c00092ef:	ee                   	out    dx,al
c00092f0:	61                   	popa   
c00092f1:	c3                   	ret    
	...

c00092f4 <memset>:
c00092f4:	55                   	push   ebp
c00092f5:	89 e5                	mov    ebp,esp
c00092f7:	56                   	push   esi
c00092f8:	53                   	push   ebx
c00092f9:	83 ec 10             	sub    esp,0x10
c00092fc:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c00092ff:	8b 75 10             	mov    esi,DWORD PTR [ebp+0x10]
c0009302:	8a 55 0c             	mov    dl,BYTE PTR [ebp+0xc]
c0009305:	85 db                	test   ebx,ebx
c0009307:	75 1f                	jne    c0009328 <memset+0x34>
c0009309:	68 a4 b8 00 c0       	push   0xc000b8a4
c000930e:	68 fc b8 00 c0       	push   0xc000b8fc
c0009313:	6a 0f                	push   0xf
c0009315:	68 b2 b8 00 c0       	push   0xc000b8b2
c000931a:	88 55 f4             	mov    BYTE PTR [ebp-0xc],dl
c000931d:	e8 aa f3 ff ff       	call   c00086cc <panic_spin>
c0009322:	8a 55 f4             	mov    dl,BYTE PTR [ebp-0xc]
c0009325:	83 c4 10             	add    esp,0x10
c0009328:	31 c0                	xor    eax,eax
c000932a:	eb 04                	jmp    c0009330 <memset+0x3c>
c000932c:	88 14 03             	mov    BYTE PTR [ebx+eax*1],dl
c000932f:	40                   	inc    eax
c0009330:	39 f0                	cmp    eax,esi
c0009332:	75 f8                	jne    c000932c <memset+0x38>
c0009334:	8d 65 f8             	lea    esp,[ebp-0x8]
c0009337:	5b                   	pop    ebx
c0009338:	5e                   	pop    esi
c0009339:	5d                   	pop    ebp
c000933a:	c3                   	ret    

c000933b <memcpy>:
c000933b:	55                   	push   ebp
c000933c:	89 e5                	mov    ebp,esp
c000933e:	57                   	push   edi
c000933f:	56                   	push   esi
c0009340:	53                   	push   ebx
c0009341:	83 ec 0c             	sub    esp,0xc
c0009344:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
c0009347:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c000934a:	8b 7d 10             	mov    edi,DWORD PTR [ebp+0x10]
c000934d:	85 f6                	test   esi,esi
c000934f:	74 04                	je     c0009355 <memcpy+0x1a>
c0009351:	85 db                	test   ebx,ebx
c0009353:	75 19                	jne    c000936e <memcpy+0x33>
c0009355:	68 bf b8 00 c0       	push   0xc000b8bf
c000935a:	68 04 b9 00 c0       	push   0xc000b904
c000935f:	6a 22                	push   0x22
c0009361:	68 b2 b8 00 c0       	push   0xc000b8b2
c0009366:	e8 61 f3 ff ff       	call   c00086cc <panic_spin>
c000936b:	83 c4 10             	add    esp,0x10
c000936e:	31 c0                	xor    eax,eax
c0009370:	eb 07                	jmp    c0009379 <memcpy+0x3e>
c0009372:	8a 14 06             	mov    dl,BYTE PTR [esi+eax*1]
c0009375:	88 14 03             	mov    BYTE PTR [ebx+eax*1],dl
c0009378:	40                   	inc    eax
c0009379:	39 f8                	cmp    eax,edi
c000937b:	75 f5                	jne    c0009372 <memcpy+0x37>
c000937d:	8d 65 f4             	lea    esp,[ebp-0xc]
c0009380:	5b                   	pop    ebx
c0009381:	5e                   	pop    esi
c0009382:	5f                   	pop    edi
c0009383:	5d                   	pop    ebp
c0009384:	c3                   	ret    

c0009385 <memcmp>:
c0009385:	55                   	push   ebp
c0009386:	89 e5                	mov    ebp,esp
c0009388:	56                   	push   esi
c0009389:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
c000938c:	53                   	push   ebx
c000938d:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
c0009390:	85 db                	test   ebx,ebx
c0009392:	74 04                	je     c0009398 <memcmp+0x13>
c0009394:	85 f6                	test   esi,esi
c0009396:	75 19                	jne    c00093b1 <memcmp+0x2c>
c0009398:	68 de b8 00 c0       	push   0xc000b8de
c000939d:	68 0c b9 00 c0       	push   0xc000b90c
c00093a2:	6a 3b                	push   0x3b
c00093a4:	68 b2 b8 00 c0       	push   0xc000b8b2
c00093a9:	e8 1e f3 ff ff       	call   c00086cc <panic_spin>
c00093ae:	83 c4 10             	add    esp,0x10
c00093b1:	8a 13                	mov    dl,BYTE PTR [ebx]
c00093b3:	83 c8 ff             	or     eax,0xffffffff
c00093b6:	38 16                	cmp    BYTE PTR [esi],dl
c00093b8:	72 06                	jb     c00093c0 <memcmp+0x3b>
c00093ba:	0f 97 c0             	seta   al
c00093bd:	0f b6 c0             	movzx  eax,al
c00093c0:	8d 65 f8             	lea    esp,[ebp-0x8]
c00093c3:	5b                   	pop    ebx
c00093c4:	5e                   	pop    esi
c00093c5:	5d                   	pop    ebp
c00093c6:	c3                   	ret    

c00093c7 <strcpy>:
c00093c7:	55                   	push   ebp
c00093c8:	31 d2                	xor    edx,edx
c00093ca:	89 e5                	mov    ebp,esp
c00093cc:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c00093cf:	53                   	push   ebx
c00093d0:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
c00093d3:	8a 0c 13             	mov    cl,BYTE PTR [ebx+edx*1]
c00093d6:	88 0c 10             	mov    BYTE PTR [eax+edx*1],cl
c00093d9:	42                   	inc    edx
c00093da:	84 c9                	test   cl,cl
c00093dc:	75 f5                	jne    c00093d3 <strcpy+0xc>
c00093de:	5b                   	pop    ebx
c00093df:	5d                   	pop    ebp
c00093e0:	c3                   	ret    
	...

c00093f0 <switch_to>:
c00093f0:	56                   	push   esi
c00093f1:	57                   	push   edi
c00093f2:	53                   	push   ebx
c00093f3:	55                   	push   ebp
c00093f4:	8b 44 24 14          	mov    eax,DWORD PTR [esp+0x14]
c00093f8:	89 20                	mov    DWORD PTR [eax],esp
c00093fa:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
c00093fe:	8b 20                	mov    esp,DWORD PTR [eax]
c0009400:	5d                   	pop    ebp
c0009401:	5b                   	pop    ebx
c0009402:	5f                   	pop    edi
c0009403:	5e                   	pop    esi
c0009404:	c3                   	ret    
c0009405:	00 00                	add    BYTE PTR [eax],al
	...

c0009408 <kernel_thread>:
c0009408:	55                   	push   ebp
c0009409:	89 e5                	mov    ebp,esp
c000940b:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
c000940e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0009411:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
c0009414:	5d                   	pop    ebp
c0009415:	ff e0                	jmp    eax

c0009417 <init_thread>:
c0009417:	55                   	push   ebp
c0009418:	89 e5                	mov    ebp,esp
c000941a:	56                   	push   esi
c000941b:	8b 75 10             	mov    esi,DWORD PTR [ebp+0x10]
c000941e:	53                   	push   ebx
c000941f:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c0009422:	50                   	push   eax
c0009423:	6a 28                	push   0x28
c0009425:	6a 00                	push   0x0
c0009427:	53                   	push   ebx
c0009428:	e8 c7 fe ff ff       	call   c00092f4 <memset>
c000942d:	8d 43 08             	lea    eax,[ebx+0x8]
c0009430:	5a                   	pop    edx
c0009431:	59                   	pop    ecx
c0009432:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
c0009435:	50                   	push   eax
c0009436:	e8 8c ff ff ff       	call   c00093c7 <strcpy>
c000943b:	89 f0                	mov    eax,esi
c000943d:	83 c4 10             	add    esp,0x10
c0009440:	88 43 18             	mov    BYTE PTR [ebx+0x18],al
c0009443:	8d 83 00 10 00 00    	lea    eax,[ebx+0x1000]
c0009449:	c7 43 04 00 00 00 00 	mov    DWORD PTR [ebx+0x4],0x0
c0009450:	89 03                	mov    DWORD PTR [ebx],eax
c0009452:	c7 43 24 78 56 34 12 	mov    DWORD PTR [ebx+0x24],0x12345678
c0009459:	8d 65 f8             	lea    esp,[ebp-0x8]
c000945c:	5b                   	pop    ebx
c000945d:	5e                   	pop    esi
c000945e:	5d                   	pop    ebp
c000945f:	c3                   	ret    

c0009460 <thread_create>:
c0009460:	55                   	push   ebp
c0009461:	89 e5                	mov    ebp,esp
c0009463:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
c0009466:	8b 02                	mov    eax,DWORD PTR [edx]
c0009468:	8d 88 50 fe ff ff    	lea    ecx,[eax-0x1b0]
c000946e:	89 0a                	mov    DWORD PTR [edx],ecx
c0009470:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
c0009473:	c7 80 60 fe ff ff 08 	mov    DWORD PTR [eax-0x1a0],0xc0009408
c000947a:	94 00 c0 
c000947d:	c7 80 50 fe ff ff 00 	mov    DWORD PTR [eax-0x1b0],0x0
c0009484:	00 00 00 
c0009487:	c7 80 54 fe ff ff 00 	mov    DWORD PTR [eax-0x1ac],0x0
c000948e:	00 00 00 
c0009491:	89 90 68 fe ff ff    	mov    DWORD PTR [eax-0x198],edx
c0009497:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
c000949a:	c7 80 5c fe ff ff 00 	mov    DWORD PTR [eax-0x1a4],0x0
c00094a1:	00 00 00 
c00094a4:	c7 80 58 fe ff ff 00 	mov    DWORD PTR [eax-0x1a8],0x0
c00094ab:	00 00 00 
c00094ae:	89 90 6c fe ff ff    	mov    DWORD PTR [eax-0x194],edx
c00094b4:	5d                   	pop    ebp
c00094b5:	c3                   	ret    

c00094b6 <thread_start>:
c00094b6:	55                   	push   ebp
c00094b7:	89 e5                	mov    ebp,esp
c00094b9:	56                   	push   esi
c00094ba:	53                   	push   ebx
c00094bb:	8a 5d 0c             	mov    bl,BYTE PTR [ebp+0xc]
c00094be:	83 ec 0c             	sub    esp,0xc
c00094c1:	6a 01                	push   0x1
c00094c3:	e8 07 fc ff ff       	call   c00090cf <get_kernel_page>
c00094c8:	83 c4 0c             	add    esp,0xc
c00094cb:	0f b6 db             	movzx  ebx,bl
c00094ce:	53                   	push   ebx
c00094cf:	ff 75 08             	push   DWORD PTR [ebp+0x8]
c00094d2:	89 c6                	mov    esi,eax
c00094d4:	50                   	push   eax
c00094d5:	e8 3d ff ff ff       	call   c0009417 <init_thread>
c00094da:	83 c4 0c             	add    esp,0xc
c00094dd:	ff 75 14             	push   DWORD PTR [ebp+0x14]
c00094e0:	ff 75 10             	push   DWORD PTR [ebp+0x10]
c00094e3:	56                   	push   esi
c00094e4:	e8 77 ff ff ff       	call   c0009460 <thread_create>
c00094e9:	8b 26                	mov    esp,DWORD PTR [esi]
c00094eb:	5d                   	pop    ebp
c00094ec:	5b                   	pop    ebx
c00094ed:	5f                   	pop    edi
c00094ee:	5e                   	pop    esi
c00094ef:	c3                   	ret    
c00094f0:	8d 65 f8             	lea    esp,[ebp-0x8]
c00094f3:	89 f0                	mov    eax,esi
c00094f5:	5b                   	pop    ebx
c00094f6:	5e                   	pop    esi
c00094f7:	5d                   	pop    ebp
c00094f8:	c3                   	ret    
c00094f9:	00 00                	add    BYTE PTR [eax],al
	...

c00094fc <get_time>:
c00094fc:	55                   	push   ebp
c00094fd:	89 e5                	mov    ebp,esp
c00094ff:	57                   	push   edi
c0009500:	56                   	push   esi
c0009501:	be 70 00 00 00       	mov    esi,0x70
c0009506:	53                   	push   ebx
c0009507:	83 ec 1c             	sub    esp,0x1c
c000950a:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
c000950d:	e8 db f6 ff ff       	call   c0008bed <intr_get_status>
c0009512:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
c0009515:	b8 89 00 00 00       	mov    eax,0x89
c000951a:	89 f2                	mov    edx,esi
c000951c:	ee                   	out    dx,al
c000951d:	bb 71 00 00 00       	mov    ebx,0x71
c0009522:	89 da                	mov    edx,ebx
c0009524:	ec                   	in     al,dx
c0009525:	89 c1                	mov    ecx,eax
c0009527:	89 f2                	mov    edx,esi
c0009529:	b8 b2 00 00 00       	mov    eax,0xb2
c000952e:	ee                   	out    dx,al
c000952f:	89 da                	mov    edx,ebx
c0009531:	ec                   	in     al,dx
c0009532:	c1 e0 08             	shl    eax,0x8
c0009535:	89 f2                	mov    edx,esi
c0009537:	01 c1                	add    ecx,eax
c0009539:	b8 88 00 00 00       	mov    eax,0x88
c000953e:	89 4f 14             	mov    DWORD PTR [edi+0x14],ecx
c0009541:	ee                   	out    dx,al
c0009542:	89 da                	mov    edx,ebx
c0009544:	ec                   	in     al,dx
c0009545:	89 47 10             	mov    DWORD PTR [edi+0x10],eax
c0009548:	89 f2                	mov    edx,esi
c000954a:	b8 87 00 00 00       	mov    eax,0x87
c000954f:	ee                   	out    dx,al
c0009550:	89 da                	mov    edx,ebx
c0009552:	ec                   	in     al,dx
c0009553:	89 47 0c             	mov    DWORD PTR [edi+0xc],eax
c0009556:	89 f2                	mov    edx,esi
c0009558:	b8 84 00 00 00       	mov    eax,0x84
c000955d:	ee                   	out    dx,al
c000955e:	89 da                	mov    edx,ebx
c0009560:	ec                   	in     al,dx
c0009561:	89 47 08             	mov    DWORD PTR [edi+0x8],eax
c0009564:	89 f2                	mov    edx,esi
c0009566:	b8 82 00 00 00       	mov    eax,0x82
c000956b:	ee                   	out    dx,al
c000956c:	89 da                	mov    edx,ebx
c000956e:	ec                   	in     al,dx
c000956f:	b9 80 00 00 00       	mov    ecx,0x80
c0009574:	89 f2                	mov    edx,esi
c0009576:	89 47 04             	mov    DWORD PTR [edi+0x4],eax
c0009579:	89 c8                	mov    eax,ecx
c000957b:	ee                   	out    dx,al
c000957c:	89 da                	mov    edx,ebx
c000957e:	ec                   	in     al,dx
c000957f:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
c0009582:	89 f2                	mov    edx,esi
c0009584:	89 07                	mov    DWORD PTR [edi],eax
c0009586:	89 c8                	mov    eax,ecx
c0009588:	ee                   	out    dx,al
c0009589:	89 da                	mov    edx,ebx
c000958b:	ec                   	in     al,dx
c000958c:	39 45 e4             	cmp    DWORD PTR [ebp-0x1c],eax
c000958f:	75 84                	jne    c0009515 <get_time+0x19>
c0009591:	b2 70                	mov    dl,0x70
c0009593:	31 c0                	xor    eax,eax
c0009595:	ee                   	out    dx,al
c0009596:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
c0009599:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
c000959c:	83 c4 1c             	add    esp,0x1c
c000959f:	5b                   	pop    ebx
c00095a0:	5e                   	pop    esi
c00095a1:	5f                   	pop    edi
c00095a2:	5d                   	pop    ebp
c00095a3:	e9 80 f6 ff ff       	jmp    c0008c28 <intr_set_status>

c00095a8 <init_pit>:
c00095a8:	55                   	push   ebp
c00095a9:	ba 43 00 00 00       	mov    edx,0x43
c00095ae:	89 e5                	mov    ebp,esp
c00095b0:	b8 34 00 00 00       	mov    eax,0x34
c00095b5:	ee                   	out    dx,al
c00095b6:	b2 40                	mov    dl,0x40
c00095b8:	b0 9c                	mov    al,0x9c
c00095ba:	ee                   	out    dx,al
c00095bb:	b0 2e                	mov    al,0x2e
c00095bd:	ee                   	out    dx,al
c00095be:	5d                   	pop    ebp
c00095bf:	c3                   	ret    

c00095c0 <intr0x20_handler>:
c00095c0:	55                   	push   ebp
c00095c1:	ba 20 00 00 00       	mov    edx,0x20
c00095c6:	89 e5                	mov    ebp,esp
c00095c8:	b8 60 00 00 00       	mov    eax,0x60
c00095cd:	ee                   	out    dx,al
c00095ce:	5d                   	pop    ebp
c00095cf:	c3                   	ret    

Disassembly of section .data:

c00095d0 <_data>:
	...

c00095d8 <SectionCode32>:
c00095d8:	ff                   	(bad)  
c00095d9:	ff 00                	inc    DWORD PTR [eax]
c00095db:	00 00                	add    BYTE PTR [eax],al
c00095dd:	98                   	cwde   
c00095de:	cf                   	iret   
	...

c00095e0 <SectionData32>:
c00095e0:	ff                   	(bad)  
c00095e1:	ff 00                	inc    DWORD PTR [eax]
c00095e3:	00 00                	add    BYTE PTR [eax],al
c00095e5:	92                   	xchg   edx,eax
c00095e6:	cf                   	iret   
	...

c00095e8 <SectionVideo>:
c00095e8:	07                   	pop    es
c00095e9:	00 00                	add    BYTE PTR [eax],al
c00095eb:	80 0b 92             	or     BYTE PTR [ebx],0x92
c00095ee:	c0 00 00             	rol    BYTE PTR [eax],0x0
	...

c00097d0 <gdt_ptr>:
c00097d0:	1f                   	pop    ds
c00097d1:	00 d0                	add    al,dl
c00097d3:	95                   	xchg   ebp,eax
c00097d4:	00 c0                	add    al,al
	...

c00097d8 <PKnFont>:
	...
c00099e8:	00 10                	add    BYTE PTR [eax],dl
c00099ea:	10 10                	adc    BYTE PTR [eax],dl
c00099ec:	10 10                	adc    BYTE PTR [eax],dl
c00099ee:	10 10                	adc    BYTE PTR [eax],dl
c00099f0:	10 10                	adc    BYTE PTR [eax],dl
c00099f2:	00 00                	add    BYTE PTR [eax],al
c00099f4:	10 10                	adc    BYTE PTR [eax],dl
c00099f6:	00 00                	add    BYTE PTR [eax],al
c00099f8:	28 28                	sub    BYTE PTR [eax],ch
c00099fa:	28 00                	sub    BYTE PTR [eax],al
	...
c0009a08:	00 44 44 44          	add    BYTE PTR [esp+eax*2+0x44],al
c0009a0c:	fe 44 44 44          	inc    BYTE PTR [esp+eax*2+0x44]
c0009a10:	44                   	inc    esp
c0009a11:	44                   	inc    esp
c0009a12:	fe 44 44 44          	inc    BYTE PTR [esp+eax*2+0x44]
c0009a16:	00 00                	add    BYTE PTR [eax],al
c0009a18:	10 3a                	adc    BYTE PTR [edx],bh
c0009a1a:	56                   	push   esi
c0009a1b:	92                   	xchg   edx,eax
c0009a1c:	92                   	xchg   edx,eax
c0009a1d:	90                   	nop
c0009a1e:	50                   	push   eax
c0009a1f:	38 14 12             	cmp    BYTE PTR [edx+edx*1],dl
c0009a22:	92                   	xchg   edx,eax
c0009a23:	92                   	xchg   edx,eax
c0009a24:	d4 b8                	aam    0xb8
c0009a26:	10 10                	adc    BYTE PTR [eax],dl
c0009a28:	62 92 94 94 68 08    	bound  edx,QWORD PTR [edx+0x8689494]
c0009a2e:	10 10                	adc    BYTE PTR [eax],dl
c0009a30:	20 2c 52             	and    BYTE PTR [edx+edx*2],ch
c0009a33:	52                   	push   edx
c0009a34:	92                   	xchg   edx,eax
c0009a35:	8c 00                	mov    WORD PTR [eax],es
c0009a37:	00 00                	add    BYTE PTR [eax],al
c0009a39:	70 88                	jo     c00099c3 <PKnFont+0x1eb>
c0009a3b:	88 88 90 60 47 a2    	mov    BYTE PTR [eax-0x5db89f70],cl
c0009a41:	92                   	xchg   edx,eax
c0009a42:	8a 84 46 39 00 00 04 	mov    al,BYTE PTR [esi+eax*2+0x4000039]
c0009a49:	08 10                	or     BYTE PTR [eax],dl
	...
c0009a57:	00 02                	add    BYTE PTR [edx],al
c0009a59:	04 08                	add    al,0x8
c0009a5b:	08 10                	or     BYTE PTR [eax],dl
c0009a5d:	10 10                	adc    BYTE PTR [eax],dl
c0009a5f:	10 10                	adc    BYTE PTR [eax],dl
c0009a61:	10 10                	adc    BYTE PTR [eax],dl
c0009a63:	08 08                	or     BYTE PTR [eax],cl
c0009a65:	04 02                	add    al,0x2
c0009a67:	00 80 40 20 20 10    	add    BYTE PTR [eax+0x10202040],al
c0009a6d:	10 10                	adc    BYTE PTR [eax],dl
c0009a6f:	10 10                	adc    BYTE PTR [eax],dl
c0009a71:	10 10                	adc    BYTE PTR [eax],dl
c0009a73:	20 20                	and    BYTE PTR [eax],ah
c0009a75:	40                   	inc    eax
c0009a76:	80 00 00             	add    BYTE PTR [eax],0x0
c0009a79:	00 00                	add    BYTE PTR [eax],al
c0009a7b:	00 00                	add    BYTE PTR [eax],al
c0009a7d:	10 92 54 38 54 92    	adc    BYTE PTR [edx-0x6dabc7ac],dl
c0009a83:	10 00                	adc    BYTE PTR [eax],al
	...
c0009a8d:	10 10                	adc    BYTE PTR [eax],dl
c0009a8f:	10 fe                	adc    dh,bh
c0009a91:	10 10                	adc    BYTE PTR [eax],dl
c0009a93:	10 00                	adc    BYTE PTR [eax],al
	...
c0009aa1:	00 00                	add    BYTE PTR [eax],al
c0009aa3:	18 18                	sbb    BYTE PTR [eax],bl
c0009aa5:	08 08                	or     BYTE PTR [eax],cl
c0009aa7:	10 00                	adc    BYTE PTR [eax],al
c0009aa9:	00 00                	add    BYTE PTR [eax],al
c0009aab:	00 00                	add    BYTE PTR [eax],al
c0009aad:	00 00                	add    BYTE PTR [eax],al
c0009aaf:	00 fe                	add    dh,bh
	...
c0009ac1:	00 00                	add    BYTE PTR [eax],al
c0009ac3:	00 18                	add    BYTE PTR [eax],bl
c0009ac5:	18 00                	sbb    BYTE PTR [eax],al
c0009ac7:	00 02                	add    BYTE PTR [edx],al
c0009ac9:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
c0009acc:	08 08                	or     BYTE PTR [eax],cl
c0009ace:	08 10                	or     BYTE PTR [eax],dl
c0009ad0:	10 20                	adc    BYTE PTR [eax],ah
c0009ad2:	20 40 40             	and    BYTE PTR [eax+0x40],al
c0009ad5:	40                   	inc    eax
c0009ad6:	80 80 00 18 24 24 42 	add    BYTE PTR [eax+0x24241800],0x42
c0009add:	42                   	inc    edx
c0009ade:	42                   	inc    edx
c0009adf:	42                   	inc    edx
c0009ae0:	42                   	inc    edx
c0009ae1:	42                   	inc    edx
c0009ae2:	42                   	inc    edx
c0009ae3:	24 24                	and    al,0x24
c0009ae5:	18 00                	sbb    BYTE PTR [eax],al
c0009ae7:	00 00                	add    BYTE PTR [eax],al
c0009ae9:	08 18                	or     BYTE PTR [eax],bl
c0009aeb:	28 08                	sub    BYTE PTR [eax],cl
c0009aed:	08 08                	or     BYTE PTR [eax],cl
c0009aef:	08 08                	or     BYTE PTR [eax],cl
c0009af1:	08 08                	or     BYTE PTR [eax],cl
c0009af3:	08 08                	or     BYTE PTR [eax],cl
c0009af5:	3e 00 00             	add    BYTE PTR ds:[eax],al
c0009af8:	00 18                	add    BYTE PTR [eax],bl
c0009afa:	24 42                	and    al,0x42
c0009afc:	42                   	inc    edx
c0009afd:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
c0009b00:	10 20                	adc    BYTE PTR [eax],ah
c0009b02:	20 40 40             	and    BYTE PTR [eax+0x40],al
c0009b05:	7e 00                	jle    c0009b07 <PKnFont+0x32f>
c0009b07:	00 00                	add    BYTE PTR [eax],al
c0009b09:	18 24 42             	sbb    BYTE PTR [edx+eax*2],ah
c0009b0c:	02 02                	add    al,BYTE PTR [edx]
c0009b0e:	04 18                	add    al,0x18
c0009b10:	04 02                	add    al,0x2
c0009b12:	02 42 24             	add    al,BYTE PTR [edx+0x24]
c0009b15:	18 00                	sbb    BYTE PTR [eax],al
c0009b17:	00 00                	add    BYTE PTR [eax],al
c0009b19:	0c 0c                	or     al,0xc
c0009b1b:	0c 14                	or     al,0x14
c0009b1d:	14 14                	adc    al,0x14
c0009b1f:	24 24                	and    al,0x24
c0009b21:	44                   	inc    esp
c0009b22:	7e 04                	jle    c0009b28 <PKnFont+0x350>
c0009b24:	04 1e                	add    al,0x1e
c0009b26:	00 00                	add    BYTE PTR [eax],al
c0009b28:	00 7c 40 40          	add    BYTE PTR [eax+eax*2+0x40],bh
c0009b2c:	40                   	inc    eax
c0009b2d:	58                   	pop    eax
c0009b2e:	64 02 02             	add    al,BYTE PTR fs:[edx]
c0009b31:	02 02                	add    al,BYTE PTR [edx]
c0009b33:	42                   	inc    edx
c0009b34:	24 18                	and    al,0x18
c0009b36:	00 00                	add    BYTE PTR [eax],al
c0009b38:	00 18                	add    BYTE PTR [eax],bl
c0009b3a:	24 42                	and    al,0x42
c0009b3c:	40                   	inc    eax
c0009b3d:	58                   	pop    eax
c0009b3e:	64 42                	fs inc edx
c0009b40:	42                   	inc    edx
c0009b41:	42                   	inc    edx
c0009b42:	42                   	inc    edx
c0009b43:	42                   	inc    edx
c0009b44:	24 18                	and    al,0x18
c0009b46:	00 00                	add    BYTE PTR [eax],al
c0009b48:	00 7e 42             	add    BYTE PTR [esi+0x42],bh
c0009b4b:	42                   	inc    edx
c0009b4c:	04 04                	add    al,0x4
c0009b4e:	08 08                	or     BYTE PTR [eax],cl
c0009b50:	08 10                	or     BYTE PTR [eax],dl
c0009b52:	10 10                	adc    BYTE PTR [eax],dl
c0009b54:	10 38                	adc    BYTE PTR [eax],bh
c0009b56:	00 00                	add    BYTE PTR [eax],al
c0009b58:	00 18                	add    BYTE PTR [eax],bl
c0009b5a:	24 42                	and    al,0x42
c0009b5c:	42                   	inc    edx
c0009b5d:	42                   	inc    edx
c0009b5e:	24 18                	and    al,0x18
c0009b60:	24 42                	and    al,0x42
c0009b62:	42                   	inc    edx
c0009b63:	42                   	inc    edx
c0009b64:	24 18                	and    al,0x18
c0009b66:	00 00                	add    BYTE PTR [eax],al
c0009b68:	00 18                	add    BYTE PTR [eax],bl
c0009b6a:	24 42                	and    al,0x42
c0009b6c:	42                   	inc    edx
c0009b6d:	42                   	inc    edx
c0009b6e:	42                   	inc    edx
c0009b6f:	42                   	inc    edx
c0009b70:	26 1a 02             	sbb    al,BYTE PTR es:[edx]
c0009b73:	42                   	inc    edx
c0009b74:	24 18                	and    al,0x18
c0009b76:	00 00                	add    BYTE PTR [eax],al
c0009b78:	00 00                	add    BYTE PTR [eax],al
c0009b7a:	00 00                	add    BYTE PTR [eax],al
c0009b7c:	00 18                	add    BYTE PTR [eax],bl
c0009b7e:	18 00                	sbb    BYTE PTR [eax],al
c0009b80:	00 00                	add    BYTE PTR [eax],al
c0009b82:	00 00                	add    BYTE PTR [eax],al
c0009b84:	18 18                	sbb    BYTE PTR [eax],bl
c0009b86:	00 00                	add    BYTE PTR [eax],al
c0009b88:	00 00                	add    BYTE PTR [eax],al
c0009b8a:	00 00                	add    BYTE PTR [eax],al
c0009b8c:	00 18                	add    BYTE PTR [eax],bl
c0009b8e:	18 00                	sbb    BYTE PTR [eax],al
c0009b90:	00 00                	add    BYTE PTR [eax],al
c0009b92:	00 18                	add    BYTE PTR [eax],bl
c0009b94:	18 08                	sbb    BYTE PTR [eax],cl
c0009b96:	08 10                	or     BYTE PTR [eax],dl
c0009b98:	00 02                	add    BYTE PTR [edx],al
c0009b9a:	04 08                	add    al,0x8
c0009b9c:	10 20                	adc    BYTE PTR [eax],ah
c0009b9e:	40                   	inc    eax
c0009b9f:	80 80 40 20 10 08 04 	add    BYTE PTR [eax+0x8102040],0x4
c0009ba6:	02 00                	add    al,BYTE PTR [eax]
c0009ba8:	00 00                	add    BYTE PTR [eax],al
c0009baa:	00 00                	add    BYTE PTR [eax],al
c0009bac:	00 00                	add    BYTE PTR [eax],al
c0009bae:	fe 00                	inc    BYTE PTR [eax]
c0009bb0:	00 fe                	add    dh,bh
c0009bb2:	00 00                	add    BYTE PTR [eax],al
c0009bb4:	00 00                	add    BYTE PTR [eax],al
c0009bb6:	00 00                	add    BYTE PTR [eax],al
c0009bb8:	00 80 40 20 10 08    	add    BYTE PTR [eax+0x8102040],al
c0009bbe:	04 02                	add    al,0x2
c0009bc0:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
c0009bc3:	10 20                	adc    BYTE PTR [eax],ah
c0009bc5:	40                   	inc    eax
c0009bc6:	80 00 00             	add    BYTE PTR [eax],0x0
c0009bc9:	38 44 82 82          	cmp    BYTE PTR [edx+eax*4-0x7e],al
c0009bcd:	82                   	(bad)  
c0009bce:	04 08                	add    al,0x8
c0009bd0:	10 10                	adc    BYTE PTR [eax],dl
c0009bd2:	00 00                	add    BYTE PTR [eax],al
c0009bd4:	18 18                	sbb    BYTE PTR [eax],bl
c0009bd6:	00 00                	add    BYTE PTR [eax],al
c0009bd8:	00 38                	add    BYTE PTR [eax],bh
c0009bda:	44                   	inc    esp
c0009bdb:	82                   	(bad)  
c0009bdc:	9a aa aa aa aa aa 9c 	call   0x9caa:0xaaaaaaaa
c0009be3:	80 46 38 00          	add    BYTE PTR [esi+0x38],0x0
c0009be7:	00 00                	add    BYTE PTR [eax],al
c0009be9:	18 18                	sbb    BYTE PTR [eax],bl
c0009beb:	18 18                	sbb    BYTE PTR [eax],bl
c0009bed:	24 24                	and    al,0x24
c0009bef:	24 24                	and    al,0x24
c0009bf1:	7e 42                	jle    c0009c35 <PKnFont+0x45d>
c0009bf3:	42                   	inc    edx
c0009bf4:	42                   	inc    edx
c0009bf5:	e7 00                	out    0x0,eax
c0009bf7:	00 00                	add    BYTE PTR [eax],al
c0009bf9:	f0 48                	lock dec eax
c0009bfb:	44                   	inc    esp
c0009bfc:	44                   	inc    esp
c0009bfd:	44                   	inc    esp
c0009bfe:	48                   	dec    eax
c0009bff:	78 44                	js     c0009c45 <PKnFont+0x46d>
c0009c01:	42                   	inc    edx
c0009c02:	42                   	inc    edx
c0009c03:	42                   	inc    edx
c0009c04:	44                   	inc    esp
c0009c05:	f8                   	clc    
c0009c06:	00 00                	add    BYTE PTR [eax],al
c0009c08:	00 3a                	add    BYTE PTR [edx],bh
c0009c0a:	46                   	inc    esi
c0009c0b:	42                   	inc    edx
c0009c0c:	82                   	(bad)  
c0009c0d:	80 80 80 80 80 82 42 	add    BYTE PTR [eax-0x7d7f7f80],0x42
c0009c14:	44                   	inc    esp
c0009c15:	38 00                	cmp    BYTE PTR [eax],al
c0009c17:	00 00                	add    BYTE PTR [eax],al
c0009c19:	f8                   	clc    
c0009c1a:	44                   	inc    esp
c0009c1b:	44                   	inc    esp
c0009c1c:	42                   	inc    edx
c0009c1d:	42                   	inc    edx
c0009c1e:	42                   	inc    edx
c0009c1f:	42                   	inc    edx
c0009c20:	42                   	inc    edx
c0009c21:	42                   	inc    edx
c0009c22:	42                   	inc    edx
c0009c23:	44                   	inc    esp
c0009c24:	44                   	inc    esp
c0009c25:	f8                   	clc    
c0009c26:	00 00                	add    BYTE PTR [eax],al
c0009c28:	00 fe                	add    dh,bh
c0009c2a:	42                   	inc    edx
c0009c2b:	42                   	inc    edx
c0009c2c:	40                   	inc    eax
c0009c2d:	40                   	inc    eax
c0009c2e:	44                   	inc    esp
c0009c2f:	7c 44                	jl     c0009c75 <PKnFont+0x49d>
c0009c31:	40                   	inc    eax
c0009c32:	40                   	inc    eax
c0009c33:	42                   	inc    edx
c0009c34:	42                   	inc    edx
c0009c35:	fe 00                	inc    BYTE PTR [eax]
c0009c37:	00 00                	add    BYTE PTR [eax],al
c0009c39:	fe 42 42             	inc    BYTE PTR [edx+0x42]
c0009c3c:	40                   	inc    eax
c0009c3d:	40                   	inc    eax
c0009c3e:	44                   	inc    esp
c0009c3f:	7c 44                	jl     c0009c85 <PKnFont+0x4ad>
c0009c41:	44                   	inc    esp
c0009c42:	40                   	inc    eax
c0009c43:	40                   	inc    eax
c0009c44:	40                   	inc    eax
c0009c45:	f0 00 00             	lock add BYTE PTR [eax],al
c0009c48:	00 3a                	add    BYTE PTR [edx],bh
c0009c4a:	46                   	inc    esi
c0009c4b:	42                   	inc    edx
c0009c4c:	82                   	(bad)  
c0009c4d:	80 80 9e 82 82 82 42 	add    BYTE PTR [eax-0x7d7d7d62],0x42
c0009c54:	46                   	inc    esi
c0009c55:	38 00                	cmp    BYTE PTR [eax],al
c0009c57:	00 00                	add    BYTE PTR [eax],al
c0009c59:	e7 42                	out    0x42,eax
c0009c5b:	42                   	inc    edx
c0009c5c:	42                   	inc    edx
c0009c5d:	42                   	inc    edx
c0009c5e:	42                   	inc    edx
c0009c5f:	7e 42                	jle    c0009ca3 <PKnFont+0x4cb>
c0009c61:	42                   	inc    edx
c0009c62:	42                   	inc    edx
c0009c63:	42                   	inc    edx
c0009c64:	42                   	inc    edx
c0009c65:	e7 00                	out    0x0,eax
c0009c67:	00 00                	add    BYTE PTR [eax],al
c0009c69:	7c 10                	jl     c0009c7b <PKnFont+0x4a3>
c0009c6b:	10 10                	adc    BYTE PTR [eax],dl
c0009c6d:	10 10                	adc    BYTE PTR [eax],dl
c0009c6f:	10 10                	adc    BYTE PTR [eax],dl
c0009c71:	10 10                	adc    BYTE PTR [eax],dl
c0009c73:	10 10                	adc    BYTE PTR [eax],dl
c0009c75:	7c 00                	jl     c0009c77 <PKnFont+0x49f>
c0009c77:	00 00                	add    BYTE PTR [eax],al
c0009c79:	1f                   	pop    ds
c0009c7a:	04 04                	add    al,0x4
c0009c7c:	04 04                	add    al,0x4
c0009c7e:	04 04                	add    al,0x4
c0009c80:	04 04                	add    al,0x4
c0009c82:	04 04                	add    al,0x4
c0009c84:	84 48 30             	test   BYTE PTR [eax+0x30],cl
c0009c87:	00 00                	add    BYTE PTR [eax],al
c0009c89:	e7 42                	out    0x42,eax
c0009c8b:	44                   	inc    esp
c0009c8c:	48                   	dec    eax
c0009c8d:	50                   	push   eax
c0009c8e:	50                   	push   eax
c0009c8f:	60                   	pusha  
c0009c90:	50                   	push   eax
c0009c91:	50                   	push   eax
c0009c92:	48                   	dec    eax
c0009c93:	44                   	inc    esp
c0009c94:	42                   	inc    edx
c0009c95:	e7 00                	out    0x0,eax
c0009c97:	00 00                	add    BYTE PTR [eax],al
c0009c99:	f0 40                	lock inc eax
c0009c9b:	40                   	inc    eax
c0009c9c:	40                   	inc    eax
c0009c9d:	40                   	inc    eax
c0009c9e:	40                   	inc    eax
c0009c9f:	40                   	inc    eax
c0009ca0:	40                   	inc    eax
c0009ca1:	40                   	inc    eax
c0009ca2:	40                   	inc    eax
c0009ca3:	42                   	inc    edx
c0009ca4:	42                   	inc    edx
c0009ca5:	fe 00                	inc    BYTE PTR [eax]
c0009ca7:	00 00                	add    BYTE PTR [eax],al
c0009ca9:	c3                   	ret    
c0009caa:	42                   	inc    edx
c0009cab:	66 66 66 5a          	data16 data16 pop dx
c0009caf:	5a                   	pop    edx
c0009cb0:	5a                   	pop    edx
c0009cb1:	42                   	inc    edx
c0009cb2:	42                   	inc    edx
c0009cb3:	42                   	inc    edx
c0009cb4:	42                   	inc    edx
c0009cb5:	e7 00                	out    0x0,eax
c0009cb7:	00 00                	add    BYTE PTR [eax],al
c0009cb9:	c7 42 62 62 52 52 52 	mov    DWORD PTR [edx+0x62],0x52525262
c0009cc0:	4a                   	dec    edx
c0009cc1:	4a                   	dec    edx
c0009cc2:	4a                   	dec    edx
c0009cc3:	46                   	inc    esi
c0009cc4:	46                   	inc    esi
c0009cc5:	e2 00                	loop   c0009cc7 <PKnFont+0x4ef>
c0009cc7:	00 00                	add    BYTE PTR [eax],al
c0009cc9:	38 44 82 82          	cmp    BYTE PTR [edx+eax*4-0x7e],al
c0009ccd:	82                   	(bad)  
c0009cce:	82                   	(bad)  
c0009ccf:	82                   	(bad)  
c0009cd0:	82                   	(bad)  
c0009cd1:	82                   	(bad)  
c0009cd2:	82                   	(bad)  
c0009cd3:	82                   	(bad)  
c0009cd4:	44                   	inc    esp
c0009cd5:	38 00                	cmp    BYTE PTR [eax],al
c0009cd7:	00 00                	add    BYTE PTR [eax],al
c0009cd9:	f8                   	clc    
c0009cda:	44                   	inc    esp
c0009cdb:	42                   	inc    edx
c0009cdc:	42                   	inc    edx
c0009cdd:	42                   	inc    edx
c0009cde:	44                   	inc    esp
c0009cdf:	78 40                	js     c0009d21 <PKnFont+0x549>
c0009ce1:	40                   	inc    eax
c0009ce2:	40                   	inc    eax
c0009ce3:	40                   	inc    eax
c0009ce4:	40                   	inc    eax
c0009ce5:	f0 00 00             	lock add BYTE PTR [eax],al
c0009ce8:	00 38                	add    BYTE PTR [eax],bh
c0009cea:	44                   	inc    esp
c0009ceb:	82                   	(bad)  
c0009cec:	82                   	(bad)  
c0009ced:	82                   	(bad)  
c0009cee:	82                   	(bad)  
c0009cef:	82                   	(bad)  
c0009cf0:	82                   	(bad)  
c0009cf1:	82                   	(bad)  
c0009cf2:	92                   	xchg   edx,eax
c0009cf3:	8a 44 3a 00          	mov    al,BYTE PTR [edx+edi*1+0x0]
c0009cf7:	00 00                	add    BYTE PTR [eax],al
c0009cf9:	fc                   	cld    
c0009cfa:	42                   	inc    edx
c0009cfb:	42                   	inc    edx
c0009cfc:	42                   	inc    edx
c0009cfd:	42                   	inc    edx
c0009cfe:	7c 44                	jl     c0009d44 <PKnFont+0x56c>
c0009d00:	42                   	inc    edx
c0009d01:	42                   	inc    edx
c0009d02:	42                   	inc    edx
c0009d03:	42                   	inc    edx
c0009d04:	42                   	inc    edx
c0009d05:	e7 00                	out    0x0,eax
c0009d07:	00 00                	add    BYTE PTR [eax],al
c0009d09:	3a 46 82             	cmp    al,BYTE PTR [esi-0x7e]
c0009d0c:	82                   	(bad)  
c0009d0d:	80 40 38 04          	add    BYTE PTR [eax+0x38],0x4
c0009d11:	02 82 82 c4 b8 00    	add    al,BYTE PTR [edx+0xb8c482]
c0009d17:	00 00                	add    BYTE PTR [eax],al
c0009d19:	fe                   	(bad)  
c0009d1a:	92                   	xchg   edx,eax
c0009d1b:	92                   	xchg   edx,eax
c0009d1c:	10 10                	adc    BYTE PTR [eax],dl
c0009d1e:	10 10                	adc    BYTE PTR [eax],dl
c0009d20:	10 10                	adc    BYTE PTR [eax],dl
c0009d22:	10 10                	adc    BYTE PTR [eax],dl
c0009d24:	10 7c 00 00          	adc    BYTE PTR [eax+eax*1+0x0],bh
c0009d28:	00 e7                	add    bh,ah
c0009d2a:	42                   	inc    edx
c0009d2b:	42                   	inc    edx
c0009d2c:	42                   	inc    edx
c0009d2d:	42                   	inc    edx
c0009d2e:	42                   	inc    edx
c0009d2f:	42                   	inc    edx
c0009d30:	42                   	inc    edx
c0009d31:	42                   	inc    edx
c0009d32:	42                   	inc    edx
c0009d33:	42                   	inc    edx
c0009d34:	24 3c                	and    al,0x3c
c0009d36:	00 00                	add    BYTE PTR [eax],al
c0009d38:	00 e7                	add    bh,ah
c0009d3a:	42                   	inc    edx
c0009d3b:	42                   	inc    edx
c0009d3c:	42                   	inc    edx
c0009d3d:	42                   	inc    edx
c0009d3e:	24 24                	and    al,0x24
c0009d40:	24 24                	and    al,0x24
c0009d42:	18 18                	sbb    BYTE PTR [eax],bl
c0009d44:	18 18                	sbb    BYTE PTR [eax],bl
c0009d46:	00 00                	add    BYTE PTR [eax],al
c0009d48:	00 e7                	add    bh,ah
c0009d4a:	42                   	inc    edx
c0009d4b:	42                   	inc    edx
c0009d4c:	42                   	inc    edx
c0009d4d:	5a                   	pop    edx
c0009d4e:	5a                   	pop    edx
c0009d4f:	5a                   	pop    edx
c0009d50:	5a                   	pop    edx
c0009d51:	24 24                	and    al,0x24
c0009d53:	24 24                	and    al,0x24
c0009d55:	24 00                	and    al,0x0
c0009d57:	00 00                	add    BYTE PTR [eax],al
c0009d59:	e7 42                	out    0x42,eax
c0009d5b:	42                   	inc    edx
c0009d5c:	24 24                	and    al,0x24
c0009d5e:	24 18                	and    al,0x18
c0009d60:	24 24                	and    al,0x24
c0009d62:	24 42                	and    al,0x42
c0009d64:	42                   	inc    edx
c0009d65:	e7 00                	out    0x0,eax
c0009d67:	00 00                	add    BYTE PTR [eax],al
c0009d69:	ee                   	out    dx,al
c0009d6a:	44                   	inc    esp
c0009d6b:	44                   	inc    esp
c0009d6c:	44                   	inc    esp
c0009d6d:	28 28                	sub    BYTE PTR [eax],ch
c0009d6f:	28 10                	sub    BYTE PTR [eax],dl
c0009d71:	10 10                	adc    BYTE PTR [eax],dl
c0009d73:	10 10                	adc    BYTE PTR [eax],dl
c0009d75:	7c 00                	jl     c0009d77 <PKnFont+0x59f>
c0009d77:	00 00                	add    BYTE PTR [eax],al
c0009d79:	fe 84 84 08 08 10 10 	inc    BYTE PTR [esp+eax*4+0x10100808]
c0009d80:	20 20                	and    BYTE PTR [eax],ah
c0009d82:	40                   	inc    eax
c0009d83:	42                   	inc    edx
c0009d84:	82                   	(bad)  
c0009d85:	fe 00                	inc    BYTE PTR [eax]
c0009d87:	00 00                	add    BYTE PTR [eax],al
c0009d89:	3e 20 20             	and    BYTE PTR ds:[eax],ah
c0009d8c:	20 20                	and    BYTE PTR [eax],ah
c0009d8e:	20 20                	and    BYTE PTR [eax],ah
c0009d90:	20 20                	and    BYTE PTR [eax],ah
c0009d92:	20 20                	and    BYTE PTR [eax],ah
c0009d94:	20 20                	and    BYTE PTR [eax],ah
c0009d96:	3e 00 80 80 40 40 20 	add    BYTE PTR ds:[eax+0x20404080],al
c0009d9d:	20 20                	and    BYTE PTR [eax],ah
c0009d9f:	10 10                	adc    BYTE PTR [eax],dl
c0009da1:	08 08                	or     BYTE PTR [eax],cl
c0009da3:	04 04                	add    al,0x4
c0009da5:	04 02                	add    al,0x2
c0009da7:	02 00                	add    al,BYTE PTR [eax]
c0009da9:	7c 04                	jl     c0009daf <PKnFont+0x5d7>
c0009dab:	04 04                	add    al,0x4
c0009dad:	04 04                	add    al,0x4
c0009daf:	04 04                	add    al,0x4
c0009db1:	04 04                	add    al,0x4
c0009db3:	04 04                	add    al,0x4
c0009db5:	04 7c                	add    al,0x7c
c0009db7:	00 00                	add    BYTE PTR [eax],al
c0009db9:	10 28                	adc    BYTE PTR [eax],ch
c0009dbb:	44                   	inc    esp
c0009dbc:	82                   	(bad)  
	...
c0009dd5:	00 fe                	add    dh,bh
c0009dd7:	00 10                	add    BYTE PTR [eax],dl
c0009dd9:	08 04 00             	or     BYTE PTR [eax+eax*1],al
	...
c0009dec:	00 70 08             	add    BYTE PTR [eax+0x8],dh
c0009def:	04 3c                	add    al,0x3c
c0009df1:	44                   	inc    esp
c0009df2:	84 84 8c 76 00 00 c0 	test   BYTE PTR [esp+ecx*4-0x3fffff8a],al
c0009df9:	40                   	inc    eax
c0009dfa:	40                   	inc    eax
c0009dfb:	40                   	inc    eax
c0009dfc:	40                   	inc    eax
c0009dfd:	58                   	pop    eax
c0009dfe:	64 42                	fs inc edx
c0009e00:	42                   	inc    edx
c0009e01:	42                   	inc    edx
c0009e02:	42                   	inc    edx
c0009e03:	42                   	inc    edx
c0009e04:	64 58                	fs pop eax
c0009e06:	00 00                	add    BYTE PTR [eax],al
c0009e08:	00 00                	add    BYTE PTR [eax],al
c0009e0a:	00 00                	add    BYTE PTR [eax],al
c0009e0c:	00 30                	add    BYTE PTR [eax],dh
c0009e0e:	4c                   	dec    esp
c0009e0f:	84 84 80 80 82 44 38 	test   BYTE PTR [eax+eax*4+0x38448280],al
c0009e16:	00 00                	add    BYTE PTR [eax],al
c0009e18:	0c 04                	or     al,0x4
c0009e1a:	04 04                	add    al,0x4
c0009e1c:	04 34                	add    al,0x34
c0009e1e:	4c                   	dec    esp
c0009e1f:	84 84 84 84 84 4c 36 	test   BYTE PTR [esp+eax*4+0x364c8484],al
c0009e26:	00 00                	add    BYTE PTR [eax],al
c0009e28:	00 00                	add    BYTE PTR [eax],al
c0009e2a:	00 00                	add    BYTE PTR [eax],al
c0009e2c:	00 38                	add    BYTE PTR [eax],bh
c0009e2e:	44                   	inc    esp
c0009e2f:	82                   	(bad)  
c0009e30:	82                   	(bad)  
c0009e31:	fc                   	cld    
c0009e32:	80 82 42 3c 00 00 0e 	add    BYTE PTR [edx+0x3c42],0xe
c0009e39:	10 10                	adc    BYTE PTR [eax],dl
c0009e3b:	10 10                	adc    BYTE PTR [eax],dl
c0009e3d:	7c 10                	jl     c0009e4f <PKnFont+0x677>
c0009e3f:	10 10                	adc    BYTE PTR [eax],dl
c0009e41:	10 10                	adc    BYTE PTR [eax],dl
c0009e43:	10 10                	adc    BYTE PTR [eax],dl
c0009e45:	7c 00                	jl     c0009e47 <PKnFont+0x66f>
c0009e47:	00 00                	add    BYTE PTR [eax],al
c0009e49:	00 00                	add    BYTE PTR [eax],al
c0009e4b:	00 00                	add    BYTE PTR [eax],al
c0009e4d:	36 4c                	ss dec esp
c0009e4f:	84 84 84 84 4c 34 04 	test   BYTE PTR [esp+eax*4+0x4344c84],al
c0009e56:	04 38                	add    al,0x38
c0009e58:	c0 40 40 40          	rol    BYTE PTR [eax+0x40],0x40
c0009e5c:	40                   	inc    eax
c0009e5d:	58                   	pop    eax
c0009e5e:	64 42                	fs inc edx
c0009e60:	42                   	inc    edx
c0009e61:	42                   	inc    edx
c0009e62:	42                   	inc    edx
c0009e63:	42                   	inc    edx
c0009e64:	42                   	inc    edx
c0009e65:	e3 00                	jecxz  c0009e67 <PKnFont+0x68f>
c0009e67:	00 00                	add    BYTE PTR [eax],al
c0009e69:	10 10                	adc    BYTE PTR [eax],dl
c0009e6b:	00 00                	add    BYTE PTR [eax],al
c0009e6d:	30 10                	xor    BYTE PTR [eax],dl
c0009e6f:	10 10                	adc    BYTE PTR [eax],dl
c0009e71:	10 10                	adc    BYTE PTR [eax],dl
c0009e73:	10 10                	adc    BYTE PTR [eax],dl
c0009e75:	38 00                	cmp    BYTE PTR [eax],al
c0009e77:	00 00                	add    BYTE PTR [eax],al
c0009e79:	04 04                	add    al,0x4
c0009e7b:	00 00                	add    BYTE PTR [eax],al
c0009e7d:	0c 04                	or     al,0x4
c0009e7f:	04 04                	add    al,0x4
c0009e81:	04 04                	add    al,0x4
c0009e83:	04 04                	add    al,0x4
c0009e85:	08 08                	or     BYTE PTR [eax],cl
c0009e87:	30 c0                	xor    al,al
c0009e89:	40                   	inc    eax
c0009e8a:	40                   	inc    eax
c0009e8b:	40                   	inc    eax
c0009e8c:	40                   	inc    eax
c0009e8d:	4e                   	dec    esi
c0009e8e:	44                   	inc    esp
c0009e8f:	48                   	dec    eax
c0009e90:	50                   	push   eax
c0009e91:	60                   	pusha  
c0009e92:	50                   	push   eax
c0009e93:	48                   	dec    eax
c0009e94:	44                   	inc    esp
c0009e95:	e6 00                	out    0x0,al
c0009e97:	00 30                	add    BYTE PTR [eax],dh
c0009e99:	10 10                	adc    BYTE PTR [eax],dl
c0009e9b:	10 10                	adc    BYTE PTR [eax],dl
c0009e9d:	10 10                	adc    BYTE PTR [eax],dl
c0009e9f:	10 10                	adc    BYTE PTR [eax],dl
c0009ea1:	10 10                	adc    BYTE PTR [eax],dl
c0009ea3:	10 10                	adc    BYTE PTR [eax],dl
c0009ea5:	38 00                	cmp    BYTE PTR [eax],al
c0009ea7:	00 00                	add    BYTE PTR [eax],al
c0009ea9:	00 00                	add    BYTE PTR [eax],al
c0009eab:	00 00                	add    BYTE PTR [eax],al
c0009ead:	f6                   	(bad)  
c0009eae:	49                   	dec    ecx
c0009eaf:	49                   	dec    ecx
c0009eb0:	49                   	dec    ecx
c0009eb1:	49                   	dec    ecx
c0009eb2:	49                   	dec    ecx
c0009eb3:	49                   	dec    ecx
c0009eb4:	49                   	dec    ecx
c0009eb5:	db 00                	fild   DWORD PTR [eax]
c0009eb7:	00 00                	add    BYTE PTR [eax],al
c0009eb9:	00 00                	add    BYTE PTR [eax],al
c0009ebb:	00 00                	add    BYTE PTR [eax],al
c0009ebd:	d8 64 42 42          	fsub   DWORD PTR [edx+eax*2+0x42]
c0009ec1:	42                   	inc    edx
c0009ec2:	42                   	inc    edx
c0009ec3:	42                   	inc    edx
c0009ec4:	42                   	inc    edx
c0009ec5:	e3 00                	jecxz  c0009ec7 <PKnFont+0x6ef>
c0009ec7:	00 00                	add    BYTE PTR [eax],al
c0009ec9:	00 00                	add    BYTE PTR [eax],al
c0009ecb:	00 00                	add    BYTE PTR [eax],al
c0009ecd:	38 44 82 82          	cmp    BYTE PTR [edx+eax*4-0x7e],al
c0009ed1:	82                   	(bad)  
c0009ed2:	82                   	(bad)  
c0009ed3:	82                   	(bad)  
c0009ed4:	44                   	inc    esp
c0009ed5:	38 00                	cmp    BYTE PTR [eax],al
c0009ed7:	00 00                	add    BYTE PTR [eax],al
c0009ed9:	00 00                	add    BYTE PTR [eax],al
c0009edb:	00 d8                	add    al,bl
c0009edd:	64 42                	fs inc edx
c0009edf:	42                   	inc    edx
c0009ee0:	42                   	inc    edx
c0009ee1:	42                   	inc    edx
c0009ee2:	42                   	inc    edx
c0009ee3:	64 58                	fs pop eax
c0009ee5:	40                   	inc    eax
c0009ee6:	40                   	inc    eax
c0009ee7:	e0 00                	loopne c0009ee9 <PKnFont+0x711>
c0009ee9:	00 00                	add    BYTE PTR [eax],al
c0009eeb:	00 34 4c             	add    BYTE PTR [esp+ecx*2],dh
c0009eee:	84 84 84 84 84 4c 34 	test   BYTE PTR [esp+eax*4+0x344c8484],al
c0009ef5:	04 04                	add    al,0x4
c0009ef7:	0e                   	push   cs
c0009ef8:	00 00                	add    BYTE PTR [eax],al
c0009efa:	00 00                	add    BYTE PTR [eax],al
c0009efc:	00 dc                	add    ah,bl
c0009efe:	62 42 40             	bound  eax,QWORD PTR [edx+0x40]
c0009f01:	40                   	inc    eax
c0009f02:	40                   	inc    eax
c0009f03:	40                   	inc    eax
c0009f04:	40                   	inc    eax
c0009f05:	e0 00                	loopne c0009f07 <PKnFont+0x72f>
c0009f07:	00 00                	add    BYTE PTR [eax],al
c0009f09:	00 00                	add    BYTE PTR [eax],al
c0009f0b:	00 00                	add    BYTE PTR [eax],al
c0009f0d:	7a 86                	jp     c0009e95 <PKnFont+0x6bd>
c0009f0f:	82                   	(bad)  
c0009f10:	c0 38 06             	sar    BYTE PTR [eax],0x6
c0009f13:	82                   	(bad)  
c0009f14:	c2 bc 00             	ret    0xbc
c0009f17:	00 00                	add    BYTE PTR [eax],al
c0009f19:	00 10                	add    BYTE PTR [eax],dl
c0009f1b:	10 10                	adc    BYTE PTR [eax],dl
c0009f1d:	7c 10                	jl     c0009f2f <PKnFont+0x757>
c0009f1f:	10 10                	adc    BYTE PTR [eax],dl
c0009f21:	10 10                	adc    BYTE PTR [eax],dl
c0009f23:	10 10                	adc    BYTE PTR [eax],dl
c0009f25:	0e                   	push   cs
c0009f26:	00 00                	add    BYTE PTR [eax],al
c0009f28:	00 00                	add    BYTE PTR [eax],al
c0009f2a:	00 00                	add    BYTE PTR [eax],al
c0009f2c:	00 c6                	add    dh,al
c0009f2e:	42                   	inc    edx
c0009f2f:	42                   	inc    edx
c0009f30:	42                   	inc    edx
c0009f31:	42                   	inc    edx
c0009f32:	42                   	inc    edx
c0009f33:	42                   	inc    edx
c0009f34:	46                   	inc    esi
c0009f35:	3b 00                	cmp    eax,DWORD PTR [eax]
c0009f37:	00 00                	add    BYTE PTR [eax],al
c0009f39:	00 00                	add    BYTE PTR [eax],al
c0009f3b:	00 00                	add    BYTE PTR [eax],al
c0009f3d:	e7 42                	out    0x42,eax
c0009f3f:	42                   	inc    edx
c0009f40:	42                   	inc    edx
c0009f41:	24 24                	and    al,0x24
c0009f43:	24 18                	and    al,0x18
c0009f45:	18 00                	sbb    BYTE PTR [eax],al
c0009f47:	00 00                	add    BYTE PTR [eax],al
c0009f49:	00 00                	add    BYTE PTR [eax],al
c0009f4b:	00 00                	add    BYTE PTR [eax],al
c0009f4d:	e7 42                	out    0x42,eax
c0009f4f:	42                   	inc    edx
c0009f50:	5a                   	pop    edx
c0009f51:	5a                   	pop    edx
c0009f52:	5a                   	pop    edx
c0009f53:	24 24                	and    al,0x24
c0009f55:	24 00                	and    al,0x0
c0009f57:	00 00                	add    BYTE PTR [eax],al
c0009f59:	00 00                	add    BYTE PTR [eax],al
c0009f5b:	00 00                	add    BYTE PTR [eax],al
c0009f5d:	c6 44 28 28 10       	mov    BYTE PTR [eax+ebp*1+0x28],0x10
c0009f62:	28 28                	sub    BYTE PTR [eax],ch
c0009f64:	44                   	inc    esp
c0009f65:	c6 00 00             	mov    BYTE PTR [eax],0x0
c0009f68:	00 00                	add    BYTE PTR [eax],al
c0009f6a:	00 00                	add    BYTE PTR [eax],al
c0009f6c:	00 e7                	add    bh,ah
c0009f6e:	42                   	inc    edx
c0009f6f:	42                   	inc    edx
c0009f70:	24 24                	and    al,0x24
c0009f72:	24 18                	and    al,0x18
c0009f74:	18 10                	sbb    BYTE PTR [eax],dl
c0009f76:	10 60 00             	adc    BYTE PTR [eax+0x0],ah
c0009f79:	00 00                	add    BYTE PTR [eax],al
c0009f7b:	00 00                	add    BYTE PTR [eax],al
c0009f7d:	fe 82 84 08 10 20    	inc    BYTE PTR [edx+0x20100884]
c0009f83:	42                   	inc    edx
c0009f84:	82                   	(bad)  
c0009f85:	fe 00                	inc    BYTE PTR [eax]
c0009f87:	00 00                	add    BYTE PTR [eax],al
c0009f89:	06                   	push   es
c0009f8a:	08 10                	or     BYTE PTR [eax],dl
c0009f8c:	10 10                	adc    BYTE PTR [eax],dl
c0009f8e:	10 60 10             	adc    BYTE PTR [eax+0x10],ah
c0009f91:	10 10                	adc    BYTE PTR [eax],dl
c0009f93:	10 08                	adc    BYTE PTR [eax],cl
c0009f95:	06                   	push   es
c0009f96:	00 00                	add    BYTE PTR [eax],al
c0009f98:	10 10                	adc    BYTE PTR [eax],dl
c0009f9a:	10 10                	adc    BYTE PTR [eax],dl
c0009f9c:	10 10                	adc    BYTE PTR [eax],dl
c0009f9e:	10 10                	adc    BYTE PTR [eax],dl
c0009fa0:	10 10                	adc    BYTE PTR [eax],dl
c0009fa2:	10 10                	adc    BYTE PTR [eax],dl
c0009fa4:	10 10                	adc    BYTE PTR [eax],dl
c0009fa6:	10 10                	adc    BYTE PTR [eax],dl
c0009fa8:	00 60 10             	add    BYTE PTR [eax+0x10],ah
c0009fab:	08 08                	or     BYTE PTR [eax],cl
c0009fad:	08 08                	or     BYTE PTR [eax],cl
c0009faf:	06                   	push   es
c0009fb0:	08 08                	or     BYTE PTR [eax],cl
c0009fb2:	08 08                	or     BYTE PTR [eax],cl
c0009fb4:	10 60 00             	adc    BYTE PTR [eax+0x0],ah
c0009fb7:	00 00                	add    BYTE PTR [eax],al
c0009fb9:	72 8c                	jb     c0009f47 <PKnFont+0x76f>
	...

c000a7d8 <intr_entry_table>:
	...

c000a894 <put_int_buffer>:
	...

Disassembly of section .eh_frame:

c000a89c <.eh_frame>:
c000a89c:	10 00                	adc    BYTE PTR [eax],al
c000a89e:	00 00                	add    BYTE PTR [eax],al
c000a8a0:	00 00                	add    BYTE PTR [eax],al
c000a8a2:	00 00                	add    BYTE PTR [eax],al
c000a8a4:	01 00                	add    DWORD PTR [eax],eax
c000a8a6:	01 7c 08 0c          	add    DWORD PTR [eax+ecx*1+0xc],edi
c000a8aa:	04 04                	add    al,0x4
c000a8ac:	88 01                	mov    BYTE PTR [ecx],al
c000a8ae:	00 00                	add    BYTE PTR [eax],al
c000a8b0:	a0 01 00 00 18       	mov    al,ds:0x18000001
c000a8b5:	00 00                	add    BYTE PTR [eax],al
c000a8b7:	00 58 7f             	add    BYTE PTR [eax+0x7f],bl
c000a8ba:	00 c0                	add    al,al
c000a8bc:	39 03                	cmp    DWORD PTR [ebx],eax
c000a8be:	00 00                	add    BYTE PTR [eax],al
c000a8c0:	41                   	inc    ecx
c000a8c1:	0e                   	push   cs
c000a8c2:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000a8c8:	42                   	inc    edx
c000a8c9:	83 04 86 03          	add    DWORD PTR [esi+eax*4],0x3
c000a8cd:	49                   	dec    ecx
c000a8ce:	2e 0c 45             	cs or  al,0x45
c000a8d1:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000a8d5:	00 4f 2e             	add    BYTE PTR [edi+0x2e],cl
c000a8d8:	04 04                	add    al,0x4
c000a8da:	07                   	pop    es
c000a8db:	00 00                	add    BYTE PTR [eax],al
c000a8dd:	00 2e                	add    BYTE PTR [esi],ch
c000a8df:	08 47 2e             	or     BYTE PTR [edi+0x2e],al
c000a8e2:	0c 49                	or     al,0x49
c000a8e4:	2e 10 41 2e          	adc    BYTE PTR cs:[ecx+0x2e],al
c000a8e8:	14 41                	adc    al,0x41
c000a8ea:	2e 18 45 2e          	sbb    BYTE PTR cs:[ebp+0x2e],al
c000a8ee:	1c 45                	sbb    al,0x45
c000a8f0:	2e 20 4d 2e          	and    BYTE PTR cs:[ebp+0x2e],cl
c000a8f4:	0c 4c                	or     al,0x4c
c000a8f6:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000a8fa:	14 41                	adc    al,0x41
c000a8fc:	2e 18 4b 2e          	sbb    BYTE PTR cs:[ebx+0x2e],cl
c000a900:	1c 45                	sbb    al,0x45
c000a902:	2e 20 4d 2e          	and    BYTE PTR cs:[ebp+0x2e],cl
c000a906:	0c 4c                	or     al,0x4c
c000a908:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000a90c:	14 41                	adc    al,0x41
c000a90e:	2e 18 4b 2e          	sbb    BYTE PTR cs:[ebx+0x2e],cl
c000a912:	1c 45                	sbb    al,0x45
c000a914:	2e 20 4d 2e          	and    BYTE PTR cs:[ebp+0x2e],cl
c000a918:	0c 4c                	or     al,0x4c
c000a91a:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000a91e:	14 41                	adc    al,0x41
c000a920:	2e 18 4b 2e          	sbb    BYTE PTR cs:[ebx+0x2e],cl
c000a924:	1c 45                	sbb    al,0x45
c000a926:	2e 20 4d 2e          	and    BYTE PTR cs:[ebp+0x2e],cl
c000a92a:	0c 47                	or     al,0x47
c000a92c:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000a930:	14 41                	adc    al,0x41
c000a932:	2e 18 4b 2e          	sbb    BYTE PTR cs:[ebx+0x2e],cl
c000a936:	1c 45                	sbb    al,0x45
c000a938:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000a93c:	0c 42                	or     al,0x42
c000a93e:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000a942:	14 41                	adc    al,0x41
c000a944:	2e 18 4b 2e          	sbb    BYTE PTR cs:[ebx+0x2e],cl
c000a948:	1c 45                	sbb    al,0x45
c000a94a:	2e 20 4d 2e          	and    BYTE PTR cs:[ebp+0x2e],cl
c000a94e:	0c 4c                	or     al,0x4c
c000a950:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000a954:	14 41                	adc    al,0x41
c000a956:	2e 18 4b 2e          	sbb    BYTE PTR cs:[ebx+0x2e],cl
c000a95a:	1c 45                	sbb    al,0x45
c000a95c:	2e 20 4d 2e          	and    BYTE PTR cs:[ebp+0x2e],cl
c000a960:	0c 47                	or     al,0x47
c000a962:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000a966:	14 41                	adc    al,0x41
c000a968:	2e 18 4b 2e          	sbb    BYTE PTR cs:[ebx+0x2e],cl
c000a96c:	1c 45                	sbb    al,0x45
c000a96e:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000a972:	0c 42                	or     al,0x42
c000a974:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000a978:	14 41                	adc    al,0x41
c000a97a:	2e 18 4b 2e          	sbb    BYTE PTR cs:[ebx+0x2e],cl
c000a97e:	1c 45                	sbb    al,0x45
c000a980:	2e 20 4d 2e          	and    BYTE PTR cs:[ebp+0x2e],cl
c000a984:	0c 4c                	or     al,0x4c
c000a986:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000a98a:	14 41                	adc    al,0x41
c000a98c:	2e 18 49 2e          	sbb    BYTE PTR cs:[ecx+0x2e],cl
c000a990:	1c 45                	sbb    al,0x45
c000a992:	2e 20 4d 2e          	and    BYTE PTR cs:[ebp+0x2e],cl
c000a996:	0c 47                	or     al,0x47
c000a998:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000a99c:	14 41                	adc    al,0x41
c000a99e:	2e 18 49 2e          	sbb    BYTE PTR cs:[ecx+0x2e],cl
c000a9a2:	1c 45                	sbb    al,0x45
c000a9a4:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000a9a8:	0c 42                	or     al,0x42
c000a9aa:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000a9ae:	14 41                	adc    al,0x41
c000a9b0:	2e 18 49 2e          	sbb    BYTE PTR cs:[ecx+0x2e],cl
c000a9b4:	1c 45                	sbb    al,0x45
c000a9b6:	2e 20 4d 2e          	and    BYTE PTR cs:[ebp+0x2e],cl
c000a9ba:	0c 4c                	or     al,0x4c
c000a9bc:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000a9c0:	14 41                	adc    al,0x41
c000a9c2:	2e 18 49 2e          	sbb    BYTE PTR cs:[ecx+0x2e],cl
c000a9c6:	1c 45                	sbb    al,0x45
c000a9c8:	2e 20 4d 2e          	and    BYTE PTR cs:[ebp+0x2e],cl
c000a9cc:	0c 47                	or     al,0x47
c000a9ce:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000a9d2:	14 41                	adc    al,0x41
c000a9d4:	2e 18 49 2e          	sbb    BYTE PTR cs:[ecx+0x2e],cl
c000a9d8:	1c 45                	sbb    al,0x45
c000a9da:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000a9de:	0c 42                	or     al,0x42
c000a9e0:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000a9e4:	14 41                	adc    al,0x41
c000a9e6:	2e 18 49 2e          	sbb    BYTE PTR cs:[ecx+0x2e],cl
c000a9ea:	1c 45                	sbb    al,0x45
c000a9ec:	2e 20 4d 2e          	and    BYTE PTR cs:[ebp+0x2e],cl
c000a9f0:	0c 4c                	or     al,0x4c
c000a9f2:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000a9f6:	14 41                	adc    al,0x41
c000a9f8:	2e 18 49 2e          	sbb    BYTE PTR cs:[ecx+0x2e],cl
c000a9fc:	1c 45                	sbb    al,0x45
c000a9fe:	2e 20 4d 2e          	and    BYTE PTR cs:[ebp+0x2e],cl
c000aa02:	0c 47                	or     al,0x47
c000aa04:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000aa08:	14 41                	adc    al,0x41
c000aa0a:	2e 18 49 2e          	sbb    BYTE PTR cs:[ecx+0x2e],cl
c000aa0e:	1c 45                	sbb    al,0x45
c000aa10:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000aa14:	0c 42                	or     al,0x42
c000aa16:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000aa1a:	14 41                	adc    al,0x41
c000aa1c:	2e 18 49 2e          	sbb    BYTE PTR cs:[ecx+0x2e],cl
c000aa20:	1c 45                	sbb    al,0x45
c000aa22:	2e 20 4d 2e          	and    BYTE PTR cs:[ebp+0x2e],cl
c000aa26:	0c 4c                	or     al,0x4c
c000aa28:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000aa2c:	14 41                	adc    al,0x41
c000aa2e:	2e 18 49 2e          	sbb    BYTE PTR cs:[ecx+0x2e],cl
c000aa32:	1c 45                	sbb    al,0x45
c000aa34:	2e 20 4d 2e          	and    BYTE PTR cs:[ebp+0x2e],cl
c000aa38:	0c 47                	or     al,0x47
c000aa3a:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000aa3e:	14 41                	adc    al,0x41
c000aa40:	2e 18 49 2e          	sbb    BYTE PTR cs:[ecx+0x2e],cl
c000aa44:	1c 45                	sbb    al,0x45
c000aa46:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000aa4a:	00 45 2e             	add    BYTE PTR [ebp+0x2e],al
c000aa4d:	0c 45                	or     al,0x45
c000aa4f:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000aa53:	00 70 01             	add    BYTE PTR [eax+0x1],dh
c000aa56:	00 00                	add    BYTE PTR [eax],al
c000aa58:	bc 01 00 00 91       	mov    esp,0x91000001
c000aa5d:	82                   	(bad)  
c000aa5e:	00 c0                	add    al,al
c000aa60:	d7                   	xlat   BYTE PTR ds:[ebx]
c000aa61:	02 00                	add    al,BYTE PTR [eax]
c000aa63:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000aa66:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000aa6c:	50                   	push   eax
c000aa6d:	2e 0c 45             	cs or  al,0x45
c000aa70:	2e 10 02             	adc    BYTE PTR cs:[edx],al
c000aa73:	e9 2e 14 42 2e       	jmp    ee42bea6 <_kernel_end+0x2e400eb2>
c000aa78:	18 42 2e             	sbb    BYTE PTR [edx+0x2e],al
c000aa7b:	1c 45                	sbb    al,0x45
c000aa7d:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000aa81:	0c 42                	or     al,0x42
c000aa83:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000aa87:	14 42                	adc    al,0x42
c000aa89:	2e 18 42 2e          	sbb    BYTE PTR cs:[edx+0x2e],al
c000aa8d:	1c 45                	sbb    al,0x45
c000aa8f:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000aa93:	0c 42                	or     al,0x42
c000aa95:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000aa99:	14 42                	adc    al,0x42
c000aa9b:	2e 18 42 2e          	sbb    BYTE PTR cs:[edx+0x2e],al
c000aa9f:	1c 45                	sbb    al,0x45
c000aaa1:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000aaa5:	0c 42                	or     al,0x42
c000aaa7:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000aaab:	14 42                	adc    al,0x42
c000aaad:	2e 18 42 2e          	sbb    BYTE PTR cs:[edx+0x2e],al
c000aab1:	1c 45                	sbb    al,0x45
c000aab3:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000aab7:	0c 42                	or     al,0x42
c000aab9:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000aabd:	14 42                	adc    al,0x42
c000aabf:	2e 18 42 2e          	sbb    BYTE PTR cs:[edx+0x2e],al
c000aac3:	1c 45                	sbb    al,0x45
c000aac5:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000aac9:	0c 42                	or     al,0x42
c000aacb:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000aacf:	14 42                	adc    al,0x42
c000aad1:	2e 18 42 2e          	sbb    BYTE PTR cs:[edx+0x2e],al
c000aad5:	1c 45                	sbb    al,0x45
c000aad7:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000aadb:	0c 42                	or     al,0x42
c000aadd:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000aae1:	14 42                	adc    al,0x42
c000aae3:	2e 18 42 2e          	sbb    BYTE PTR cs:[edx+0x2e],al
c000aae7:	1c 45                	sbb    al,0x45
c000aae9:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000aaed:	0c 42                	or     al,0x42
c000aaef:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000aaf3:	14 42                	adc    al,0x42
c000aaf5:	2e 18 42 2e          	sbb    BYTE PTR cs:[edx+0x2e],al
c000aaf9:	1c 45                	sbb    al,0x45
c000aafb:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000aaff:	0c 42                	or     al,0x42
c000ab01:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000ab05:	14 42                	adc    al,0x42
c000ab07:	2e 18 42 2e          	sbb    BYTE PTR cs:[edx+0x2e],al
c000ab0b:	1c 45                	sbb    al,0x45
c000ab0d:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ab11:	0c 42                	or     al,0x42
c000ab13:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000ab17:	14 42                	adc    al,0x42
c000ab19:	2e 18 42 2e          	sbb    BYTE PTR cs:[edx+0x2e],al
c000ab1d:	1c 45                	sbb    al,0x45
c000ab1f:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ab23:	0c 42                	or     al,0x42
c000ab25:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000ab29:	14 42                	adc    al,0x42
c000ab2b:	2e 18 42 2e          	sbb    BYTE PTR cs:[edx+0x2e],al
c000ab2f:	1c 45                	sbb    al,0x45
c000ab31:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ab35:	0c 42                	or     al,0x42
c000ab37:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000ab3b:	14 42                	adc    al,0x42
c000ab3d:	2e 18 45 2e          	sbb    BYTE PTR cs:[ebp+0x2e],al
c000ab41:	1c 45                	sbb    al,0x45
c000ab43:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ab47:	0c 42                	or     al,0x42
c000ab49:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000ab4d:	14 42                	adc    al,0x42
c000ab4f:	2e 18 45 2e          	sbb    BYTE PTR cs:[ebp+0x2e],al
c000ab53:	1c 45                	sbb    al,0x45
c000ab55:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ab59:	0c 42                	or     al,0x42
c000ab5b:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000ab5f:	14 42                	adc    al,0x42
c000ab61:	2e 18 45 2e          	sbb    BYTE PTR cs:[ebp+0x2e],al
c000ab65:	1c 45                	sbb    al,0x45
c000ab67:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ab6b:	0c 42                	or     al,0x42
c000ab6d:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000ab71:	14 42                	adc    al,0x42
c000ab73:	2e 18 45 2e          	sbb    BYTE PTR cs:[ebp+0x2e],al
c000ab77:	1c 45                	sbb    al,0x45
c000ab79:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ab7d:	0c 42                	or     al,0x42
c000ab7f:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000ab83:	14 42                	adc    al,0x42
c000ab85:	2e 18 45 2e          	sbb    BYTE PTR cs:[ebp+0x2e],al
c000ab89:	1c 45                	sbb    al,0x45
c000ab8b:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ab8f:	0c 42                	or     al,0x42
c000ab91:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000ab95:	14 42                	adc    al,0x42
c000ab97:	2e 18 45 2e          	sbb    BYTE PTR cs:[ebp+0x2e],al
c000ab9b:	1c 45                	sbb    al,0x45
c000ab9d:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000aba1:	0c 42                	or     al,0x42
c000aba3:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000aba7:	14 42                	adc    al,0x42
c000aba9:	2e 18 45 2e          	sbb    BYTE PTR cs:[ebp+0x2e],al
c000abad:	1c 45                	sbb    al,0x45
c000abaf:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000abb3:	00 42 2e             	add    BYTE PTR [edx+0x2e],al
c000abb6:	04 04                	add    al,0x4
c000abb8:	05 00 00 00 2e       	add    eax,0x2e000000
c000abbd:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000abc0:	0c 45                	or     al,0x45
c000abc2:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000abc6:	00 00                	add    BYTE PTR [eax],al
c000abc8:	2c 00                	sub    al,0x0
c000abca:	00 00                	add    BYTE PTR [eax],al
c000abcc:	30 03                	xor    BYTE PTR [ebx],al
c000abce:	00 00                	add    BYTE PTR [eax],al
c000abd0:	68 85 00 c0 1a       	push   0x1ac00085
c000abd5:	00 00                	add    BYTE PTR [eax],al
c000abd7:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000abda:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000abe0:	43                   	inc    ebx
c000abe1:	2e 04 04             	cs add al,0x4
c000abe4:	05 00 00 00 2e       	add    eax,0x2e000000
c000abe9:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000abec:	0c 43                	or     al,0x43
c000abee:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000abf2:	00 41 c5             	add    BYTE PTR [ecx-0x3b],al
c000abf5:	0c 04                	or     al,0x4
c000abf7:	04 1c                	add    al,0x1c
c000abf9:	00 00                	add    BYTE PTR [eax],al
c000abfb:	00 60 03             	add    BYTE PTR [eax+0x3],ah
c000abfe:	00 00                	add    BYTE PTR [eax],al
c000ac00:	82                   	(bad)  
c000ac01:	85 00                	test   DWORD PTR [eax],eax
c000ac03:	c0 23 00             	shl    BYTE PTR [ebx],0x0
c000ac06:	00 00                	add    BYTE PTR [eax],al
c000ac08:	41                   	inc    ecx
c000ac09:	0e                   	push   cs
c000ac0a:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ac10:	47                   	inc    edi
c000ac11:	0c 04                	or     al,0x4
c000ac13:	04 c5                	add    al,0xc5
c000ac15:	00 00                	add    BYTE PTR [eax],al
c000ac17:	00 50 00             	add    BYTE PTR [eax+0x0],dl
c000ac1a:	00 00                	add    BYTE PTR [eax],al
c000ac1c:	80 03 00             	add    BYTE PTR [ebx],0x0
c000ac1f:	00 a5 85 00 c0 be    	add    BYTE PTR [ebp-0x413fff7b],ah
c000ac25:	00 00                	add    BYTE PTR [eax],al
c000ac27:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000ac2a:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ac30:	42                   	inc    edx
c000ac31:	86 04 87             	xchg   BYTE PTR [edi+eax*4],al
c000ac34:	03 46 83             	add    eax,DWORD PTR [esi-0x7d]
c000ac37:	05 5c 2e 04 04       	add    eax,0x4042e5c
c000ac3c:	05 00 00 00 2e       	add    eax,0x2e000000
c000ac41:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000ac44:	0c 45                	or     al,0x45
c000ac46:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000ac4a:	00 02                	add    BYTE PTR [edx],al
c000ac4c:	4e                   	dec    esi
c000ac4d:	2e 04 04             	cs add al,0x4
c000ac50:	02 00                	add    al,BYTE PTR [eax]
c000ac52:	00 00                	add    BYTE PTR [eax],al
c000ac54:	2e 08 41 2e          	or     BYTE PTR cs:[ecx+0x2e],al
c000ac58:	0c 41                	or     al,0x41
c000ac5a:	2e 10 4b 2e          	adc    BYTE PTR cs:[ebx+0x2e],cl
c000ac5e:	00 62 c3             	add    BYTE PTR [edx-0x3d],ah
c000ac61:	41                   	inc    ecx
c000ac62:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000ac66:	0c 04                	or     al,0x4
c000ac68:	04 c5                	add    al,0xc5
c000ac6a:	00 00                	add    BYTE PTR [eax],al
c000ac6c:	3c 00                	cmp    al,0x0
c000ac6e:	00 00                	add    BYTE PTR [eax],al
c000ac70:	d4 03                	aam    0x3
c000ac72:	00 00                	add    BYTE PTR [eax],al
c000ac74:	63 86 00 c0 68 00    	arpl   WORD PTR [esi+0x68c000],ax
c000ac7a:	00 00                	add    BYTE PTR [eax],al
c000ac7c:	41                   	inc    ecx
c000ac7d:	0e                   	push   cs
c000ac7e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ac84:	46                   	inc    esi
c000ac85:	83 05 86 04 87 03 53 	add    DWORD PTR ds:0x3870486,0x53
c000ac8c:	2e 04 04             	cs add al,0x4
c000ac8f:	05 00 00 00 2e       	add    eax,0x2e000000
c000ac94:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000ac97:	0c 45                	or     al,0x45
c000ac99:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000ac9d:	00 74 c3 41          	add    BYTE PTR [ebx+eax*8+0x41],dh
c000aca1:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000aca5:	0c 04                	or     al,0x4
c000aca7:	04 c5                	add    al,0xc5
c000aca9:	00 00                	add    BYTE PTR [eax],al
c000acab:	00 38                	add    BYTE PTR [eax],bh
c000acad:	00 00                	add    BYTE PTR [eax],al
c000acaf:	00 14 04             	add    BYTE PTR [esp+eax*1],dl
c000acb2:	00 00                	add    BYTE PTR [eax],al
c000acb4:	cc                   	int3   
c000acb5:	86 00                	xchg   BYTE PTR [eax],al
c000acb7:	c0 a1 00 00 00 41 0e 	shl    BYTE PTR [ecx+0x41000000],0xe
c000acbe:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000acc4:	4b                   	dec    ebx
c000acc5:	2e 0c 45             	cs or  al,0x45
c000acc8:	2e 10 52 2e          	adc    BYTE PTR cs:[edx+0x2e],dl
c000accc:	0c 43                	or     al,0x43
c000acce:	2e 10 5e 2e          	adc    BYTE PTR cs:[esi+0x2e],bl
c000acd2:	0c 43                	or     al,0x43
c000acd4:	2e 10 5e 2e          	adc    BYTE PTR cs:[esi+0x2e],bl
c000acd8:	0c 43                	or     al,0x43
c000acda:	2e 10 5e 2e          	adc    BYTE PTR cs:[esi+0x2e],bl
c000acde:	0c 43                	or     al,0x43
c000ace0:	2e 10 54 2e 00       	adc    BYTE PTR cs:[esi+ebp*1+0x0],dl
c000ace5:	00 00                	add    BYTE PTR [eax],al
c000ace7:	00 28                	add    BYTE PTR [eax],ch
c000ace9:	00 00                	add    BYTE PTR [eax],al
c000aceb:	00 50 04             	add    BYTE PTR [eax+0x4],dl
c000acee:	00 00                	add    BYTE PTR [eax],al
c000acf0:	70 87                	jo     c000ac79 <_edata+0x3dd>
c000acf2:	00 c0                	add    al,al
c000acf4:	4d                   	dec    ebp
c000acf5:	00 00                	add    BYTE PTR [eax],al
c000acf7:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000acfa:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ad00:	49                   	dec    ecx
c000ad01:	83 05 86 04 87 03 7d 	add    DWORD PTR ds:0x3870486,0x7d
c000ad08:	c3                   	ret    
c000ad09:	41                   	inc    ecx
c000ad0a:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000ad0e:	0c 04                	or     al,0x4
c000ad10:	04 c5                	add    al,0xc5
c000ad12:	00 00                	add    BYTE PTR [eax],al
c000ad14:	1c 00                	sbb    al,0x0
c000ad16:	00 00                	add    BYTE PTR [eax],al
c000ad18:	7c 04                	jl     c000ad1e <_edata+0x482>
c000ad1a:	00 00                	add    BYTE PTR [eax],al
c000ad1c:	bd 87 00 c0 25       	mov    ebp,0x25c00087
c000ad21:	00 00                	add    BYTE PTR [eax],al
c000ad23:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000ad26:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ad2c:	61                   	popa   
c000ad2d:	0c 04                	or     al,0x4
c000ad2f:	04 c5                	add    al,0xc5
c000ad31:	00 00                	add    BYTE PTR [eax],al
c000ad33:	00 a0 00 00 00 9c    	add    BYTE PTR [eax-0x64000000],ah
c000ad39:	04 00                	add    al,0x0
c000ad3b:	00 e2                	add    dl,ah
c000ad3d:	87 00                	xchg   DWORD PTR [eax],eax
c000ad3f:	c0 f8 00             	sar    al,0x0
c000ad42:	00 00                	add    BYTE PTR [eax],al
c000ad44:	41                   	inc    ecx
c000ad45:	0e                   	push   cs
c000ad46:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ad4c:	41                   	inc    ecx
c000ad4d:	83 03 7e             	add    DWORD PTR [ebx],0x7e
c000ad50:	2e 04 04             	cs add al,0x4
c000ad53:	07                   	pop    es
c000ad54:	00 00                	add    BYTE PTR [eax],al
c000ad56:	00 2e                	add    BYTE PTR [esi],ch
c000ad58:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000ad5b:	0c 42                	or     al,0x42
c000ad5d:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000ad61:	14 41                	adc    al,0x41
c000ad63:	2e 18 51 2e          	sbb    BYTE PTR cs:[ecx+0x2e],dl
c000ad67:	1c 48                	sbb    al,0x48
c000ad69:	2e 20 41 2e          	and    BYTE PTR cs:[ecx+0x2e],al
c000ad6d:	24 42                	and    al,0x42
c000ad6f:	2e 28 45 2e          	sub    BYTE PTR cs:[ebp+0x2e],al
c000ad73:	2c 41                	sub    al,0x41
c000ad75:	2e 30 4d 2e          	xor    BYTE PTR cs:[ebp+0x2e],cl
c000ad79:	00 47 2e             	add    BYTE PTR [edi+0x2e],al
c000ad7c:	04 04                	add    al,0x4
c000ad7e:	02 00                	add    al,BYTE PTR [eax]
c000ad80:	00 00                	add    BYTE PTR [eax],al
c000ad82:	2e 08 41 2e          	or     BYTE PTR cs:[ecx+0x2e],al
c000ad86:	0c 42                	or     al,0x42
c000ad88:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000ad8c:	14 41                	adc    al,0x41
c000ad8e:	2e 18 51 2e          	sbb    BYTE PTR cs:[ecx+0x2e],dl
c000ad92:	1c 42                	sbb    al,0x42
c000ad94:	2e 20 41 2e          	and    BYTE PTR cs:[ecx+0x2e],al
c000ad98:	24 42                	and    al,0x42
c000ad9a:	2e 28 45 2e          	sub    BYTE PTR cs:[ebp+0x2e],al
c000ad9e:	2c 41                	sub    al,0x41
c000ada0:	2e 30 4d 2e          	xor    BYTE PTR cs:[ebp+0x2e],cl
c000ada4:	00 47 2e             	add    BYTE PTR [edi+0x2e],al
c000ada7:	04 04                	add    al,0x4
c000ada9:	02 00                	add    al,BYTE PTR [eax]
c000adab:	00 00                	add    BYTE PTR [eax],al
c000adad:	2e 08 41 2e          	or     BYTE PTR cs:[ecx+0x2e],al
c000adb1:	0c 42                	or     al,0x42
c000adb3:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000adb7:	14 41                	adc    al,0x41
c000adb9:	2e 18 51 2e          	sbb    BYTE PTR cs:[ecx+0x2e],dl
c000adbd:	1c 42                	sbb    al,0x42
c000adbf:	2e 20 41 2e          	and    BYTE PTR cs:[ecx+0x2e],al
c000adc3:	24 42                	and    al,0x42
c000adc5:	2e 28 45 2e          	sub    BYTE PTR cs:[ebp+0x2e],al
c000adc9:	2c 41                	sub    al,0x41
c000adcb:	2e 30 48 2e          	xor    BYTE PTR cs:[eax+0x2e],cl
c000adcf:	00 44 c5 0c          	add    BYTE PTR [ebp+eax*8+0xc],al
c000add3:	04 04                	add    al,0x4
c000add5:	c3                   	ret    
c000add6:	00 00                	add    BYTE PTR [eax],al
c000add8:	28 00                	sub    BYTE PTR [eax],al
c000adda:	00 00                	add    BYTE PTR [eax],al
c000addc:	40                   	inc    eax
c000addd:	05 00 00 da 88       	add    eax,0x88da0000
c000ade2:	00 c0                	add    al,al
c000ade4:	8b 00                	mov    eax,DWORD PTR [eax]
c000ade6:	00 00                	add    BYTE PTR [eax],al
c000ade8:	41                   	inc    ecx
c000ade9:	0e                   	push   cs
c000adea:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000adf0:	43                   	inc    ebx
c000adf1:	83 05 86 04 87 03 02 	add    DWORD PTR ds:0x3870486,0x2
c000adf8:	81 c3 41 c6 41 c7    	add    ebx,0xc741c641
c000adfe:	41                   	inc    ecx
c000adff:	0c 04                	or     al,0x4
c000ae01:	04 c5                	add    al,0xc5
c000ae03:	00 44 00 00          	add    BYTE PTR [eax+eax*1+0x0],al
c000ae07:	00 6c 05 00          	add    BYTE PTR [ebp+eax*1+0x0],ch
c000ae0b:	00 65 89             	add    BYTE PTR [ebp-0x77],ah
c000ae0e:	00 c0                	add    al,al
c000ae10:	38 00                	cmp    BYTE PTR [eax],al
c000ae12:	00 00                	add    BYTE PTR [eax],al
c000ae14:	41                   	inc    ecx
c000ae15:	0e                   	push   cs
c000ae16:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ae1c:	41                   	inc    ecx
c000ae1d:	87 03                	xchg   DWORD PTR [ebx],eax
c000ae1f:	44                   	inc    esp
c000ae20:	86 04 04             	xchg   BYTE PTR [esp+eax*1],al
c000ae23:	04 00                	add    al,0x0
c000ae25:	00 00                	add    BYTE PTR [eax],al
c000ae27:	83 05 49 2e 04 04 01 	add    DWORD PTR ds:0x4042e49,0x1
c000ae2e:	00 00                	add    BYTE PTR [eax],al
c000ae30:	00 2e                	add    BYTE PTR [esi],ch
c000ae32:	08 43 2e             	or     BYTE PTR [ebx+0x2e],al
c000ae35:	0c 41                	or     al,0x41
c000ae37:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000ae3b:	14 48                	adc    al,0x48
c000ae3d:	2e 00 4c c3 41       	add    BYTE PTR cs:[ebx+eax*8+0x41],cl
c000ae42:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000ae46:	0c 04                	or     al,0x4
c000ae48:	04 c5                	add    al,0xc5
c000ae4a:	00 00                	add    BYTE PTR [eax],al
c000ae4c:	24 00                	and    al,0x0
c000ae4e:	00 00                	add    BYTE PTR [eax],al
c000ae50:	b4 05                	mov    ah,0x5
c000ae52:	00 00                	add    BYTE PTR [eax],al
c000ae54:	a0 89 00 c0 27       	mov    al,ds:0x27c00089
c000ae59:	00 00                	add    BYTE PTR [eax],al
c000ae5b:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000ae5e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ae64:	55                   	push   ebp
c000ae65:	2e 0c 45             	cs or  al,0x45
c000ae68:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000ae6c:	00 41 c5             	add    BYTE PTR [ecx-0x3b],al
c000ae6f:	0c 04                	or     al,0x4
c000ae71:	04 00                	add    al,0x0
c000ae73:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000ae76:	00 00                	add    BYTE PTR [eax],al
c000ae78:	dc 05 00 00 e8 89    	fadd   QWORD PTR ds:0x89e80000
c000ae7e:	00 c0                	add    al,al
c000ae80:	3d 00 00 00 41       	cmp    eax,0x41000000
c000ae85:	0e                   	push   cs
c000ae86:	08 85 02 47 0d 05    	or     BYTE PTR [ebp+0x50d4702],al
c000ae8c:	74 0c                	je     c000ae9a <_edata+0x5fe>
c000ae8e:	04 04                	add    al,0x4
c000ae90:	c5 00                	lds    eax,FWORD PTR [eax]
c000ae92:	00 00                	add    BYTE PTR [eax],al
c000ae94:	1c 00                	sbb    al,0x0
c000ae96:	00 00                	add    BYTE PTR [eax],al
c000ae98:	fc                   	cld    
c000ae99:	05 00 00 25 8a       	add    eax,0x8a250000
c000ae9e:	00 c0                	add    al,al
c000aea0:	42                   	inc    edx
c000aea1:	00 00                	add    BYTE PTR [eax],al
c000aea3:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000aea6:	08 85 02 44 0d 05    	or     BYTE PTR [ebp+0x50d4402],al
c000aeac:	7c 0c                	jl     c000aeba <_edata+0x61e>
c000aeae:	04 04                	add    al,0x4
c000aeb0:	c5 00                	lds    eax,FWORD PTR [eax]
c000aeb2:	00 00                	add    BYTE PTR [eax],al
c000aeb4:	20 00                	and    BYTE PTR [eax],al
c000aeb6:	00 00                	add    BYTE PTR [eax],al
c000aeb8:	1c 06                	sbb    al,0x6
c000aeba:	00 00                	add    BYTE PTR [eax],al
c000aebc:	67 8a 00             	mov    al,BYTE PTR [bx+si]
c000aebf:	c0 2c 00 00          	shr    BYTE PTR [eax+eax*1],0x0
c000aec3:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000aec6:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000aecc:	44                   	inc    esp
c000aecd:	83 03 63             	add    DWORD PTR [ebx],0x63
c000aed0:	c3                   	ret    
c000aed1:	41                   	inc    ecx
c000aed2:	0c 04                	or     al,0x4
c000aed4:	04 c5                	add    al,0xc5
c000aed6:	00 00                	add    BYTE PTR [eax],al
c000aed8:	38 00                	cmp    BYTE PTR [eax],al
c000aeda:	00 00                	add    BYTE PTR [eax],al
c000aedc:	40                   	inc    eax
c000aedd:	06                   	push   es
c000aede:	00 00                	add    BYTE PTR [eax],al
c000aee0:	93                   	xchg   ebx,eax
c000aee1:	8a 00                	mov    al,BYTE PTR [eax]
c000aee3:	c0 5b 00 00          	rcr    BYTE PTR [ebx+0x0],0x0
c000aee7:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000aeea:	08 85 02 47 0d 05    	or     BYTE PTR [ebp+0x50d4702],al
c000aef0:	44                   	inc    esp
c000aef1:	83 04 86 03          	add    DWORD PTR [esi+eax*4],0x3
c000aef5:	4a                   	dec    edx
c000aef6:	2e 0c 48             	cs or  al,0x48
c000aef9:	2e 10 5c 2e 00       	adc    BYTE PTR cs:[esi+ebp*1+0x0],bl
c000aefe:	53                   	push   ebx
c000aeff:	0a c3                	or     al,bl
c000af01:	41                   	inc    ecx
c000af02:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000af06:	04 c5                	add    al,0xc5
c000af08:	45                   	inc    ebp
c000af09:	0b 44 c3 41          	or     eax,DWORD PTR [ebx+eax*8+0x41]
c000af0d:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000af11:	04 c5                	add    al,0xc5
c000af13:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000af16:	00 00                	add    BYTE PTR [eax],al
c000af18:	7c 06                	jl     c000af20 <_edata+0x684>
c000af1a:	00 00                	add    BYTE PTR [eax],al
c000af1c:	ee                   	out    dx,al
c000af1d:	8a 00                	mov    al,BYTE PTR [eax]
c000af1f:	c0 cd 00             	ror    ch,0x0
c000af22:	00 00                	add    BYTE PTR [eax],al
c000af24:	41                   	inc    ecx
c000af25:	0e                   	push   cs
c000af26:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000af2c:	02 c9                	add    cl,cl
c000af2e:	0c 04                	or     al,0x4
c000af30:	04 c5                	add    al,0xc5
c000af32:	00 00                	add    BYTE PTR [eax],al
c000af34:	1c 00                	sbb    al,0x0
c000af36:	00 00                	add    BYTE PTR [eax],al
c000af38:	9c                   	pushf  
c000af39:	06                   	push   es
c000af3a:	00 00                	add    BYTE PTR [eax],al
c000af3c:	bb 8b 00 c0 32       	mov    ebx,0x32c0008b
c000af41:	00 00                	add    BYTE PTR [eax],al
c000af43:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000af46:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000af4c:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000af4d:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
c000af50:	04 00                	add    al,0x0
c000af52:	00 00                	add    BYTE PTR [eax],al
c000af54:	1c 00                	sbb    al,0x0
c000af56:	00 00                	add    BYTE PTR [eax],al
c000af58:	bc 06 00 00 ed       	mov    esp,0xed000006
c000af5d:	8b 00                	mov    eax,DWORD PTR [eax]
c000af5f:	c0 10 00             	rcl    BYTE PTR [eax],0x0
c000af62:	00 00                	add    BYTE PTR [eax],al
c000af64:	41                   	inc    ecx
c000af65:	0e                   	push   cs
c000af66:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000af6c:	4c                   	dec    esp
c000af6d:	0c 04                	or     al,0x4
c000af6f:	04 c5                	add    al,0xc5
c000af71:	00 00                	add    BYTE PTR [eax],al
c000af73:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000af76:	00 00                	add    BYTE PTR [eax],al
c000af78:	dc 06                	fadd   QWORD PTR [esi]
c000af7a:	00 00                	add    BYTE PTR [eax],al
c000af7c:	fd                   	std    
c000af7d:	8b 00                	mov    eax,DWORD PTR [eax]
c000af7f:	c0 14 00 00          	rcl    BYTE PTR [eax+eax*1],0x0
c000af83:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000af86:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000af8c:	50                   	push   eax
c000af8d:	0c 04                	or     al,0x4
c000af8f:	04 c5                	add    al,0xc5
c000af91:	00 00                	add    BYTE PTR [eax],al
c000af93:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000af96:	00 00                	add    BYTE PTR [eax],al
c000af98:	fc                   	cld    
c000af99:	06                   	push   es
c000af9a:	00 00                	add    BYTE PTR [eax],al
c000af9c:	11 8c 00 c0 17 00 00 	adc    DWORD PTR [eax+eax*1+0x17c0],ecx
c000afa3:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000afa6:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000afac:	53                   	push   ebx
c000afad:	0c 04                	or     al,0x4
c000afaf:	04 c5                	add    al,0xc5
c000afb1:	00 00                	add    BYTE PTR [eax],al
c000afb3:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
c000afb6:	00 00                	add    BYTE PTR [eax],al
c000afb8:	1c 07                	sbb    al,0x7
c000afba:	00 00                	add    BYTE PTR [eax],al
c000afbc:	28 8c 00 c0 15 00 00 	sub    BYTE PTR [eax+eax*1+0x15c0],cl
c000afc3:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000afc6:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000afcc:	47                   	inc    edi
c000afcd:	0a 0c 04             	or     cl,BYTE PTR [esp+eax*1]
c000afd0:	04 c5                	add    al,0xc5
c000afd2:	45                   	inc    ebp
c000afd3:	0b 41 0c             	or     eax,DWORD PTR [ecx+0xc]
c000afd6:	04 04                	add    al,0x4
c000afd8:	c5 00                	lds    eax,FWORD PTR [eax]
c000afda:	00 00                	add    BYTE PTR [eax],al
c000afdc:	1c 00                	sbb    al,0x0
c000afde:	00 00                	add    BYTE PTR [eax],al
c000afe0:	44                   	inc    esp
c000afe1:	07                   	pop    es
c000afe2:	00 00                	add    BYTE PTR [eax],al
c000afe4:	40                   	inc    eax
c000afe5:	8c 00                	mov    WORD PTR [eax],es
c000afe7:	c0 1e 00             	rcr    BYTE PTR [esi],0x0
c000afea:	00 00                	add    BYTE PTR [eax],al
c000afec:	41                   	inc    ecx
c000afed:	0e                   	push   cs
c000afee:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000aff4:	5a                   	pop    edx
c000aff5:	0c 04                	or     al,0x4
c000aff7:	04 c5                	add    al,0xc5
c000aff9:	00 00                	add    BYTE PTR [eax],al
c000affb:	00 28                	add    BYTE PTR [eax],ch
c000affd:	00 00                	add    BYTE PTR [eax],al
c000afff:	00 64 07 00          	add    BYTE PTR [edi+eax*1+0x0],ah
c000b003:	00 5e 8c             	add    BYTE PTR [esi-0x74],bl
c000b006:	00 c0                	add    al,al
c000b008:	29 00                	sub    DWORD PTR [eax],eax
c000b00a:	00 00                	add    BYTE PTR [eax],al
c000b00c:	41                   	inc    ecx
c000b00d:	0e                   	push   cs
c000b00e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b014:	41                   	inc    ecx
c000b015:	86 03                	xchg   BYTE PTR [ebx],al
c000b017:	44                   	inc    esp
c000b018:	83 04 04 1a          	add    DWORD PTR [esp+eax*1],0x1a
c000b01c:	00 00                	add    BYTE PTR [eax],al
c000b01e:	00 c3                	add    bl,al
c000b020:	41                   	inc    ecx
c000b021:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000b025:	04 c5                	add    al,0xc5
c000b027:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b02a:	00 00                	add    BYTE PTR [eax],al
c000b02c:	90                   	nop
c000b02d:	07                   	pop    es
c000b02e:	00 00                	add    BYTE PTR [eax],al
c000b030:	87 8c 00 c0 18 00 00 	xchg   DWORD PTR [eax+eax*1+0x18c0],ecx
c000b037:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b03a:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b040:	50                   	push   eax
c000b041:	0c 04                	or     al,0x4
c000b043:	04 c5                	add    al,0xc5
c000b045:	00 00                	add    BYTE PTR [eax],al
c000b047:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b04a:	00 00                	add    BYTE PTR [eax],al
c000b04c:	b0 07                	mov    al,0x7
c000b04e:	00 00                	add    BYTE PTR [eax],al
c000b050:	9f                   	lahf   
c000b051:	8c 00                	mov    WORD PTR [eax],es
c000b053:	c0 18 00             	rcr    BYTE PTR [eax],0x0
c000b056:	00 00                	add    BYTE PTR [eax],al
c000b058:	41                   	inc    ecx
c000b059:	0e                   	push   cs
c000b05a:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b060:	50                   	push   eax
c000b061:	0c 04                	or     al,0x4
c000b063:	04 c5                	add    al,0xc5
c000b065:	00 00                	add    BYTE PTR [eax],al
c000b067:	00 28                	add    BYTE PTR [eax],ch
c000b069:	00 00                	add    BYTE PTR [eax],al
c000b06b:	00 d0                	add    al,dl
c000b06d:	07                   	pop    es
c000b06e:	00 00                	add    BYTE PTR [eax],al
c000b070:	b7 8c                	mov    bh,0x8c
c000b072:	00 c0                	add    al,al
c000b074:	3f                   	aas    
c000b075:	00 00                	add    BYTE PTR [eax],al
c000b077:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b07a:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b080:	42                   	inc    edx
c000b081:	83 03 6d             	add    DWORD PTR [ebx],0x6d
c000b084:	2e 0c 41             	cs or  al,0x41
c000b087:	2e 10 4b c5          	adc    BYTE PTR cs:[ebx-0x3b],cl
c000b08b:	0c 04                	or     al,0x4
c000b08d:	04 c3                	add    al,0xc3
c000b08f:	41                   	inc    ecx
c000b090:	13 03                	adc    eax,DWORD PTR [ebx]
c000b092:	2e 00 1c 00          	add    BYTE PTR cs:[eax+eax*1],bl
c000b096:	00 00                	add    BYTE PTR [eax],al
c000b098:	fc                   	cld    
c000b099:	07                   	pop    es
c000b09a:	00 00                	add    BYTE PTR [eax],al
c000b09c:	f6                   	(bad)  
c000b09d:	8c 00                	mov    WORD PTR [eax],es
c000b09f:	c0 12 00             	rcl    BYTE PTR [edx],0x0
c000b0a2:	00 00                	add    BYTE PTR [eax],al
c000b0a4:	41                   	inc    ecx
c000b0a5:	0e                   	push   cs
c000b0a6:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b0ac:	4a                   	dec    edx
c000b0ad:	0c 04                	or     al,0x4
c000b0af:	04 c5                	add    al,0xc5
c000b0b1:	00 00                	add    BYTE PTR [eax],al
c000b0b3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b0b6:	00 00                	add    BYTE PTR [eax],al
c000b0b8:	1c 08                	sbb    al,0x8
c000b0ba:	00 00                	add    BYTE PTR [eax],al
c000b0bc:	08 8d 00 c0 27 00    	or     BYTE PTR [ebp+0x27c000],cl
c000b0c2:	00 00                	add    BYTE PTR [eax],al
c000b0c4:	41                   	inc    ecx
c000b0c5:	0e                   	push   cs
c000b0c6:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b0cc:	63 0c 04             	arpl   WORD PTR [esp+eax*1],cx
c000b0cf:	04 c5                	add    al,0xc5
c000b0d1:	00 00                	add    BYTE PTR [eax],al
c000b0d3:	00 3c 00             	add    BYTE PTR [eax+eax*1],bh
c000b0d6:	00 00                	add    BYTE PTR [eax],al
c000b0d8:	3c 08                	cmp    al,0x8
c000b0da:	00 00                	add    BYTE PTR [eax],al
c000b0dc:	2f                   	das    
c000b0dd:	8d 00                	lea    eax,[eax]
c000b0df:	c0                   	(bad)  
c000b0e0:	34 00                	xor    al,0x0
c000b0e2:	00 00                	add    BYTE PTR [eax],al
c000b0e4:	41                   	inc    ecx
c000b0e5:	0e                   	push   cs
c000b0e6:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b0ec:	46                   	inc    esi
c000b0ed:	83 05 86 04 87 03 4f 	add    DWORD PTR ds:0x3870486,0x4f
c000b0f4:	2e 04 04             	cs add al,0x4
c000b0f7:	01 00                	add    DWORD PTR [eax],eax
c000b0f9:	00 00                	add    BYTE PTR [eax],al
c000b0fb:	2e 08 41 2e          	or     BYTE PTR cs:[ecx+0x2e],al
c000b0ff:	0c 41                	or     al,0x41
c000b101:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000b105:	00 4f c3             	add    BYTE PTR [edi-0x3d],cl
c000b108:	41                   	inc    ecx
c000b109:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000b10d:	0c 04                	or     al,0x4
c000b10f:	04 c5                	add    al,0xc5
c000b111:	00 00                	add    BYTE PTR [eax],al
c000b113:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b116:	00 00                	add    BYTE PTR [eax],al
c000b118:	7c 08                	jl     c000b122 <_edata+0x886>
c000b11a:	00 00                	add    BYTE PTR [eax],al
c000b11c:	63 8d 00 c0 1a 00    	arpl   WORD PTR [ebp+0x1ac000],cx
c000b122:	00 00                	add    BYTE PTR [eax],al
c000b124:	41                   	inc    ecx
c000b125:	0e                   	push   cs
c000b126:	08 85 02 44 0d 05    	or     BYTE PTR [ebp+0x50d4402],al
c000b12c:	54                   	push   esp
c000b12d:	0c 04                	or     al,0x4
c000b12f:	04 c5                	add    al,0xc5
c000b131:	00 00                	add    BYTE PTR [eax],al
c000b133:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b136:	00 00                	add    BYTE PTR [eax],al
c000b138:	9c                   	pushf  
c000b139:	08 00                	or     BYTE PTR [eax],al
c000b13b:	00 7d 8d             	add    BYTE PTR [ebp-0x73],bh
c000b13e:	00 c0                	add    al,al
c000b140:	14 00                	adc    al,0x0
c000b142:	00 00                	add    BYTE PTR [eax],al
c000b144:	41                   	inc    ecx
c000b145:	0e                   	push   cs
c000b146:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b14c:	44                   	inc    esp
c000b14d:	0c 04                	or     al,0x4
c000b14f:	04 c5                	add    al,0xc5
c000b151:	00 00                	add    BYTE PTR [eax],al
c000b153:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b156:	00 00                	add    BYTE PTR [eax],al
c000b158:	bc 08 00 00 94       	mov    esp,0x94000008
c000b15d:	8d 00                	lea    eax,[eax]
c000b15f:	c0 23 00             	shl    BYTE PTR [ebx],0x0
c000b162:	00 00                	add    BYTE PTR [eax],al
c000b164:	41                   	inc    ecx
c000b165:	0e                   	push   cs
c000b166:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b16c:	5f                   	pop    edi
c000b16d:	0c 04                	or     al,0x4
c000b16f:	04 c5                	add    al,0xc5
c000b171:	00 00                	add    BYTE PTR [eax],al
c000b173:	00 20                	add    BYTE PTR [eax],ah
c000b175:	00 00                	add    BYTE PTR [eax],al
c000b177:	00 dc                	add    ah,bl
c000b179:	08 00                	or     BYTE PTR [eax],al
c000b17b:	00 b7 8d 00 c0 1b    	add    BYTE PTR [edi+0x1bc0008d],dh
c000b181:	00 00                	add    BYTE PTR [eax],al
c000b183:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b186:	08 85 02 44 0d 05    	or     BYTE PTR [ebp+0x50d4402],al
c000b18c:	46                   	inc    esi
c000b18d:	83 03 4e             	add    DWORD PTR [ebx],0x4e
c000b190:	c3                   	ret    
c000b191:	41                   	inc    ecx
c000b192:	0c 04                	or     al,0x4
c000b194:	04 c5                	add    al,0xc5
c000b196:	00 00                	add    BYTE PTR [eax],al
c000b198:	28 00                	sub    BYTE PTR [eax],al
c000b19a:	00 00                	add    BYTE PTR [eax],al
c000b19c:	00 09                	add    BYTE PTR [ecx],cl
c000b19e:	00 00                	add    BYTE PTR [eax],al
c000b1a0:	d2 8d 00 c0 62 00    	ror    BYTE PTR [ebp+0x62c000],cl
c000b1a6:	00 00                	add    BYTE PTR [eax],al
c000b1a8:	41                   	inc    ecx
c000b1a9:	0e                   	push   cs
c000b1aa:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b1b0:	44                   	inc    esp
c000b1b1:	83 05 86 04 87 03 02 	add    DWORD PTR ds:0x3870486,0x2
c000b1b8:	57                   	push   edi
c000b1b9:	c3                   	ret    
c000b1ba:	41                   	inc    ecx
c000b1bb:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000b1bf:	0c 04                	or     al,0x4
c000b1c1:	04 c5                	add    al,0xc5
c000b1c3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b1c6:	00 00                	add    BYTE PTR [eax],al
c000b1c8:	2c 09                	sub    al,0x9
c000b1ca:	00 00                	add    BYTE PTR [eax],al
c000b1cc:	34 8e                	xor    al,0x8e
c000b1ce:	00 c0                	add    al,al
c000b1d0:	0d 00 00 00 41       	or     eax,0x41000000
c000b1d5:	0e                   	push   cs
c000b1d6:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b1dc:	45                   	inc    ebp
c000b1dd:	0c 04                	or     al,0x4
c000b1df:	04 c5                	add    al,0xc5
c000b1e1:	00 00                	add    BYTE PTR [eax],al
c000b1e3:	00 28                	add    BYTE PTR [eax],ch
c000b1e5:	00 00                	add    BYTE PTR [eax],al
c000b1e7:	00 4c 09 00          	add    BYTE PTR [ecx+ecx*1+0x0],cl
c000b1eb:	00 41 8e             	add    BYTE PTR [ecx-0x72],al
c000b1ee:	00 c0                	add    al,al
c000b1f0:	0a 01                	or     al,BYTE PTR [ecx]
c000b1f2:	00 00                	add    BYTE PTR [eax],al
c000b1f4:	41                   	inc    ecx
c000b1f5:	0e                   	push   cs
c000b1f6:	08 85 02 44 0d 05    	or     BYTE PTR [ebp+0x50d4402],al
c000b1fc:	46                   	inc    esi
c000b1fd:	83 05 86 04 87 03 02 	add    DWORD PTR ds:0x3870486,0x2
c000b204:	fb                   	sti    
c000b205:	c3                   	ret    
c000b206:	41                   	inc    ecx
c000b207:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000b20b:	0c 04                	or     al,0x4
c000b20d:	04 c5                	add    al,0xc5
c000b20f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b212:	00 00                	add    BYTE PTR [eax],al
c000b214:	78 09                	js     c000b21f <_edata+0x983>
c000b216:	00 00                	add    BYTE PTR [eax],al
c000b218:	4b                   	dec    ebx
c000b219:	8f 00                	pop    DWORD PTR [eax]
c000b21b:	c0 0d 00 00 00 41 0e 	ror    BYTE PTR ds:0x41000000,0xe
c000b222:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b228:	45                   	inc    ebp
c000b229:	0c 04                	or     al,0x4
c000b22b:	04 c5                	add    al,0xc5
c000b22d:	00 00                	add    BYTE PTR [eax],al
c000b22f:	00 54 00 00          	add    BYTE PTR [eax+eax*1+0x0],dl
c000b233:	00 98 09 00 00 58    	add    BYTE PTR [eax+0x58000009],bl
c000b239:	8f 00                	pop    DWORD PTR [eax]
c000b23b:	c0 69 00 00          	shr    BYTE PTR [ecx+0x0],0x0
c000b23f:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b242:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b248:	42                   	inc    edx
c000b249:	83 04 86 03          	add    DWORD PTR [esi+eax*4],0x3
c000b24d:	4f                   	dec    edi
c000b24e:	2e 04 04             	cs add al,0x4
c000b251:	07                   	pop    es
c000b252:	00 00                	add    BYTE PTR [eax],al
c000b254:	00 2e                	add    BYTE PTR [esi],ch
c000b256:	08 4b 2e             	or     BYTE PTR [ebx+0x2e],cl
c000b259:	0c 46                	or     al,0x46
c000b25b:	2e 10 41 2e          	adc    BYTE PTR cs:[ecx+0x2e],al
c000b25f:	14 45                	adc    al,0x45
c000b261:	2e 18 4a 2e          	sbb    BYTE PTR cs:[edx+0x2e],cl
c000b265:	1c 42                	sbb    al,0x42
c000b267:	2e 20 45 2e          	and    BYTE PTR cs:[ebp+0x2e],al
c000b26b:	24 48                	and    al,0x48
c000b26d:	2e 00 45 2e          	add    BYTE PTR cs:[ebp+0x2e],al
c000b271:	04 04                	add    al,0x4
c000b273:	05 00 00 00 2e       	add    eax,0x2e000000
c000b278:	08 45 2e             	or     BYTE PTR [ebp+0x2e],al
c000b27b:	0c 48                	or     al,0x48
c000b27d:	2e 00 44 c3 41       	add    BYTE PTR cs:[ebx+eax*8+0x41],al
c000b282:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000b286:	04 c5                	add    al,0xc5
c000b288:	1c 00                	sbb    al,0x0
c000b28a:	00 00                	add    BYTE PTR [eax],al
c000b28c:	f0 09 00             	lock or DWORD PTR [eax],eax
c000b28f:	00 c1                	add    cl,al
c000b291:	8f 00                	pop    DWORD PTR [eax]
c000b293:	c0 12 00             	rcl    BYTE PTR [edx],0x0
c000b296:	00 00                	add    BYTE PTR [eax],al
c000b298:	41                   	inc    ecx
c000b299:	0e                   	push   cs
c000b29a:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b2a0:	44                   	inc    esp
c000b2a1:	0c 04                	or     al,0x4
c000b2a3:	04 c5                	add    al,0xc5
c000b2a5:	00 00                	add    BYTE PTR [eax],al
c000b2a7:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b2aa:	00 00                	add    BYTE PTR [eax],al
c000b2ac:	10 0a                	adc    BYTE PTR [edx],cl
c000b2ae:	00 00                	add    BYTE PTR [eax],al
c000b2b0:	d3 8f 00 c0 22 00    	ror    DWORD PTR [edi+0x22c000],cl
c000b2b6:	00 00                	add    BYTE PTR [eax],al
c000b2b8:	41                   	inc    ecx
c000b2b9:	0e                   	push   cs
c000b2ba:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b2c0:	44                   	inc    esp
c000b2c1:	0c 04                	or     al,0x4
c000b2c3:	04 c5                	add    al,0xc5
c000b2c5:	00 00                	add    BYTE PTR [eax],al
c000b2c7:	00 4c 00 00          	add    BYTE PTR [eax+eax*1+0x0],cl
c000b2cb:	00 30                	add    BYTE PTR [eax],dh
c000b2cd:	0a 00                	or     al,BYTE PTR [eax]
c000b2cf:	00 f5                	add    ch,dh
c000b2d1:	8f 00                	pop    DWORD PTR [eax]
c000b2d3:	c0                   	(bad)  
c000b2d4:	70 00                	jo     c000b2d6 <_edata+0xa3a>
c000b2d6:	00 00                	add    BYTE PTR [eax],al
c000b2d8:	41                   	inc    ecx
c000b2d9:	0e                   	push   cs
c000b2da:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b2e0:	46                   	inc    esi
c000b2e1:	83 05 86 04 87 03 47 	add    DWORD PTR ds:0x3870486,0x47
c000b2e8:	2e 04 04             	cs add al,0x4
c000b2eb:	13 00                	adc    eax,DWORD PTR [eax]
c000b2ed:	00 00                	add    BYTE PTR [eax],al
c000b2ef:	2e 00 52 2e          	add    BYTE PTR cs:[edx+0x2e],dl
c000b2f3:	04 04                	add    al,0x4
c000b2f5:	08 00                	or     BYTE PTR [eax],al
c000b2f7:	00 00                	add    BYTE PTR [eax],al
c000b2f9:	2e 08 48 2e          	or     BYTE PTR cs:[eax+0x2e],cl
c000b2fd:	14 51                	adc    al,0x51
c000b2ff:	2e 18 47 2e          	sbb    BYTE PTR cs:[edi+0x2e],al
c000b303:	1c 41                	sbb    al,0x41
c000b305:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000b309:	00 46 c3             	add    BYTE PTR [esi-0x3d],al
c000b30c:	41                   	inc    ecx
c000b30d:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000b311:	0c 04                	or     al,0x4
c000b313:	04 c5                	add    al,0xc5
c000b315:	00 00                	add    BYTE PTR [eax],al
c000b317:	00 64 00 00          	add    BYTE PTR [eax+eax*1+0x0],ah
c000b31b:	00 80 0a 00 00 65    	add    BYTE PTR [eax+0x6500000a],al
c000b321:	90                   	nop
c000b322:	00 c0                	add    al,al
c000b324:	6a 00                	push   0x0
c000b326:	00 00                	add    BYTE PTR [eax],al
c000b328:	41                   	inc    ecx
c000b329:	0e                   	push   cs
c000b32a:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b330:	46                   	inc    esi
c000b331:	83 05 86 04 87 03 58 	add    DWORD PTR ds:0x3870486,0x58
c000b338:	2e 04 04             	cs add al,0x4
c000b33b:	03 00                	add    eax,DWORD PTR [eax]
c000b33d:	00 00                	add    BYTE PTR [eax],al
c000b33f:	2e 08 46 2e          	or     BYTE PTR cs:[esi+0x2e],al
c000b343:	04 04                	add    al,0x4
c000b345:	01 00                	add    DWORD PTR [eax],eax
c000b347:	00 00                	add    BYTE PTR [eax],al
c000b349:	2e 00 4c 2e 04       	add    BYTE PTR cs:[esi+ebp*1+0x4],cl
c000b34e:	04 03                	add    al,0x3
c000b350:	00 00                	add    BYTE PTR [eax],al
c000b352:	00 2e                	add    BYTE PTR [esi],ch
c000b354:	08 46 2e             	or     BYTE PTR [esi+0x2e],al
c000b357:	04 04                	add    al,0x4
c000b359:	01 00                	add    DWORD PTR [eax],eax
c000b35b:	00 00                	add    BYTE PTR [eax],al
c000b35d:	2e 00 45 2e          	add    BYTE PTR cs:[ebp+0x2e],al
c000b361:	04 04                	add    al,0x4
c000b363:	02 00                	add    al,BYTE PTR [eax]
c000b365:	00 00                	add    BYTE PTR [eax],al
c000b367:	2e 08 41 2e          	or     BYTE PTR cs:[ecx+0x2e],al
c000b36b:	0c 41                	or     al,0x41
c000b36d:	2e 10 4e 2e          	adc    BYTE PTR cs:[esi+0x2e],cl
c000b371:	00 4e c3             	add    BYTE PTR [esi-0x3d],cl
c000b374:	41                   	inc    ecx
c000b375:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000b379:	0c 04                	or     al,0x4
c000b37b:	04 c5                	add    al,0xc5
c000b37d:	00 00                	add    BYTE PTR [eax],al
c000b37f:	00 3c 00             	add    BYTE PTR [eax+eax*1],bh
c000b382:	00 00                	add    BYTE PTR [eax],al
c000b384:	e8 0a 00 00 cf       	call   8f00b393 <AR_CODE32+0x8efff2fb>
c000b389:	90                   	nop
c000b38a:	00 c0                	add    al,al
c000b38c:	34 00                	xor    al,0x0
c000b38e:	00 00                	add    BYTE PTR [eax],al
c000b390:	41                   	inc    ecx
c000b391:	0e                   	push   cs
c000b392:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b398:	44                   	inc    esp
c000b399:	2e 08 83 03 44 2e 0c 	or     BYTE PTR cs:[ebx+0xc2e4403],al
c000b3a0:	42                   	inc    edx
c000b3a1:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000b3a5:	00 48 2e             	add    BYTE PTR [eax+0x2e],cl
c000b3a8:	04 04                	add    al,0x4
c000b3aa:	01 00                	add    DWORD PTR [eax],eax
c000b3ac:	00 00                	add    BYTE PTR [eax],al
c000b3ae:	2e 08 42 2e          	or     BYTE PTR cs:[edx+0x2e],al
c000b3b2:	0c 41                	or     al,0x41
c000b3b4:	2e 10 4e 2e          	adc    BYTE PTR cs:[esi+0x2e],cl
c000b3b8:	00 44 c5 0c          	add    BYTE PTR [ebp+eax*8+0xc],al
c000b3bc:	04 04                	add    al,0x4
c000b3be:	c3                   	ret    
c000b3bf:	00 38                	add    BYTE PTR [eax],bh
c000b3c1:	00 00                	add    BYTE PTR [eax],al
c000b3c3:	00 28                	add    BYTE PTR [eax],ch
c000b3c5:	0b 00                	or     eax,DWORD PTR [eax]
c000b3c7:	00 f4                	add    ah,dh
c000b3c9:	92                   	xchg   edx,eax
c000b3ca:	00 c0                	add    al,al
c000b3cc:	47                   	inc    edi
c000b3cd:	00 00                	add    BYTE PTR [eax],al
c000b3cf:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b3d2:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b3d8:	45                   	inc    ebp
c000b3d9:	83 04 86 03          	add    DWORD PTR [esi+eax*4],0x3
c000b3dd:	52                   	push   edx
c000b3de:	2e 04 04             	cs add al,0x4
c000b3e1:	05 00 00 00 2e       	add    eax,0x2e000000
c000b3e6:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000b3e9:	0c 45                	or     al,0x45
c000b3eb:	2e 10 4e 2e          	adc    BYTE PTR cs:[esi+0x2e],cl
c000b3ef:	00 50 c3             	add    BYTE PTR [eax-0x3d],dl
c000b3f2:	41                   	inc    ecx
c000b3f3:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000b3f7:	04 c5                	add    al,0xc5
c000b3f9:	00 00                	add    BYTE PTR [eax],al
c000b3fb:	00 3c 00             	add    BYTE PTR [eax+eax*1],bh
c000b3fe:	00 00                	add    BYTE PTR [eax],al
c000b400:	64 0b 00             	or     eax,DWORD PTR fs:[eax]
c000b403:	00 3b                	add    BYTE PTR [ebx],bh
c000b405:	93                   	xchg   ebx,eax
c000b406:	00 c0                	add    al,al
c000b408:	4a                   	dec    edx
c000b409:	00 00                	add    BYTE PTR [eax],al
c000b40b:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b40e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b414:	46                   	inc    esi
c000b415:	83 05 86 04 87 03 56 	add    DWORD PTR ds:0x3870486,0x56
c000b41c:	2e 04 04             	cs add al,0x4
c000b41f:	05 00 00 00 2e       	add    eax,0x2e000000
c000b424:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000b427:	0c 45                	or     al,0x45
c000b429:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000b42d:	00 53 c3             	add    BYTE PTR [ebx-0x3d],dl
c000b430:	41                   	inc    ecx
c000b431:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000b435:	0c 04                	or     al,0x4
c000b437:	04 c5                	add    al,0xc5
c000b439:	00 00                	add    BYTE PTR [eax],al
c000b43b:	00 3c 00             	add    BYTE PTR [eax+eax*1],bh
c000b43e:	00 00                	add    BYTE PTR [eax],al
c000b440:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
c000b441:	0b 00                	or     eax,DWORD PTR [eax]
c000b443:	00 85 93 00 c0 42    	add    BYTE PTR [ebp+0x42c00093],al
c000b449:	00 00                	add    BYTE PTR [eax],al
c000b44b:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b44e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b454:	41                   	inc    ecx
c000b455:	86 03                	xchg   BYTE PTR [ebx],al
c000b457:	44                   	inc    esp
c000b458:	83 04 04 10          	add    DWORD PTR [esp+eax*1],0x10
c000b45c:	00 00                	add    BYTE PTR [eax],al
c000b45e:	00 2e                	add    BYTE PTR [esi],ch
c000b460:	04 04                	add    al,0x4
c000b462:	05 00 00 00 2e       	add    eax,0x2e000000
c000b467:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000b46a:	0c 45                	or     al,0x45
c000b46c:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000b470:	00 53 c3             	add    BYTE PTR [ebx-0x3d],dl
c000b473:	41                   	inc    ecx
c000b474:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000b478:	04 c5                	add    al,0xc5
c000b47a:	00 00                	add    BYTE PTR [eax],al
c000b47c:	20 00                	and    BYTE PTR [eax],al
c000b47e:	00 00                	add    BYTE PTR [eax],al
c000b480:	e4 0b                	in     al,0xb
c000b482:	00 00                	add    BYTE PTR [eax],al
c000b484:	c7                   	(bad)  
c000b485:	93                   	xchg   ebx,eax
c000b486:	00 c0                	add    al,al
c000b488:	1a 00                	sbb    al,BYTE PTR [eax]
c000b48a:	00 00                	add    BYTE PTR [eax],al
c000b48c:	41                   	inc    ecx
c000b48d:	0e                   	push   cs
c000b48e:	08 85 02 44 0d 05    	or     BYTE PTR [ebp+0x50d4402],al
c000b494:	44                   	inc    esp
c000b495:	83 03 4f             	add    DWORD PTR [ebx],0x4f
c000b498:	c3                   	ret    
c000b499:	41                   	inc    ecx
c000b49a:	0c 04                	or     al,0x4
c000b49c:	04 c5                	add    al,0xc5
c000b49e:	00 00                	add    BYTE PTR [eax],al
c000b4a0:	1c 00                	sbb    al,0x0
c000b4a2:	00 00                	add    BYTE PTR [eax],al
c000b4a4:	08 0c 00             	or     BYTE PTR [eax+eax*1],cl
c000b4a7:	00 08                	add    BYTE PTR [eax],cl
c000b4a9:	94                   	xchg   esp,eax
c000b4aa:	00 c0                	add    al,al
c000b4ac:	0f 00 00             	sldt   WORD PTR [eax]
c000b4af:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b4b2:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b4b8:	4a                   	dec    edx
c000b4b9:	0c 04                	or     al,0x4
c000b4bb:	04 c5                	add    al,0xc5
c000b4bd:	00 00                	add    BYTE PTR [eax],al
c000b4bf:	00 48 00             	add    BYTE PTR [eax+0x0],cl
c000b4c2:	00 00                	add    BYTE PTR [eax],al
c000b4c4:	28 0c 00             	sub    BYTE PTR [eax+eax*1],cl
c000b4c7:	00 17                	add    BYTE PTR [edi],dl
c000b4c9:	94                   	xchg   esp,eax
c000b4ca:	00 c0                	add    al,al
c000b4cc:	49                   	dec    ecx
c000b4cd:	00 00                	add    BYTE PTR [eax],al
c000b4cf:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b4d2:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b4d8:	41                   	inc    ecx
c000b4d9:	86 03                	xchg   BYTE PTR [ebx],al
c000b4db:	44                   	inc    esp
c000b4dc:	83 04 04 04          	add    DWORD PTR [esp+eax*1],0x4
c000b4e0:	00 00                	add    BYTE PTR [eax],al
c000b4e2:	00 2e                	add    BYTE PTR [esi],ch
c000b4e4:	04 04                	add    al,0x4
c000b4e6:	02 00                	add    al,BYTE PTR [eax]
c000b4e8:	00 00                	add    BYTE PTR [eax],al
c000b4ea:	2e 08 42 2e          	or     BYTE PTR cs:[edx+0x2e],al
c000b4ee:	0c 41                	or     al,0x41
c000b4f0:	2e 10 49 2e          	adc    BYTE PTR cs:[ecx+0x2e],cl
c000b4f4:	0c 41                	or     al,0x41
c000b4f6:	2e 08 43 2e          	or     BYTE PTR cs:[ebx+0x2e],al
c000b4fa:	0c 41                	or     al,0x41
c000b4fc:	2e 10 4a 2e          	adc    BYTE PTR cs:[edx+0x2e],cl
c000b500:	00 5d c3             	add    BYTE PTR [ebp-0x3d],bl
c000b503:	41                   	inc    ecx
c000b504:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000b508:	04 c5                	add    al,0xc5
c000b50a:	00 00                	add    BYTE PTR [eax],al
c000b50c:	1c 00                	sbb    al,0x0
c000b50e:	00 00                	add    BYTE PTR [eax],al
c000b510:	74 0c                	je     c000b51e <_edata+0xc82>
c000b512:	00 00                	add    BYTE PTR [eax],al
c000b514:	60                   	pusha  
c000b515:	94                   	xchg   esp,eax
c000b516:	00 c0                	add    al,al
c000b518:	56                   	push   esi
c000b519:	00 00                	add    BYTE PTR [eax],al
c000b51b:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b51e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b524:	02 52 0c             	add    dl,BYTE PTR [edx+0xc]
c000b527:	04 04                	add    al,0x4
c000b529:	c5 00                	lds    eax,FWORD PTR [eax]
c000b52b:	00 50 00             	add    BYTE PTR [eax+0x0],dl
c000b52e:	00 00                	add    BYTE PTR [eax],al
c000b530:	94                   	xchg   esp,eax
c000b531:	0c 00                	or     al,0x0
c000b533:	00 b6 94 00 c0 43    	add    BYTE PTR [esi+0x43c00094],dh
c000b539:	00 00                	add    BYTE PTR [eax],al
c000b53b:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b53e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b544:	42                   	inc    edx
c000b545:	83 04 86 03          	add    DWORD PTR [esi+eax*4],0x3
c000b549:	46                   	inc    esi
c000b54a:	2e 0c 42             	cs or  al,0x42
c000b54d:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000b551:	04 04                	add    al,0x4
c000b553:	04 00                	add    al,0x0
c000b555:	00 00                	add    BYTE PTR [eax],al
c000b557:	2e 08 43 2e          	or     BYTE PTR cs:[ebx+0x2e],al
c000b55b:	0c 43                	or     al,0x43
c000b55d:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000b561:	04 04                	add    al,0x4
c000b563:	03 00                	add    eax,DWORD PTR [eax]
c000b565:	00 00                	add    BYTE PTR [eax],al
c000b567:	2e 08 43 2e          	or     BYTE PTR cs:[ebx+0x2e],al
c000b56b:	0c 41                	or     al,0x41
c000b56d:	2e 10 52 c3          	adc    BYTE PTR cs:[edx-0x3d],dl
c000b571:	41                   	inc    ecx
c000b572:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000b576:	04 c5                	add    al,0xc5
c000b578:	41                   	inc    ecx
c000b579:	13 03                	adc    eax,DWORD PTR [ebx]
c000b57b:	2e 00 00             	add    BYTE PTR cs:[eax],al
c000b57e:	00 00                	add    BYTE PTR [eax],al
c000b580:	28 00                	sub    BYTE PTR [eax],al
c000b582:	00 00                	add    BYTE PTR [eax],al
c000b584:	e8 0c 00 00 fc       	call   bc00b595 <AR_CODE32+0xbbfff4fd>
c000b589:	94                   	xchg   esp,eax
c000b58a:	00 c0                	add    al,al
c000b58c:	ac                   	lods   al,BYTE PTR ds:[esi]
c000b58d:	00 00                	add    BYTE PTR [eax],al
c000b58f:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b592:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b598:	42                   	inc    edx
c000b599:	86 04 87             	xchg   BYTE PTR [edi+eax*4],al
c000b59c:	03 49 83             	add    ecx,DWORD PTR [ecx-0x7d]
c000b59f:	05 02 96 c3 41       	add    eax,0x41c39602
c000b5a4:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000b5a8:	0c 04                	or     al,0x4
c000b5aa:	04 c5                	add    al,0xc5
c000b5ac:	1c 00                	sbb    al,0x0
c000b5ae:	00 00                	add    BYTE PTR [eax],al
c000b5b0:	14 0d                	adc    al,0xd
c000b5b2:	00 00                	add    BYTE PTR [eax],al
c000b5b4:	a8 95                	test   al,0x95
c000b5b6:	00 c0                	add    al,al
c000b5b8:	18 00                	sbb    BYTE PTR [eax],al
c000b5ba:	00 00                	add    BYTE PTR [eax],al
c000b5bc:	41                   	inc    ecx
c000b5bd:	0e                   	push   cs
c000b5be:	08 85 02 47 0d 05    	or     BYTE PTR [ebp+0x50d4702],al
c000b5c4:	4f                   	dec    edi
c000b5c5:	0c 04                	or     al,0x4
c000b5c7:	04 c5                	add    al,0xc5
c000b5c9:	00 00                	add    BYTE PTR [eax],al
c000b5cb:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b5ce:	00 00                	add    BYTE PTR [eax],al
c000b5d0:	34 0d                	xor    al,0xd
c000b5d2:	00 00                	add    BYTE PTR [eax],al
c000b5d4:	c0 95 00 c0 10 00 00 	rcl    BYTE PTR [ebp+0x10c000],0x0
c000b5db:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b5de:	08 85 02 47 0d 05    	or     BYTE PTR [ebp+0x50d4702],al
c000b5e4:	47                   	inc    edi
c000b5e5:	0c 04                	or     al,0x4
c000b5e7:	04 c5                	add    al,0xc5
c000b5e9:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .rodata:

c000b5ec <_rodata>:
c000b5ec:	48                   	dec    eax
c000b5ed:	65 6c                	gs ins BYTE PTR es:[edi],dx
c000b5ef:	6c                   	ins    BYTE PTR es:[edi],dx
c000b5f0:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b5f1:	20 77 6f             	and    BYTE PTR [edi+0x6f],dh
c000b5f4:	72 6c                	jb     c000b662 <__func__.874+0x6>
c000b5f6:	64 0a 00             	or     al,BYTE PTR fs:[eax]
c000b5f9:	6b 5f 61 00          	imul   ebx,DWORD PTR [edi+0x61],0x0
c000b5fd:	00 00                	add    BYTE PTR [eax],al
c000b5ff:	00 62 79             	add    BYTE PTR [edx+0x79],ah
c000b602:	74 65                	je     c000b669 <__func__.874+0xd>
c000b604:	5f                   	pop    edi
c000b605:	69 6e 64 65 78 20 3c 	imul   ebp,DWORD PTR [esi+0x64],0x3c207865
c000b60c:	20 28                	and    BYTE PTR [eax],ch
c000b60e:	62 74 6d 70          	bound  esi,QWORD PTR [ebp+ebp*2+0x70]
c000b612:	2d 3e 62 74 6d       	sub    eax,0x6d74623e
c000b617:	70 5f                	jo     c000b678 <__func__.874+0x1c>
c000b619:	62 79 74             	bound  edi,QWORD PTR [ecx+0x74]
c000b61c:	65 73 5f             	gs jae c000b67e <__func__.874+0x22>
c000b61f:	6c                   	ins    BYTE PTR es:[edi],dx
c000b620:	65 6e                	outs   dx,BYTE PTR gs:[esi]
c000b622:	29 00                	sub    DWORD PTR [eax],eax
c000b624:	6c                   	ins    BYTE PTR es:[edi],dx
c000b625:	69 62 2f 62 69 74 6d 	imul   esp,DWORD PTR [edx+0x2f],0x6d746962
c000b62c:	61                   	popa   
c000b62d:	70 2e                	jo     c000b65d <__func__.874+0x1>
c000b62f:	63 00                	arpl   WORD PTR [eax],ax
c000b631:	76 61                	jbe    c000b694 <__func__.874+0x38>
c000b633:	6c                   	ins    BYTE PTR es:[edi],dx
c000b634:	75 65                	jne    c000b69b <__func__.874+0x3f>
c000b636:	20 3d 3d 20 30 20    	and    BYTE PTR ds:0x2030203d,bh
c000b63c:	7c 7c                	jl     c000b6ba <__func__.874+0x5e>
c000b63e:	20 76 61             	and    BYTE PTR [esi+0x61],dh
c000b641:	6c                   	ins    BYTE PTR es:[edi],dx
c000b642:	75 65                	jne    c000b6a9 <__func__.874+0x4d>
c000b644:	20 3d 3d 20 31 00    	and    BYTE PTR ds:0x31203d,bh
	...

c000b64c <__func__.857>:
c000b64c:	62 69 74             	bound  ebp,QWORD PTR [ecx+0x74]
c000b64f:	6d                   	ins    DWORD PTR es:[edi],dx
c000b650:	61                   	popa   
c000b651:	70 5f                	jo     c000b6b2 <__func__.874+0x56>
c000b653:	61                   	popa   
c000b654:	6c                   	ins    BYTE PTR es:[edi],dx
c000b655:	6c                   	ins    BYTE PTR es:[edi],dx
c000b656:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b657:	63 00                	arpl   WORD PTR [eax],ax
c000b659:	00 00                	add    BYTE PTR [eax],al
	...

c000b65c <__func__.874>:
c000b65c:	62 69 74             	bound  ebp,QWORD PTR [ecx+0x74]
c000b65f:	6d                   	ins    DWORD PTR es:[edi],dx
c000b660:	61                   	popa   
c000b661:	70 5f                	jo     c000b6c2 <__func__.874+0x66>
c000b663:	73 65                	jae    c000b6ca <__func__.874+0x6e>
c000b665:	74 00                	je     c000b667 <__func__.874+0xb>
c000b667:	45                   	inc    ebp
c000b668:	72 72                	jb     c000b6dc <__func__.874+0x80>
c000b66a:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b66b:	72 0a                	jb     c000b677 <__func__.874+0x1b>
c000b66d:	00 46 69             	add    BYTE PTR [esi+0x69],al
c000b670:	6c                   	ins    BYTE PTR es:[edi],dx
c000b671:	65 3a 00             	cmp    al,BYTE PTR gs:[eax]
c000b674:	49                   	dec    ecx
c000b675:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b676:	20 66 75             	and    BYTE PTR [esi+0x75],ah
c000b679:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b67a:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
c000b67e:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b67f:	3a 20                	cmp    ah,BYTE PTR [eax]
c000b681:	00 4c 69 6e          	add    BYTE PTR [ecx+ebp*2+0x6e],cl
c000b685:	65 3a 00             	cmp    al,BYTE PTR gs:[eax]
c000b688:	43                   	inc    ebx
c000b689:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b68a:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b68b:	64 69 74 69 6f 6e 3a 	imul   esi,DWORD PTR fs:[ecx+ebp*2+0x6f],0x203a6e
c000b692:	20 00 
c000b694:	69 6e 74 72 3a 00 23 	imul   ebp,DWORD PTR [esi+0x74],0x23003a72
c000b69b:	44                   	inc    esp
c000b69c:	45                   	inc    ebp
c000b69d:	20 44 69 76          	and    BYTE PTR [ecx+ebp*2+0x76],al
c000b6a1:	69 64 65 20 45 72 72 	imul   esp,DWORD PTR [ebp+eiz*2+0x20],0x6f727245
c000b6a8:	6f 
c000b6a9:	72 00                	jb     c000b6ab <__func__.874+0x4f>
c000b6ab:	23 44 42 20          	and    eax,DWORD PTR [edx+eax*2+0x20]
c000b6af:	44                   	inc    esp
c000b6b0:	65 62 75 67          	bound  esi,QWORD PTR gs:[ebp+0x67]
c000b6b4:	20 45 78             	and    BYTE PTR [ebp+0x78],al
c000b6b7:	63 65 70             	arpl   WORD PTR [ebp+0x70],sp
c000b6ba:	74 69                	je     c000b725 <__func__.874+0xc9>
c000b6bc:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b6bd:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b6be:	00 4e 4d             	add    BYTE PTR [esi+0x4d],cl
c000b6c1:	49                   	dec    ecx
c000b6c2:	20 49 6e             	and    BYTE PTR [ecx+0x6e],cl
c000b6c5:	74 65                	je     c000b72c <__func__.874+0xd0>
c000b6c7:	72 72                	jb     c000b73b <__func__.874+0xdf>
c000b6c9:	75 70                	jne    c000b73b <__func__.874+0xdf>
c000b6cb:	74 00                	je     c000b6cd <__func__.874+0x71>
c000b6cd:	23 42 50             	and    eax,DWORD PTR [edx+0x50]
c000b6d0:	20 42 72             	and    BYTE PTR [edx+0x72],al
c000b6d3:	65 61                	gs popa 
c000b6d5:	6b 70 6f 69          	imul   esi,DWORD PTR [eax+0x6f],0x69
c000b6d9:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b6da:	74 20                	je     c000b6fc <__func__.874+0xa0>
c000b6dc:	45                   	inc    ebp
c000b6dd:	78 63                	js     c000b742 <__func__.874+0xe6>
c000b6df:	65 70 74             	gs jo  c000b756 <__func__.874+0xfa>
c000b6e2:	69 6f 6e 00 23 4f 46 	imul   ebp,DWORD PTR [edi+0x6e],0x464f2300
c000b6e9:	20 4f 76             	and    BYTE PTR [edi+0x76],cl
c000b6ec:	65 72 66             	gs jb  c000b755 <__func__.874+0xf9>
c000b6ef:	6c                   	ins    BYTE PTR es:[edi],dx
c000b6f0:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b6f1:	77 20                	ja     c000b713 <__func__.874+0xb7>
c000b6f3:	45                   	inc    ebp
c000b6f4:	78 63                	js     c000b759 <__func__.874+0xfd>
c000b6f6:	65 70 74             	gs jo  c000b76d <__func__.874+0x111>
c000b6f9:	69 6f 6e 00 23 42 52 	imul   ebp,DWORD PTR [edi+0x6e],0x52422300
c000b700:	20 42 4f             	and    BYTE PTR [edx+0x4f],al
c000b703:	55                   	push   ebp
c000b704:	4e                   	dec    esi
c000b705:	44                   	inc    esp
c000b706:	20 52 61             	and    BYTE PTR [edx+0x61],dl
c000b709:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b70a:	67 65 20 45 78       	and    BYTE PTR gs:[di+0x78],al
c000b70f:	63 65 65             	arpl   WORD PTR [ebp+0x65],sp
c000b712:	64 65 64 20 45 78    	fs gs and BYTE PTR fs:[ebp+0x78],al
c000b718:	63 65 70             	arpl   WORD PTR [ebp+0x70],sp
c000b71b:	74 69                	je     c000b786 <__func__.874+0x12a>
c000b71d:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b71e:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b71f:	00 23                	add    BYTE PTR [ebx],ah
c000b721:	55                   	push   ebp
c000b722:	44                   	inc    esp
c000b723:	20 49 6e             	and    BYTE PTR [ecx+0x6e],cl
c000b726:	76 61                	jbe    c000b789 <__func__.874+0x12d>
c000b728:	6c                   	ins    BYTE PTR es:[edi],dx
c000b729:	69 64 20 4f 70 63 6f 	imul   esp,DWORD PTR [eax+eiz*1+0x4f],0x646f6370
c000b730:	64 
c000b731:	65 20 45 78          	and    BYTE PTR gs:[ebp+0x78],al
c000b735:	63 65 70             	arpl   WORD PTR [ebp+0x70],sp
c000b738:	74 69                	je     c000b7a3 <__func__.874+0x147>
c000b73a:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b73b:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b73c:	00 23                	add    BYTE PTR [ebx],ah
c000b73e:	4e                   	dec    esi
c000b73f:	4d                   	dec    ebp
c000b740:	20 44 65 76          	and    BYTE PTR [ebp+eiz*2+0x76],al
c000b744:	69 63 65 20 4e 6f 74 	imul   esp,DWORD PTR [ebx+0x65],0x746f4e20
c000b74b:	20 41 76             	and    BYTE PTR [ecx+0x76],al
c000b74e:	61                   	popa   
c000b74f:	69 6c 61 62 6c 65 20 	imul   ebp,DWORD PTR [ecx+eiz*2+0x62],0x4520656c
c000b756:	45 
c000b757:	78 63                	js     c000b7bc <__func__.874+0x160>
c000b759:	65 70 74             	gs jo  c000b7d0 <__func__.874+0x174>
c000b75c:	69 6f 6e 00 23 44 46 	imul   ebp,DWORD PTR [edi+0x6e],0x46442300
c000b763:	20 44 6f 75          	and    BYTE PTR [edi+ebp*2+0x75],al
c000b767:	62 6c 65 20          	bound  ebp,QWORD PTR [ebp+eiz*2+0x20]
c000b76b:	46                   	inc    esi
c000b76c:	61                   	popa   
c000b76d:	75 6c                	jne    c000b7db <__func__.874+0x17f>
c000b76f:	74 20                	je     c000b791 <__func__.874+0x135>
c000b771:	45                   	inc    ebp
c000b772:	78 63                	js     c000b7d7 <__func__.874+0x17b>
c000b774:	65 70 74             	gs jo  c000b7eb <__func__.874+0x18f>
c000b777:	69 6f 6e 00 43 6f 70 	imul   ebp,DWORD PTR [edi+0x6e],0x706f4300
c000b77e:	72 6f                	jb     c000b7ef <__func__.874+0x193>
c000b780:	63 65 73             	arpl   WORD PTR [ebp+0x73],sp
c000b783:	73 6f                	jae    c000b7f4 <__func__.874+0x198>
c000b785:	72 20                	jb     c000b7a7 <__func__.874+0x14b>
c000b787:	53                   	push   ebx
c000b788:	65 67 6d             	gs ins DWORD PTR es:[di],dx
c000b78b:	65 6e                	outs   dx,BYTE PTR gs:[esi]
c000b78d:	74 20                	je     c000b7af <__func__.874+0x153>
c000b78f:	4f                   	dec    edi
c000b790:	76 65                	jbe    c000b7f7 <__func__.874+0x19b>
c000b792:	72 72                	jb     c000b806 <__func__.874+0x1aa>
c000b794:	75 6e                	jne    c000b804 <__func__.874+0x1a8>
c000b796:	00 23                	add    BYTE PTR [ebx],ah
c000b798:	54                   	push   esp
c000b799:	53                   	push   ebx
c000b79a:	20 49 6e             	and    BYTE PTR [ecx+0x6e],cl
c000b79d:	76 61                	jbe    c000b800 <__func__.874+0x1a4>
c000b79f:	6c                   	ins    BYTE PTR es:[edi],dx
c000b7a0:	69 64 20 54 53 53 20 	imul   esp,DWORD PTR [eax+eiz*1+0x54],0x45205353
c000b7a7:	45 
c000b7a8:	78 63                	js     c000b80d <__func__.874+0x1b1>
c000b7aa:	65 70 74             	gs jo  c000b821 <__func__.874+0x1c5>
c000b7ad:	69 6f 6e 00 23 4e 50 	imul   ebp,DWORD PTR [edi+0x6e],0x504e2300
c000b7b4:	20 53 65             	and    BYTE PTR [ebx+0x65],dl
c000b7b7:	67 6d                	ins    DWORD PTR es:[di],dx
c000b7b9:	65 6e                	outs   dx,BYTE PTR gs:[esi]
c000b7bb:	74 20                	je     c000b7dd <__func__.874+0x181>
c000b7bd:	4e                   	dec    esi
c000b7be:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b7bf:	74 20                	je     c000b7e1 <__func__.874+0x185>
c000b7c1:	50                   	push   eax
c000b7c2:	72 65                	jb     c000b829 <__func__.874+0x1cd>
c000b7c4:	73 65                	jae    c000b82b <__func__.874+0x1cf>
c000b7c6:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b7c7:	74 00                	je     c000b7c9 <__func__.874+0x16d>
c000b7c9:	23 53 53             	and    edx,DWORD PTR [ebx+0x53]
c000b7cc:	20 53 74             	and    BYTE PTR [ebx+0x74],dl
c000b7cf:	61                   	popa   
c000b7d0:	63 6b 20             	arpl   WORD PTR [ebx+0x20],bp
c000b7d3:	46                   	inc    esi
c000b7d4:	61                   	popa   
c000b7d5:	75 6c                	jne    c000b843 <__func__.874+0x1e7>
c000b7d7:	74 20                	je     c000b7f9 <__func__.874+0x19d>
c000b7d9:	45                   	inc    ebp
c000b7da:	78 63                	js     c000b83f <__func__.874+0x1e3>
c000b7dc:	65 70 74             	gs jo  c000b853 <__func__.874+0x1f7>
c000b7df:	69 6f 6e 00 23 47 50 	imul   ebp,DWORD PTR [edi+0x6e],0x50472300
c000b7e6:	20 47 65             	and    BYTE PTR [edi+0x65],al
c000b7e9:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b7ea:	65 72 61             	gs jb  c000b84e <__func__.874+0x1f2>
c000b7ed:	6c                   	ins    BYTE PTR es:[edi],dx
c000b7ee:	20 50 72             	and    BYTE PTR [eax+0x72],dl
c000b7f1:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b7f2:	74 65                	je     c000b859 <__func__.874+0x1fd>
c000b7f4:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
c000b7f8:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b7f9:	20 45 78             	and    BYTE PTR [ebp+0x78],al
c000b7fc:	63 65 70             	arpl   WORD PTR [ebp+0x70],sp
c000b7ff:	74 69                	je     c000b86a <__func__.874+0x20e>
c000b801:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b802:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b803:	00 23                	add    BYTE PTR [ebx],ah
c000b805:	50                   	push   eax
c000b806:	46                   	inc    esi
c000b807:	20 50 61             	and    BYTE PTR [eax+0x61],dl
c000b80a:	67 65 2d 46 61 75 6c 	addr16 gs sub eax,0x6c756146
c000b811:	74 20                	je     c000b833 <__func__.874+0x1d7>
c000b813:	45                   	inc    ebp
c000b814:	78 63                	js     c000b879 <__func__.874+0x21d>
c000b816:	65 70 74             	gs jo  c000b88d <__func__.874+0x231>
c000b819:	69 6f 6e 00 52 65 73 	imul   ebp,DWORD PTR [edi+0x6e],0x73655200
c000b820:	65 72 76             	gs jb  c000b899 <__func__.874+0x23d>
c000b823:	65 64 00 23          	gs add BYTE PTR fs:[ebx],ah
c000b827:	4d                   	dec    ebp
c000b828:	46                   	inc    esi
c000b829:	20 78 38             	and    BYTE PTR [eax+0x38],bh
c000b82c:	37                   	aaa    
c000b82d:	20 46 50             	and    BYTE PTR [esi+0x50],al
c000b830:	55                   	push   ebp
c000b831:	20 46 6c             	and    BYTE PTR [esi+0x6c],al
c000b834:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b835:	61                   	popa   
c000b836:	74 69                	je     c000b8a1 <__func__.874+0x245>
c000b838:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b839:	67 2d 50 6f 69 6e    	addr16 sub eax,0x6e696f50
c000b83f:	74 20                	je     c000b861 <__func__.874+0x205>
c000b841:	45                   	inc    ebp
c000b842:	72 72                	jb     c000b8b6 <__func__.874+0x25a>
c000b844:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b845:	72 00                	jb     c000b847 <__func__.874+0x1eb>
c000b847:	23 41 43             	and    eax,DWORD PTR [ecx+0x43]
c000b84a:	20 41 6c             	and    BYTE PTR [ecx+0x6c],al
c000b84d:	69 67 6e 6d 65 6e 74 	imul   esp,DWORD PTR [edi+0x6e],0x746e656d
c000b854:	20 43 68             	and    BYTE PTR [ebx+0x68],al
c000b857:	65 63 6b 20          	arpl   WORD PTR gs:[ebx+0x20],bp
c000b85b:	45                   	inc    ebp
c000b85c:	78 63                	js     c000b8c1 <__func__.874+0x265>
c000b85e:	65 70 74             	gs jo  c000b8d5 <__func__.874+0x279>
c000b861:	69 6f 6e 00 23 4d 43 	imul   ebp,DWORD PTR [edi+0x6e],0x434d2300
c000b868:	20 4d 61             	and    BYTE PTR [ebp+0x61],cl
c000b86b:	63 68 69             	arpl   WORD PTR [eax+0x69],bp
c000b86e:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b86f:	65 2d 43 68 65 63    	gs sub eax,0x63656843
c000b875:	6b 20 45             	imul   esp,DWORD PTR [eax],0x45
c000b878:	78 63                	js     c000b8dd <__func__.874+0x281>
c000b87a:	65 70 74             	gs jo  c000b8f1 <__func__.874+0x295>
c000b87d:	69 6f 6e 00 23 58 46 	imul   ebp,DWORD PTR [edi+0x6e],0x46582300
c000b884:	20 53 49             	and    BYTE PTR [ebx+0x49],dl
c000b887:	4d                   	dec    ebp
c000b888:	44                   	inc    esp
c000b889:	20 46 6c             	and    BYTE PTR [esi+0x6c],al
c000b88c:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b88d:	61                   	popa   
c000b88e:	74 69                	je     c000b8f9 <__func__.874+0x29d>
c000b890:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b891:	67 2d 50 6f 69 6e    	addr16 sub eax,0x6e696f50
c000b897:	74 20                	je     c000b8b9 <__func__.874+0x25d>
c000b899:	45                   	inc    ebp
c000b89a:	78 63                	js     c000b8ff <__func__.830+0x3>
c000b89c:	65 70 74             	gs jo  c000b913 <_erodata>
c000b89f:	69 6f 6e 00 00 64 73 	imul   ebp,DWORD PTR [edi+0x6e],0x73640000
c000b8a6:	74 5f                	je     c000b907 <__func__.841+0x3>
c000b8a8:	5f                   	pop    edi
c000b8a9:	20 21                	and    BYTE PTR [ecx],ah
c000b8ab:	3d 20 4e 55 4c       	cmp    eax,0x4c554e20
c000b8b0:	4c                   	dec    esp
c000b8b1:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
c000b8b5:	2f                   	das    
c000b8b6:	73 74                	jae    c000b92c <_ebss+0x10>
c000b8b8:	72 69                	jb     c000b923 <_ebss+0x7>
c000b8ba:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b8bb:	67 2e 63 00          	arpl   WORD PTR cs:[bx+si],ax
c000b8bf:	64 73 74             	fs jae c000b936 <Screen+0x2>
c000b8c2:	5f                   	pop    edi
c000b8c3:	5f                   	pop    edi
c000b8c4:	20 21                	and    BYTE PTR [ecx],ah
c000b8c6:	3d 20 4e 55 4c       	cmp    eax,0x4c554e20
c000b8cb:	4c                   	dec    esp
c000b8cc:	20 26                	and    BYTE PTR [esi],ah
c000b8ce:	26 20 73 72          	and    BYTE PTR es:[ebx+0x72],dh
c000b8d2:	63 5f 5f             	arpl   WORD PTR [edi+0x5f],bx
c000b8d5:	20 21                	and    BYTE PTR [ecx],ah
c000b8d7:	3d 20 4e 55 4c       	cmp    eax,0x4c554e20
c000b8dc:	4c                   	dec    esp
c000b8dd:	00 70 31             	add    BYTE PTR [eax+0x31],dh
c000b8e0:	5f                   	pop    edi
c000b8e1:	5f                   	pop    edi
c000b8e2:	20 21                	and    BYTE PTR [ecx],ah
c000b8e4:	3d 20 4e 55 4c       	cmp    eax,0x4c554e20
c000b8e9:	4c                   	dec    esp
c000b8ea:	20 26                	and    BYTE PTR [esi],ah
c000b8ec:	26 20 70 32          	and    BYTE PTR es:[eax+0x32],dh
c000b8f0:	5f                   	pop    edi
c000b8f1:	5f                   	pop    edi
c000b8f2:	20 21                	and    BYTE PTR [ecx],ah
c000b8f4:	3d 20 4e 55 4c       	cmp    eax,0x4c554e20
c000b8f9:	4c                   	dec    esp
	...

c000b8fc <__func__.830>:
c000b8fc:	6d                   	ins    DWORD PTR es:[edi],dx
c000b8fd:	65 6d                	gs ins DWORD PTR es:[edi],dx
c000b8ff:	73 65                	jae    c000b966 <Screen+0x32>
c000b901:	74 00                	je     c000b903 <__func__.830+0x7>
	...

c000b904 <__func__.841>:
c000b904:	6d                   	ins    DWORD PTR es:[edi],dx
c000b905:	65 6d                	gs ins DWORD PTR es:[edi],dx
c000b907:	63 70 79             	arpl   WORD PTR [eax+0x79],si
	...

c000b90c <__func__.853>:
c000b90c:	6d                   	ins    DWORD PTR es:[edi],dx
c000b90d:	65 6d                	gs ins DWORD PTR es:[edi],dx
c000b90f:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
	...

Disassembly of section .bss:

c000b914 <_bss>:
c000b914:	00 00                	add    BYTE PTR [eax],al
	...

c000b918 <ticks>:
c000b918:	00 00                	add    BYTE PTR [eax],al
	...

c000b91c <_ebss>:
	...

c000b934 <Screen>:
	...

c000b980 <intr_name>:
	...

c000ba3c <idt>:
	...

c000bbb4 <user_pool>:
	...

c00138c4 <user_vaddr>:
	...

c001b5d4 <kernel_vaddr>:
	...

c00232e4 <kernel_pool>:
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	47                   	inc    edi
   1:	43                   	inc    ebx
   2:	43                   	inc    ebx
   3:	3a 20                	cmp    ah,BYTE PTR [eax]
   5:	28 47 4e             	sub    BYTE PTR [edi+0x4e],al
   8:	55                   	push   ebp
   9:	29 20                	sub    DWORD PTR [eax],esp
   b:	34 2e                	xor    al,0x2e
   d:	36 2e 31 00          	ss xor DWORD PTR cs:[eax],eax
