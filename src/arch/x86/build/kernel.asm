
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
c0007f47:	0f 01 15 b0 9a 00 c0 	lgdtd  ds:0xc0009ab0
c0007f4e:	e9 8f 03 00 00       	jmp    c00082e2 <kernel_main>
c0007f53:	e9 fb ff ff ff       	jmp    c0007f53 <_start+0x53>

c0007f58 <k_thread_b>:
c0007f58:	55                   	push   ebp
c0007f59:	89 e5                	mov    ebp,esp
c0007f5b:	53                   	push   ebx
c0007f5c:	31 db                	xor    ebx,ebx
c0007f5e:	52                   	push   edx
c0007f5f:	50                   	push   eax
c0007f60:	50                   	push   eax
c0007f61:	6a 14                	push   0x14
c0007f63:	6a 14                	push   0x14
c0007f65:	6a 0a                	push   0xa
c0007f67:	6a 0a                	push   0xa
c0007f69:	53                   	push   ebx
c0007f6a:	43                   	inc    ebx
c0007f6b:	68 8c bf 00 c0       	push   0xc000bf8c
c0007f70:	e8 e7 09 00 00       	call   c000895c <RectangleFill>
c0007f75:	83 c4 20             	add    esp,0x20
c0007f78:	eb e5                	jmp    c0007f5f <k_thread_b+0x7>

c0007f7a <k_thread_a>:
c0007f7a:	55                   	push   ebp
c0007f7b:	89 e5                	mov    ebp,esp
c0007f7d:	56                   	push   esi
c0007f7e:	53                   	push   ebx
c0007f7f:	8b 1d 1c 7c 00 00    	mov    ebx,DWORD PTR ds:0x7c1c
c0007f85:	83 ec 0c             	sub    esp,0xc
c0007f88:	68 74 bf 00 c0       	push   0xc000bf74
c0007f8d:	e8 2a 18 00 00       	call   c00097bc <get_time>
c0007f92:	83 c4 10             	add    esp,0x10
c0007f95:	83 eb 22             	sub    ebx,0x22
c0007f98:	8b 15 1c 7c 00 00    	mov    edx,DWORD PTR ds:0x7c1c
c0007f9e:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c0007fa3:	51                   	push   ecx
c0007fa4:	8b 35 74 bf 00 c0    	mov    esi,DWORD PTR ds:0xc000bf74
c0007faa:	51                   	push   ecx
c0007fab:	8d 4a f8             	lea    ecx,[edx-0x8]
c0007fae:	83 ea 26             	sub    edx,0x26
c0007fb1:	51                   	push   ecx
c0007fb2:	8d 48 f9             	lea    ecx,[eax-0x7]
c0007fb5:	2d d1 00 00 00       	sub    eax,0xd1
c0007fba:	51                   	push   ecx
c0007fbb:	52                   	push   edx
c0007fbc:	50                   	push   eax
c0007fbd:	68 84 84 84 00       	push   0x848484
c0007fc2:	68 8c bf 00 c0       	push   0xc000bf8c
c0007fc7:	e8 90 09 00 00       	call   c000895c <RectangleFill>
c0007fcc:	8b 15 1c 7c 00 00    	mov    edx,DWORD PTR ds:0x7c1c
c0007fd2:	83 c4 18             	add    esp,0x18
c0007fd5:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c0007fda:	8d 4a f5             	lea    ecx,[edx-0xb]
c0007fdd:	83 ea 29             	sub    edx,0x29
c0007fe0:	51                   	push   ecx
c0007fe1:	8d 48 f6             	lea    ecx,[eax-0xa]
c0007fe4:	2d d4 00 00 00       	sub    eax,0xd4
c0007fe9:	51                   	push   ecx
c0007fea:	52                   	push   edx
c0007feb:	50                   	push   eax
c0007fec:	68 ff ff ff 00       	push   0xffffff
c0007ff1:	68 8c bf 00 c0       	push   0xc000bf8c
c0007ff6:	e8 61 09 00 00       	call   c000895c <RectangleFill>
c0007ffb:	a1 88 bf 00 c0       	mov    eax,ds:0xc000bf88
c0008000:	83 c4 14             	add    esp,0x14
c0008003:	25 00 f0 00 00       	and    eax,0xf000
c0008008:	c1 e8 0c             	shr    eax,0xc
c000800b:	83 c0 30             	add    eax,0x30
c000800e:	50                   	push   eax
c000800f:	6a 00                	push   0x0
c0008011:	53                   	push   ebx
c0008012:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c0008017:	2d ca 00 00 00       	sub    eax,0xca
c000801c:	50                   	push   eax
c000801d:	68 8c bf 00 c0       	push   0xc000bf8c
c0008022:	e8 9f 0a 00 00       	call   c0008ac6 <put_char_graphic>
c0008027:	a1 88 bf 00 c0       	mov    eax,ds:0xc000bf88
c000802c:	83 c4 14             	add    esp,0x14
c000802f:	25 00 0f 00 00       	and    eax,0xf00
c0008034:	c1 e8 08             	shr    eax,0x8
c0008037:	83 c0 30             	add    eax,0x30
c000803a:	50                   	push   eax
c000803b:	6a 00                	push   0x0
c000803d:	53                   	push   ebx
c000803e:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c0008043:	2d c0 00 00 00       	sub    eax,0xc0
c0008048:	50                   	push   eax
c0008049:	68 8c bf 00 c0       	push   0xc000bf8c
c000804e:	e8 73 0a 00 00       	call   c0008ac6 <put_char_graphic>
c0008053:	a1 88 bf 00 c0       	mov    eax,ds:0xc000bf88
c0008058:	83 c4 14             	add    esp,0x14
c000805b:	25 f0 00 00 00       	and    eax,0xf0
c0008060:	c1 e8 04             	shr    eax,0x4
c0008063:	83 c0 30             	add    eax,0x30
c0008066:	50                   	push   eax
c0008067:	6a 00                	push   0x0
c0008069:	53                   	push   ebx
c000806a:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c000806f:	2d b6 00 00 00       	sub    eax,0xb6
c0008074:	50                   	push   eax
c0008075:	68 8c bf 00 c0       	push   0xc000bf8c
c000807a:	e8 47 0a 00 00       	call   c0008ac6 <put_char_graphic>
c000807f:	a1 88 bf 00 c0       	mov    eax,ds:0xc000bf88
c0008084:	83 c4 14             	add    esp,0x14
c0008087:	83 e0 0f             	and    eax,0xf
c000808a:	83 c0 30             	add    eax,0x30
c000808d:	50                   	push   eax
c000808e:	6a 00                	push   0x0
c0008090:	53                   	push   ebx
c0008091:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c0008096:	2d ac 00 00 00       	sub    eax,0xac
c000809b:	50                   	push   eax
c000809c:	68 8c bf 00 c0       	push   0xc000bf8c
c00080a1:	e8 20 0a 00 00       	call   c0008ac6 <put_char_graphic>
c00080a6:	83 c4 14             	add    esp,0x14
c00080a9:	6a 2f                	push   0x2f
c00080ab:	6a 00                	push   0x0
c00080ad:	53                   	push   ebx
c00080ae:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c00080b3:	2d a2 00 00 00       	sub    eax,0xa2
c00080b8:	50                   	push   eax
c00080b9:	68 8c bf 00 c0       	push   0xc000bf8c
c00080be:	e8 03 0a 00 00       	call   c0008ac6 <put_char_graphic>
c00080c3:	a1 84 bf 00 c0       	mov    eax,ds:0xc000bf84
c00080c8:	83 c4 14             	add    esp,0x14
c00080cb:	25 f0 00 00 00       	and    eax,0xf0
c00080d0:	c1 e8 04             	shr    eax,0x4
c00080d3:	83 c0 30             	add    eax,0x30
c00080d6:	50                   	push   eax
c00080d7:	6a 00                	push   0x0
c00080d9:	53                   	push   ebx
c00080da:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c00080df:	2d 98 00 00 00       	sub    eax,0x98
c00080e4:	50                   	push   eax
c00080e5:	68 8c bf 00 c0       	push   0xc000bf8c
c00080ea:	e8 d7 09 00 00       	call   c0008ac6 <put_char_graphic>
c00080ef:	a1 84 bf 00 c0       	mov    eax,ds:0xc000bf84
c00080f4:	83 c4 14             	add    esp,0x14
c00080f7:	83 e0 0f             	and    eax,0xf
c00080fa:	83 c0 30             	add    eax,0x30
c00080fd:	50                   	push   eax
c00080fe:	6a 00                	push   0x0
c0008100:	53                   	push   ebx
c0008101:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c0008106:	2d 8e 00 00 00       	sub    eax,0x8e
c000810b:	50                   	push   eax
c000810c:	68 8c bf 00 c0       	push   0xc000bf8c
c0008111:	e8 b0 09 00 00       	call   c0008ac6 <put_char_graphic>
c0008116:	83 c4 14             	add    esp,0x14
c0008119:	6a 2f                	push   0x2f
c000811b:	6a 00                	push   0x0
c000811d:	53                   	push   ebx
c000811e:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c0008123:	2d 84 00 00 00       	sub    eax,0x84
c0008128:	50                   	push   eax
c0008129:	68 8c bf 00 c0       	push   0xc000bf8c
c000812e:	e8 93 09 00 00       	call   c0008ac6 <put_char_graphic>
c0008133:	a1 80 bf 00 c0       	mov    eax,ds:0xc000bf80
c0008138:	83 c4 14             	add    esp,0x14
c000813b:	25 f0 00 00 00       	and    eax,0xf0
c0008140:	c1 e8 04             	shr    eax,0x4
c0008143:	83 c0 30             	add    eax,0x30
c0008146:	50                   	push   eax
c0008147:	6a 00                	push   0x0
c0008149:	53                   	push   ebx
c000814a:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c000814f:	83 e8 7a             	sub    eax,0x7a
c0008152:	50                   	push   eax
c0008153:	68 8c bf 00 c0       	push   0xc000bf8c
c0008158:	e8 69 09 00 00       	call   c0008ac6 <put_char_graphic>
c000815d:	a1 80 bf 00 c0       	mov    eax,ds:0xc000bf80
c0008162:	83 c4 14             	add    esp,0x14
c0008165:	83 e0 0f             	and    eax,0xf
c0008168:	83 c0 30             	add    eax,0x30
c000816b:	50                   	push   eax
c000816c:	6a 00                	push   0x0
c000816e:	53                   	push   ebx
c000816f:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c0008174:	83 e8 70             	sub    eax,0x70
c0008177:	50                   	push   eax
c0008178:	68 8c bf 00 c0       	push   0xc000bf8c
c000817d:	e8 44 09 00 00       	call   c0008ac6 <put_char_graphic>
c0008182:	83 c4 14             	add    esp,0x14
c0008185:	6a 20                	push   0x20
c0008187:	6a 00                	push   0x0
c0008189:	53                   	push   ebx
c000818a:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c000818f:	83 e8 66             	sub    eax,0x66
c0008192:	50                   	push   eax
c0008193:	68 8c bf 00 c0       	push   0xc000bf8c
c0008198:	e8 29 09 00 00       	call   c0008ac6 <put_char_graphic>
c000819d:	a1 7c bf 00 c0       	mov    eax,ds:0xc000bf7c
c00081a2:	83 c4 14             	add    esp,0x14
c00081a5:	25 f0 00 00 00       	and    eax,0xf0
c00081aa:	c1 e8 04             	shr    eax,0x4
c00081ad:	83 c0 30             	add    eax,0x30
c00081b0:	50                   	push   eax
c00081b1:	6a 00                	push   0x0
c00081b3:	53                   	push   ebx
c00081b4:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c00081b9:	83 e8 5c             	sub    eax,0x5c
c00081bc:	50                   	push   eax
c00081bd:	68 8c bf 00 c0       	push   0xc000bf8c
c00081c2:	e8 ff 08 00 00       	call   c0008ac6 <put_char_graphic>
c00081c7:	a1 7c bf 00 c0       	mov    eax,ds:0xc000bf7c
c00081cc:	83 c4 14             	add    esp,0x14
c00081cf:	83 e0 0f             	and    eax,0xf
c00081d2:	83 c0 30             	add    eax,0x30
c00081d5:	50                   	push   eax
c00081d6:	6a 00                	push   0x0
c00081d8:	53                   	push   ebx
c00081d9:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c00081de:	83 e8 52             	sub    eax,0x52
c00081e1:	50                   	push   eax
c00081e2:	68 8c bf 00 c0       	push   0xc000bf8c
c00081e7:	e8 da 08 00 00       	call   c0008ac6 <put_char_graphic>
c00081ec:	83 c4 14             	add    esp,0x14
c00081ef:	6a 3a                	push   0x3a
c00081f1:	6a 00                	push   0x0
c00081f3:	53                   	push   ebx
c00081f4:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c00081f9:	83 e8 48             	sub    eax,0x48
c00081fc:	50                   	push   eax
c00081fd:	68 8c bf 00 c0       	push   0xc000bf8c
c0008202:	e8 bf 08 00 00       	call   c0008ac6 <put_char_graphic>
c0008207:	a1 78 bf 00 c0       	mov    eax,ds:0xc000bf78
c000820c:	83 c4 14             	add    esp,0x14
c000820f:	25 f0 00 00 00       	and    eax,0xf0
c0008214:	c1 e8 04             	shr    eax,0x4
c0008217:	83 c0 30             	add    eax,0x30
c000821a:	50                   	push   eax
c000821b:	6a 00                	push   0x0
c000821d:	53                   	push   ebx
c000821e:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c0008223:	83 e8 3e             	sub    eax,0x3e
c0008226:	50                   	push   eax
c0008227:	68 8c bf 00 c0       	push   0xc000bf8c
c000822c:	e8 95 08 00 00       	call   c0008ac6 <put_char_graphic>
c0008231:	a1 78 bf 00 c0       	mov    eax,ds:0xc000bf78
c0008236:	83 c4 14             	add    esp,0x14
c0008239:	83 e0 0f             	and    eax,0xf
c000823c:	83 c0 30             	add    eax,0x30
c000823f:	50                   	push   eax
c0008240:	6a 00                	push   0x0
c0008242:	53                   	push   ebx
c0008243:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c0008248:	83 e8 34             	sub    eax,0x34
c000824b:	50                   	push   eax
c000824c:	68 8c bf 00 c0       	push   0xc000bf8c
c0008251:	e8 70 08 00 00       	call   c0008ac6 <put_char_graphic>
c0008256:	83 c4 14             	add    esp,0x14
c0008259:	6a 3a                	push   0x3a
c000825b:	6a 00                	push   0x0
c000825d:	53                   	push   ebx
c000825e:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c0008263:	83 e8 2a             	sub    eax,0x2a
c0008266:	50                   	push   eax
c0008267:	68 8c bf 00 c0       	push   0xc000bf8c
c000826c:	e8 55 08 00 00       	call   c0008ac6 <put_char_graphic>
c0008271:	a1 74 bf 00 c0       	mov    eax,ds:0xc000bf74
c0008276:	83 c4 14             	add    esp,0x14
c0008279:	25 f0 00 00 00       	and    eax,0xf0
c000827e:	c1 e8 04             	shr    eax,0x4
c0008281:	83 c0 30             	add    eax,0x30
c0008284:	50                   	push   eax
c0008285:	6a 00                	push   0x0
c0008287:	53                   	push   ebx
c0008288:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c000828d:	83 e8 20             	sub    eax,0x20
c0008290:	50                   	push   eax
c0008291:	68 8c bf 00 c0       	push   0xc000bf8c
c0008296:	e8 2b 08 00 00       	call   c0008ac6 <put_char_graphic>
c000829b:	a1 74 bf 00 c0       	mov    eax,ds:0xc000bf74
c00082a0:	83 c4 14             	add    esp,0x14
c00082a3:	83 e0 0f             	and    eax,0xf
c00082a6:	83 c0 30             	add    eax,0x30
c00082a9:	50                   	push   eax
c00082aa:	6a 00                	push   0x0
c00082ac:	53                   	push   ebx
c00082ad:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c00082b2:	83 e8 16             	sub    eax,0x16
c00082b5:	50                   	push   eax
c00082b6:	68 8c bf 00 c0       	push   0xc000bf8c
c00082bb:	e8 06 08 00 00       	call   c0008ac6 <put_char_graphic>
c00082c0:	83 c4 20             	add    esp,0x20
c00082c3:	eb 10                	jmp    c00082d5 <k_thread_a+0x35b>
c00082c5:	83 ec 0c             	sub    esp,0xc
c00082c8:	68 74 bf 00 c0       	push   0xc000bf74
c00082cd:	e8 ea 14 00 00       	call   c00097bc <get_time>
c00082d2:	83 c4 10             	add    esp,0x10
c00082d5:	39 35 74 bf 00 c0    	cmp    DWORD PTR ds:0xc000bf74,esi
c00082db:	74 e8                	je     c00082c5 <k_thread_a+0x34b>
c00082dd:	e9 b6 fc ff ff       	jmp    c0007f98 <k_thread_a+0x1e>

c00082e2 <kernel_main>:
c00082e2:	55                   	push   ebp
c00082e3:	89 e5                	mov    ebp,esp
c00082e5:	53                   	push   ebx
c00082e6:	53                   	push   ebx
c00082e7:	e8 a0 08 00 00       	call   c0008b8c <init_all>
c00082ec:	83 ec 0c             	sub    esp,0xc
c00082ef:	68 10 bc 00 c0       	push   0xc000bc10
c00082f4:	e8 6a 11 00 00       	call   c0009463 <put_str>
c00082f9:	c7 04 24 50 00 00 00 	mov    DWORD PTR [esp],0x50
c0008300:	e8 d4 10 00 00       	call   c00093d9 <put_char>
c0008305:	c7 04 24 4b 00 00 00 	mov    DWORD PTR [esp],0x4b
c000830c:	e8 c8 10 00 00       	call   c00093d9 <put_char>
c0008311:	c7 04 24 6e 00 00 00 	mov    DWORD PTR [esp],0x6e
c0008318:	e8 bc 10 00 00       	call   c00093d9 <put_char>
c000831d:	c7 04 24 20 00 00 00 	mov    DWORD PTR [esp],0x20
c0008324:	e8 b0 10 00 00       	call   c00093d9 <put_char>
c0008329:	c7 04 24 28 00 00 00 	mov    DWORD PTR [esp],0x28
c0008330:	e8 a4 10 00 00       	call   c00093d9 <put_char>
c0008335:	c7 04 24 63 00 00 00 	mov    DWORD PTR [esp],0x63
c000833c:	e8 98 10 00 00       	call   c00093d9 <put_char>
c0008341:	c7 04 24 29 00 00 00 	mov    DWORD PTR [esp],0x29
c0008348:	e8 8c 10 00 00       	call   c00093d9 <put_char>
c000834d:	c7 04 24 20 00 00 00 	mov    DWORD PTR [esp],0x20
c0008354:	e8 80 10 00 00       	call   c00093d9 <put_char>
c0008359:	c7 04 24 4c 00 00 00 	mov    DWORD PTR [esp],0x4c
c0008360:	e8 74 10 00 00       	call   c00093d9 <put_char>
c0008365:	c7 04 24 69 00 00 00 	mov    DWORD PTR [esp],0x69
c000836c:	e8 68 10 00 00       	call   c00093d9 <put_char>
c0008371:	c7 04 24 6e 00 00 00 	mov    DWORD PTR [esp],0x6e
c0008378:	e8 5c 10 00 00       	call   c00093d9 <put_char>
c000837d:	c7 04 24 43 00 00 00 	mov    DWORD PTR [esp],0x43
c0008384:	e8 50 10 00 00       	call   c00093d9 <put_char>
c0008389:	c7 04 24 68 00 00 00 	mov    DWORD PTR [esp],0x68
c0008390:	e8 44 10 00 00       	call   c00093d9 <put_char>
c0008395:	c7 04 24 65 00 00 00 	mov    DWORD PTR [esp],0x65
c000839c:	e8 38 10 00 00       	call   c00093d9 <put_char>
c00083a1:	c7 04 24 6e 00 00 00 	mov    DWORD PTR [esp],0x6e
c00083a8:	e8 2c 10 00 00       	call   c00093d9 <put_char>
c00083ad:	c7 04 24 6a 00 00 00 	mov    DWORD PTR [esp],0x6a
c00083b4:	e8 20 10 00 00       	call   c00093d9 <put_char>
c00083b9:	c7 04 24 75 00 00 00 	mov    DWORD PTR [esp],0x75
c00083c0:	e8 14 10 00 00       	call   c00093d9 <put_char>
c00083c5:	c7 04 24 6e 00 00 00 	mov    DWORD PTR [esp],0x6e
c00083cc:	e8 08 10 00 00       	call   c00093d9 <put_char>
c00083d1:	c7 04 24 50 00 00 00 	mov    DWORD PTR [esp],0x50
c00083d8:	68 ff ff ff 00       	push   0xffffff
c00083dd:	6a 14                	push   0x14
c00083df:	6a 14                	push   0x14
c00083e1:	68 8c bf 00 c0       	push   0xc000bf8c
c00083e6:	e8 db 06 00 00       	call   c0008ac6 <put_char_graphic>
c00083eb:	83 c4 14             	add    esp,0x14
c00083ee:	6a 4b                	push   0x4b
c00083f0:	68 ff ff ff 00       	push   0xffffff
c00083f5:	6a 14                	push   0x14
c00083f7:	6a 1e                	push   0x1e
c00083f9:	68 8c bf 00 c0       	push   0xc000bf8c
c00083fe:	e8 c3 06 00 00       	call   c0008ac6 <put_char_graphic>
c0008403:	83 c4 14             	add    esp,0x14
c0008406:	6a 6e                	push   0x6e
c0008408:	68 ff ff ff 00       	push   0xffffff
c000840d:	6a 14                	push   0x14
c000840f:	6a 28                	push   0x28
c0008411:	68 8c bf 00 c0       	push   0xc000bf8c
c0008416:	e8 ab 06 00 00       	call   c0008ac6 <put_char_graphic>
c000841b:	83 c4 14             	add    esp,0x14
c000841e:	6a 20                	push   0x20
c0008420:	68 ff ff ff 00       	push   0xffffff
c0008425:	6a 14                	push   0x14
c0008427:	6a 32                	push   0x32
c0008429:	68 8c bf 00 c0       	push   0xc000bf8c
c000842e:	e8 93 06 00 00       	call   c0008ac6 <put_char_graphic>
c0008433:	83 c4 14             	add    esp,0x14
c0008436:	6a 28                	push   0x28
c0008438:	68 ff ff ff 00       	push   0xffffff
c000843d:	6a 14                	push   0x14
c000843f:	6a 3c                	push   0x3c
c0008441:	68 8c bf 00 c0       	push   0xc000bf8c
c0008446:	e8 7b 06 00 00       	call   c0008ac6 <put_char_graphic>
c000844b:	83 c4 14             	add    esp,0x14
c000844e:	6a 63                	push   0x63
c0008450:	68 ff ff ff 00       	push   0xffffff
c0008455:	6a 14                	push   0x14
c0008457:	6a 46                	push   0x46
c0008459:	68 8c bf 00 c0       	push   0xc000bf8c
c000845e:	e8 63 06 00 00       	call   c0008ac6 <put_char_graphic>
c0008463:	83 c4 14             	add    esp,0x14
c0008466:	6a 29                	push   0x29
c0008468:	68 ff ff ff 00       	push   0xffffff
c000846d:	6a 14                	push   0x14
c000846f:	6a 50                	push   0x50
c0008471:	68 8c bf 00 c0       	push   0xc000bf8c
c0008476:	e8 4b 06 00 00       	call   c0008ac6 <put_char_graphic>
c000847b:	83 c4 14             	add    esp,0x14
c000847e:	31 db                	xor    ebx,ebx
c0008480:	6a 20                	push   0x20
c0008482:	68 ff ff ff 00       	push   0xffffff
c0008487:	6a 14                	push   0x14
c0008489:	6a 5a                	push   0x5a
c000848b:	68 8c bf 00 c0       	push   0xc000bf8c
c0008490:	e8 31 06 00 00       	call   c0008ac6 <put_char_graphic>
c0008495:	83 c4 14             	add    esp,0x14
c0008498:	6a 4c                	push   0x4c
c000849a:	68 ff ff ff 00       	push   0xffffff
c000849f:	6a 14                	push   0x14
c00084a1:	6a 64                	push   0x64
c00084a3:	68 8c bf 00 c0       	push   0xc000bf8c
c00084a8:	e8 19 06 00 00       	call   c0008ac6 <put_char_graphic>
c00084ad:	83 c4 14             	add    esp,0x14
c00084b0:	6a 69                	push   0x69
c00084b2:	68 ff ff ff 00       	push   0xffffff
c00084b7:	6a 14                	push   0x14
c00084b9:	6a 6e                	push   0x6e
c00084bb:	68 8c bf 00 c0       	push   0xc000bf8c
c00084c0:	e8 01 06 00 00       	call   c0008ac6 <put_char_graphic>
c00084c5:	83 c4 14             	add    esp,0x14
c00084c8:	6a 6e                	push   0x6e
c00084ca:	68 ff ff ff 00       	push   0xffffff
c00084cf:	6a 14                	push   0x14
c00084d1:	6a 78                	push   0x78
c00084d3:	68 8c bf 00 c0       	push   0xc000bf8c
c00084d8:	e8 e9 05 00 00       	call   c0008ac6 <put_char_graphic>
c00084dd:	83 c4 14             	add    esp,0x14
c00084e0:	6a 43                	push   0x43
c00084e2:	68 ff ff ff 00       	push   0xffffff
c00084e7:	6a 14                	push   0x14
c00084e9:	68 82 00 00 00       	push   0x82
c00084ee:	68 8c bf 00 c0       	push   0xc000bf8c
c00084f3:	e8 ce 05 00 00       	call   c0008ac6 <put_char_graphic>
c00084f8:	83 c4 14             	add    esp,0x14
c00084fb:	6a 68                	push   0x68
c00084fd:	68 ff ff ff 00       	push   0xffffff
c0008502:	6a 14                	push   0x14
c0008504:	68 8c 00 00 00       	push   0x8c
c0008509:	68 8c bf 00 c0       	push   0xc000bf8c
c000850e:	e8 b3 05 00 00       	call   c0008ac6 <put_char_graphic>
c0008513:	83 c4 14             	add    esp,0x14
c0008516:	6a 65                	push   0x65
c0008518:	68 ff ff ff 00       	push   0xffffff
c000851d:	6a 14                	push   0x14
c000851f:	68 96 00 00 00       	push   0x96
c0008524:	68 8c bf 00 c0       	push   0xc000bf8c
c0008529:	e8 98 05 00 00       	call   c0008ac6 <put_char_graphic>
c000852e:	83 c4 14             	add    esp,0x14
c0008531:	6a 6e                	push   0x6e
c0008533:	68 ff ff ff 00       	push   0xffffff
c0008538:	6a 14                	push   0x14
c000853a:	68 a0 00 00 00       	push   0xa0
c000853f:	68 8c bf 00 c0       	push   0xc000bf8c
c0008544:	e8 7d 05 00 00       	call   c0008ac6 <put_char_graphic>
c0008549:	83 c4 14             	add    esp,0x14
c000854c:	6a 6a                	push   0x6a
c000854e:	68 ff ff ff 00       	push   0xffffff
c0008553:	6a 14                	push   0x14
c0008555:	68 aa 00 00 00       	push   0xaa
c000855a:	68 8c bf 00 c0       	push   0xc000bf8c
c000855f:	e8 62 05 00 00       	call   c0008ac6 <put_char_graphic>
c0008564:	83 c4 14             	add    esp,0x14
c0008567:	6a 75                	push   0x75
c0008569:	68 ff ff ff 00       	push   0xffffff
c000856e:	6a 14                	push   0x14
c0008570:	68 b4 00 00 00       	push   0xb4
c0008575:	68 8c bf 00 c0       	push   0xc000bf8c
c000857a:	e8 47 05 00 00       	call   c0008ac6 <put_char_graphic>
c000857f:	83 c4 14             	add    esp,0x14
c0008582:	6a 6e                	push   0x6e
c0008584:	68 ff ff ff 00       	push   0xffffff
c0008589:	6a 14                	push   0x14
c000858b:	68 be 00 00 00       	push   0xbe
c0008590:	68 8c bf 00 c0       	push   0xc000bf8c
c0008595:	e8 2c 05 00 00       	call   c0008ac6 <put_char_graphic>
c000859a:	83 c4 18             	add    esp,0x18
c000859d:	6a 03                	push   0x3
c000859f:	68 1d bc 00 c0       	push   0xc000bc1d
c00085a4:	68 ff ff ff 0f       	push   0xfffffff
c00085a9:	6a 28                	push   0x28
c00085ab:	6a 14                	push   0x14
c00085ad:	68 8c bf 00 c0       	push   0xc000bf8c
c00085b2:	e8 9a 05 00 00       	call   c0008b51 <put_str_graphic>
c00085b7:	83 c4 20             	add    esp,0x20
c00085ba:	6a 00                	push   0x0
c00085bc:	68 7a 7f 00 c0       	push   0xc0007f7a
c00085c1:	6a 1f                	push   0x1f
c00085c3:	68 21 bc 00 c0       	push   0xc000bc21
c00085c8:	e8 33 11 00 00       	call   c0009700 <thread_start>
c00085cd:	6a 00                	push   0x0
c00085cf:	68 58 7f 00 c0       	push   0xc0007f58
c00085d4:	6a 1f                	push   0x1f
c00085d6:	68 25 bc 00 c0       	push   0xc000bc25
c00085db:	e8 20 11 00 00       	call   c0009700 <thread_start>
c00085e0:	83 c4 20             	add    esp,0x20
c00085e3:	e8 19 08 00 00       	call   c0008e01 <intr_enable>
c00085e8:	83 ec 0c             	sub    esp,0xc
c00085eb:	6a 50                	push   0x50
c00085ed:	53                   	push   ebx
c00085ee:	43                   	inc    ebx
c00085ef:	6a 28                	push   0x28
c00085f1:	68 be 00 00 00       	push   0xbe
c00085f6:	68 8c bf 00 c0       	push   0xc000bf8c
c00085fb:	e8 c6 04 00 00       	call   c0008ac6 <put_char_graphic>
c0008600:	83 c4 20             	add    esp,0x20
c0008603:	eb e3                	jmp    c00085e8 <kernel_main+0x306>
c0008605:	00 00                	add    BYTE PTR [eax],al
	...

c0008608 <bitmap_init>:
c0008608:	55                   	push   ebp
c0008609:	89 e5                	mov    ebp,esp
c000860b:	83 ec 0c             	sub    esp,0xc
c000860e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0008611:	ff 30                	push   DWORD PTR [eax]
c0008613:	6a 00                	push   0x0
c0008615:	ff 70 04             	push   DWORD PTR [eax+0x4]
c0008618:	e8 97 0e 00 00       	call   c00094b4 <memset>
c000861d:	83 c4 10             	add    esp,0x10
c0008620:	c9                   	leave  
c0008621:	c3                   	ret    

c0008622 <bitmap_scan_test>:
c0008622:	55                   	push   ebp
c0008623:	89 e5                	mov    ebp,esp
c0008625:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
c0008628:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
c000862b:	5d                   	pop    ebp
c000862c:	8b 52 04             	mov    edx,DWORD PTR [edx+0x4]
c000862f:	89 c8                	mov    eax,ecx
c0008631:	83 e1 07             	and    ecx,0x7
c0008634:	c1 e8 03             	shr    eax,0x3
c0008637:	0f b6 04 02          	movzx  eax,BYTE PTR [edx+eax*1]
c000863b:	ba 01 00 00 00       	mov    edx,0x1
c0008640:	d3 e2                	shl    edx,cl
c0008642:	21 d0                	and    eax,edx
c0008644:	c3                   	ret    

c0008645 <bitmap_alloc>:
c0008645:	55                   	push   ebp
c0008646:	89 e5                	mov    ebp,esp
c0008648:	57                   	push   edi
c0008649:	56                   	push   esi
c000864a:	31 f6                	xor    esi,esi
c000864c:	53                   	push   ebx
c000864d:	83 ec 1c             	sub    esp,0x1c
c0008650:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c0008653:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
c0008656:	eb 01                	jmp    c0008659 <bitmap_alloc+0x14>
c0008658:	46                   	inc    esi
c0008659:	80 3c 30 ff          	cmp    BYTE PTR [eax+esi*1],0xff
c000865d:	75 04                	jne    c0008663 <bitmap_alloc+0x1e>
c000865f:	3b 33                	cmp    esi,DWORD PTR [ebx]
c0008661:	72 f5                	jb     c0008658 <bitmap_alloc+0x13>
c0008663:	3b 33                	cmp    esi,DWORD PTR [ebx]
c0008665:	72 19                	jb     c0008680 <bitmap_alloc+0x3b>
c0008667:	68 2c bc 00 c0       	push   0xc000bc2c
c000866c:	68 78 bc 00 c0       	push   0xc000bc78
c0008671:	6a 2e                	push   0x2e
c0008673:	68 50 bc 00 c0       	push   0xc000bc50
c0008678:	e8 ef 00 00 00       	call   c000876c <panic_spin>
c000867d:	83 c4 10             	add    esp,0x10
c0008680:	8b 13                	mov    edx,DWORD PTR [ebx]
c0008682:	83 c8 ff             	or     eax,0xffffffff
c0008685:	39 d6                	cmp    esi,edx
c0008687:	74 72                	je     c00086fb <bitmap_alloc+0xb6>
c0008689:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
c000868c:	31 c9                	xor    ecx,ecx
c000868e:	bf 01 00 00 00       	mov    edi,0x1
c0008693:	89 75 e4             	mov    DWORD PTR [ebp-0x1c],esi
c0008696:	89 55 dc             	mov    DWORD PTR [ebp-0x24],edx
c0008699:	8a 04 30             	mov    al,BYTE PTR [eax+esi*1]
c000869c:	eb 01                	jmp    c000869f <bitmap_alloc+0x5a>
c000869e:	41                   	inc    ecx
c000869f:	89 fe                	mov    esi,edi
c00086a1:	d3 e6                	shl    esi,cl
c00086a3:	89 f2                	mov    edx,esi
c00086a5:	84 d0                	test   al,dl
c00086a7:	75 f5                	jne    c000869e <bitmap_alloc+0x59>
c00086a9:	8b 75 e4             	mov    esi,DWORD PTR [ebp-0x1c]
c00086ac:	83 7d 0c 01          	cmp    DWORD PTR [ebp+0xc],0x1
c00086b0:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
c00086b3:	8d 0c f1             	lea    ecx,[ecx+esi*8]
c00086b6:	89 c8                	mov    eax,ecx
c00086b8:	74 41                	je     c00086fb <bitmap_alloc+0xb6>
c00086ba:	8d 3c d5 00 00 00 00 	lea    edi,[edx*8+0x0]
c00086c1:	be 01 00 00 00       	mov    esi,0x1
c00086c6:	29 cf                	sub    edi,ecx
c00086c8:	8d 51 01             	lea    edx,[ecx+0x1]
c00086cb:	eb 27                	jmp    c00086f4 <bitmap_alloc+0xaf>
c00086cd:	50                   	push   eax
c00086ce:	46                   	inc    esi
c00086cf:	50                   	push   eax
c00086d0:	52                   	push   edx
c00086d1:	53                   	push   ebx
c00086d2:	89 55 e0             	mov    DWORD PTR [ebp-0x20],edx
c00086d5:	e8 48 ff ff ff       	call   c0008622 <bitmap_scan_test>
c00086da:	83 c4 10             	add    esp,0x10
c00086dd:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
c00086e0:	85 c0                	test   eax,eax
c00086e2:	74 02                	je     c00086e6 <bitmap_alloc+0xa1>
c00086e4:	31 f6                	xor    esi,esi
c00086e6:	3b 75 0c             	cmp    esi,DWORD PTR [ebp+0xc]
c00086e9:	75 07                	jne    c00086f2 <bitmap_alloc+0xad>
c00086eb:	29 f2                	sub    edx,esi
c00086ed:	8d 42 01             	lea    eax,[edx+0x1]
c00086f0:	eb 09                	jmp    c00086fb <bitmap_alloc+0xb6>
c00086f2:	4f                   	dec    edi
c00086f3:	42                   	inc    edx
c00086f4:	85 ff                	test   edi,edi
c00086f6:	75 d5                	jne    c00086cd <bitmap_alloc+0x88>
c00086f8:	83 c8 ff             	or     eax,0xffffffff
c00086fb:	8d 65 f4             	lea    esp,[ebp-0xc]
c00086fe:	5b                   	pop    ebx
c00086ff:	5e                   	pop    esi
c0008700:	5f                   	pop    edi
c0008701:	5d                   	pop    ebp
c0008702:	c3                   	ret    

c0008703 <bitmap_set>:
c0008703:	55                   	push   ebp
c0008704:	89 e5                	mov    ebp,esp
c0008706:	57                   	push   edi
c0008707:	56                   	push   esi
c0008708:	53                   	push   ebx
c0008709:	83 ec 0c             	sub    esp,0xc
c000870c:	8a 5d 10             	mov    bl,BYTE PTR [ebp+0x10]
c000870f:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
c0008712:	8b 7d 0c             	mov    edi,DWORD PTR [ebp+0xc]
c0008715:	80 fb 01             	cmp    bl,0x1
c0008718:	76 19                	jbe    c0008733 <bitmap_set+0x30>
c000871a:	68 5d bc 00 c0       	push   0xc000bc5d
c000871f:	68 88 bc 00 c0       	push   0xc000bc88
c0008724:	6a 65                	push   0x65
c0008726:	68 50 bc 00 c0       	push   0xc000bc50
c000872b:	e8 3c 00 00 00       	call   c000876c <panic_spin>
c0008730:	83 c4 10             	add    esp,0x10
c0008733:	89 fa                	mov    edx,edi
c0008735:	89 f9                	mov    ecx,edi
c0008737:	c1 ea 03             	shr    edx,0x3
c000873a:	83 e1 07             	and    ecx,0x7
c000873d:	84 db                	test   bl,bl
c000873f:	74 06                	je     c0008747 <bitmap_set+0x44>
c0008741:	fe cb                	dec    bl
c0008743:	75 1e                	jne    c0008763 <bitmap_set+0x60>
c0008745:	eb 10                	jmp    c0008757 <bitmap_set+0x54>
c0008747:	03 56 04             	add    edx,DWORD PTR [esi+0x4]
c000874a:	b8 01 00 00 00       	mov    eax,0x1
c000874f:	d3 e0                	shl    eax,cl
c0008751:	f7 d0                	not    eax
c0008753:	20 02                	and    BYTE PTR [edx],al
c0008755:	eb 0c                	jmp    c0008763 <bitmap_set+0x60>
c0008757:	03 56 04             	add    edx,DWORD PTR [esi+0x4]
c000875a:	b8 01 00 00 00       	mov    eax,0x1
c000875f:	d3 e0                	shl    eax,cl
c0008761:	08 02                	or     BYTE PTR [edx],al
c0008763:	8d 65 f4             	lea    esp,[ebp-0xc]
c0008766:	5b                   	pop    ebx
c0008767:	5e                   	pop    esi
c0008768:	5f                   	pop    edi
c0008769:	5d                   	pop    ebp
c000876a:	c3                   	ret    
	...

c000876c <panic_spin>:
c000876c:	55                   	push   ebp
c000876d:	89 e5                	mov    ebp,esp
c000876f:	83 ec 08             	sub    esp,0x8
c0008772:	e8 76 06 00 00       	call   c0008ded <intr_disable>
c0008777:	83 ec 0c             	sub    esp,0xc
c000877a:	68 93 bc 00 c0       	push   0xc000bc93
c000877f:	e8 df 0c 00 00       	call   c0009463 <put_str>
c0008784:	c7 04 24 9a bc 00 c0 	mov    DWORD PTR [esp],0xc000bc9a
c000878b:	e8 d3 0c 00 00       	call   c0009463 <put_str>
c0008790:	5a                   	pop    edx
c0008791:	ff 75 08             	push   DWORD PTR [ebp+0x8]
c0008794:	e8 ca 0c 00 00       	call   c0009463 <put_str>
c0008799:	c7 04 24 0a 00 00 00 	mov    DWORD PTR [esp],0xa
c00087a0:	e8 34 0c 00 00       	call   c00093d9 <put_char>
c00087a5:	c7 04 24 a0 bc 00 c0 	mov    DWORD PTR [esp],0xc000bca0
c00087ac:	e8 b2 0c 00 00       	call   c0009463 <put_str>
c00087b1:	59                   	pop    ecx
c00087b2:	ff 75 10             	push   DWORD PTR [ebp+0x10]
c00087b5:	e8 a9 0c 00 00       	call   c0009463 <put_str>
c00087ba:	c7 04 24 0a 00 00 00 	mov    DWORD PTR [esp],0xa
c00087c1:	e8 13 0c 00 00       	call   c00093d9 <put_char>
c00087c6:	c7 04 24 ae bc 00 c0 	mov    DWORD PTR [esp],0xc000bcae
c00087cd:	e8 91 0c 00 00       	call   c0009463 <put_str>
c00087d2:	58                   	pop    eax
c00087d3:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
c00087d6:	e8 a7 0c 00 00       	call   c0009482 <put_int>
c00087db:	c7 04 24 0a 00 00 00 	mov    DWORD PTR [esp],0xa
c00087e2:	e8 f2 0b 00 00       	call   c00093d9 <put_char>
c00087e7:	c7 04 24 b4 bc 00 c0 	mov    DWORD PTR [esp],0xc000bcb4
c00087ee:	e8 70 0c 00 00       	call   c0009463 <put_str>
c00087f3:	58                   	pop    eax
c00087f4:	ff 75 14             	push   DWORD PTR [ebp+0x14]
c00087f7:	e8 67 0c 00 00       	call   c0009463 <put_str>
c00087fc:	c7 04 24 0a 00 00 00 	mov    DWORD PTR [esp],0xa
c0008803:	e8 d1 0b 00 00       	call   c00093d9 <put_char>
c0008808:	83 c4 10             	add    esp,0x10
c000880b:	eb fe                	jmp    c000880b <panic_spin+0x9f>
c000880d:	00 00                	add    BYTE PTR [eax],al
	...

c0008810 <init_fifo>:
c0008810:	55                   	push   ebp
c0008811:	89 e5                	mov    ebp,esp
c0008813:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0008816:	8b 55 14             	mov    edx,DWORD PTR [ebp+0x14]
c0008819:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
c000881c:	c7 40 10 00 00 00 00 	mov    DWORD PTR [eax+0x10],0x0
c0008823:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
c0008826:	89 48 04             	mov    DWORD PTR [eax+0x4],ecx
c0008829:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
c000882c:	c7 40 14 00 00 00 00 	mov    DWORD PTR [eax+0x14],0x0
c0008833:	5d                   	pop    ebp
c0008834:	c3                   	ret    

c0008835 <fifo_put>:
c0008835:	55                   	push   ebp
c0008836:	89 e5                	mov    ebp,esp
c0008838:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c000883b:	57                   	push   edi
c000883c:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
c000883f:	56                   	push   esi
c0008840:	53                   	push   ebx
c0008841:	8b 48 0c             	mov    ecx,DWORD PTR [eax+0xc]
c0008844:	85 c9                	test   ecx,ecx
c0008846:	75 09                	jne    c0008851 <fifo_put+0x1c>
c0008848:	c7 40 18 01 00 00 00 	mov    DWORD PTR [eax+0x18],0x1
c000884f:	eb 6f                	jmp    c00088c0 <fifo_put+0x8b>
c0008851:	49                   	dec    ecx
c0008852:	89 48 0c             	mov    DWORD PTR [eax+0xc],ecx
c0008855:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
c0008858:	83 f9 10             	cmp    ecx,0x10
c000885b:	74 21                	je     c000887e <fifo_put+0x49>
c000885d:	7f 07                	jg     c0008866 <fifo_put+0x31>
c000885f:	83 f9 08             	cmp    ecx,0x8
c0008862:	75 5c                	jne    c00088c0 <fifo_put+0x8b>
c0008864:	eb 0c                	jmp    c0008872 <fifo_put+0x3d>
c0008866:	83 f9 20             	cmp    ecx,0x20
c0008869:	74 21                	je     c000888c <fifo_put+0x57>
c000886b:	83 f9 40             	cmp    ecx,0x40
c000886e:	75 50                	jne    c00088c0 <fifo_put+0x8b>
c0008870:	eb 26                	jmp    c0008898 <fifo_put+0x63>
c0008872:	8a 1a                	mov    bl,BYTE PTR [edx]
c0008874:	8b 08                	mov    ecx,DWORD PTR [eax]
c0008876:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
c0008879:	88 1c 11             	mov    BYTE PTR [ecx+edx*1],bl
c000887c:	eb 2b                	jmp    c00088a9 <fifo_put+0x74>
c000887e:	66 8b 32             	mov    si,WORD PTR [edx]
c0008881:	8b 48 14             	mov    ecx,DWORD PTR [eax+0x14]
c0008884:	8b 10                	mov    edx,DWORD PTR [eax]
c0008886:	66 89 34 4a          	mov    WORD PTR [edx+ecx*2],si
c000888a:	eb 1d                	jmp    c00088a9 <fifo_put+0x74>
c000888c:	8b 32                	mov    esi,DWORD PTR [edx]
c000888e:	8b 48 14             	mov    ecx,DWORD PTR [eax+0x14]
c0008891:	8b 10                	mov    edx,DWORD PTR [eax]
c0008893:	89 34 8a             	mov    DWORD PTR [edx+ecx*4],esi
c0008896:	eb 11                	jmp    c00088a9 <fifo_put+0x74>
c0008898:	8b 32                	mov    esi,DWORD PTR [edx]
c000889a:	8b 7a 04             	mov    edi,DWORD PTR [edx+0x4]
c000889d:	8b 48 14             	mov    ecx,DWORD PTR [eax+0x14]
c00088a0:	8b 10                	mov    edx,DWORD PTR [eax]
c00088a2:	89 34 ca             	mov    DWORD PTR [edx+ecx*8],esi
c00088a5:	89 7c ca 04          	mov    DWORD PTR [edx+ecx*8+0x4],edi
c00088a9:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
c00088ac:	31 c9                	xor    ecx,ecx
c00088ae:	42                   	inc    edx
c00088af:	3b 50 08             	cmp    edx,DWORD PTR [eax+0x8]
c00088b2:	0f 95 c1             	setne  cl
c00088b5:	f7 d9                	neg    ecx
c00088b7:	21 ca                	and    edx,ecx
c00088b9:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
c00088bc:	31 c0                	xor    eax,eax
c00088be:	eb 03                	jmp    c00088c3 <fifo_put+0x8e>
c00088c0:	83 c8 ff             	or     eax,0xffffffff
c00088c3:	5b                   	pop    ebx
c00088c4:	5e                   	pop    esi
c00088c5:	5f                   	pop    edi
c00088c6:	5d                   	pop    ebp
c00088c7:	c3                   	ret    

c00088c8 <fifo_get>:
c00088c8:	55                   	push   ebp
c00088c9:	83 c8 ff             	or     eax,0xffffffff
c00088cc:	89 e5                	mov    ebp,esp
c00088ce:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
c00088d1:	57                   	push   edi
c00088d2:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
c00088d5:	56                   	push   esi
c00088d6:	53                   	push   ebx
c00088d7:	8b 5a 0c             	mov    ebx,DWORD PTR [edx+0xc]
c00088da:	3b 5a 08             	cmp    ebx,DWORD PTR [edx+0x8]
c00088dd:	74 64                	je     c0008943 <fifo_get+0x7b>
c00088df:	43                   	inc    ebx
c00088e0:	8b 42 10             	mov    eax,DWORD PTR [edx+0x10]
c00088e3:	89 5a 0c             	mov    DWORD PTR [edx+0xc],ebx
c00088e6:	8b 5a 04             	mov    ebx,DWORD PTR [edx+0x4]
c00088e9:	83 fb 10             	cmp    ebx,0x10
c00088ec:	74 1e                	je     c000890c <fifo_get+0x44>
c00088ee:	7f 07                	jg     c00088f7 <fifo_get+0x2f>
c00088f0:	83 fb 08             	cmp    ebx,0x8
c00088f3:	75 39                	jne    c000892e <fifo_get+0x66>
c00088f5:	eb 0c                	jmp    c0008903 <fifo_get+0x3b>
c00088f7:	83 fb 20             	cmp    ebx,0x20
c00088fa:	74 1b                	je     c0008917 <fifo_get+0x4f>
c00088fc:	83 fb 40             	cmp    ebx,0x40
c00088ff:	75 2d                	jne    c000892e <fifo_get+0x66>
c0008901:	eb 1d                	jmp    c0008920 <fifo_get+0x58>
c0008903:	8b 1a                	mov    ebx,DWORD PTR [edx]
c0008905:	8a 04 03             	mov    al,BYTE PTR [ebx+eax*1]
c0008908:	88 01                	mov    BYTE PTR [ecx],al
c000890a:	eb 22                	jmp    c000892e <fifo_get+0x66>
c000890c:	8b 1a                	mov    ebx,DWORD PTR [edx]
c000890e:	66 8b 04 43          	mov    ax,WORD PTR [ebx+eax*2]
c0008912:	66 89 01             	mov    WORD PTR [ecx],ax
c0008915:	eb 17                	jmp    c000892e <fifo_get+0x66>
c0008917:	8b 1a                	mov    ebx,DWORD PTR [edx]
c0008919:	8b 04 83             	mov    eax,DWORD PTR [ebx+eax*4]
c000891c:	89 01                	mov    DWORD PTR [ecx],eax
c000891e:	eb 0e                	jmp    c000892e <fifo_get+0x66>
c0008920:	8b 1a                	mov    ebx,DWORD PTR [edx]
c0008922:	8b 34 c3             	mov    esi,DWORD PTR [ebx+eax*8]
c0008925:	8b 7c c3 04          	mov    edi,DWORD PTR [ebx+eax*8+0x4]
c0008929:	89 31                	mov    DWORD PTR [ecx],esi
c000892b:	89 79 04             	mov    DWORD PTR [ecx+0x4],edi
c000892e:	8b 42 10             	mov    eax,DWORD PTR [edx+0x10]
c0008931:	31 c9                	xor    ecx,ecx
c0008933:	40                   	inc    eax
c0008934:	3b 42 08             	cmp    eax,DWORD PTR [edx+0x8]
c0008937:	0f 95 c1             	setne  cl
c000893a:	f7 d9                	neg    ecx
c000893c:	21 c8                	and    eax,ecx
c000893e:	89 42 10             	mov    DWORD PTR [edx+0x10],eax
c0008941:	31 c0                	xor    eax,eax
c0008943:	5b                   	pop    ebx
c0008944:	5e                   	pop    esi
c0008945:	5f                   	pop    edi
c0008946:	5d                   	pop    ebp
c0008947:	c3                   	ret    

c0008948 <fifo_empty>:
c0008948:	55                   	push   ebp
c0008949:	89 e5                	mov    ebp,esp
c000894b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c000894e:	5d                   	pop    ebp
c000894f:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
c0008952:	39 50 0c             	cmp    DWORD PTR [eax+0xc],edx
c0008955:	0f 94 c0             	sete   al
c0008958:	0f b6 c0             	movzx  eax,al
c000895b:	c3                   	ret    

c000895c <RectangleFill>:
c000895c:	55                   	push   ebp
c000895d:	89 e5                	mov    ebp,esp
c000895f:	57                   	push   edi
c0008960:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
c0008963:	56                   	push   esi
c0008964:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
c0008967:	53                   	push   ebx
c0008968:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c000896b:	83 3d 0c 7c 00 00 01 	cmp    DWORD PTR ds:0x7c0c,0x1
c0008972:	75 30                	jne    c00089a4 <RectangleFill+0x48>
c0008974:	89 ca                	mov    edx,ecx
c0008976:	81 e2 00 00 00 ff    	and    edx,0xff000000
c000897c:	81 fa 00 00 00 ff    	cmp    edx,0xff000000
c0008982:	75 16                	jne    c000899a <RectangleFill+0x3e>
c0008984:	eb 1e                	jmp    c00089a4 <RectangleFill+0x48>
c0008986:	8b 7b 04             	mov    edi,DWORD PTR [ebx+0x4]
c0008989:	8b 33                	mov    esi,DWORD PTR [ebx]
c000898b:	0f af f8             	imul   edi,eax
c000898e:	01 d7                	add    edi,edx
c0008990:	42                   	inc    edx
c0008991:	89 0c be             	mov    DWORD PTR [esi+edi*4],ecx
c0008994:	3b 55 18             	cmp    edx,DWORD PTR [ebp+0x18]
c0008997:	7e ed                	jle    c0008986 <RectangleFill+0x2a>
c0008999:	40                   	inc    eax
c000899a:	3b 45 1c             	cmp    eax,DWORD PTR [ebp+0x1c]
c000899d:	7f 05                	jg     c00089a4 <RectangleFill+0x48>
c000899f:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
c00089a2:	eb f0                	jmp    c0008994 <RectangleFill+0x38>
c00089a4:	5b                   	pop    ebx
c00089a5:	5e                   	pop    esi
c00089a6:	5f                   	pop    edi
c00089a7:	5d                   	pop    ebp
c00089a8:	c3                   	ret    

c00089a9 <init_Rectangle>:
c00089a9:	55                   	push   ebp
c00089aa:	89 e5                	mov    ebp,esp
c00089ac:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c00089af:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
c00089b2:	89 10                	mov    DWORD PTR [eax],edx
c00089b4:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
c00089b7:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
c00089ba:	8b 55 14             	mov    edx,DWORD PTR [ebp+0x14]
c00089bd:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
c00089c0:	8b 55 18             	mov    edx,DWORD PTR [ebp+0x18]
c00089c3:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
c00089c6:	8b 55 1c             	mov    edx,DWORD PTR [ebp+0x1c]
c00089c9:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
c00089cc:	5d                   	pop    ebp
c00089cd:	c3                   	ret    

c00089ce <init_screen>:
c00089ce:	55                   	push   ebp
c00089cf:	89 e5                	mov    ebp,esp
c00089d1:	53                   	push   ebx
c00089d2:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c00089d5:	83 3d 0c 7c 00 00 01 	cmp    DWORD PTR ds:0x7c0c,0x1
c00089dc:	0f 85 df 00 00 00    	jne    c0008ac1 <init_screen+0xf3>
c00089e2:	a1 1c 7c 00 00       	mov    eax,ds:0x7c1c
c00089e7:	8b 15 18 7c 00 00    	mov    edx,DWORD PTR ds:0x7c18
c00089ed:	c7 43 0c 00 00 00 00 	mov    DWORD PTR [ebx+0xc],0x0
c00089f4:	c7 43 10 00 00 00 00 	mov    DWORD PTR [ebx+0x10],0x0
c00089fb:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
c00089fe:	89 53 04             	mov    DWORD PTR [ebx+0x4],edx
c0008a01:	a1 1c 7c 00 00       	mov    eax,ds:0x7c1c
c0008a06:	c7 03 00 00 00 fe    	mov    DWORD PTR [ebx],0xfe000000
c0008a0c:	83 e8 33             	sub    eax,0x33
c0008a0f:	50                   	push   eax
c0008a10:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c0008a15:	48                   	dec    eax
c0008a16:	50                   	push   eax
c0008a17:	6a 00                	push   0x0
c0008a19:	6a 00                	push   0x0
c0008a1b:	68 84 84 00 00       	push   0x8484
c0008a20:	53                   	push   ebx
c0008a21:	e8 36 ff ff ff       	call   c000895c <RectangleFill>
c0008a26:	a1 1c 7c 00 00       	mov    eax,ds:0x7c1c
c0008a2b:	8d 50 ff             	lea    edx,[eax-0x1]
c0008a2e:	83 e8 33             	sub    eax,0x33
c0008a31:	52                   	push   edx
c0008a32:	8b 15 18 7c 00 00    	mov    edx,DWORD PTR ds:0x7c18
c0008a38:	4a                   	dec    edx
c0008a39:	52                   	push   edx
c0008a3a:	50                   	push   eax
c0008a3b:	6a 00                	push   0x0
c0008a3d:	68 c6 c6 c6 00       	push   0xc6c6c6
c0008a42:	53                   	push   ebx
c0008a43:	e8 14 ff ff ff       	call   c000895c <RectangleFill>
c0008a48:	a1 1c 7c 00 00       	mov    eax,ds:0x7c1c
c0008a4d:	83 c4 30             	add    esp,0x30
c0008a50:	8d 50 f8             	lea    edx,[eax-0x8]
c0008a53:	83 e8 26             	sub    eax,0x26
c0008a56:	52                   	push   edx
c0008a57:	6a 2b                	push   0x2b
c0008a59:	50                   	push   eax
c0008a5a:	6a 0d                	push   0xd
c0008a5c:	68 84 84 84 00       	push   0x848484
c0008a61:	53                   	push   ebx
c0008a62:	e8 f5 fe ff ff       	call   c000895c <RectangleFill>
c0008a67:	a1 1c 7c 00 00       	mov    eax,ds:0x7c1c
c0008a6c:	8d 50 f5             	lea    edx,[eax-0xb]
c0008a6f:	83 e8 29             	sub    eax,0x29
c0008a72:	52                   	push   edx
c0008a73:	6a 28                	push   0x28
c0008a75:	50                   	push   eax
c0008a76:	6a 0a                	push   0xa
c0008a78:	68 ff ff ff 00       	push   0xffffff
c0008a7d:	53                   	push   ebx
c0008a7e:	e8 d9 fe ff ff       	call   c000895c <RectangleFill>
c0008a83:	a1 1c 7c 00 00       	mov    eax,ds:0x7c1c
c0008a88:	83 c4 30             	add    esp,0x30
c0008a8b:	8d 50 f8             	lea    edx,[eax-0x8]
c0008a8e:	83 e8 26             	sub    eax,0x26
c0008a91:	52                   	push   edx
c0008a92:	6a 3a                	push   0x3a
c0008a94:	50                   	push   eax
c0008a95:	6a 35                	push   0x35
c0008a97:	68 84 84 84 00       	push   0x848484
c0008a9c:	53                   	push   ebx
c0008a9d:	e8 ba fe ff ff       	call   c000895c <RectangleFill>
c0008aa2:	a1 1c 7c 00 00       	mov    eax,ds:0x7c1c
c0008aa7:	8d 50 f5             	lea    edx,[eax-0xb]
c0008aaa:	83 e8 29             	sub    eax,0x29
c0008aad:	52                   	push   edx
c0008aae:	6a 37                	push   0x37
c0008ab0:	50                   	push   eax
c0008ab1:	6a 32                	push   0x32
c0008ab3:	68 ff ff ff 00       	push   0xffffff
c0008ab8:	53                   	push   ebx
c0008ab9:	e8 9e fe ff ff       	call   c000895c <RectangleFill>
c0008abe:	83 c4 30             	add    esp,0x30
c0008ac1:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
c0008ac4:	c9                   	leave  
c0008ac5:	c3                   	ret    

c0008ac6 <put_char_graphic>:
c0008ac6:	55                   	push   ebp
c0008ac7:	89 e5                	mov    ebp,esp
c0008ac9:	57                   	push   edi
c0008aca:	56                   	push   esi
c0008acb:	53                   	push   ebx
c0008acc:	31 db                	xor    ebx,ebx
c0008ace:	83 ec 08             	sub    esp,0x8
c0008ad1:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
c0008ad4:	0f be 55 18          	movsx  edx,BYTE PTR [ebp+0x18]
c0008ad8:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
c0008adb:	8b 3e                	mov    edi,DWORD PTR [esi]
c0008add:	c1 e2 04             	shl    edx,0x4
c0008ae0:	81 c2 b8 9a 00 c0    	add    edx,0xc0009ab8
c0008ae6:	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
c0008ae9:	89 75 ec             	mov    DWORD PTR [ebp-0x14],esi
c0008aec:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
c0008aef:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
c0008af2:	8b 75 f0             	mov    esi,DWORD PTR [ebp-0x10]
c0008af5:	01 da                	add    edx,ebx
c0008af7:	0f af 51 04          	imul   edx,DWORD PTR [ecx+0x4]
c0008afb:	0f be 0c 1e          	movsx  ecx,BYTE PTR [esi+ebx*1]
c0008aff:	03 55 0c             	add    edx,DWORD PTR [ebp+0xc]
c0008b02:	f6 c1 80             	test   cl,0x80
c0008b05:	8d 14 97             	lea    edx,[edi+edx*4]
c0008b08:	74 02                	je     c0008b0c <put_char_graphic+0x46>
c0008b0a:	89 02                	mov    DWORD PTR [edx],eax
c0008b0c:	f6 c1 40             	test   cl,0x40
c0008b0f:	74 03                	je     c0008b14 <put_char_graphic+0x4e>
c0008b11:	89 42 04             	mov    DWORD PTR [edx+0x4],eax
c0008b14:	f6 c1 20             	test   cl,0x20
c0008b17:	74 03                	je     c0008b1c <put_char_graphic+0x56>
c0008b19:	89 42 08             	mov    DWORD PTR [edx+0x8],eax
c0008b1c:	f6 c1 10             	test   cl,0x10
c0008b1f:	74 03                	je     c0008b24 <put_char_graphic+0x5e>
c0008b21:	89 42 0c             	mov    DWORD PTR [edx+0xc],eax
c0008b24:	f6 c1 08             	test   cl,0x8
c0008b27:	74 03                	je     c0008b2c <put_char_graphic+0x66>
c0008b29:	89 42 10             	mov    DWORD PTR [edx+0x10],eax
c0008b2c:	f6 c1 04             	test   cl,0x4
c0008b2f:	74 03                	je     c0008b34 <put_char_graphic+0x6e>
c0008b31:	89 42 14             	mov    DWORD PTR [edx+0x14],eax
c0008b34:	f6 c1 02             	test   cl,0x2
c0008b37:	74 03                	je     c0008b3c <put_char_graphic+0x76>
c0008b39:	89 42 18             	mov    DWORD PTR [edx+0x18],eax
c0008b3c:	80 e1 01             	and    cl,0x1
c0008b3f:	74 03                	je     c0008b44 <put_char_graphic+0x7e>
c0008b41:	89 42 1c             	mov    DWORD PTR [edx+0x1c],eax
c0008b44:	43                   	inc    ebx
c0008b45:	83 fb 10             	cmp    ebx,0x10
c0008b48:	75 a2                	jne    c0008aec <put_char_graphic+0x26>
c0008b4a:	58                   	pop    eax
c0008b4b:	5a                   	pop    edx
c0008b4c:	5b                   	pop    ebx
c0008b4d:	5e                   	pop    esi
c0008b4e:	5f                   	pop    edi
c0008b4f:	5d                   	pop    ebp
c0008b50:	c3                   	ret    

c0008b51 <put_str_graphic>:
c0008b51:	55                   	push   ebp
c0008b52:	89 e5                	mov    ebp,esp
c0008b54:	57                   	push   edi
c0008b55:	8b 7d 14             	mov    edi,DWORD PTR [ebp+0x14]
c0008b58:	56                   	push   esi
c0008b59:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
c0008b5c:	53                   	push   ebx
c0008b5d:	31 db                	xor    ebx,ebx
c0008b5f:	eb 1c                	jmp    c0008b7d <put_str_graphic+0x2c>
c0008b61:	8b 55 18             	mov    edx,DWORD PTR [ebp+0x18]
c0008b64:	0f be 04 1a          	movsx  eax,BYTE PTR [edx+ebx*1]
c0008b68:	43                   	inc    ebx
c0008b69:	50                   	push   eax
c0008b6a:	57                   	push   edi
c0008b6b:	ff 75 10             	push   DWORD PTR [ebp+0x10]
c0008b6e:	56                   	push   esi
c0008b6f:	83 c6 0a             	add    esi,0xa
c0008b72:	ff 75 08             	push   DWORD PTR [ebp+0x8]
c0008b75:	e8 4c ff ff ff       	call   c0008ac6 <put_char_graphic>
c0008b7a:	83 c4 14             	add    esp,0x14
c0008b7d:	3b 5d 1c             	cmp    ebx,DWORD PTR [ebp+0x1c]
c0008b80:	7c df                	jl     c0008b61 <put_str_graphic+0x10>
c0008b82:	8d 65 f4             	lea    esp,[ebp-0xc]
c0008b85:	5b                   	pop    ebx
c0008b86:	5e                   	pop    esi
c0008b87:	5f                   	pop    edi
c0008b88:	5d                   	pop    ebp
c0008b89:	c3                   	ret    
	...

c0008b8c <init_all>:
c0008b8c:	55                   	push   ebp
c0008b8d:	89 e5                	mov    ebp,esp
c0008b8f:	83 ec 08             	sub    esp,0x8
c0008b92:	e8 14 02 00 00       	call   c0008dab <init_idt>
c0008b97:	e8 cc 0c 00 00       	call   c0009868 <init_pit>
c0008b9c:	e8 a7 05 00 00       	call   c0009148 <init_memory>
c0008ba1:	e8 98 0a 00 00       	call   c000963e <init_thread>
c0008ba6:	83 ec 0c             	sub    esp,0xc
c0008ba9:	68 8c bf 00 c0       	push   0xc000bf8c
c0008bae:	e8 1b fe ff ff       	call   c00089ce <init_screen>
c0008bb3:	83 c4 10             	add    esp,0x10
c0008bb6:	c9                   	leave  
c0008bb7:	c3                   	ret    
	...

c0008bc0 <asm_intr0x20_handler>:
c0008bc0:	06                   	push   es
c0008bc1:	1e                   	push   ds
c0008bc2:	60                   	pusha  
c0008bc3:	89 e0                	mov    eax,esp
c0008bc5:	50                   	push   eax
c0008bc6:	66 8c d0             	mov    ax,ss
c0008bc9:	8e d8                	mov    ds,eax
c0008bcb:	8e c0                	mov    es,eax
c0008bcd:	e8 ae 0c 00 00       	call   c0009880 <intr0x20_handler>
c0008bd2:	58                   	pop    eax
c0008bd3:	61                   	popa   
c0008bd4:	1f                   	pop    ds
c0008bd5:	07                   	pop    es
c0008bd6:	cf                   	iret   
	...

c0008bd8 <init_pic>:
c0008bd8:	55                   	push   ebp
c0008bd9:	ba 21 00 00 00       	mov    edx,0x21
c0008bde:	89 e5                	mov    ebp,esp
c0008be0:	b8 ff 00 00 00       	mov    eax,0xff
c0008be5:	ee                   	out    dx,al
c0008be6:	b2 a1                	mov    dl,0xa1
c0008be8:	ee                   	out    dx,al
c0008be9:	b2 20                	mov    dl,0x20
c0008beb:	b0 11                	mov    al,0x11
c0008bed:	ee                   	out    dx,al
c0008bee:	b2 21                	mov    dl,0x21
c0008bf0:	b0 20                	mov    al,0x20
c0008bf2:	ee                   	out    dx,al
c0008bf3:	b0 04                	mov    al,0x4
c0008bf5:	ee                   	out    dx,al
c0008bf6:	b0 01                	mov    al,0x1
c0008bf8:	ee                   	out    dx,al
c0008bf9:	b2 a0                	mov    dl,0xa0
c0008bfb:	b0 11                	mov    al,0x11
c0008bfd:	ee                   	out    dx,al
c0008bfe:	b2 a1                	mov    dl,0xa1
c0008c00:	b0 28                	mov    al,0x28
c0008c02:	ee                   	out    dx,al
c0008c03:	b0 02                	mov    al,0x2
c0008c05:	ee                   	out    dx,al
c0008c06:	b0 01                	mov    al,0x1
c0008c08:	ee                   	out    dx,al
c0008c09:	b2 21                	mov    dl,0x21
c0008c0b:	b0 fe                	mov    al,0xfe
c0008c0d:	ee                   	out    dx,al
c0008c0e:	b2 a1                	mov    dl,0xa1
c0008c10:	b0 ff                	mov    al,0xff
c0008c12:	ee                   	out    dx,al
c0008c13:	5d                   	pop    ebp
c0008c14:	c3                   	ret    

c0008c15 <idt_desc_init>:
c0008c15:	55                   	push   ebp
c0008c16:	31 c0                	xor    eax,eax
c0008c18:	89 e5                	mov    ebp,esp
c0008c1a:	c7 05 38 ab 00 c0 c0 	mov    DWORD PTR ds:0xc000ab38,0xc0008bc0
c0008c21:	8b 00 c0 
c0008c24:	8b 0c 85 b8 aa 00 c0 	mov    ecx,DWORD PTR [eax*4-0x3fff5548]
c0008c2b:	8d 14 c5 94 c0 00 c0 	lea    edx,[eax*8-0x3fff3f6c]
c0008c32:	66 c7 42 02 08 00    	mov    WORD PTR [edx+0x2],0x8
c0008c38:	c6 42 04 00          	mov    BYTE PTR [edx+0x4],0x0
c0008c3c:	c6 42 05 8e          	mov    BYTE PTR [edx+0x5],0x8e
c0008c40:	66 89 0c c5 94 c0 00 	mov    WORD PTR [eax*8-0x3fff3f6c],cx
c0008c47:	c0 
c0008c48:	40                   	inc    eax
c0008c49:	c1 e9 10             	shr    ecx,0x10
c0008c4c:	83 f8 2f             	cmp    eax,0x2f
c0008c4f:	66 89 4a 06          	mov    WORD PTR [edx+0x6],cx
c0008c53:	75 cf                	jne    c0008c24 <idt_desc_init+0xf>
c0008c55:	5d                   	pop    ebp
c0008c56:	c3                   	ret    

c0008c57 <set_gatedesc>:
c0008c57:	55                   	push   ebp
c0008c58:	89 e5                	mov    ebp,esp
c0008c5a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0008c5d:	53                   	push   ebx
c0008c5e:	8b 4d 14             	mov    ecx,DWORD PTR [ebp+0x14]
c0008c61:	8b 5d 10             	mov    ebx,DWORD PTR [ebp+0x10]
c0008c64:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
c0008c67:	88 48 05             	mov    BYTE PTR [eax+0x5],cl
c0008c6a:	66 89 58 02          	mov    WORD PTR [eax+0x2],bx
c0008c6e:	89 cb                	mov    ebx,ecx
c0008c70:	66 89 10             	mov    WORD PTR [eax],dx
c0008c73:	c1 fb 08             	sar    ebx,0x8
c0008c76:	c1 ea 10             	shr    edx,0x10
c0008c79:	88 58 04             	mov    BYTE PTR [eax+0x4],bl
c0008c7c:	66 89 50 06          	mov    WORD PTR [eax+0x6],dx
c0008c80:	5b                   	pop    ebx
c0008c81:	5d                   	pop    ebp
c0008c82:	c3                   	ret    

c0008c83 <general_intr_handler>:
c0008c83:	55                   	push   ebp
c0008c84:	b8 20 00 00 00       	mov    eax,0x20
c0008c89:	89 e5                	mov    ebp,esp
c0008c8b:	89 c2                	mov    edx,eax
c0008c8d:	56                   	push   esi
c0008c8e:	53                   	push   ebx
c0008c8f:	8a 5d 08             	mov    bl,BYTE PTR [ebp+0x8]
c0008c92:	ee                   	out    dx,al
c0008c93:	b2 a0                	mov    dl,0xa0
c0008c95:	ee                   	out    dx,al
c0008c96:	83 ec 0c             	sub    esp,0xc
c0008c99:	0f b6 f3             	movzx  esi,bl
c0008c9c:	68 c0 bc 00 c0       	push   0xc000bcc0
c0008ca1:	e8 bd 07 00 00       	call   c0009463 <put_str>
c0008ca6:	89 34 24             	mov    DWORD PTR [esp],esi
c0008ca9:	e8 d4 07 00 00       	call   c0009482 <put_int>
c0008cae:	c7 04 24 20 00 00 00 	mov    DWORD PTR [esp],0x20
c0008cb5:	e8 1f 07 00 00       	call   c00093d9 <put_char>
c0008cba:	83 c4 10             	add    esp,0x10
c0008cbd:	80 fb 14             	cmp    bl,0x14
c0008cc0:	77 15                	ja     c0008cd7 <general_intr_handler+0x54>
c0008cc2:	8b 04 b5 d8 bf 00 c0 	mov    eax,DWORD PTR [esi*4-0x3fff4028]
c0008cc9:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
c0008ccc:	8d 65 f8             	lea    esp,[ebp-0x8]
c0008ccf:	5b                   	pop    ebx
c0008cd0:	5e                   	pop    esi
c0008cd1:	5d                   	pop    ebp
c0008cd2:	e9 8c 07 00 00       	jmp    c0009463 <put_str>
c0008cd7:	8d 65 f8             	lea    esp,[ebp-0x8]
c0008cda:	5b                   	pop    ebx
c0008cdb:	5e                   	pop    esi
c0008cdc:	5d                   	pop    ebp
c0008cdd:	c3                   	ret    

c0008cde <exception_init>:
c0008cde:	55                   	push   ebp
c0008cdf:	89 e5                	mov    ebp,esp
c0008ce1:	c7 05 d8 bf 00 c0 c6 	mov    DWORD PTR ds:0xc000bfd8,0xc000bcc6
c0008ce8:	bc 00 c0 
c0008ceb:	c7 05 dc bf 00 c0 d7 	mov    DWORD PTR ds:0xc000bfdc,0xc000bcd7
c0008cf2:	bc 00 c0 
c0008cf5:	c7 05 e0 bf 00 c0 eb 	mov    DWORD PTR ds:0xc000bfe0,0xc000bceb
c0008cfc:	bc 00 c0 
c0008cff:	c7 05 e4 bf 00 c0 f9 	mov    DWORD PTR ds:0xc000bfe4,0xc000bcf9
c0008d06:	bc 00 c0 
c0008d09:	c7 05 e8 bf 00 c0 12 	mov    DWORD PTR ds:0xc000bfe8,0xc000bd12
c0008d10:	bd 00 c0 
c0008d13:	c7 05 ec bf 00 c0 29 	mov    DWORD PTR ds:0xc000bfec,0xc000bd29
c0008d1a:	bd 00 c0 
c0008d1d:	c7 05 f0 bf 00 c0 4c 	mov    DWORD PTR ds:0xc000bff0,0xc000bd4c
c0008d24:	bd 00 c0 
c0008d27:	c7 05 f4 bf 00 c0 69 	mov    DWORD PTR ds:0xc000bff4,0xc000bd69
c0008d2e:	bd 00 c0 
c0008d31:	c7 05 f8 bf 00 c0 8c 	mov    DWORD PTR ds:0xc000bff8,0xc000bd8c
c0008d38:	bd 00 c0 
c0008d3b:	c7 05 fc bf 00 c0 a7 	mov    DWORD PTR ds:0xc000bffc,0xc000bda7
c0008d42:	bd 00 c0 
c0008d45:	c7 05 00 c0 00 c0 c3 	mov    DWORD PTR ds:0xc000c000,0xc000bdc3
c0008d4c:	bd 00 c0 
c0008d4f:	c7 05 04 c0 00 c0 dd 	mov    DWORD PTR ds:0xc000c004,0xc000bddd
c0008d56:	bd 00 c0 
c0008d59:	c7 05 08 c0 00 c0 f5 	mov    DWORD PTR ds:0xc000c008,0xc000bdf5
c0008d60:	bd 00 c0 
c0008d63:	c7 05 0c c0 00 c0 0f 	mov    DWORD PTR ds:0xc000c00c,0xc000be0f
c0008d6a:	be 00 c0 
c0008d6d:	c7 05 10 c0 00 c0 30 	mov    DWORD PTR ds:0xc000c010,0xc000be30
c0008d74:	be 00 c0 
c0008d77:	c7 05 14 c0 00 c0 49 	mov    DWORD PTR ds:0xc000c014,0xc000be49
c0008d7e:	be 00 c0 
c0008d81:	c7 05 18 c0 00 c0 52 	mov    DWORD PTR ds:0xc000c018,0xc000be52
c0008d88:	be 00 c0 
c0008d8b:	c7 05 1c c0 00 c0 73 	mov    DWORD PTR ds:0xc000c01c,0xc000be73
c0008d92:	be 00 c0 
c0008d95:	c7 05 20 c0 00 c0 91 	mov    DWORD PTR ds:0xc000c020,0xc000be91
c0008d9c:	be 00 c0 
c0008d9f:	c7 05 24 c0 00 c0 ad 	mov    DWORD PTR ds:0xc000c024,0xc000bead
c0008da6:	be 00 c0 
c0008da9:	5d                   	pop    ebp
c0008daa:	c3                   	ret    

c0008dab <init_idt>:
c0008dab:	55                   	push   ebp
c0008dac:	89 e5                	mov    ebp,esp
c0008dae:	83 ec 10             	sub    esp,0x10
c0008db1:	e8 5f fe ff ff       	call   c0008c15 <idt_desc_init>
c0008db6:	e8 1d fe ff ff       	call   c0008bd8 <init_pic>
c0008dbb:	b8 94 c0 00 c0       	mov    eax,0xc000c094
c0008dc0:	c1 e0 10             	shl    eax,0x10
c0008dc3:	0d 77 01 00 00       	or     eax,0x177
c0008dc8:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
c0008dcb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
c0008dd2:	e8 07 ff ff ff       	call   c0008cde <exception_init>
c0008dd7:	0f 01 5d f8          	lidtd  [ebp-0x8]
c0008ddb:	c9                   	leave  
c0008ddc:	c3                   	ret    

c0008ddd <intr_get_status>:
c0008ddd:	55                   	push   ebp
c0008dde:	89 e5                	mov    ebp,esp
c0008de0:	9c                   	pushf  
c0008de1:	58                   	pop    eax
c0008de2:	f6 c4 02             	test   ah,0x2
c0008de5:	0f 95 c0             	setne  al
c0008de8:	0f b6 c0             	movzx  eax,al
c0008deb:	5d                   	pop    ebp
c0008dec:	c3                   	ret    

c0008ded <intr_disable>:
c0008ded:	55                   	push   ebp
c0008dee:	89 e5                	mov    ebp,esp
c0008df0:	e8 e8 ff ff ff       	call   c0008ddd <intr_get_status>
c0008df5:	31 d2                	xor    edx,edx
c0008df7:	48                   	dec    eax
c0008df8:	75 03                	jne    c0008dfd <intr_disable+0x10>
c0008dfa:	fa                   	cli    
c0008dfb:	b2 01                	mov    dl,0x1
c0008dfd:	89 d0                	mov    eax,edx
c0008dff:	5d                   	pop    ebp
c0008e00:	c3                   	ret    

c0008e01 <intr_enable>:
c0008e01:	55                   	push   ebp
c0008e02:	89 e5                	mov    ebp,esp
c0008e04:	e8 d4 ff ff ff       	call   c0008ddd <intr_get_status>
c0008e09:	ba 01 00 00 00       	mov    edx,0x1
c0008e0e:	48                   	dec    eax
c0008e0f:	74 03                	je     c0008e14 <intr_enable+0x13>
c0008e11:	fb                   	sti    
c0008e12:	30 d2                	xor    dl,dl
c0008e14:	89 d0                	mov    eax,edx
c0008e16:	5d                   	pop    ebp
c0008e17:	c3                   	ret    

c0008e18 <intr_set_status>:
c0008e18:	55                   	push   ebp
c0008e19:	89 e5                	mov    ebp,esp
c0008e1b:	83 7d 08 01          	cmp    DWORD PTR [ebp+0x8],0x1
c0008e1f:	75 06                	jne    c0008e27 <intr_set_status+0xf>
c0008e21:	5d                   	pop    ebp
c0008e22:	e9 da ff ff ff       	jmp    c0008e01 <intr_enable>
c0008e27:	5d                   	pop    ebp
c0008e28:	e9 c0 ff ff ff       	jmp    c0008ded <intr_disable>
c0008e2d:	00 00                	add    BYTE PTR [eax],al
	...

c0008e30 <list_init>:
c0008e30:	55                   	push   ebp
c0008e31:	89 e5                	mov    ebp,esp
c0008e33:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0008e36:	8d 50 08             	lea    edx,[eax+0x8]
c0008e39:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
c0008e3f:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
c0008e42:	89 40 08             	mov    DWORD PTR [eax+0x8],eax
c0008e45:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [eax+0xc],0x0
c0008e4c:	5d                   	pop    ebp
c0008e4d:	c3                   	ret    

c0008e4e <list_in>:
c0008e4e:	55                   	push   ebp
c0008e4f:	89 e5                	mov    ebp,esp
c0008e51:	56                   	push   esi
c0008e52:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
c0008e55:	53                   	push   ebx
c0008e56:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
c0008e59:	e8 8f ff ff ff       	call   c0008ded <intr_disable>
c0008e5e:	8b 13                	mov    edx,DWORD PTR [ebx]
c0008e60:	89 5e 04             	mov    DWORD PTR [esi+0x4],ebx
c0008e63:	89 16                	mov    DWORD PTR [esi],edx
c0008e65:	8b 13                	mov    edx,DWORD PTR [ebx]
c0008e67:	89 33                	mov    DWORD PTR [ebx],esi
c0008e69:	89 72 04             	mov    DWORD PTR [edx+0x4],esi
c0008e6c:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
c0008e6f:	5b                   	pop    ebx
c0008e70:	5e                   	pop    esi
c0008e71:	5d                   	pop    ebp
c0008e72:	e9 a1 ff ff ff       	jmp    c0008e18 <intr_set_status>

c0008e77 <list_push>:
c0008e77:	55                   	push   ebp
c0008e78:	89 e5                	mov    ebp,esp
c0008e7a:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
c0008e7d:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
c0008e80:	8b 52 04             	mov    edx,DWORD PTR [edx+0x4]
c0008e83:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
c0008e86:	89 55 0c             	mov    DWORD PTR [ebp+0xc],edx
c0008e89:	5d                   	pop    ebp
c0008e8a:	e9 bf ff ff ff       	jmp    c0008e4e <list_in>

c0008e8f <list_append>:
c0008e8f:	55                   	push   ebp
c0008e90:	89 e5                	mov    ebp,esp
c0008e92:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
c0008e95:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
c0008e98:	8b 52 08             	mov    edx,DWORD PTR [edx+0x8]
c0008e9b:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
c0008e9e:	89 55 0c             	mov    DWORD PTR [ebp+0xc],edx
c0008ea1:	5d                   	pop    ebp
c0008ea2:	e9 a7 ff ff ff       	jmp    c0008e4e <list_in>

c0008ea7 <list_remove>:
c0008ea7:	55                   	push   ebp
c0008ea8:	89 e5                	mov    ebp,esp
c0008eaa:	53                   	push   ebx
c0008eab:	50                   	push   eax
c0008eac:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c0008eaf:	e8 39 ff ff ff       	call   c0008ded <intr_disable>
c0008eb4:	8b 13                	mov    edx,DWORD PTR [ebx]
c0008eb6:	85 d2                	test   edx,edx
c0008eb8:	74 1c                	je     c0008ed6 <list_remove+0x2f>
c0008eba:	8b 4b 04             	mov    ecx,DWORD PTR [ebx+0x4]
c0008ebd:	85 c9                	test   ecx,ecx
c0008ebf:	74 15                	je     c0008ed6 <list_remove+0x2f>
c0008ec1:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
c0008ec4:	8b 4b 04             	mov    ecx,DWORD PTR [ebx+0x4]
c0008ec7:	c7 43 04 00 00 00 00 	mov    DWORD PTR [ebx+0x4],0x0
c0008ece:	89 11                	mov    DWORD PTR [ecx],edx
c0008ed0:	c7 03 00 00 00 00    	mov    DWORD PTR [ebx],0x0
c0008ed6:	83 ec 0c             	sub    esp,0xc
c0008ed9:	50                   	push   eax
c0008eda:	e8 39 ff ff ff       	call   c0008e18 <intr_set_status>
c0008edf:	89 d8                	mov    eax,ebx
c0008ee1:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
c0008ee4:	c9                   	leave  
c0008ee5:	c3                   	ret    

c0008ee6 <list_pop>:
c0008ee6:	55                   	push   ebp
c0008ee7:	89 e5                	mov    ebp,esp
c0008ee9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0008eec:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
c0008eef:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
c0008ef2:	5d                   	pop    ebp
c0008ef3:	e9 af ff ff ff       	jmp    c0008ea7 <list_remove>

c0008ef8 <list_find>:
c0008ef8:	55                   	push   ebp
c0008ef9:	89 e5                	mov    ebp,esp
c0008efb:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
c0008efe:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
c0008f01:	8b 42 04             	mov    eax,DWORD PTR [edx+0x4]
c0008f04:	83 c2 08             	add    edx,0x8
c0008f07:	eb 07                	jmp    c0008f10 <list_find+0x18>
c0008f09:	39 c8                	cmp    eax,ecx
c0008f0b:	74 0b                	je     c0008f18 <list_find+0x20>
c0008f0d:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
c0008f10:	39 d0                	cmp    eax,edx
c0008f12:	75 f5                	jne    c0008f09 <list_find+0x11>
c0008f14:	31 c0                	xor    eax,eax
c0008f16:	eb 05                	jmp    c0008f1d <list_find+0x25>
c0008f18:	b8 01 00 00 00       	mov    eax,0x1
c0008f1d:	5d                   	pop    ebp
c0008f1e:	c3                   	ret    

c0008f1f <list_traversal>:
c0008f1f:	55                   	push   ebp
c0008f20:	89 e5                	mov    ebp,esp
c0008f22:	57                   	push   edi
c0008f23:	56                   	push   esi
c0008f24:	53                   	push   ebx
c0008f25:	83 ec 0c             	sub    esp,0xc
c0008f28:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
c0008f2b:	8b 7d 10             	mov    edi,DWORD PTR [ebp+0x10]
c0008f2e:	8b 5e 04             	mov    ebx,DWORD PTR [esi+0x4]
c0008f31:	83 c6 08             	add    esi,0x8
c0008f34:	eb 11                	jmp    c0008f47 <list_traversal+0x28>
c0008f36:	52                   	push   edx
c0008f37:	52                   	push   edx
c0008f38:	57                   	push   edi
c0008f39:	53                   	push   ebx
c0008f3a:	ff 55 0c             	call   DWORD PTR [ebp+0xc]
c0008f3d:	83 c4 10             	add    esp,0x10
c0008f40:	85 c0                	test   eax,eax
c0008f42:	75 07                	jne    c0008f4b <list_traversal+0x2c>
c0008f44:	8b 5b 04             	mov    ebx,DWORD PTR [ebx+0x4]
c0008f47:	39 f3                	cmp    ebx,esi
c0008f49:	75 eb                	jne    c0008f36 <list_traversal+0x17>
c0008f4b:	8d 65 f4             	lea    esp,[ebp-0xc]
c0008f4e:	5b                   	pop    ebx
c0008f4f:	5e                   	pop    esi
c0008f50:	5f                   	pop    edi
c0008f51:	5d                   	pop    ebp
c0008f52:	c3                   	ret    

c0008f53 <list_len>:
c0008f53:	55                   	push   ebp
c0008f54:	31 c0                	xor    eax,eax
c0008f56:	89 e5                	mov    ebp,esp
c0008f58:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
c0008f5b:	8b 51 04             	mov    edx,DWORD PTR [ecx+0x4]
c0008f5e:	83 c1 08             	add    ecx,0x8
c0008f61:	eb 04                	jmp    c0008f67 <list_len+0x14>
c0008f63:	8b 52 04             	mov    edx,DWORD PTR [edx+0x4]
c0008f66:	40                   	inc    eax
c0008f67:	39 ca                	cmp    edx,ecx
c0008f69:	75 f8                	jne    c0008f63 <list_len+0x10>
c0008f6b:	5d                   	pop    ebp
c0008f6c:	c3                   	ret    

c0008f6d <list_empty>:
c0008f6d:	55                   	push   ebp
c0008f6e:	89 e5                	mov    ebp,esp
c0008f70:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0008f73:	5d                   	pop    ebp
c0008f74:	8d 50 08             	lea    edx,[eax+0x8]
c0008f77:	39 50 04             	cmp    DWORD PTR [eax+0x4],edx
c0008f7a:	0f 94 c0             	sete   al
c0008f7d:	0f b6 c0             	movzx  eax,al
c0008f80:	c3                   	ret    
c0008f81:	00 00                	add    BYTE PTR [eax],al
	...

c0008f84 <init_memmam>:
c0008f84:	55                   	push   ebp
c0008f85:	89 e5                	mov    ebp,esp
c0008f87:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0008f8a:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
c0008f90:	c7 40 04 00 00 00 00 	mov    DWORD PTR [eax+0x4],0x0
c0008f97:	c7 40 08 00 00 00 00 	mov    DWORD PTR [eax+0x8],0x0
c0008f9e:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [eax+0xc],0x0
c0008fa5:	5d                   	pop    ebp
c0008fa6:	c3                   	ret    

c0008fa7 <TotalFreeSize>:
c0008fa7:	55                   	push   ebp
c0008fa8:	31 d2                	xor    edx,edx
c0008faa:	89 e5                	mov    ebp,esp
c0008fac:	31 c0                	xor    eax,eax
c0008fae:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
c0008fb1:	53                   	push   ebx
c0008fb2:	8b 19                	mov    ebx,DWORD PTR [ecx]
c0008fb4:	eb 05                	jmp    c0008fbb <TotalFreeSize+0x14>
c0008fb6:	03 44 d1 14          	add    eax,DWORD PTR [ecx+edx*8+0x14]
c0008fba:	42                   	inc    edx
c0008fbb:	39 da                	cmp    edx,ebx
c0008fbd:	75 f7                	jne    c0008fb6 <TotalFreeSize+0xf>
c0008fbf:	5b                   	pop    ebx
c0008fc0:	5d                   	pop    ebp
c0008fc1:	c3                   	ret    

c0008fc2 <mem_alloc>:
c0008fc2:	55                   	push   ebp
c0008fc3:	89 e5                	mov    ebp,esp
c0008fc5:	57                   	push   edi
c0008fc6:	56                   	push   esi
c0008fc7:	53                   	push   ebx
c0008fc8:	51                   	push   ecx
c0008fc9:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
c0008fcc:	31 c9                	xor    ecx,ecx
c0008fce:	8b 02                	mov    eax,DWORD PTR [edx]
c0008fd0:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
c0008fd3:	eb 42                	jmp    c0009017 <mem_alloc+0x55>
c0008fd5:	8b 74 ca 14          	mov    esi,DWORD PTR [edx+ecx*8+0x14]
c0008fd9:	3b 75 0c             	cmp    esi,DWORD PTR [ebp+0xc]
c0008fdc:	72 38                	jb     c0009016 <mem_alloc+0x54>
c0008fde:	8d 59 02             	lea    ebx,[ecx+0x2]
c0008fe1:	8b 7d 0c             	mov    edi,DWORD PTR [ebp+0xc]
c0008fe4:	8b 04 da             	mov    eax,DWORD PTR [edx+ebx*8]
c0008fe7:	2b 75 0c             	sub    esi,DWORD PTR [ebp+0xc]
c0008fea:	01 c7                	add    edi,eax
c0008fec:	85 f6                	test   esi,esi
c0008fee:	89 3c da             	mov    DWORD PTR [edx+ebx*8],edi
c0008ff1:	89 74 da 04          	mov    DWORD PTR [edx+ebx*8+0x4],esi
c0008ff5:	75 27                	jne    c000901e <mem_alloc+0x5c>
c0008ff7:	8b 5d f0             	mov    ebx,DWORD PTR [ebp-0x10]
c0008ffa:	4b                   	dec    ebx
c0008ffb:	89 1a                	mov    DWORD PTR [edx],ebx
c0008ffd:	eb 11                	jmp    c0009010 <mem_alloc+0x4e>
c0008fff:	41                   	inc    ecx
c0009000:	8b 74 ca 10          	mov    esi,DWORD PTR [edx+ecx*8+0x10]
c0009004:	8b 7c ca 14          	mov    edi,DWORD PTR [edx+ecx*8+0x14]
c0009008:	89 74 ca 08          	mov    DWORD PTR [edx+ecx*8+0x8],esi
c000900c:	89 7c ca 0c          	mov    DWORD PTR [edx+ecx*8+0xc],edi
c0009010:	39 d9                	cmp    ecx,ebx
c0009012:	72 eb                	jb     c0008fff <mem_alloc+0x3d>
c0009014:	eb 08                	jmp    c000901e <mem_alloc+0x5c>
c0009016:	41                   	inc    ecx
c0009017:	3b 4d f0             	cmp    ecx,DWORD PTR [ebp-0x10]
c000901a:	75 b9                	jne    c0008fd5 <mem_alloc+0x13>
c000901c:	31 c0                	xor    eax,eax
c000901e:	5a                   	pop    edx
c000901f:	5b                   	pop    ebx
c0009020:	5e                   	pop    esi
c0009021:	5f                   	pop    edi
c0009022:	5d                   	pop    ebp
c0009023:	c3                   	ret    

c0009024 <mem_alloc_page>:
c0009024:	55                   	push   ebp
c0009025:	89 e5                	mov    ebp,esp
c0009027:	c1 65 0c 0c          	shl    DWORD PTR [ebp+0xc],0xc
c000902b:	5d                   	pop    ebp
c000902c:	e9 91 ff ff ff       	jmp    c0008fc2 <mem_alloc>

c0009031 <mem_free>:
c0009031:	55                   	push   ebp
c0009032:	31 c9                	xor    ecx,ecx
c0009034:	89 e5                	mov    ebp,esp
c0009036:	57                   	push   edi
c0009037:	56                   	push   esi
c0009038:	53                   	push   ebx
c0009039:	83 ec 10             	sub    esp,0x10
c000903c:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
c000903f:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
c0009042:	8b 75 10             	mov    esi,DWORD PTR [ebp+0x10]
c0009045:	8b 02                	mov    eax,DWORD PTR [edx]
c0009047:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
c000904a:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
c000904d:	eb 07                	jmp    c0009056 <mem_free+0x25>
c000904f:	39 5c ca 10          	cmp    DWORD PTR [edx+ecx*8+0x10],ebx
c0009053:	77 06                	ja     c000905b <mem_free+0x2a>
c0009055:	41                   	inc    ecx
c0009056:	3b 4d ec             	cmp    ecx,DWORD PTR [ebp-0x14]
c0009059:	75 f4                	jne    c000904f <mem_free+0x1e>
c000905b:	85 c9                	test   ecx,ecx
c000905d:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
c0009060:	74 60                	je     c00090c2 <mem_free+0x91>
c0009062:	8d 79 01             	lea    edi,[ecx+0x1]
c0009065:	8b 44 fa 04          	mov    eax,DWORD PTR [edx+edi*8+0x4]
c0009069:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
c000906c:	03 04 fa             	add    eax,DWORD PTR [edx+edi*8]
c000906f:	39 d8                	cmp    eax,ebx
c0009071:	75 4f                	jne    c00090c2 <mem_free+0x91>
c0009073:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
c0009076:	01 f0                	add    eax,esi
c0009078:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
c000907b:	89 44 fa 04          	mov    DWORD PTR [edx+edi*8+0x4],eax
c000907f:	31 c0                	xor    eax,eax
c0009081:	3b 4d ec             	cmp    ecx,DWORD PTR [ebp-0x14]
c0009084:	0f 83 a9 00 00 00    	jae    c0009133 <mem_free+0x102>
c000908a:	01 de                	add    esi,ebx
c000908c:	8d 59 02             	lea    ebx,[ecx+0x2]
c000908f:	39 34 da             	cmp    DWORD PTR [edx+ebx*8],esi
c0009092:	0f 85 9b 00 00 00    	jne    c0009133 <mem_free+0x102>
c0009098:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
c000909b:	03 44 da 04          	add    eax,DWORD PTR [edx+ebx*8+0x4]
c000909f:	89 44 fa 04          	mov    DWORD PTR [edx+edi*8+0x4],eax
c00090a3:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
c00090a6:	48                   	dec    eax
c00090a7:	89 02                	mov    DWORD PTR [edx],eax
c00090a9:	eb 11                	jmp    c00090bc <mem_free+0x8b>
c00090ab:	41                   	inc    ecx
c00090ac:	8b 74 ca 10          	mov    esi,DWORD PTR [edx+ecx*8+0x10]
c00090b0:	8b 7c ca 14          	mov    edi,DWORD PTR [edx+ecx*8+0x14]
c00090b4:	89 74 ca 08          	mov    DWORD PTR [edx+ecx*8+0x8],esi
c00090b8:	89 7c ca 0c          	mov    DWORD PTR [edx+ecx*8+0xc],edi
c00090bc:	39 c1                	cmp    ecx,eax
c00090be:	72 eb                	jb     c00090ab <mem_free+0x7a>
c00090c0:	eb 1d                	jmp    c00090df <mem_free+0xae>
c00090c2:	3b 4d ec             	cmp    ecx,DWORD PTR [ebp-0x14]
c00090c5:	73 1c                	jae    c00090e3 <mem_free+0xb2>
c00090c7:	8d 3c 33             	lea    edi,[ebx+esi*1]
c00090ca:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
c00090cd:	8d 79 02             	lea    edi,[ecx+0x2]
c00090d0:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
c00090d3:	39 04 fa             	cmp    DWORD PTR [edx+edi*8],eax
c00090d6:	75 0b                	jne    c00090e3 <mem_free+0xb2>
c00090d8:	01 74 fa 04          	add    DWORD PTR [edx+edi*8+0x4],esi
c00090dc:	89 1c fa             	mov    DWORD PTR [edx+edi*8],ebx
c00090df:	31 c0                	xor    eax,eax
c00090e1:	eb 50                	jmp    c0009133 <mem_free+0x102>
c00090e3:	81 7d ec 9f 0f 00 00 	cmp    DWORD PTR [ebp-0x14],0xf9f
c00090ea:	76 15                	jbe    c0009101 <mem_free+0xd0>
c00090ec:	eb 3a                	jmp    c0009128 <mem_free+0xf7>
c00090ee:	8b 74 c2 08          	mov    esi,DWORD PTR [edx+eax*8+0x8]
c00090f2:	8b 7c c2 0c          	mov    edi,DWORD PTR [edx+eax*8+0xc]
c00090f6:	89 74 c2 10          	mov    DWORD PTR [edx+eax*8+0x10],esi
c00090fa:	89 7c c2 14          	mov    DWORD PTR [edx+eax*8+0x14],edi
c00090fe:	40                   	inc    eax
c00090ff:	eb 06                	jmp    c0009107 <mem_free+0xd6>
c0009101:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
c0009104:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
c0009107:	39 c8                	cmp    eax,ecx
c0009109:	7f e3                	jg     c00090ee <mem_free+0xbd>
c000910b:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
c000910e:	8b 75 f0             	mov    esi,DWORD PTR [ebp-0x10]
c0009111:	40                   	inc    eax
c0009112:	39 42 04             	cmp    DWORD PTR [edx+0x4],eax
c0009115:	89 02                	mov    DWORD PTR [edx],eax
c0009117:	73 03                	jae    c000911c <mem_free+0xeb>
c0009119:	89 42 04             	mov    DWORD PTR [edx+0x4],eax
c000911c:	83 c1 02             	add    ecx,0x2
c000911f:	89 1c ca             	mov    DWORD PTR [edx+ecx*8],ebx
c0009122:	89 74 ca 04          	mov    DWORD PTR [edx+ecx*8+0x4],esi
c0009126:	eb b7                	jmp    c00090df <mem_free+0xae>
c0009128:	ff 42 0c             	inc    DWORD PTR [edx+0xc]
c000912b:	b8 01 00 00 00       	mov    eax,0x1
c0009130:	01 72 08             	add    DWORD PTR [edx+0x8],esi
c0009133:	83 c4 10             	add    esp,0x10
c0009136:	5b                   	pop    ebx
c0009137:	5e                   	pop    esi
c0009138:	5f                   	pop    edi
c0009139:	5d                   	pop    ebp
c000913a:	c3                   	ret    

c000913b <mem_free_page>:
c000913b:	55                   	push   ebp
c000913c:	89 e5                	mov    ebp,esp
c000913e:	c1 65 10 0c          	shl    DWORD PTR [ebp+0x10],0xc
c0009142:	5d                   	pop    ebp
c0009143:	e9 e9 fe ff ff       	jmp    c0009031 <mem_free>

c0009148 <init_memory>:
c0009148:	55                   	push   ebp
c0009149:	89 e5                	mov    ebp,esp
c000914b:	56                   	push   esi
c000914c:	53                   	push   ebx
c000914d:	8b 35 00 7c 00 00    	mov    esi,DWORD PTR ds:0x7c00
c0009153:	8d 9e 00 e0 ef ff    	lea    ebx,[esi-0x102000]
c0009159:	d1 eb                	shr    ebx,1
c000915b:	53                   	push   ebx
c000915c:	29 de                	sub    esi,ebx
c000915e:	68 00 20 10 00       	push   0x102000
c0009163:	81 c3 00 20 10 00    	add    ebx,0x102000
c0009169:	68 3c 39 02 c0       	push   0xc002393c
c000916e:	e8 c8 ff ff ff       	call   c000913b <mem_free_page>
c0009173:	56                   	push   esi
c0009174:	53                   	push   ebx
c0009175:	68 0c c2 00 c0       	push   0xc000c20c
c000917a:	e8 bc ff ff ff       	call   c000913b <mem_free_page>
c000917f:	68 00 00 10 00       	push   0x100000
c0009184:	6a 00                	push   0x0
c0009186:	68 2c bc 01 c0       	push   0xc001bc2c
c000918b:	e8 ab ff ff ff       	call   c000913b <mem_free_page>
c0009190:	83 c4 24             	add    esp,0x24
c0009193:	68 ff ff ff 3d       	push   0x3dffffff
c0009198:	68 00 00 00 c0       	push   0xc0000000
c000919d:	68 2c bc 01 c0       	push   0xc001bc2c
c00091a2:	e8 94 ff ff ff       	call   c000913b <mem_free_page>
c00091a7:	83 c4 0c             	add    esp,0xc
c00091aa:	8d 65 f8             	lea    esp,[ebp-0x8]
c00091ad:	5b                   	pop    ebx
c00091ae:	5e                   	pop    esi
c00091af:	5d                   	pop    ebp
c00091b0:	c3                   	ret    

c00091b1 <pde_ptr>:
c00091b1:	55                   	push   ebp
c00091b2:	89 e5                	mov    ebp,esp
c00091b4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c00091b7:	5d                   	pop    ebp
c00091b8:	c1 e8 16             	shr    eax,0x16
c00091bb:	8d 04 85 00 f0 ff ff 	lea    eax,[eax*4-0x1000]
c00091c2:	c3                   	ret    

c00091c3 <pte_ptr>:
c00091c3:	55                   	push   ebp
c00091c4:	89 e5                	mov    ebp,esp
c00091c6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c00091c9:	5d                   	pop    ebp
c00091ca:	89 c2                	mov    edx,eax
c00091cc:	25 00 f0 3f 00       	and    eax,0x3ff000
c00091d1:	81 e2 00 00 c0 ff    	and    edx,0xffc00000
c00091d7:	c1 ea 0a             	shr    edx,0xa
c00091da:	c1 e8 0a             	shr    eax,0xa
c00091dd:	8d 84 02 00 00 c0 ff 	lea    eax,[edx+eax*1-0x400000]
c00091e4:	c3                   	ret    

c00091e5 <page_table_add>:
c00091e5:	55                   	push   ebp
c00091e6:	89 e5                	mov    ebp,esp
c00091e8:	57                   	push   edi
c00091e9:	56                   	push   esi
c00091ea:	53                   	push   ebx
c00091eb:	83 ec 0c             	sub    esp,0xc
c00091ee:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c00091f1:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
c00091f4:	50                   	push   eax
c00091f5:	89 c7                	mov    edi,eax
c00091f7:	e8 c7 ff ff ff       	call   c00091c3 <pte_ptr>
c00091fc:	c1 ef 16             	shr    edi,0x16
c00091ff:	f6 04 bd 00 f0 ff ff 	test   BYTE PTR [edi*4-0x1000],0x1
c0009206:	01 
c0009207:	5b                   	pop    ebx
c0009208:	89 c3                	mov    ebx,eax
c000920a:	74 0c                	je     c0009218 <page_table_add+0x33>
c000920c:	f6 00 01             	test   BYTE PTR [eax],0x1
c000920f:	75 3c                	jne    c000924d <page_table_add+0x68>
c0009211:	83 ce 07             	or     esi,0x7
c0009214:	89 30                	mov    DWORD PTR [eax],esi
c0009216:	eb 35                	jmp    c000924d <page_table_add+0x68>
c0009218:	6a 01                	push   0x1
c000921a:	83 ce 07             	or     esi,0x7
c000921d:	68 3c 39 02 c0       	push   0xc002393c
c0009222:	e8 fd fd ff ff       	call   c0009024 <mem_alloc_page>
c0009227:	83 ec 0c             	sub    esp,0xc
c000922a:	83 c8 07             	or     eax,0x7
c000922d:	89 04 bd 00 f0 ff ff 	mov    DWORD PTR [edi*4-0x1000],eax
c0009234:	89 d8                	mov    eax,ebx
c0009236:	68 00 10 00 00       	push   0x1000
c000923b:	25 00 f0 ff ff       	and    eax,0xfffff000
c0009240:	6a 00                	push   0x0
c0009242:	50                   	push   eax
c0009243:	e8 6c 02 00 00       	call   c00094b4 <memset>
c0009248:	83 c4 20             	add    esp,0x20
c000924b:	89 33                	mov    DWORD PTR [ebx],esi
c000924d:	8d 65 f4             	lea    esp,[ebp-0xc]
c0009250:	5b                   	pop    ebx
c0009251:	5e                   	pop    esi
c0009252:	5f                   	pop    edi
c0009253:	5d                   	pop    ebp
c0009254:	c3                   	ret    

c0009255 <page_alloc>:
c0009255:	55                   	push   ebp
c0009256:	89 e5                	mov    ebp,esp
c0009258:	57                   	push   edi
c0009259:	56                   	push   esi
c000925a:	53                   	push   ebx
c000925b:	83 ec 1c             	sub    esp,0x1c
c000925e:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
c0009261:	83 7d 08 01          	cmp    DWORD PTR [ebp+0x8],0x1
c0009265:	c7 45 e4 0c c2 00 c0 	mov    DWORD PTR [ebp-0x1c],0xc000c20c
c000926c:	75 07                	jne    c0009275 <page_alloc+0x20>
c000926e:	c7 45 e4 3c 39 02 c0 	mov    DWORD PTR [ebp-0x1c],0xc002393c
c0009275:	56                   	push   esi
c0009276:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
c0009279:	e8 a6 fd ff ff       	call   c0009024 <mem_alloc_page>
c000927e:	59                   	pop    ecx
c000927f:	5f                   	pop    edi
c0009280:	85 c0                	test   eax,eax
c0009282:	89 c3                	mov    ebx,eax
c0009284:	89 c7                	mov    edi,eax
c0009286:	75 25                	jne    c00092ad <page_alloc+0x58>
c0009288:	eb 2b                	jmp    c00092b5 <page_alloc+0x60>
c000928a:	6a 01                	push   0x1
c000928c:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
c000928f:	e8 90 fd ff ff       	call   c0009024 <mem_alloc_page>
c0009294:	59                   	pop    ecx
c0009295:	5a                   	pop    edx
c0009296:	85 c0                	test   eax,eax
c0009298:	74 19                	je     c00092b3 <page_alloc+0x5e>
c000929a:	52                   	push   edx
c000929b:	4e                   	dec    esi
c000929c:	52                   	push   edx
c000929d:	50                   	push   eax
c000929e:	57                   	push   edi
c000929f:	81 c7 00 10 00 00    	add    edi,0x1000
c00092a5:	e8 3b ff ff ff       	call   c00091e5 <page_table_add>
c00092aa:	83 c4 10             	add    esp,0x10
c00092ad:	85 f6                	test   esi,esi
c00092af:	75 d9                	jne    c000928a <page_alloc+0x35>
c00092b1:	eb 02                	jmp    c00092b5 <page_alloc+0x60>
c00092b3:	31 db                	xor    ebx,ebx
c00092b5:	8d 65 f4             	lea    esp,[ebp-0xc]
c00092b8:	89 d8                	mov    eax,ebx
c00092ba:	5b                   	pop    ebx
c00092bb:	5e                   	pop    esi
c00092bc:	5f                   	pop    edi
c00092bd:	5d                   	pop    ebp
c00092be:	c3                   	ret    

c00092bf <get_kernel_page>:
c00092bf:	55                   	push   ebp
c00092c0:	89 e5                	mov    ebp,esp
c00092c2:	53                   	push   ebx
c00092c3:	83 ec 1c             	sub    esp,0x1c
c00092c6:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c00092c9:	53                   	push   ebx
c00092ca:	6a 01                	push   0x1
c00092cc:	e8 84 ff ff ff       	call   c0009255 <page_alloc>
c00092d1:	83 c4 10             	add    esp,0x10
c00092d4:	85 c0                	test   eax,eax
c00092d6:	74 16                	je     c00092ee <get_kernel_page+0x2f>
c00092d8:	c1 e3 0c             	shl    ebx,0xc
c00092db:	52                   	push   edx
c00092dc:	53                   	push   ebx
c00092dd:	6a 00                	push   0x0
c00092df:	50                   	push   eax
c00092e0:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
c00092e3:	e8 cc 01 00 00       	call   c00094b4 <memset>
c00092e8:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
c00092eb:	83 c4 10             	add    esp,0x10
c00092ee:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
c00092f1:	c9                   	leave  
c00092f2:	c3                   	ret    
	...

c00092f4 <itoa>:
c00092f4:	55                   	push   ebp
c00092f5:	89 e5                	mov    ebp,esp
c00092f7:	57                   	push   edi
c00092f8:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
c00092fb:	56                   	push   esi
c00092fc:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
c00092ff:	53                   	push   ebx
c0009300:	8b 7d 10             	mov    edi,DWORD PTR [ebp+0x10]
c0009303:	31 db                	xor    ebx,ebx
c0009305:	89 f0                	mov    eax,esi
c0009307:	99                   	cdq    
c0009308:	89 d0                	mov    eax,edx
c000930a:	31 f0                	xor    eax,esi
c000930c:	29 d0                	sub    eax,edx
c000930e:	eb 02                	jmp    c0009312 <itoa+0x1e>
c0009310:	89 d3                	mov    ebx,edx
c0009312:	99                   	cdq    
c0009313:	f7 ff                	idiv   edi
c0009315:	8a 92 d0 be 00 c0    	mov    dl,BYTE PTR [edx-0x3fff4130]
c000931b:	85 c0                	test   eax,eax
c000931d:	88 14 19             	mov    BYTE PTR [ecx+ebx*1],dl
c0009320:	8d 53 01             	lea    edx,[ebx+0x1]
c0009323:	7f eb                	jg     c0009310 <itoa+0x1c>
c0009325:	85 f6                	test   esi,esi
c0009327:	79 07                	jns    c0009330 <itoa+0x3c>
c0009329:	c6 04 11 2d          	mov    BYTE PTR [ecx+edx*1],0x2d
c000932d:	8d 53 02             	lea    edx,[ebx+0x2]
c0009330:	c6 04 11 00          	mov    BYTE PTR [ecx+edx*1],0x0
c0009334:	89 c8                	mov    eax,ecx
c0009336:	eb 01                	jmp    c0009339 <itoa+0x45>
c0009338:	40                   	inc    eax
c0009339:	80 38 00             	cmp    BYTE PTR [eax],0x0
c000933c:	75 fa                	jne    c0009338 <itoa+0x44>
c000933e:	eb 09                	jmp    c0009349 <itoa+0x55>
c0009340:	8a 11                	mov    dl,BYTE PTR [ecx]
c0009342:	8a 18                	mov    bl,BYTE PTR [eax]
c0009344:	88 19                	mov    BYTE PTR [ecx],bl
c0009346:	41                   	inc    ecx
c0009347:	88 10                	mov    BYTE PTR [eax],dl
c0009349:	48                   	dec    eax
c000934a:	39 c8                	cmp    eax,ecx
c000934c:	77 f2                	ja     c0009340 <itoa+0x4c>
c000934e:	5b                   	pop    ebx
c000934f:	5e                   	pop    esi
c0009350:	5f                   	pop    edi
c0009351:	5d                   	pop    ebp
c0009352:	c3                   	ret    

c0009353 <roll_screen>:
c0009353:	55                   	push   ebp
c0009354:	31 c0                	xor    eax,eax
c0009356:	89 e5                	mov    ebp,esp
c0009358:	56                   	push   esi
c0009359:	53                   	push   ebx
c000935a:	8b 15 18 7c 00 00    	mov    edx,DWORD PTR ds:0x7c18
c0009360:	8b 0d 10 7c 00 00    	mov    ecx,DWORD PTR ds:0x7c10
c0009366:	8d 1c 51             	lea    ebx,[ecx+edx*2]
c0009369:	4a                   	dec    edx
c000936a:	0f af 15 1c 7c 00 00 	imul   edx,DWORD PTR ds:0x7c1c
c0009371:	eb 09                	jmp    c000937c <roll_screen+0x29>
c0009373:	66 8b 34 43          	mov    si,WORD PTR [ebx+eax*2]
c0009377:	66 89 34 41          	mov    WORD PTR [ecx+eax*2],si
c000937b:	40                   	inc    eax
c000937c:	39 d0                	cmp    eax,edx
c000937e:	75 f3                	jne    c0009373 <roll_screen+0x20>
c0009380:	5b                   	pop    ebx
c0009381:	5e                   	pop    esi
c0009382:	5d                   	pop    ebp
c0009383:	c3                   	ret    

c0009384 <get_cursor>:
c0009384:	55                   	push   ebp
c0009385:	ba d4 03 00 00       	mov    edx,0x3d4
c000938a:	89 e5                	mov    ebp,esp
c000938c:	b8 0e 00 00 00       	mov    eax,0xe
c0009391:	53                   	push   ebx
c0009392:	ee                   	out    dx,al
c0009393:	bb d5 03 00 00       	mov    ebx,0x3d5
c0009398:	89 da                	mov    edx,ebx
c000939a:	ec                   	in     al,dx
c000939b:	89 c1                	mov    ecx,eax
c000939d:	b2 d4                	mov    dl,0xd4
c000939f:	b8 0f 00 00 00       	mov    eax,0xf
c00093a4:	ee                   	out    dx,al
c00093a5:	89 da                	mov    edx,ebx
c00093a7:	ec                   	in     al,dx
c00093a8:	c1 e1 08             	shl    ecx,0x8
c00093ab:	09 c1                	or     ecx,eax
c00093ad:	89 c8                	mov    eax,ecx
c00093af:	5b                   	pop    ebx
c00093b0:	5d                   	pop    ebp
c00093b1:	c3                   	ret    

c00093b2 <set_cursor>:
c00093b2:	55                   	push   ebp
c00093b3:	ba d4 03 00 00       	mov    edx,0x3d4
c00093b8:	89 e5                	mov    ebp,esp
c00093ba:	b8 0e 00 00 00       	mov    eax,0xe
c00093bf:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
c00093c2:	ee                   	out    dx,al
c00093c3:	0f b6 c5             	movzx  eax,ch
c00093c6:	b2 d5                	mov    dl,0xd5
c00093c8:	ee                   	out    dx,al
c00093c9:	b8 0f 00 00 00       	mov    eax,0xf
c00093ce:	b2 d4                	mov    dl,0xd4
c00093d0:	ee                   	out    dx,al
c00093d1:	0f b6 c1             	movzx  eax,cl
c00093d4:	b2 d5                	mov    dl,0xd5
c00093d6:	ee                   	out    dx,al
c00093d7:	5d                   	pop    ebp
c00093d8:	c3                   	ret    

c00093d9 <put_char>:
c00093d9:	55                   	push   ebp
c00093da:	89 e5                	mov    ebp,esp
c00093dc:	56                   	push   esi
c00093dd:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
c00093e0:	53                   	push   ebx
c00093e1:	83 3d 0c 7c 00 00 00 	cmp    DWORD PTR ds:0x7c0c,0x0
c00093e8:	89 f3                	mov    ebx,esi
c00093ea:	75 73                	jne    c000945f <put_char+0x86>
c00093ec:	e8 93 ff ff ff       	call   c0009384 <get_cursor>
c00093f1:	80 fb 0a             	cmp    bl,0xa
c00093f4:	74 19                	je     c000940f <put_char+0x36>
c00093f6:	80 fb 0d             	cmp    bl,0xd
c00093f9:	74 14                	je     c000940f <put_char+0x36>
c00093fb:	80 fb 08             	cmp    bl,0x8
c00093fe:	8b 15 10 7c 00 00    	mov    edx,DWORD PTR ds:0x7c10
c0009404:	75 1a                	jne    c0009420 <put_char+0x47>
c0009406:	8d 48 ff             	lea    ecx,[eax-0x1]
c0009409:	c6 04 4a 20          	mov    BYTE PTR [edx+ecx*2],0x20
c000940d:	eb 22                	jmp    c0009431 <put_char+0x58>
c000940f:	8b 1d 18 7c 00 00    	mov    ebx,DWORD PTR ds:0x7c18
c0009415:	31 d2                	xor    edx,edx
c0009417:	8d 0c 18             	lea    ecx,[eax+ebx*1]
c000941a:	f7 f3                	div    ebx
c000941c:	29 d1                	sub    ecx,edx
c000941e:	eb 11                	jmp    c0009431 <put_char+0x58>
c0009420:	88 1c 42             	mov    BYTE PTR [edx+eax*2],bl
c0009423:	8b 15 10 7c 00 00    	mov    edx,DWORD PTR ds:0x7c10
c0009429:	8d 48 01             	lea    ecx,[eax+0x1]
c000942c:	c6 44 42 01 07       	mov    BYTE PTR [edx+eax*2+0x1],0x7
c0009431:	a1 1c 7c 00 00       	mov    eax,ds:0x7c1c
c0009436:	0f af 05 18 7c 00 00 	imul   eax,DWORD PTR ds:0x7c18
c000943d:	39 c1                	cmp    ecx,eax
c000943f:	72 13                	jb     c0009454 <put_char+0x7b>
c0009441:	e8 0d ff ff ff       	call   c0009353 <roll_screen>
c0009446:	8b 0d 1c 7c 00 00    	mov    ecx,DWORD PTR ds:0x7c1c
c000944c:	49                   	dec    ecx
c000944d:	0f af 0d 18 7c 00 00 	imul   ecx,DWORD PTR ds:0x7c18
c0009454:	5b                   	pop    ebx
c0009455:	89 4d 08             	mov    DWORD PTR [ebp+0x8],ecx
c0009458:	5e                   	pop    esi
c0009459:	5d                   	pop    ebp
c000945a:	e9 53 ff ff ff       	jmp    c00093b2 <set_cursor>
c000945f:	5b                   	pop    ebx
c0009460:	5e                   	pop    esi
c0009461:	5d                   	pop    ebp
c0009462:	c3                   	ret    

c0009463 <put_str>:
c0009463:	55                   	push   ebp
c0009464:	89 e5                	mov    ebp,esp
c0009466:	53                   	push   ebx
c0009467:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c000946a:	eb 0b                	jmp    c0009477 <put_str+0x14>
c000946c:	0f b6 c0             	movzx  eax,al
c000946f:	43                   	inc    ebx
c0009470:	50                   	push   eax
c0009471:	e8 63 ff ff ff       	call   c00093d9 <put_char>
c0009476:	58                   	pop    eax
c0009477:	8a 03                	mov    al,BYTE PTR [ebx]
c0009479:	84 c0                	test   al,al
c000947b:	75 ef                	jne    c000946c <put_str+0x9>
c000947d:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
c0009480:	c9                   	leave  
c0009481:	c3                   	ret    

c0009482 <put_int>:
c0009482:	55                   	push   ebp
c0009483:	31 c0                	xor    eax,eax
c0009485:	89 e5                	mov    ebp,esp
c0009487:	b9 42 00 00 00       	mov    ecx,0x42
c000948c:	57                   	push   edi
c000948d:	8d 7d ba             	lea    edi,[ebp-0x46]
c0009490:	83 ec 50             	sub    esp,0x50
c0009493:	f3 aa                	rep stos BYTE PTR es:[edi],al
c0009495:	8d 7d ba             	lea    edi,[ebp-0x46]
c0009498:	6a 10                	push   0x10
c000949a:	57                   	push   edi
c000949b:	ff 75 08             	push   DWORD PTR [ebp+0x8]
c000949e:	e8 51 fe ff ff       	call   c00092f4 <itoa>
c00094a3:	57                   	push   edi
c00094a4:	e8 ba ff ff ff       	call   c0009463 <put_str>
c00094a9:	83 c4 10             	add    esp,0x10
c00094ac:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
c00094af:	c9                   	leave  
c00094b0:	c3                   	ret    
c00094b1:	00 00                	add    BYTE PTR [eax],al
	...

c00094b4 <memset>:
c00094b4:	55                   	push   ebp
c00094b5:	89 e5                	mov    ebp,esp
c00094b7:	56                   	push   esi
c00094b8:	53                   	push   ebx
c00094b9:	83 ec 10             	sub    esp,0x10
c00094bc:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c00094bf:	8b 75 10             	mov    esi,DWORD PTR [ebp+0x10]
c00094c2:	8a 55 0c             	mov    dl,BYTE PTR [ebp+0xc]
c00094c5:	85 db                	test   ebx,ebx
c00094c7:	75 1f                	jne    c00094e8 <memset+0x34>
c00094c9:	68 f8 be 00 c0       	push   0xc000bef8
c00094ce:	68 50 bf 00 c0       	push   0xc000bf50
c00094d3:	6a 0f                	push   0xf
c00094d5:	68 06 bf 00 c0       	push   0xc000bf06
c00094da:	88 55 f4             	mov    BYTE PTR [ebp-0xc],dl
c00094dd:	e8 8a f2 ff ff       	call   c000876c <panic_spin>
c00094e2:	8a 55 f4             	mov    dl,BYTE PTR [ebp-0xc]
c00094e5:	83 c4 10             	add    esp,0x10
c00094e8:	31 c0                	xor    eax,eax
c00094ea:	eb 04                	jmp    c00094f0 <memset+0x3c>
c00094ec:	88 14 03             	mov    BYTE PTR [ebx+eax*1],dl
c00094ef:	40                   	inc    eax
c00094f0:	39 f0                	cmp    eax,esi
c00094f2:	75 f8                	jne    c00094ec <memset+0x38>
c00094f4:	8d 65 f8             	lea    esp,[ebp-0x8]
c00094f7:	5b                   	pop    ebx
c00094f8:	5e                   	pop    esi
c00094f9:	5d                   	pop    ebp
c00094fa:	c3                   	ret    

c00094fb <memcpy>:
c00094fb:	55                   	push   ebp
c00094fc:	89 e5                	mov    ebp,esp
c00094fe:	57                   	push   edi
c00094ff:	56                   	push   esi
c0009500:	53                   	push   ebx
c0009501:	83 ec 0c             	sub    esp,0xc
c0009504:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
c0009507:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c000950a:	8b 7d 10             	mov    edi,DWORD PTR [ebp+0x10]
c000950d:	85 f6                	test   esi,esi
c000950f:	74 04                	je     c0009515 <memcpy+0x1a>
c0009511:	85 db                	test   ebx,ebx
c0009513:	75 19                	jne    c000952e <memcpy+0x33>
c0009515:	68 13 bf 00 c0       	push   0xc000bf13
c000951a:	68 58 bf 00 c0       	push   0xc000bf58
c000951f:	6a 22                	push   0x22
c0009521:	68 06 bf 00 c0       	push   0xc000bf06
c0009526:	e8 41 f2 ff ff       	call   c000876c <panic_spin>
c000952b:	83 c4 10             	add    esp,0x10
c000952e:	31 c0                	xor    eax,eax
c0009530:	eb 07                	jmp    c0009539 <memcpy+0x3e>
c0009532:	8a 14 06             	mov    dl,BYTE PTR [esi+eax*1]
c0009535:	88 14 03             	mov    BYTE PTR [ebx+eax*1],dl
c0009538:	40                   	inc    eax
c0009539:	39 f8                	cmp    eax,edi
c000953b:	75 f5                	jne    c0009532 <memcpy+0x37>
c000953d:	8d 65 f4             	lea    esp,[ebp-0xc]
c0009540:	5b                   	pop    ebx
c0009541:	5e                   	pop    esi
c0009542:	5f                   	pop    edi
c0009543:	5d                   	pop    ebp
c0009544:	c3                   	ret    

c0009545 <memcmp>:
c0009545:	55                   	push   ebp
c0009546:	89 e5                	mov    ebp,esp
c0009548:	56                   	push   esi
c0009549:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
c000954c:	53                   	push   ebx
c000954d:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
c0009550:	85 db                	test   ebx,ebx
c0009552:	74 04                	je     c0009558 <memcmp+0x13>
c0009554:	85 f6                	test   esi,esi
c0009556:	75 19                	jne    c0009571 <memcmp+0x2c>
c0009558:	68 32 bf 00 c0       	push   0xc000bf32
c000955d:	68 60 bf 00 c0       	push   0xc000bf60
c0009562:	6a 3b                	push   0x3b
c0009564:	68 06 bf 00 c0       	push   0xc000bf06
c0009569:	e8 fe f1 ff ff       	call   c000876c <panic_spin>
c000956e:	83 c4 10             	add    esp,0x10
c0009571:	8a 13                	mov    dl,BYTE PTR [ebx]
c0009573:	83 c8 ff             	or     eax,0xffffffff
c0009576:	38 16                	cmp    BYTE PTR [esi],dl
c0009578:	72 06                	jb     c0009580 <memcmp+0x3b>
c000957a:	0f 97 c0             	seta   al
c000957d:	0f b6 c0             	movzx  eax,al
c0009580:	8d 65 f8             	lea    esp,[ebp-0x8]
c0009583:	5b                   	pop    ebx
c0009584:	5e                   	pop    esi
c0009585:	5d                   	pop    ebp
c0009586:	c3                   	ret    

c0009587 <strcpy>:
c0009587:	55                   	push   ebp
c0009588:	31 d2                	xor    edx,edx
c000958a:	89 e5                	mov    ebp,esp
c000958c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c000958f:	53                   	push   ebx
c0009590:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
c0009593:	8a 0c 13             	mov    cl,BYTE PTR [ebx+edx*1]
c0009596:	88 0c 10             	mov    BYTE PTR [eax+edx*1],cl
c0009599:	42                   	inc    edx
c000959a:	84 c9                	test   cl,cl
c000959c:	75 f5                	jne    c0009593 <strcpy+0xc>
c000959e:	5b                   	pop    ebx
c000959f:	5d                   	pop    ebp
c00095a0:	c3                   	ret    
	...

c00095b0 <switch_to>:
c00095b0:	56                   	push   esi
c00095b1:	57                   	push   edi
c00095b2:	53                   	push   ebx
c00095b3:	55                   	push   ebp
c00095b4:	8b 44 24 14          	mov    eax,DWORD PTR [esp+0x14]
c00095b8:	89 20                	mov    DWORD PTR [eax],esp
c00095ba:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
c00095be:	8b 20                	mov    esp,DWORD PTR [eax]
c00095c0:	5d                   	pop    ebp
c00095c1:	5b                   	pop    ebx
c00095c2:	5f                   	pop    edi
c00095c3:	5e                   	pop    esi
c00095c4:	c3                   	ret    
c00095c5:	00 00                	add    BYTE PTR [eax],al
	...

c00095c8 <kernel_thread>:
c00095c8:	55                   	push   ebp
c00095c9:	89 e5                	mov    ebp,esp
c00095cb:	56                   	push   esi
c00095cc:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
c00095cf:	53                   	push   ebx
c00095d0:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c00095d3:	e8 29 f8 ff ff       	call   c0008e01 <intr_enable>
c00095d8:	89 75 08             	mov    DWORD PTR [ebp+0x8],esi
c00095db:	89 d8                	mov    eax,ebx
c00095dd:	5b                   	pop    ebx
c00095de:	5e                   	pop    esi
c00095df:	5d                   	pop    ebp
c00095e0:	ff e0                	jmp    eax

c00095e2 <thread_init>:
c00095e2:	55                   	push   ebp
c00095e3:	89 e5                	mov    ebp,esp
c00095e5:	56                   	push   esi
c00095e6:	8b 75 10             	mov    esi,DWORD PTR [ebp+0x10]
c00095e9:	53                   	push   ebx
c00095ea:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c00095ed:	50                   	push   eax
c00095ee:	6a 28                	push   0x28
c00095f0:	6a 00                	push   0x0
c00095f2:	53                   	push   ebx
c00095f3:	e8 bc fe ff ff       	call   c00094b4 <memset>
c00095f8:	8d 43 08             	lea    eax,[ebx+0x8]
c00095fb:	5a                   	pop    edx
c00095fc:	59                   	pop    ecx
c00095fd:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
c0009600:	50                   	push   eax
c0009601:	e8 81 ff ff ff       	call   c0009587 <strcpy>
c0009606:	83 c4 10             	add    esp,0x10
c0009609:	31 c0                	xor    eax,eax
c000960b:	3b 1d 68 b6 02 c0    	cmp    ebx,DWORD PTR ds:0xc002b668
c0009611:	c7 43 24 78 56 34 12 	mov    DWORD PTR [ebx+0x24],0x12345678
c0009618:	0f 95 c0             	setne  al
c000961b:	89 43 04             	mov    DWORD PTR [ebx+0x4],eax
c000961e:	89 f0                	mov    eax,esi
c0009620:	88 43 18             	mov    BYTE PTR [ebx+0x18],al
c0009623:	8d 83 00 10 00 00    	lea    eax,[ebx+0x1000]
c0009629:	89 03                	mov    DWORD PTR [ebx],eax
c000962b:	8d 65 f8             	lea    esp,[ebp-0x8]
c000962e:	5b                   	pop    ebx
c000962f:	5e                   	pop    esi
c0009630:	5d                   	pop    ebp
c0009631:	c3                   	ret    

c0009632 <running_thread>:
c0009632:	55                   	push   ebp
c0009633:	89 e5                	mov    ebp,esp
c0009635:	89 e0                	mov    eax,esp
c0009637:	25 00 f0 ff ff       	and    eax,0xfffff000
c000963c:	5d                   	pop    ebp
c000963d:	c3                   	ret    

c000963e <init_thread>:
c000963e:	55                   	push   ebp
c000963f:	89 e5                	mov    ebp,esp
c0009641:	83 ec 14             	sub    esp,0x14
c0009644:	6a 01                	push   0x1
c0009646:	e8 74 fc ff ff       	call   c00092bf <get_kernel_page>
c000964b:	68 00 04 00 00       	push   0x400
c0009650:	6a 20                	push   0x20
c0009652:	50                   	push   eax
c0009653:	68 6c b6 02 c0       	push   0xc002b66c
c0009658:	e8 b3 f1 ff ff       	call   c0008810 <init_fifo>
c000965d:	83 c4 14             	add    esp,0x14
c0009660:	6a 01                	push   0x1
c0009662:	e8 58 fc ff ff       	call   c00092bf <get_kernel_page>
c0009667:	68 00 04 00 00       	push   0x400
c000966c:	6a 20                	push   0x20
c000966e:	50                   	push   eax
c000966f:	68 4c b6 02 c0       	push   0xc002b64c
c0009674:	e8 97 f1 ff ff       	call   c0008810 <init_fifo>
c0009679:	83 c4 20             	add    esp,0x20
c000967c:	e8 b1 ff ff ff       	call   c0009632 <running_thread>
c0009681:	52                   	push   edx
c0009682:	6a 1f                	push   0x1f
c0009684:	68 67 bf 00 c0       	push   0xc000bf67
c0009689:	50                   	push   eax
c000968a:	a3 68 b6 02 c0       	mov    ds:0xc002b668,eax
c000968f:	e8 4e ff ff ff       	call   c00095e2 <thread_init>
c0009694:	59                   	pop    ecx
c0009695:	58                   	pop    eax
c0009696:	68 68 b6 02 c0       	push   0xc002b668
c000969b:	68 4c b6 02 c0       	push   0xc002b64c
c00096a0:	e8 90 f1 ff ff       	call   c0008835 <fifo_put>
c00096a5:	83 c4 10             	add    esp,0x10
c00096a8:	c9                   	leave  
c00096a9:	c3                   	ret    

c00096aa <thread_create>:
c00096aa:	55                   	push   ebp
c00096ab:	89 e5                	mov    ebp,esp
c00096ad:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
c00096b0:	8b 02                	mov    eax,DWORD PTR [edx]
c00096b2:	8d 88 50 fe ff ff    	lea    ecx,[eax-0x1b0]
c00096b8:	89 0a                	mov    DWORD PTR [edx],ecx
c00096ba:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
c00096bd:	c7 80 60 fe ff ff c8 	mov    DWORD PTR [eax-0x1a0],0xc00095c8
c00096c4:	95 00 c0 
c00096c7:	c7 80 50 fe ff ff 00 	mov    DWORD PTR [eax-0x1b0],0x0
c00096ce:	00 00 00 
c00096d1:	c7 80 54 fe ff ff 00 	mov    DWORD PTR [eax-0x1ac],0x0
c00096d8:	00 00 00 
c00096db:	89 90 68 fe ff ff    	mov    DWORD PTR [eax-0x198],edx
c00096e1:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
c00096e4:	c7 80 5c fe ff ff 00 	mov    DWORD PTR [eax-0x1a4],0x0
c00096eb:	00 00 00 
c00096ee:	c7 80 58 fe ff ff 00 	mov    DWORD PTR [eax-0x1a8],0x0
c00096f5:	00 00 00 
c00096f8:	89 90 6c fe ff ff    	mov    DWORD PTR [eax-0x194],edx
c00096fe:	5d                   	pop    ebp
c00096ff:	c3                   	ret    

c0009700 <thread_start>:
c0009700:	55                   	push   ebp
c0009701:	89 e5                	mov    ebp,esp
c0009703:	53                   	push   ebx
c0009704:	83 ec 20             	sub    esp,0x20
c0009707:	8a 5d 0c             	mov    bl,BYTE PTR [ebp+0xc]
c000970a:	6a 01                	push   0x1
c000970c:	e8 ae fb ff ff       	call   c00092bf <get_kernel_page>
c0009711:	83 c4 0c             	add    esp,0xc
c0009714:	0f b6 db             	movzx  ebx,bl
c0009717:	53                   	push   ebx
c0009718:	ff 75 08             	push   DWORD PTR [ebp+0x8]
c000971b:	8d 5d f4             	lea    ebx,[ebp-0xc]
c000971e:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
c0009721:	50                   	push   eax
c0009722:	e8 bb fe ff ff       	call   c00095e2 <thread_init>
c0009727:	83 c4 0c             	add    esp,0xc
c000972a:	ff 75 14             	push   DWORD PTR [ebp+0x14]
c000972d:	ff 75 10             	push   DWORD PTR [ebp+0x10]
c0009730:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
c0009733:	e8 72 ff ff ff       	call   c00096aa <thread_create>
c0009738:	58                   	pop    eax
c0009739:	5a                   	pop    edx
c000973a:	53                   	push   ebx
c000973b:	68 6c b6 02 c0       	push   0xc002b66c
c0009740:	e8 f0 f0 ff ff       	call   c0008835 <fifo_put>
c0009745:	59                   	pop    ecx
c0009746:	58                   	pop    eax
c0009747:	53                   	push   ebx
c0009748:	68 4c b6 02 c0       	push   0xc002b64c
c000974d:	e8 e3 f0 ff ff       	call   c0008835 <fifo_put>
c0009752:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
c0009755:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
c0009758:	c9                   	leave  
c0009759:	c3                   	ret    

c000975a <schedule>:
c000975a:	55                   	push   ebp
c000975b:	89 e5                	mov    ebp,esp
c000975d:	83 ec 18             	sub    esp,0x18
c0009760:	e8 cd fe ff ff       	call   c0009632 <running_thread>
c0009765:	83 78 04 00          	cmp    DWORD PTR [eax+0x4],0x0
c0009769:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
c000976c:	75 23                	jne    c0009791 <schedule+0x37>
c000976e:	50                   	push   eax
c000976f:	50                   	push   eax
c0009770:	8d 45 f0             	lea    eax,[ebp-0x10]
c0009773:	50                   	push   eax
c0009774:	68 6c b6 02 c0       	push   0xc002b66c
c0009779:	e8 b7 f0 ff ff       	call   c0008835 <fifo_put>
c000977e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
c0009781:	83 c4 10             	add    esp,0x10
c0009784:	8a 50 18             	mov    dl,BYTE PTR [eax+0x18]
c0009787:	c7 40 04 00 00 00 00 	mov    DWORD PTR [eax+0x4],0x0
c000978e:	88 50 19             	mov    BYTE PTR [eax+0x19],dl
c0009791:	50                   	push   eax
c0009792:	50                   	push   eax
c0009793:	8d 45 f4             	lea    eax,[ebp-0xc]
c0009796:	50                   	push   eax
c0009797:	68 6c b6 02 c0       	push   0xc002b66c
c000979c:	e8 27 f1 ff ff       	call   c00088c8 <fifo_get>
c00097a1:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
c00097a4:	c7 40 04 00 00 00 00 	mov    DWORD PTR [eax+0x4],0x0
c00097ab:	5a                   	pop    edx
c00097ac:	59                   	pop    ecx
c00097ad:	50                   	push   eax
c00097ae:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
c00097b1:	e8 fa fd ff ff       	call   c00095b0 <switch_to>
c00097b6:	83 c4 10             	add    esp,0x10
c00097b9:	c9                   	leave  
c00097ba:	c3                   	ret    
	...

c00097bc <get_time>:
c00097bc:	55                   	push   ebp
c00097bd:	89 e5                	mov    ebp,esp
c00097bf:	57                   	push   edi
c00097c0:	56                   	push   esi
c00097c1:	be 70 00 00 00       	mov    esi,0x70
c00097c6:	53                   	push   ebx
c00097c7:	83 ec 1c             	sub    esp,0x1c
c00097ca:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
c00097cd:	e8 0b f6 ff ff       	call   c0008ddd <intr_get_status>
c00097d2:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
c00097d5:	b8 89 00 00 00       	mov    eax,0x89
c00097da:	89 f2                	mov    edx,esi
c00097dc:	ee                   	out    dx,al
c00097dd:	bb 71 00 00 00       	mov    ebx,0x71
c00097e2:	89 da                	mov    edx,ebx
c00097e4:	ec                   	in     al,dx
c00097e5:	89 c1                	mov    ecx,eax
c00097e7:	89 f2                	mov    edx,esi
c00097e9:	b8 b2 00 00 00       	mov    eax,0xb2
c00097ee:	ee                   	out    dx,al
c00097ef:	89 da                	mov    edx,ebx
c00097f1:	ec                   	in     al,dx
c00097f2:	c1 e0 08             	shl    eax,0x8
c00097f5:	89 f2                	mov    edx,esi
c00097f7:	01 c1                	add    ecx,eax
c00097f9:	b8 88 00 00 00       	mov    eax,0x88
c00097fe:	89 4f 14             	mov    DWORD PTR [edi+0x14],ecx
c0009801:	ee                   	out    dx,al
c0009802:	89 da                	mov    edx,ebx
c0009804:	ec                   	in     al,dx
c0009805:	89 47 10             	mov    DWORD PTR [edi+0x10],eax
c0009808:	89 f2                	mov    edx,esi
c000980a:	b8 87 00 00 00       	mov    eax,0x87
c000980f:	ee                   	out    dx,al
c0009810:	89 da                	mov    edx,ebx
c0009812:	ec                   	in     al,dx
c0009813:	89 47 0c             	mov    DWORD PTR [edi+0xc],eax
c0009816:	89 f2                	mov    edx,esi
c0009818:	b8 84 00 00 00       	mov    eax,0x84
c000981d:	ee                   	out    dx,al
c000981e:	89 da                	mov    edx,ebx
c0009820:	ec                   	in     al,dx
c0009821:	89 47 08             	mov    DWORD PTR [edi+0x8],eax
c0009824:	89 f2                	mov    edx,esi
c0009826:	b8 82 00 00 00       	mov    eax,0x82
c000982b:	ee                   	out    dx,al
c000982c:	89 da                	mov    edx,ebx
c000982e:	ec                   	in     al,dx
c000982f:	b9 80 00 00 00       	mov    ecx,0x80
c0009834:	89 f2                	mov    edx,esi
c0009836:	89 47 04             	mov    DWORD PTR [edi+0x4],eax
c0009839:	89 c8                	mov    eax,ecx
c000983b:	ee                   	out    dx,al
c000983c:	89 da                	mov    edx,ebx
c000983e:	ec                   	in     al,dx
c000983f:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
c0009842:	89 f2                	mov    edx,esi
c0009844:	89 07                	mov    DWORD PTR [edi],eax
c0009846:	89 c8                	mov    eax,ecx
c0009848:	ee                   	out    dx,al
c0009849:	89 da                	mov    edx,ebx
c000984b:	ec                   	in     al,dx
c000984c:	39 45 e4             	cmp    DWORD PTR [ebp-0x1c],eax
c000984f:	75 84                	jne    c00097d5 <get_time+0x19>
c0009851:	b2 70                	mov    dl,0x70
c0009853:	31 c0                	xor    eax,eax
c0009855:	ee                   	out    dx,al
c0009856:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
c0009859:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
c000985c:	83 c4 1c             	add    esp,0x1c
c000985f:	5b                   	pop    ebx
c0009860:	5e                   	pop    esi
c0009861:	5f                   	pop    edi
c0009862:	5d                   	pop    ebp
c0009863:	e9 b0 f5 ff ff       	jmp    c0008e18 <intr_set_status>

c0009868 <init_pit>:
c0009868:	55                   	push   ebp
c0009869:	ba 43 00 00 00       	mov    edx,0x43
c000986e:	89 e5                	mov    ebp,esp
c0009870:	b8 34 00 00 00       	mov    eax,0x34
c0009875:	ee                   	out    dx,al
c0009876:	b2 40                	mov    dl,0x40
c0009878:	b0 9c                	mov    al,0x9c
c000987a:	ee                   	out    dx,al
c000987b:	b0 2e                	mov    al,0x2e
c000987d:	ee                   	out    dx,al
c000987e:	5d                   	pop    ebp
c000987f:	c3                   	ret    

c0009880 <intr0x20_handler>:
c0009880:	55                   	push   ebp
c0009881:	b8 20 00 00 00       	mov    eax,0x20
c0009886:	89 e5                	mov    ebp,esp
c0009888:	83 ec 08             	sub    esp,0x8
c000988b:	89 c2                	mov    edx,eax
c000988d:	ee                   	out    dx,al
c000988e:	e8 9f fd ff ff       	call   c0009632 <running_thread>
c0009893:	ff 05 70 bf 00 c0    	inc    DWORD PTR ds:0xc000bf70
c0009899:	8a 50 19             	mov    dl,BYTE PTR [eax+0x19]
c000989c:	ff 40 1c             	inc    DWORD PTR [eax+0x1c]
c000989f:	84 d2                	test   dl,dl
c00098a1:	75 06                	jne    c00098a9 <intr0x20_handler+0x29>
c00098a3:	c9                   	leave  
c00098a4:	e9 b1 fe ff ff       	jmp    c000975a <schedule>
c00098a9:	4a                   	dec    edx
c00098aa:	88 50 19             	mov    BYTE PTR [eax+0x19],dl
c00098ad:	c9                   	leave  
c00098ae:	c3                   	ret    

Disassembly of section .data:

c00098b0 <_data>:
	...

c00098b8 <SectionCode32>:
c00098b8:	ff                   	(bad)  
c00098b9:	ff 00                	inc    DWORD PTR [eax]
c00098bb:	00 00                	add    BYTE PTR [eax],al
c00098bd:	98                   	cwde   
c00098be:	cf                   	iret   
	...

c00098c0 <SectionData32>:
c00098c0:	ff                   	(bad)  
c00098c1:	ff 00                	inc    DWORD PTR [eax]
c00098c3:	00 00                	add    BYTE PTR [eax],al
c00098c5:	92                   	xchg   edx,eax
c00098c6:	cf                   	iret   
	...

c00098c8 <SectionVideo>:
c00098c8:	07                   	pop    es
c00098c9:	00 00                	add    BYTE PTR [eax],al
c00098cb:	80 0b 92             	or     BYTE PTR [ebx],0x92
c00098ce:	c0 00 00             	rol    BYTE PTR [eax],0x0
	...

c0009ab0 <gdt_ptr>:
c0009ab0:	1f                   	pop    ds
c0009ab1:	00 b0 98 00 c0 00    	add    BYTE PTR [eax+0xc00098],dh
	...

c0009ab8 <PKnFont>:
	...
c0009cc8:	00 10                	add    BYTE PTR [eax],dl
c0009cca:	10 10                	adc    BYTE PTR [eax],dl
c0009ccc:	10 10                	adc    BYTE PTR [eax],dl
c0009cce:	10 10                	adc    BYTE PTR [eax],dl
c0009cd0:	10 10                	adc    BYTE PTR [eax],dl
c0009cd2:	00 00                	add    BYTE PTR [eax],al
c0009cd4:	10 10                	adc    BYTE PTR [eax],dl
c0009cd6:	00 00                	add    BYTE PTR [eax],al
c0009cd8:	28 28                	sub    BYTE PTR [eax],ch
c0009cda:	28 00                	sub    BYTE PTR [eax],al
	...
c0009ce8:	00 44 44 44          	add    BYTE PTR [esp+eax*2+0x44],al
c0009cec:	fe 44 44 44          	inc    BYTE PTR [esp+eax*2+0x44]
c0009cf0:	44                   	inc    esp
c0009cf1:	44                   	inc    esp
c0009cf2:	fe 44 44 44          	inc    BYTE PTR [esp+eax*2+0x44]
c0009cf6:	00 00                	add    BYTE PTR [eax],al
c0009cf8:	10 3a                	adc    BYTE PTR [edx],bh
c0009cfa:	56                   	push   esi
c0009cfb:	92                   	xchg   edx,eax
c0009cfc:	92                   	xchg   edx,eax
c0009cfd:	90                   	nop
c0009cfe:	50                   	push   eax
c0009cff:	38 14 12             	cmp    BYTE PTR [edx+edx*1],dl
c0009d02:	92                   	xchg   edx,eax
c0009d03:	92                   	xchg   edx,eax
c0009d04:	d4 b8                	aam    0xb8
c0009d06:	10 10                	adc    BYTE PTR [eax],dl
c0009d08:	62 92 94 94 68 08    	bound  edx,QWORD PTR [edx+0x8689494]
c0009d0e:	10 10                	adc    BYTE PTR [eax],dl
c0009d10:	20 2c 52             	and    BYTE PTR [edx+edx*2],ch
c0009d13:	52                   	push   edx
c0009d14:	92                   	xchg   edx,eax
c0009d15:	8c 00                	mov    WORD PTR [eax],es
c0009d17:	00 00                	add    BYTE PTR [eax],al
c0009d19:	70 88                	jo     c0009ca3 <PKnFont+0x1eb>
c0009d1b:	88 88 90 60 47 a2    	mov    BYTE PTR [eax-0x5db89f70],cl
c0009d21:	92                   	xchg   edx,eax
c0009d22:	8a 84 46 39 00 00 04 	mov    al,BYTE PTR [esi+eax*2+0x4000039]
c0009d29:	08 10                	or     BYTE PTR [eax],dl
	...
c0009d37:	00 02                	add    BYTE PTR [edx],al
c0009d39:	04 08                	add    al,0x8
c0009d3b:	08 10                	or     BYTE PTR [eax],dl
c0009d3d:	10 10                	adc    BYTE PTR [eax],dl
c0009d3f:	10 10                	adc    BYTE PTR [eax],dl
c0009d41:	10 10                	adc    BYTE PTR [eax],dl
c0009d43:	08 08                	or     BYTE PTR [eax],cl
c0009d45:	04 02                	add    al,0x2
c0009d47:	00 80 40 20 20 10    	add    BYTE PTR [eax+0x10202040],al
c0009d4d:	10 10                	adc    BYTE PTR [eax],dl
c0009d4f:	10 10                	adc    BYTE PTR [eax],dl
c0009d51:	10 10                	adc    BYTE PTR [eax],dl
c0009d53:	20 20                	and    BYTE PTR [eax],ah
c0009d55:	40                   	inc    eax
c0009d56:	80 00 00             	add    BYTE PTR [eax],0x0
c0009d59:	00 00                	add    BYTE PTR [eax],al
c0009d5b:	00 00                	add    BYTE PTR [eax],al
c0009d5d:	10 92 54 38 54 92    	adc    BYTE PTR [edx-0x6dabc7ac],dl
c0009d63:	10 00                	adc    BYTE PTR [eax],al
	...
c0009d6d:	10 10                	adc    BYTE PTR [eax],dl
c0009d6f:	10 fe                	adc    dh,bh
c0009d71:	10 10                	adc    BYTE PTR [eax],dl
c0009d73:	10 00                	adc    BYTE PTR [eax],al
	...
c0009d81:	00 00                	add    BYTE PTR [eax],al
c0009d83:	18 18                	sbb    BYTE PTR [eax],bl
c0009d85:	08 08                	or     BYTE PTR [eax],cl
c0009d87:	10 00                	adc    BYTE PTR [eax],al
c0009d89:	00 00                	add    BYTE PTR [eax],al
c0009d8b:	00 00                	add    BYTE PTR [eax],al
c0009d8d:	00 00                	add    BYTE PTR [eax],al
c0009d8f:	00 fe                	add    dh,bh
	...
c0009da1:	00 00                	add    BYTE PTR [eax],al
c0009da3:	00 18                	add    BYTE PTR [eax],bl
c0009da5:	18 00                	sbb    BYTE PTR [eax],al
c0009da7:	00 02                	add    BYTE PTR [edx],al
c0009da9:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
c0009dac:	08 08                	or     BYTE PTR [eax],cl
c0009dae:	08 10                	or     BYTE PTR [eax],dl
c0009db0:	10 20                	adc    BYTE PTR [eax],ah
c0009db2:	20 40 40             	and    BYTE PTR [eax+0x40],al
c0009db5:	40                   	inc    eax
c0009db6:	80 80 00 18 24 24 42 	add    BYTE PTR [eax+0x24241800],0x42
c0009dbd:	42                   	inc    edx
c0009dbe:	42                   	inc    edx
c0009dbf:	42                   	inc    edx
c0009dc0:	42                   	inc    edx
c0009dc1:	42                   	inc    edx
c0009dc2:	42                   	inc    edx
c0009dc3:	24 24                	and    al,0x24
c0009dc5:	18 00                	sbb    BYTE PTR [eax],al
c0009dc7:	00 00                	add    BYTE PTR [eax],al
c0009dc9:	08 18                	or     BYTE PTR [eax],bl
c0009dcb:	28 08                	sub    BYTE PTR [eax],cl
c0009dcd:	08 08                	or     BYTE PTR [eax],cl
c0009dcf:	08 08                	or     BYTE PTR [eax],cl
c0009dd1:	08 08                	or     BYTE PTR [eax],cl
c0009dd3:	08 08                	or     BYTE PTR [eax],cl
c0009dd5:	3e 00 00             	add    BYTE PTR ds:[eax],al
c0009dd8:	00 18                	add    BYTE PTR [eax],bl
c0009dda:	24 42                	and    al,0x42
c0009ddc:	42                   	inc    edx
c0009ddd:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
c0009de0:	10 20                	adc    BYTE PTR [eax],ah
c0009de2:	20 40 40             	and    BYTE PTR [eax+0x40],al
c0009de5:	7e 00                	jle    c0009de7 <PKnFont+0x32f>
c0009de7:	00 00                	add    BYTE PTR [eax],al
c0009de9:	18 24 42             	sbb    BYTE PTR [edx+eax*2],ah
c0009dec:	02 02                	add    al,BYTE PTR [edx]
c0009dee:	04 18                	add    al,0x18
c0009df0:	04 02                	add    al,0x2
c0009df2:	02 42 24             	add    al,BYTE PTR [edx+0x24]
c0009df5:	18 00                	sbb    BYTE PTR [eax],al
c0009df7:	00 00                	add    BYTE PTR [eax],al
c0009df9:	0c 0c                	or     al,0xc
c0009dfb:	0c 14                	or     al,0x14
c0009dfd:	14 14                	adc    al,0x14
c0009dff:	24 24                	and    al,0x24
c0009e01:	44                   	inc    esp
c0009e02:	7e 04                	jle    c0009e08 <PKnFont+0x350>
c0009e04:	04 1e                	add    al,0x1e
c0009e06:	00 00                	add    BYTE PTR [eax],al
c0009e08:	00 7c 40 40          	add    BYTE PTR [eax+eax*2+0x40],bh
c0009e0c:	40                   	inc    eax
c0009e0d:	58                   	pop    eax
c0009e0e:	64 02 02             	add    al,BYTE PTR fs:[edx]
c0009e11:	02 02                	add    al,BYTE PTR [edx]
c0009e13:	42                   	inc    edx
c0009e14:	24 18                	and    al,0x18
c0009e16:	00 00                	add    BYTE PTR [eax],al
c0009e18:	00 18                	add    BYTE PTR [eax],bl
c0009e1a:	24 42                	and    al,0x42
c0009e1c:	40                   	inc    eax
c0009e1d:	58                   	pop    eax
c0009e1e:	64 42                	fs inc edx
c0009e20:	42                   	inc    edx
c0009e21:	42                   	inc    edx
c0009e22:	42                   	inc    edx
c0009e23:	42                   	inc    edx
c0009e24:	24 18                	and    al,0x18
c0009e26:	00 00                	add    BYTE PTR [eax],al
c0009e28:	00 7e 42             	add    BYTE PTR [esi+0x42],bh
c0009e2b:	42                   	inc    edx
c0009e2c:	04 04                	add    al,0x4
c0009e2e:	08 08                	or     BYTE PTR [eax],cl
c0009e30:	08 10                	or     BYTE PTR [eax],dl
c0009e32:	10 10                	adc    BYTE PTR [eax],dl
c0009e34:	10 38                	adc    BYTE PTR [eax],bh
c0009e36:	00 00                	add    BYTE PTR [eax],al
c0009e38:	00 18                	add    BYTE PTR [eax],bl
c0009e3a:	24 42                	and    al,0x42
c0009e3c:	42                   	inc    edx
c0009e3d:	42                   	inc    edx
c0009e3e:	24 18                	and    al,0x18
c0009e40:	24 42                	and    al,0x42
c0009e42:	42                   	inc    edx
c0009e43:	42                   	inc    edx
c0009e44:	24 18                	and    al,0x18
c0009e46:	00 00                	add    BYTE PTR [eax],al
c0009e48:	00 18                	add    BYTE PTR [eax],bl
c0009e4a:	24 42                	and    al,0x42
c0009e4c:	42                   	inc    edx
c0009e4d:	42                   	inc    edx
c0009e4e:	42                   	inc    edx
c0009e4f:	42                   	inc    edx
c0009e50:	26 1a 02             	sbb    al,BYTE PTR es:[edx]
c0009e53:	42                   	inc    edx
c0009e54:	24 18                	and    al,0x18
c0009e56:	00 00                	add    BYTE PTR [eax],al
c0009e58:	00 00                	add    BYTE PTR [eax],al
c0009e5a:	00 00                	add    BYTE PTR [eax],al
c0009e5c:	00 18                	add    BYTE PTR [eax],bl
c0009e5e:	18 00                	sbb    BYTE PTR [eax],al
c0009e60:	00 00                	add    BYTE PTR [eax],al
c0009e62:	00 00                	add    BYTE PTR [eax],al
c0009e64:	18 18                	sbb    BYTE PTR [eax],bl
c0009e66:	00 00                	add    BYTE PTR [eax],al
c0009e68:	00 00                	add    BYTE PTR [eax],al
c0009e6a:	00 00                	add    BYTE PTR [eax],al
c0009e6c:	00 18                	add    BYTE PTR [eax],bl
c0009e6e:	18 00                	sbb    BYTE PTR [eax],al
c0009e70:	00 00                	add    BYTE PTR [eax],al
c0009e72:	00 18                	add    BYTE PTR [eax],bl
c0009e74:	18 08                	sbb    BYTE PTR [eax],cl
c0009e76:	08 10                	or     BYTE PTR [eax],dl
c0009e78:	00 02                	add    BYTE PTR [edx],al
c0009e7a:	04 08                	add    al,0x8
c0009e7c:	10 20                	adc    BYTE PTR [eax],ah
c0009e7e:	40                   	inc    eax
c0009e7f:	80 80 40 20 10 08 04 	add    BYTE PTR [eax+0x8102040],0x4
c0009e86:	02 00                	add    al,BYTE PTR [eax]
c0009e88:	00 00                	add    BYTE PTR [eax],al
c0009e8a:	00 00                	add    BYTE PTR [eax],al
c0009e8c:	00 00                	add    BYTE PTR [eax],al
c0009e8e:	fe 00                	inc    BYTE PTR [eax]
c0009e90:	00 fe                	add    dh,bh
c0009e92:	00 00                	add    BYTE PTR [eax],al
c0009e94:	00 00                	add    BYTE PTR [eax],al
c0009e96:	00 00                	add    BYTE PTR [eax],al
c0009e98:	00 80 40 20 10 08    	add    BYTE PTR [eax+0x8102040],al
c0009e9e:	04 02                	add    al,0x2
c0009ea0:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
c0009ea3:	10 20                	adc    BYTE PTR [eax],ah
c0009ea5:	40                   	inc    eax
c0009ea6:	80 00 00             	add    BYTE PTR [eax],0x0
c0009ea9:	38 44 82 82          	cmp    BYTE PTR [edx+eax*4-0x7e],al
c0009ead:	82                   	(bad)  
c0009eae:	04 08                	add    al,0x8
c0009eb0:	10 10                	adc    BYTE PTR [eax],dl
c0009eb2:	00 00                	add    BYTE PTR [eax],al
c0009eb4:	18 18                	sbb    BYTE PTR [eax],bl
c0009eb6:	00 00                	add    BYTE PTR [eax],al
c0009eb8:	00 38                	add    BYTE PTR [eax],bh
c0009eba:	44                   	inc    esp
c0009ebb:	82                   	(bad)  
c0009ebc:	9a aa aa aa aa aa 9c 	call   0x9caa:0xaaaaaaaa
c0009ec3:	80 46 38 00          	add    BYTE PTR [esi+0x38],0x0
c0009ec7:	00 00                	add    BYTE PTR [eax],al
c0009ec9:	18 18                	sbb    BYTE PTR [eax],bl
c0009ecb:	18 18                	sbb    BYTE PTR [eax],bl
c0009ecd:	24 24                	and    al,0x24
c0009ecf:	24 24                	and    al,0x24
c0009ed1:	7e 42                	jle    c0009f15 <PKnFont+0x45d>
c0009ed3:	42                   	inc    edx
c0009ed4:	42                   	inc    edx
c0009ed5:	e7 00                	out    0x0,eax
c0009ed7:	00 00                	add    BYTE PTR [eax],al
c0009ed9:	f0 48                	lock dec eax
c0009edb:	44                   	inc    esp
c0009edc:	44                   	inc    esp
c0009edd:	44                   	inc    esp
c0009ede:	48                   	dec    eax
c0009edf:	78 44                	js     c0009f25 <PKnFont+0x46d>
c0009ee1:	42                   	inc    edx
c0009ee2:	42                   	inc    edx
c0009ee3:	42                   	inc    edx
c0009ee4:	44                   	inc    esp
c0009ee5:	f8                   	clc    
c0009ee6:	00 00                	add    BYTE PTR [eax],al
c0009ee8:	00 3a                	add    BYTE PTR [edx],bh
c0009eea:	46                   	inc    esi
c0009eeb:	42                   	inc    edx
c0009eec:	82                   	(bad)  
c0009eed:	80 80 80 80 80 82 42 	add    BYTE PTR [eax-0x7d7f7f80],0x42
c0009ef4:	44                   	inc    esp
c0009ef5:	38 00                	cmp    BYTE PTR [eax],al
c0009ef7:	00 00                	add    BYTE PTR [eax],al
c0009ef9:	f8                   	clc    
c0009efa:	44                   	inc    esp
c0009efb:	44                   	inc    esp
c0009efc:	42                   	inc    edx
c0009efd:	42                   	inc    edx
c0009efe:	42                   	inc    edx
c0009eff:	42                   	inc    edx
c0009f00:	42                   	inc    edx
c0009f01:	42                   	inc    edx
c0009f02:	42                   	inc    edx
c0009f03:	44                   	inc    esp
c0009f04:	44                   	inc    esp
c0009f05:	f8                   	clc    
c0009f06:	00 00                	add    BYTE PTR [eax],al
c0009f08:	00 fe                	add    dh,bh
c0009f0a:	42                   	inc    edx
c0009f0b:	42                   	inc    edx
c0009f0c:	40                   	inc    eax
c0009f0d:	40                   	inc    eax
c0009f0e:	44                   	inc    esp
c0009f0f:	7c 44                	jl     c0009f55 <PKnFont+0x49d>
c0009f11:	40                   	inc    eax
c0009f12:	40                   	inc    eax
c0009f13:	42                   	inc    edx
c0009f14:	42                   	inc    edx
c0009f15:	fe 00                	inc    BYTE PTR [eax]
c0009f17:	00 00                	add    BYTE PTR [eax],al
c0009f19:	fe 42 42             	inc    BYTE PTR [edx+0x42]
c0009f1c:	40                   	inc    eax
c0009f1d:	40                   	inc    eax
c0009f1e:	44                   	inc    esp
c0009f1f:	7c 44                	jl     c0009f65 <PKnFont+0x4ad>
c0009f21:	44                   	inc    esp
c0009f22:	40                   	inc    eax
c0009f23:	40                   	inc    eax
c0009f24:	40                   	inc    eax
c0009f25:	f0 00 00             	lock add BYTE PTR [eax],al
c0009f28:	00 3a                	add    BYTE PTR [edx],bh
c0009f2a:	46                   	inc    esi
c0009f2b:	42                   	inc    edx
c0009f2c:	82                   	(bad)  
c0009f2d:	80 80 9e 82 82 82 42 	add    BYTE PTR [eax-0x7d7d7d62],0x42
c0009f34:	46                   	inc    esi
c0009f35:	38 00                	cmp    BYTE PTR [eax],al
c0009f37:	00 00                	add    BYTE PTR [eax],al
c0009f39:	e7 42                	out    0x42,eax
c0009f3b:	42                   	inc    edx
c0009f3c:	42                   	inc    edx
c0009f3d:	42                   	inc    edx
c0009f3e:	42                   	inc    edx
c0009f3f:	7e 42                	jle    c0009f83 <PKnFont+0x4cb>
c0009f41:	42                   	inc    edx
c0009f42:	42                   	inc    edx
c0009f43:	42                   	inc    edx
c0009f44:	42                   	inc    edx
c0009f45:	e7 00                	out    0x0,eax
c0009f47:	00 00                	add    BYTE PTR [eax],al
c0009f49:	7c 10                	jl     c0009f5b <PKnFont+0x4a3>
c0009f4b:	10 10                	adc    BYTE PTR [eax],dl
c0009f4d:	10 10                	adc    BYTE PTR [eax],dl
c0009f4f:	10 10                	adc    BYTE PTR [eax],dl
c0009f51:	10 10                	adc    BYTE PTR [eax],dl
c0009f53:	10 10                	adc    BYTE PTR [eax],dl
c0009f55:	7c 00                	jl     c0009f57 <PKnFont+0x49f>
c0009f57:	00 00                	add    BYTE PTR [eax],al
c0009f59:	1f                   	pop    ds
c0009f5a:	04 04                	add    al,0x4
c0009f5c:	04 04                	add    al,0x4
c0009f5e:	04 04                	add    al,0x4
c0009f60:	04 04                	add    al,0x4
c0009f62:	04 04                	add    al,0x4
c0009f64:	84 48 30             	test   BYTE PTR [eax+0x30],cl
c0009f67:	00 00                	add    BYTE PTR [eax],al
c0009f69:	e7 42                	out    0x42,eax
c0009f6b:	44                   	inc    esp
c0009f6c:	48                   	dec    eax
c0009f6d:	50                   	push   eax
c0009f6e:	50                   	push   eax
c0009f6f:	60                   	pusha  
c0009f70:	50                   	push   eax
c0009f71:	50                   	push   eax
c0009f72:	48                   	dec    eax
c0009f73:	44                   	inc    esp
c0009f74:	42                   	inc    edx
c0009f75:	e7 00                	out    0x0,eax
c0009f77:	00 00                	add    BYTE PTR [eax],al
c0009f79:	f0 40                	lock inc eax
c0009f7b:	40                   	inc    eax
c0009f7c:	40                   	inc    eax
c0009f7d:	40                   	inc    eax
c0009f7e:	40                   	inc    eax
c0009f7f:	40                   	inc    eax
c0009f80:	40                   	inc    eax
c0009f81:	40                   	inc    eax
c0009f82:	40                   	inc    eax
c0009f83:	42                   	inc    edx
c0009f84:	42                   	inc    edx
c0009f85:	fe 00                	inc    BYTE PTR [eax]
c0009f87:	00 00                	add    BYTE PTR [eax],al
c0009f89:	c3                   	ret    
c0009f8a:	42                   	inc    edx
c0009f8b:	66 66 66 5a          	data16 data16 pop dx
c0009f8f:	5a                   	pop    edx
c0009f90:	5a                   	pop    edx
c0009f91:	42                   	inc    edx
c0009f92:	42                   	inc    edx
c0009f93:	42                   	inc    edx
c0009f94:	42                   	inc    edx
c0009f95:	e7 00                	out    0x0,eax
c0009f97:	00 00                	add    BYTE PTR [eax],al
c0009f99:	c7 42 62 62 52 52 52 	mov    DWORD PTR [edx+0x62],0x52525262
c0009fa0:	4a                   	dec    edx
c0009fa1:	4a                   	dec    edx
c0009fa2:	4a                   	dec    edx
c0009fa3:	46                   	inc    esi
c0009fa4:	46                   	inc    esi
c0009fa5:	e2 00                	loop   c0009fa7 <PKnFont+0x4ef>
c0009fa7:	00 00                	add    BYTE PTR [eax],al
c0009fa9:	38 44 82 82          	cmp    BYTE PTR [edx+eax*4-0x7e],al
c0009fad:	82                   	(bad)  
c0009fae:	82                   	(bad)  
c0009faf:	82                   	(bad)  
c0009fb0:	82                   	(bad)  
c0009fb1:	82                   	(bad)  
c0009fb2:	82                   	(bad)  
c0009fb3:	82                   	(bad)  
c0009fb4:	44                   	inc    esp
c0009fb5:	38 00                	cmp    BYTE PTR [eax],al
c0009fb7:	00 00                	add    BYTE PTR [eax],al
c0009fb9:	f8                   	clc    
c0009fba:	44                   	inc    esp
c0009fbb:	42                   	inc    edx
c0009fbc:	42                   	inc    edx
c0009fbd:	42                   	inc    edx
c0009fbe:	44                   	inc    esp
c0009fbf:	78 40                	js     c000a001 <PKnFont+0x549>
c0009fc1:	40                   	inc    eax
c0009fc2:	40                   	inc    eax
c0009fc3:	40                   	inc    eax
c0009fc4:	40                   	inc    eax
c0009fc5:	f0 00 00             	lock add BYTE PTR [eax],al
c0009fc8:	00 38                	add    BYTE PTR [eax],bh
c0009fca:	44                   	inc    esp
c0009fcb:	82                   	(bad)  
c0009fcc:	82                   	(bad)  
c0009fcd:	82                   	(bad)  
c0009fce:	82                   	(bad)  
c0009fcf:	82                   	(bad)  
c0009fd0:	82                   	(bad)  
c0009fd1:	82                   	(bad)  
c0009fd2:	92                   	xchg   edx,eax
c0009fd3:	8a 44 3a 00          	mov    al,BYTE PTR [edx+edi*1+0x0]
c0009fd7:	00 00                	add    BYTE PTR [eax],al
c0009fd9:	fc                   	cld    
c0009fda:	42                   	inc    edx
c0009fdb:	42                   	inc    edx
c0009fdc:	42                   	inc    edx
c0009fdd:	42                   	inc    edx
c0009fde:	7c 44                	jl     c000a024 <PKnFont+0x56c>
c0009fe0:	42                   	inc    edx
c0009fe1:	42                   	inc    edx
c0009fe2:	42                   	inc    edx
c0009fe3:	42                   	inc    edx
c0009fe4:	42                   	inc    edx
c0009fe5:	e7 00                	out    0x0,eax
c0009fe7:	00 00                	add    BYTE PTR [eax],al
c0009fe9:	3a 46 82             	cmp    al,BYTE PTR [esi-0x7e]
c0009fec:	82                   	(bad)  
c0009fed:	80 40 38 04          	add    BYTE PTR [eax+0x38],0x4
c0009ff1:	02 82 82 c4 b8 00    	add    al,BYTE PTR [edx+0xb8c482]
c0009ff7:	00 00                	add    BYTE PTR [eax],al
c0009ff9:	fe                   	(bad)  
c0009ffa:	92                   	xchg   edx,eax
c0009ffb:	92                   	xchg   edx,eax
c0009ffc:	10 10                	adc    BYTE PTR [eax],dl
c0009ffe:	10 10                	adc    BYTE PTR [eax],dl
c000a000:	10 10                	adc    BYTE PTR [eax],dl
c000a002:	10 10                	adc    BYTE PTR [eax],dl
c000a004:	10 7c 00 00          	adc    BYTE PTR [eax+eax*1+0x0],bh
c000a008:	00 e7                	add    bh,ah
c000a00a:	42                   	inc    edx
c000a00b:	42                   	inc    edx
c000a00c:	42                   	inc    edx
c000a00d:	42                   	inc    edx
c000a00e:	42                   	inc    edx
c000a00f:	42                   	inc    edx
c000a010:	42                   	inc    edx
c000a011:	42                   	inc    edx
c000a012:	42                   	inc    edx
c000a013:	42                   	inc    edx
c000a014:	24 3c                	and    al,0x3c
c000a016:	00 00                	add    BYTE PTR [eax],al
c000a018:	00 e7                	add    bh,ah
c000a01a:	42                   	inc    edx
c000a01b:	42                   	inc    edx
c000a01c:	42                   	inc    edx
c000a01d:	42                   	inc    edx
c000a01e:	24 24                	and    al,0x24
c000a020:	24 24                	and    al,0x24
c000a022:	18 18                	sbb    BYTE PTR [eax],bl
c000a024:	18 18                	sbb    BYTE PTR [eax],bl
c000a026:	00 00                	add    BYTE PTR [eax],al
c000a028:	00 e7                	add    bh,ah
c000a02a:	42                   	inc    edx
c000a02b:	42                   	inc    edx
c000a02c:	42                   	inc    edx
c000a02d:	5a                   	pop    edx
c000a02e:	5a                   	pop    edx
c000a02f:	5a                   	pop    edx
c000a030:	5a                   	pop    edx
c000a031:	24 24                	and    al,0x24
c000a033:	24 24                	and    al,0x24
c000a035:	24 00                	and    al,0x0
c000a037:	00 00                	add    BYTE PTR [eax],al
c000a039:	e7 42                	out    0x42,eax
c000a03b:	42                   	inc    edx
c000a03c:	24 24                	and    al,0x24
c000a03e:	24 18                	and    al,0x18
c000a040:	24 24                	and    al,0x24
c000a042:	24 42                	and    al,0x42
c000a044:	42                   	inc    edx
c000a045:	e7 00                	out    0x0,eax
c000a047:	00 00                	add    BYTE PTR [eax],al
c000a049:	ee                   	out    dx,al
c000a04a:	44                   	inc    esp
c000a04b:	44                   	inc    esp
c000a04c:	44                   	inc    esp
c000a04d:	28 28                	sub    BYTE PTR [eax],ch
c000a04f:	28 10                	sub    BYTE PTR [eax],dl
c000a051:	10 10                	adc    BYTE PTR [eax],dl
c000a053:	10 10                	adc    BYTE PTR [eax],dl
c000a055:	7c 00                	jl     c000a057 <PKnFont+0x59f>
c000a057:	00 00                	add    BYTE PTR [eax],al
c000a059:	fe 84 84 08 08 10 10 	inc    BYTE PTR [esp+eax*4+0x10100808]
c000a060:	20 20                	and    BYTE PTR [eax],ah
c000a062:	40                   	inc    eax
c000a063:	42                   	inc    edx
c000a064:	82                   	(bad)  
c000a065:	fe 00                	inc    BYTE PTR [eax]
c000a067:	00 00                	add    BYTE PTR [eax],al
c000a069:	3e 20 20             	and    BYTE PTR ds:[eax],ah
c000a06c:	20 20                	and    BYTE PTR [eax],ah
c000a06e:	20 20                	and    BYTE PTR [eax],ah
c000a070:	20 20                	and    BYTE PTR [eax],ah
c000a072:	20 20                	and    BYTE PTR [eax],ah
c000a074:	20 20                	and    BYTE PTR [eax],ah
c000a076:	3e 00 80 80 40 40 20 	add    BYTE PTR ds:[eax+0x20404080],al
c000a07d:	20 20                	and    BYTE PTR [eax],ah
c000a07f:	10 10                	adc    BYTE PTR [eax],dl
c000a081:	08 08                	or     BYTE PTR [eax],cl
c000a083:	04 04                	add    al,0x4
c000a085:	04 02                	add    al,0x2
c000a087:	02 00                	add    al,BYTE PTR [eax]
c000a089:	7c 04                	jl     c000a08f <PKnFont+0x5d7>
c000a08b:	04 04                	add    al,0x4
c000a08d:	04 04                	add    al,0x4
c000a08f:	04 04                	add    al,0x4
c000a091:	04 04                	add    al,0x4
c000a093:	04 04                	add    al,0x4
c000a095:	04 7c                	add    al,0x7c
c000a097:	00 00                	add    BYTE PTR [eax],al
c000a099:	10 28                	adc    BYTE PTR [eax],ch
c000a09b:	44                   	inc    esp
c000a09c:	82                   	(bad)  
	...
c000a0b5:	00 fe                	add    dh,bh
c000a0b7:	00 10                	add    BYTE PTR [eax],dl
c000a0b9:	08 04 00             	or     BYTE PTR [eax+eax*1],al
	...
c000a0cc:	00 70 08             	add    BYTE PTR [eax+0x8],dh
c000a0cf:	04 3c                	add    al,0x3c
c000a0d1:	44                   	inc    esp
c000a0d2:	84 84 8c 76 00 00 c0 	test   BYTE PTR [esp+ecx*4-0x3fffff8a],al
c000a0d9:	40                   	inc    eax
c000a0da:	40                   	inc    eax
c000a0db:	40                   	inc    eax
c000a0dc:	40                   	inc    eax
c000a0dd:	58                   	pop    eax
c000a0de:	64 42                	fs inc edx
c000a0e0:	42                   	inc    edx
c000a0e1:	42                   	inc    edx
c000a0e2:	42                   	inc    edx
c000a0e3:	42                   	inc    edx
c000a0e4:	64 58                	fs pop eax
c000a0e6:	00 00                	add    BYTE PTR [eax],al
c000a0e8:	00 00                	add    BYTE PTR [eax],al
c000a0ea:	00 00                	add    BYTE PTR [eax],al
c000a0ec:	00 30                	add    BYTE PTR [eax],dh
c000a0ee:	4c                   	dec    esp
c000a0ef:	84 84 80 80 82 44 38 	test   BYTE PTR [eax+eax*4+0x38448280],al
c000a0f6:	00 00                	add    BYTE PTR [eax],al
c000a0f8:	0c 04                	or     al,0x4
c000a0fa:	04 04                	add    al,0x4
c000a0fc:	04 34                	add    al,0x34
c000a0fe:	4c                   	dec    esp
c000a0ff:	84 84 84 84 84 4c 36 	test   BYTE PTR [esp+eax*4+0x364c8484],al
c000a106:	00 00                	add    BYTE PTR [eax],al
c000a108:	00 00                	add    BYTE PTR [eax],al
c000a10a:	00 00                	add    BYTE PTR [eax],al
c000a10c:	00 38                	add    BYTE PTR [eax],bh
c000a10e:	44                   	inc    esp
c000a10f:	82                   	(bad)  
c000a110:	82                   	(bad)  
c000a111:	fc                   	cld    
c000a112:	80 82 42 3c 00 00 0e 	add    BYTE PTR [edx+0x3c42],0xe
c000a119:	10 10                	adc    BYTE PTR [eax],dl
c000a11b:	10 10                	adc    BYTE PTR [eax],dl
c000a11d:	7c 10                	jl     c000a12f <PKnFont+0x677>
c000a11f:	10 10                	adc    BYTE PTR [eax],dl
c000a121:	10 10                	adc    BYTE PTR [eax],dl
c000a123:	10 10                	adc    BYTE PTR [eax],dl
c000a125:	7c 00                	jl     c000a127 <PKnFont+0x66f>
c000a127:	00 00                	add    BYTE PTR [eax],al
c000a129:	00 00                	add    BYTE PTR [eax],al
c000a12b:	00 00                	add    BYTE PTR [eax],al
c000a12d:	36 4c                	ss dec esp
c000a12f:	84 84 84 84 4c 34 04 	test   BYTE PTR [esp+eax*4+0x4344c84],al
c000a136:	04 38                	add    al,0x38
c000a138:	c0 40 40 40          	rol    BYTE PTR [eax+0x40],0x40
c000a13c:	40                   	inc    eax
c000a13d:	58                   	pop    eax
c000a13e:	64 42                	fs inc edx
c000a140:	42                   	inc    edx
c000a141:	42                   	inc    edx
c000a142:	42                   	inc    edx
c000a143:	42                   	inc    edx
c000a144:	42                   	inc    edx
c000a145:	e3 00                	jecxz  c000a147 <PKnFont+0x68f>
c000a147:	00 00                	add    BYTE PTR [eax],al
c000a149:	10 10                	adc    BYTE PTR [eax],dl
c000a14b:	00 00                	add    BYTE PTR [eax],al
c000a14d:	30 10                	xor    BYTE PTR [eax],dl
c000a14f:	10 10                	adc    BYTE PTR [eax],dl
c000a151:	10 10                	adc    BYTE PTR [eax],dl
c000a153:	10 10                	adc    BYTE PTR [eax],dl
c000a155:	38 00                	cmp    BYTE PTR [eax],al
c000a157:	00 00                	add    BYTE PTR [eax],al
c000a159:	04 04                	add    al,0x4
c000a15b:	00 00                	add    BYTE PTR [eax],al
c000a15d:	0c 04                	or     al,0x4
c000a15f:	04 04                	add    al,0x4
c000a161:	04 04                	add    al,0x4
c000a163:	04 04                	add    al,0x4
c000a165:	08 08                	or     BYTE PTR [eax],cl
c000a167:	30 c0                	xor    al,al
c000a169:	40                   	inc    eax
c000a16a:	40                   	inc    eax
c000a16b:	40                   	inc    eax
c000a16c:	40                   	inc    eax
c000a16d:	4e                   	dec    esi
c000a16e:	44                   	inc    esp
c000a16f:	48                   	dec    eax
c000a170:	50                   	push   eax
c000a171:	60                   	pusha  
c000a172:	50                   	push   eax
c000a173:	48                   	dec    eax
c000a174:	44                   	inc    esp
c000a175:	e6 00                	out    0x0,al
c000a177:	00 30                	add    BYTE PTR [eax],dh
c000a179:	10 10                	adc    BYTE PTR [eax],dl
c000a17b:	10 10                	adc    BYTE PTR [eax],dl
c000a17d:	10 10                	adc    BYTE PTR [eax],dl
c000a17f:	10 10                	adc    BYTE PTR [eax],dl
c000a181:	10 10                	adc    BYTE PTR [eax],dl
c000a183:	10 10                	adc    BYTE PTR [eax],dl
c000a185:	38 00                	cmp    BYTE PTR [eax],al
c000a187:	00 00                	add    BYTE PTR [eax],al
c000a189:	00 00                	add    BYTE PTR [eax],al
c000a18b:	00 00                	add    BYTE PTR [eax],al
c000a18d:	f6                   	(bad)  
c000a18e:	49                   	dec    ecx
c000a18f:	49                   	dec    ecx
c000a190:	49                   	dec    ecx
c000a191:	49                   	dec    ecx
c000a192:	49                   	dec    ecx
c000a193:	49                   	dec    ecx
c000a194:	49                   	dec    ecx
c000a195:	db 00                	fild   DWORD PTR [eax]
c000a197:	00 00                	add    BYTE PTR [eax],al
c000a199:	00 00                	add    BYTE PTR [eax],al
c000a19b:	00 00                	add    BYTE PTR [eax],al
c000a19d:	d8 64 42 42          	fsub   DWORD PTR [edx+eax*2+0x42]
c000a1a1:	42                   	inc    edx
c000a1a2:	42                   	inc    edx
c000a1a3:	42                   	inc    edx
c000a1a4:	42                   	inc    edx
c000a1a5:	e3 00                	jecxz  c000a1a7 <PKnFont+0x6ef>
c000a1a7:	00 00                	add    BYTE PTR [eax],al
c000a1a9:	00 00                	add    BYTE PTR [eax],al
c000a1ab:	00 00                	add    BYTE PTR [eax],al
c000a1ad:	38 44 82 82          	cmp    BYTE PTR [edx+eax*4-0x7e],al
c000a1b1:	82                   	(bad)  
c000a1b2:	82                   	(bad)  
c000a1b3:	82                   	(bad)  
c000a1b4:	44                   	inc    esp
c000a1b5:	38 00                	cmp    BYTE PTR [eax],al
c000a1b7:	00 00                	add    BYTE PTR [eax],al
c000a1b9:	00 00                	add    BYTE PTR [eax],al
c000a1bb:	00 d8                	add    al,bl
c000a1bd:	64 42                	fs inc edx
c000a1bf:	42                   	inc    edx
c000a1c0:	42                   	inc    edx
c000a1c1:	42                   	inc    edx
c000a1c2:	42                   	inc    edx
c000a1c3:	64 58                	fs pop eax
c000a1c5:	40                   	inc    eax
c000a1c6:	40                   	inc    eax
c000a1c7:	e0 00                	loopne c000a1c9 <PKnFont+0x711>
c000a1c9:	00 00                	add    BYTE PTR [eax],al
c000a1cb:	00 34 4c             	add    BYTE PTR [esp+ecx*2],dh
c000a1ce:	84 84 84 84 84 4c 34 	test   BYTE PTR [esp+eax*4+0x344c8484],al
c000a1d5:	04 04                	add    al,0x4
c000a1d7:	0e                   	push   cs
c000a1d8:	00 00                	add    BYTE PTR [eax],al
c000a1da:	00 00                	add    BYTE PTR [eax],al
c000a1dc:	00 dc                	add    ah,bl
c000a1de:	62 42 40             	bound  eax,QWORD PTR [edx+0x40]
c000a1e1:	40                   	inc    eax
c000a1e2:	40                   	inc    eax
c000a1e3:	40                   	inc    eax
c000a1e4:	40                   	inc    eax
c000a1e5:	e0 00                	loopne c000a1e7 <PKnFont+0x72f>
c000a1e7:	00 00                	add    BYTE PTR [eax],al
c000a1e9:	00 00                	add    BYTE PTR [eax],al
c000a1eb:	00 00                	add    BYTE PTR [eax],al
c000a1ed:	7a 86                	jp     c000a175 <PKnFont+0x6bd>
c000a1ef:	82                   	(bad)  
c000a1f0:	c0 38 06             	sar    BYTE PTR [eax],0x6
c000a1f3:	82                   	(bad)  
c000a1f4:	c2 bc 00             	ret    0xbc
c000a1f7:	00 00                	add    BYTE PTR [eax],al
c000a1f9:	00 10                	add    BYTE PTR [eax],dl
c000a1fb:	10 10                	adc    BYTE PTR [eax],dl
c000a1fd:	7c 10                	jl     c000a20f <PKnFont+0x757>
c000a1ff:	10 10                	adc    BYTE PTR [eax],dl
c000a201:	10 10                	adc    BYTE PTR [eax],dl
c000a203:	10 10                	adc    BYTE PTR [eax],dl
c000a205:	0e                   	push   cs
c000a206:	00 00                	add    BYTE PTR [eax],al
c000a208:	00 00                	add    BYTE PTR [eax],al
c000a20a:	00 00                	add    BYTE PTR [eax],al
c000a20c:	00 c6                	add    dh,al
c000a20e:	42                   	inc    edx
c000a20f:	42                   	inc    edx
c000a210:	42                   	inc    edx
c000a211:	42                   	inc    edx
c000a212:	42                   	inc    edx
c000a213:	42                   	inc    edx
c000a214:	46                   	inc    esi
c000a215:	3b 00                	cmp    eax,DWORD PTR [eax]
c000a217:	00 00                	add    BYTE PTR [eax],al
c000a219:	00 00                	add    BYTE PTR [eax],al
c000a21b:	00 00                	add    BYTE PTR [eax],al
c000a21d:	e7 42                	out    0x42,eax
c000a21f:	42                   	inc    edx
c000a220:	42                   	inc    edx
c000a221:	24 24                	and    al,0x24
c000a223:	24 18                	and    al,0x18
c000a225:	18 00                	sbb    BYTE PTR [eax],al
c000a227:	00 00                	add    BYTE PTR [eax],al
c000a229:	00 00                	add    BYTE PTR [eax],al
c000a22b:	00 00                	add    BYTE PTR [eax],al
c000a22d:	e7 42                	out    0x42,eax
c000a22f:	42                   	inc    edx
c000a230:	5a                   	pop    edx
c000a231:	5a                   	pop    edx
c000a232:	5a                   	pop    edx
c000a233:	24 24                	and    al,0x24
c000a235:	24 00                	and    al,0x0
c000a237:	00 00                	add    BYTE PTR [eax],al
c000a239:	00 00                	add    BYTE PTR [eax],al
c000a23b:	00 00                	add    BYTE PTR [eax],al
c000a23d:	c6 44 28 28 10       	mov    BYTE PTR [eax+ebp*1+0x28],0x10
c000a242:	28 28                	sub    BYTE PTR [eax],ch
c000a244:	44                   	inc    esp
c000a245:	c6 00 00             	mov    BYTE PTR [eax],0x0
c000a248:	00 00                	add    BYTE PTR [eax],al
c000a24a:	00 00                	add    BYTE PTR [eax],al
c000a24c:	00 e7                	add    bh,ah
c000a24e:	42                   	inc    edx
c000a24f:	42                   	inc    edx
c000a250:	24 24                	and    al,0x24
c000a252:	24 18                	and    al,0x18
c000a254:	18 10                	sbb    BYTE PTR [eax],dl
c000a256:	10 60 00             	adc    BYTE PTR [eax+0x0],ah
c000a259:	00 00                	add    BYTE PTR [eax],al
c000a25b:	00 00                	add    BYTE PTR [eax],al
c000a25d:	fe 82 84 08 10 20    	inc    BYTE PTR [edx+0x20100884]
c000a263:	42                   	inc    edx
c000a264:	82                   	(bad)  
c000a265:	fe 00                	inc    BYTE PTR [eax]
c000a267:	00 00                	add    BYTE PTR [eax],al
c000a269:	06                   	push   es
c000a26a:	08 10                	or     BYTE PTR [eax],dl
c000a26c:	10 10                	adc    BYTE PTR [eax],dl
c000a26e:	10 60 10             	adc    BYTE PTR [eax+0x10],ah
c000a271:	10 10                	adc    BYTE PTR [eax],dl
c000a273:	10 08                	adc    BYTE PTR [eax],cl
c000a275:	06                   	push   es
c000a276:	00 00                	add    BYTE PTR [eax],al
c000a278:	10 10                	adc    BYTE PTR [eax],dl
c000a27a:	10 10                	adc    BYTE PTR [eax],dl
c000a27c:	10 10                	adc    BYTE PTR [eax],dl
c000a27e:	10 10                	adc    BYTE PTR [eax],dl
c000a280:	10 10                	adc    BYTE PTR [eax],dl
c000a282:	10 10                	adc    BYTE PTR [eax],dl
c000a284:	10 10                	adc    BYTE PTR [eax],dl
c000a286:	10 10                	adc    BYTE PTR [eax],dl
c000a288:	00 60 10             	add    BYTE PTR [eax+0x10],ah
c000a28b:	08 08                	or     BYTE PTR [eax],cl
c000a28d:	08 08                	or     BYTE PTR [eax],cl
c000a28f:	06                   	push   es
c000a290:	08 08                	or     BYTE PTR [eax],cl
c000a292:	08 08                	or     BYTE PTR [eax],cl
c000a294:	10 60 00             	adc    BYTE PTR [eax+0x0],ah
c000a297:	00 00                	add    BYTE PTR [eax],al
c000a299:	72 8c                	jb     c000a227 <PKnFont+0x76f>
	...

c000aab8 <intr_entry_table>:
	...

Disassembly of section .eh_frame:

c000ab74 <.eh_frame>:
c000ab74:	10 00                	adc    BYTE PTR [eax],al
c000ab76:	00 00                	add    BYTE PTR [eax],al
c000ab78:	00 00                	add    BYTE PTR [eax],al
c000ab7a:	00 00                	add    BYTE PTR [eax],al
c000ab7c:	01 00                	add    DWORD PTR [eax],eax
c000ab7e:	01 7c 08 0c          	add    DWORD PTR [eax+ecx*1+0xc],edi
c000ab82:	04 04                	add    al,0x4
c000ab84:	88 01                	mov    BYTE PTR [ecx],al
c000ab86:	00 00                	add    BYTE PTR [eax],al
c000ab88:	38 00                	cmp    BYTE PTR [eax],al
c000ab8a:	00 00                	add    BYTE PTR [eax],al
c000ab8c:	18 00                	sbb    BYTE PTR [eax],al
c000ab8e:	00 00                	add    BYTE PTR [eax],al
c000ab90:	58                   	pop    eax
c000ab91:	7f 00                	jg     c000ab93 <_edata+0x1f>
c000ab93:	c0 22 00             	shl    BYTE PTR [edx],0x0
c000ab96:	00 00                	add    BYTE PTR [eax],al
c000ab98:	41                   	inc    ecx
c000ab99:	0e                   	push   cs
c000ab9a:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000aba0:	41                   	inc    ecx
c000aba1:	83 03 44             	add    DWORD PTR [ebx],0x44
c000aba4:	2e 04 04             	cs add al,0x4
c000aba7:	01 00                	add    DWORD PTR [eax],eax
c000aba9:	00 00                	add    BYTE PTR [eax],al
c000abab:	2e 08 42 2e          	or     BYTE PTR cs:[edx+0x2e],al
c000abaf:	0c 42                	or     al,0x42
c000abb1:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000abb5:	14 42                	adc    al,0x42
c000abb7:	2e 18 41 2e          	sbb    BYTE PTR cs:[ecx+0x2e],al
c000abbb:	1c 46                	sbb    al,0x46
c000abbd:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000abc1:	00 00                	add    BYTE PTR [eax],al
c000abc3:	00 b8 01 00 00 54    	add    BYTE PTR [eax+0x54000001],bh
c000abc9:	00 00                	add    BYTE PTR [eax],al
c000abcb:	00 7a 7f             	add    BYTE PTR [edx+0x7f],bh
c000abce:	00 c0                	add    al,al
c000abd0:	68 03 00 00 41       	push   0x41000003
c000abd5:	0e                   	push   cs
c000abd6:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000abdc:	42                   	inc    edx
c000abdd:	83 04 86 03          	add    DWORD PTR [esi+eax*4],0x3
c000abe1:	49                   	dec    ecx
c000abe2:	2e 0c 45             	cs or  al,0x45
c000abe5:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000abe9:	00 4f 2e             	add    BYTE PTR [edi+0x2e],cl
c000abec:	04 04                	add    al,0x4
c000abee:	07                   	pop    es
c000abef:	00 00                	add    BYTE PTR [eax],al
c000abf1:	00 2e                	add    BYTE PTR [esi],ch
c000abf3:	08 47 2e             	or     BYTE PTR [edi+0x2e],al
c000abf6:	0c 49                	or     al,0x49
c000abf8:	2e 10 41 2e          	adc    BYTE PTR cs:[ecx+0x2e],al
c000abfc:	14 41                	adc    al,0x41
c000abfe:	2e 18 45 2e          	sbb    BYTE PTR cs:[ebp+0x2e],al
c000ac02:	1c 45                	sbb    al,0x45
c000ac04:	2e 20 4e 2e          	and    BYTE PTR cs:[esi+0x2e],cl
c000ac08:	08 4c 2e 0c          	or     BYTE PTR [esi+ebp*1+0xc],cl
c000ac0c:	49                   	dec    ecx
c000ac0d:	2e 10 41 2e          	adc    BYTE PTR cs:[ecx+0x2e],al
c000ac11:	14 41                	adc    al,0x41
c000ac13:	2e 18 45 2e          	sbb    BYTE PTR cs:[ebp+0x2e],al
c000ac17:	1c 45                	sbb    al,0x45
c000ac19:	2e 20 4d 2e          	and    BYTE PTR cs:[ebp+0x2e],cl
c000ac1d:	0c 4c                	or     al,0x4c
c000ac1f:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000ac23:	14 41                	adc    al,0x41
c000ac25:	2e 18 4b 2e          	sbb    BYTE PTR cs:[ebx+0x2e],cl
c000ac29:	1c 45                	sbb    al,0x45
c000ac2b:	2e 20 4d 2e          	and    BYTE PTR cs:[ebp+0x2e],cl
c000ac2f:	0c 4c                	or     al,0x4c
c000ac31:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000ac35:	14 41                	adc    al,0x41
c000ac37:	2e 18 4b 2e          	sbb    BYTE PTR cs:[ebx+0x2e],cl
c000ac3b:	1c 45                	sbb    al,0x45
c000ac3d:	2e 20 4d 2e          	and    BYTE PTR cs:[ebp+0x2e],cl
c000ac41:	0c 4c                	or     al,0x4c
c000ac43:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000ac47:	14 41                	adc    al,0x41
c000ac49:	2e 18 4b 2e          	sbb    BYTE PTR cs:[ebx+0x2e],cl
c000ac4d:	1c 45                	sbb    al,0x45
c000ac4f:	2e 20 4d 2e          	and    BYTE PTR cs:[ebp+0x2e],cl
c000ac53:	0c 47                	or     al,0x47
c000ac55:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000ac59:	14 41                	adc    al,0x41
c000ac5b:	2e 18 4b 2e          	sbb    BYTE PTR cs:[ebx+0x2e],cl
c000ac5f:	1c 45                	sbb    al,0x45
c000ac61:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ac65:	0c 42                	or     al,0x42
c000ac67:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000ac6b:	14 41                	adc    al,0x41
c000ac6d:	2e 18 4b 2e          	sbb    BYTE PTR cs:[ebx+0x2e],cl
c000ac71:	1c 45                	sbb    al,0x45
c000ac73:	2e 20 4d 2e          	and    BYTE PTR cs:[ebp+0x2e],cl
c000ac77:	0c 4c                	or     al,0x4c
c000ac79:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000ac7d:	14 41                	adc    al,0x41
c000ac7f:	2e 18 4b 2e          	sbb    BYTE PTR cs:[ebx+0x2e],cl
c000ac83:	1c 45                	sbb    al,0x45
c000ac85:	2e 20 4d 2e          	and    BYTE PTR cs:[ebp+0x2e],cl
c000ac89:	0c 47                	or     al,0x47
c000ac8b:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000ac8f:	14 41                	adc    al,0x41
c000ac91:	2e 18 4b 2e          	sbb    BYTE PTR cs:[ebx+0x2e],cl
c000ac95:	1c 45                	sbb    al,0x45
c000ac97:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ac9b:	0c 42                	or     al,0x42
c000ac9d:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000aca1:	14 41                	adc    al,0x41
c000aca3:	2e 18 4b 2e          	sbb    BYTE PTR cs:[ebx+0x2e],cl
c000aca7:	1c 45                	sbb    al,0x45
c000aca9:	2e 20 4d 2e          	and    BYTE PTR cs:[ebp+0x2e],cl
c000acad:	0c 4c                	or     al,0x4c
c000acaf:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000acb3:	14 41                	adc    al,0x41
c000acb5:	2e 18 49 2e          	sbb    BYTE PTR cs:[ecx+0x2e],cl
c000acb9:	1c 45                	sbb    al,0x45
c000acbb:	2e 20 4d 2e          	and    BYTE PTR cs:[ebp+0x2e],cl
c000acbf:	0c 47                	or     al,0x47
c000acc1:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000acc5:	14 41                	adc    al,0x41
c000acc7:	2e 18 49 2e          	sbb    BYTE PTR cs:[ecx+0x2e],cl
c000accb:	1c 45                	sbb    al,0x45
c000accd:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000acd1:	0c 42                	or     al,0x42
c000acd3:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000acd7:	14 41                	adc    al,0x41
c000acd9:	2e 18 49 2e          	sbb    BYTE PTR cs:[ecx+0x2e],cl
c000acdd:	1c 45                	sbb    al,0x45
c000acdf:	2e 20 4d 2e          	and    BYTE PTR cs:[ebp+0x2e],cl
c000ace3:	0c 4c                	or     al,0x4c
c000ace5:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000ace9:	14 41                	adc    al,0x41
c000aceb:	2e 18 49 2e          	sbb    BYTE PTR cs:[ecx+0x2e],cl
c000acef:	1c 45                	sbb    al,0x45
c000acf1:	2e 20 4d 2e          	and    BYTE PTR cs:[ebp+0x2e],cl
c000acf5:	0c 47                	or     al,0x47
c000acf7:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000acfb:	14 41                	adc    al,0x41
c000acfd:	2e 18 49 2e          	sbb    BYTE PTR cs:[ecx+0x2e],cl
c000ad01:	1c 45                	sbb    al,0x45
c000ad03:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ad07:	0c 42                	or     al,0x42
c000ad09:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000ad0d:	14 41                	adc    al,0x41
c000ad0f:	2e 18 49 2e          	sbb    BYTE PTR cs:[ecx+0x2e],cl
c000ad13:	1c 45                	sbb    al,0x45
c000ad15:	2e 20 4d 2e          	and    BYTE PTR cs:[ebp+0x2e],cl
c000ad19:	0c 4c                	or     al,0x4c
c000ad1b:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000ad1f:	14 41                	adc    al,0x41
c000ad21:	2e 18 49 2e          	sbb    BYTE PTR cs:[ecx+0x2e],cl
c000ad25:	1c 45                	sbb    al,0x45
c000ad27:	2e 20 4d 2e          	and    BYTE PTR cs:[ebp+0x2e],cl
c000ad2b:	0c 47                	or     al,0x47
c000ad2d:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000ad31:	14 41                	adc    al,0x41
c000ad33:	2e 18 49 2e          	sbb    BYTE PTR cs:[ecx+0x2e],cl
c000ad37:	1c 45                	sbb    al,0x45
c000ad39:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ad3d:	0c 42                	or     al,0x42
c000ad3f:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000ad43:	14 41                	adc    al,0x41
c000ad45:	2e 18 49 2e          	sbb    BYTE PTR cs:[ecx+0x2e],cl
c000ad49:	1c 45                	sbb    al,0x45
c000ad4b:	2e 20 4d 2e          	and    BYTE PTR cs:[ebp+0x2e],cl
c000ad4f:	0c 4c                	or     al,0x4c
c000ad51:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000ad55:	14 41                	adc    al,0x41
c000ad57:	2e 18 49 2e          	sbb    BYTE PTR cs:[ecx+0x2e],cl
c000ad5b:	1c 45                	sbb    al,0x45
c000ad5d:	2e 20 4d 2e          	and    BYTE PTR cs:[ebp+0x2e],cl
c000ad61:	0c 47                	or     al,0x47
c000ad63:	2e 10 42 2e          	adc    BYTE PTR cs:[edx+0x2e],al
c000ad67:	14 41                	adc    al,0x41
c000ad69:	2e 18 49 2e          	sbb    BYTE PTR cs:[ecx+0x2e],cl
c000ad6d:	1c 45                	sbb    al,0x45
c000ad6f:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ad73:	00 45 2e             	add    BYTE PTR [ebp+0x2e],al
c000ad76:	0c 45                	or     al,0x45
c000ad78:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000ad7c:	00 00                	add    BYTE PTR [eax],al
c000ad7e:	00 00                	add    BYTE PTR [eax],al
c000ad80:	a8 01                	test   al,0x1
c000ad82:	00 00                	add    BYTE PTR [eax],al
c000ad84:	10 02                	adc    BYTE PTR [edx],al
c000ad86:	00 00                	add    BYTE PTR [eax],al
c000ad88:	e2 82                	loop   c000ad0c <_edata+0x198>
c000ad8a:	00 c0                	add    al,al
c000ad8c:	23 03                	and    eax,DWORD PTR [ebx]
c000ad8e:	00 00                	add    BYTE PTR [eax],al
c000ad90:	41                   	inc    ecx
c000ad91:	0e                   	push   cs
c000ad92:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ad98:	42                   	inc    edx
c000ad99:	83 03 48             	add    DWORD PTR [ebx],0x48
c000ad9c:	2e 0c 45             	cs or  al,0x45
c000ad9f:	2e 10 02             	adc    BYTE PTR cs:[edx],al
c000ada2:	e9 2e 14 42 2e       	jmp    ee42c1d5 <_kernel_end+0x2e400b4d>
c000ada7:	18 42 2e             	sbb    BYTE PTR [edx+0x2e],al
c000adaa:	1c 45                	sbb    al,0x45
c000adac:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000adb0:	0c 42                	or     al,0x42
c000adb2:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000adb6:	14 42                	adc    al,0x42
c000adb8:	2e 18 42 2e          	sbb    BYTE PTR cs:[edx+0x2e],al
c000adbc:	1c 45                	sbb    al,0x45
c000adbe:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000adc2:	0c 42                	or     al,0x42
c000adc4:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000adc8:	14 42                	adc    al,0x42
c000adca:	2e 18 42 2e          	sbb    BYTE PTR cs:[edx+0x2e],al
c000adce:	1c 45                	sbb    al,0x45
c000add0:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000add4:	0c 42                	or     al,0x42
c000add6:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000adda:	14 42                	adc    al,0x42
c000addc:	2e 18 42 2e          	sbb    BYTE PTR cs:[edx+0x2e],al
c000ade0:	1c 45                	sbb    al,0x45
c000ade2:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ade6:	0c 42                	or     al,0x42
c000ade8:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000adec:	14 42                	adc    al,0x42
c000adee:	2e 18 42 2e          	sbb    BYTE PTR cs:[edx+0x2e],al
c000adf2:	1c 45                	sbb    al,0x45
c000adf4:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000adf8:	0c 42                	or     al,0x42
c000adfa:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000adfe:	14 42                	adc    al,0x42
c000ae00:	2e 18 42 2e          	sbb    BYTE PTR cs:[edx+0x2e],al
c000ae04:	1c 45                	sbb    al,0x45
c000ae06:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ae0a:	0c 42                	or     al,0x42
c000ae0c:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000ae10:	14 42                	adc    al,0x42
c000ae12:	2e 18 42 2e          	sbb    BYTE PTR cs:[edx+0x2e],al
c000ae16:	1c 45                	sbb    al,0x45
c000ae18:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ae1c:	0c 44                	or     al,0x44
c000ae1e:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000ae22:	14 42                	adc    al,0x42
c000ae24:	2e 18 42 2e          	sbb    BYTE PTR cs:[edx+0x2e],al
c000ae28:	1c 45                	sbb    al,0x45
c000ae2a:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ae2e:	0c 42                	or     al,0x42
c000ae30:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000ae34:	14 42                	adc    al,0x42
c000ae36:	2e 18 42 2e          	sbb    BYTE PTR cs:[edx+0x2e],al
c000ae3a:	1c 45                	sbb    al,0x45
c000ae3c:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ae40:	0c 42                	or     al,0x42
c000ae42:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000ae46:	14 42                	adc    al,0x42
c000ae48:	2e 18 42 2e          	sbb    BYTE PTR cs:[edx+0x2e],al
c000ae4c:	1c 45                	sbb    al,0x45
c000ae4e:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ae52:	0c 42                	or     al,0x42
c000ae54:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000ae58:	14 42                	adc    al,0x42
c000ae5a:	2e 18 42 2e          	sbb    BYTE PTR cs:[edx+0x2e],al
c000ae5e:	1c 45                	sbb    al,0x45
c000ae60:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ae64:	0c 42                	or     al,0x42
c000ae66:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000ae6a:	14 42                	adc    al,0x42
c000ae6c:	2e 18 45 2e          	sbb    BYTE PTR cs:[ebp+0x2e],al
c000ae70:	1c 45                	sbb    al,0x45
c000ae72:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ae76:	0c 42                	or     al,0x42
c000ae78:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000ae7c:	14 42                	adc    al,0x42
c000ae7e:	2e 18 45 2e          	sbb    BYTE PTR cs:[ebp+0x2e],al
c000ae82:	1c 45                	sbb    al,0x45
c000ae84:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ae88:	0c 42                	or     al,0x42
c000ae8a:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000ae8e:	14 42                	adc    al,0x42
c000ae90:	2e 18 45 2e          	sbb    BYTE PTR cs:[ebp+0x2e],al
c000ae94:	1c 45                	sbb    al,0x45
c000ae96:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ae9a:	0c 42                	or     al,0x42
c000ae9c:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000aea0:	14 42                	adc    al,0x42
c000aea2:	2e 18 45 2e          	sbb    BYTE PTR cs:[ebp+0x2e],al
c000aea6:	1c 45                	sbb    al,0x45
c000aea8:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000aeac:	0c 42                	or     al,0x42
c000aeae:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000aeb2:	14 42                	adc    al,0x42
c000aeb4:	2e 18 45 2e          	sbb    BYTE PTR cs:[ebp+0x2e],al
c000aeb8:	1c 45                	sbb    al,0x45
c000aeba:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000aebe:	0c 42                	or     al,0x42
c000aec0:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000aec4:	14 42                	adc    al,0x42
c000aec6:	2e 18 45 2e          	sbb    BYTE PTR cs:[ebp+0x2e],al
c000aeca:	1c 45                	sbb    al,0x45
c000aecc:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000aed0:	0c 42                	or     al,0x42
c000aed2:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000aed6:	14 42                	adc    al,0x42
c000aed8:	2e 18 45 2e          	sbb    BYTE PTR cs:[ebp+0x2e],al
c000aedc:	1c 45                	sbb    al,0x45
c000aede:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000aee2:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000aee5:	0c 45                	or     al,0x45
c000aee7:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000aeeb:	14 42                	adc    al,0x42
c000aeed:	2e 18 42 2e          	sbb    BYTE PTR cs:[edx+0x2e],al
c000aef1:	1c 45                	sbb    al,0x45
c000aef3:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000aef7:	00 42 2e             	add    BYTE PTR [edx+0x2e],al
c000aefa:	04 04                	add    al,0x4
c000aefc:	05 00 00 00 2e       	add    eax,0x2e000000
c000af01:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000af04:	0c 45                	or     al,0x45
c000af06:	2e 10 47 2e          	adc    BYTE PTR cs:[edi+0x2e],al
c000af0a:	14 45                	adc    al,0x45
c000af0c:	2e 18 42 2e          	sbb    BYTE PTR cs:[edx+0x2e],al
c000af10:	1c 45                	sbb    al,0x45
c000af12:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000af16:	00 48 2e             	add    BYTE PTR [eax+0x2e],cl
c000af19:	0c 42                	or     al,0x42
c000af1b:	2e 10 41 2e          	adc    BYTE PTR cs:[ecx+0x2e],al
c000af1f:	14 43                	adc    al,0x43
c000af21:	2e 18 45 2e          	sbb    BYTE PTR cs:[ebp+0x2e],al
c000af25:	1c 45                	sbb    al,0x45
c000af27:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000af2b:	00 2c 00             	add    BYTE PTR [eax+eax*1],ch
c000af2e:	00 00                	add    BYTE PTR [eax],al
c000af30:	bc 03 00 00 08       	mov    esp,0x8000003
c000af35:	86 00                	xchg   BYTE PTR [eax],al
c000af37:	c0 1a 00             	rcr    BYTE PTR [edx],0x0
c000af3a:	00 00                	add    BYTE PTR [eax],al
c000af3c:	41                   	inc    ecx
c000af3d:	0e                   	push   cs
c000af3e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000af44:	43                   	inc    ebx
c000af45:	2e 04 04             	cs add al,0x4
c000af48:	05 00 00 00 2e       	add    eax,0x2e000000
c000af4d:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000af50:	0c 43                	or     al,0x43
c000af52:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000af56:	00 41 c5             	add    BYTE PTR [ecx-0x3b],al
c000af59:	0c 04                	or     al,0x4
c000af5b:	04 1c                	add    al,0x1c
c000af5d:	00 00                	add    BYTE PTR [eax],al
c000af5f:	00 ec                	add    ah,ch
c000af61:	03 00                	add    eax,DWORD PTR [eax]
c000af63:	00 22                	add    BYTE PTR [edx],ah
c000af65:	86 00                	xchg   BYTE PTR [eax],al
c000af67:	c0 23 00             	shl    BYTE PTR [ebx],0x0
c000af6a:	00 00                	add    BYTE PTR [eax],al
c000af6c:	41                   	inc    ecx
c000af6d:	0e                   	push   cs
c000af6e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000af74:	47                   	inc    edi
c000af75:	0c 04                	or     al,0x4
c000af77:	04 c5                	add    al,0xc5
c000af79:	00 00                	add    BYTE PTR [eax],al
c000af7b:	00 50 00             	add    BYTE PTR [eax+0x0],dl
c000af7e:	00 00                	add    BYTE PTR [eax],al
c000af80:	0c 04                	or     al,0x4
c000af82:	00 00                	add    BYTE PTR [eax],al
c000af84:	45                   	inc    ebp
c000af85:	86 00                	xchg   BYTE PTR [eax],al
c000af87:	c0 be 00 00 00 41 0e 	sar    BYTE PTR [esi+0x41000000],0xe
c000af8e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000af94:	42                   	inc    edx
c000af95:	86 04 87             	xchg   BYTE PTR [edi+eax*4],al
c000af98:	03 46 83             	add    eax,DWORD PTR [esi-0x7d]
c000af9b:	05 5c 2e 04 04       	add    eax,0x4042e5c
c000afa0:	05 00 00 00 2e       	add    eax,0x2e000000
c000afa5:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000afa8:	0c 45                	or     al,0x45
c000afaa:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000afae:	00 02                	add    BYTE PTR [edx],al
c000afb0:	4e                   	dec    esi
c000afb1:	2e 04 04             	cs add al,0x4
c000afb4:	02 00                	add    al,BYTE PTR [eax]
c000afb6:	00 00                	add    BYTE PTR [eax],al
c000afb8:	2e 08 41 2e          	or     BYTE PTR cs:[ecx+0x2e],al
c000afbc:	0c 41                	or     al,0x41
c000afbe:	2e 10 4b 2e          	adc    BYTE PTR cs:[ebx+0x2e],cl
c000afc2:	00 62 c3             	add    BYTE PTR [edx-0x3d],ah
c000afc5:	41                   	inc    ecx
c000afc6:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000afca:	0c 04                	or     al,0x4
c000afcc:	04 c5                	add    al,0xc5
c000afce:	00 00                	add    BYTE PTR [eax],al
c000afd0:	3c 00                	cmp    al,0x0
c000afd2:	00 00                	add    BYTE PTR [eax],al
c000afd4:	60                   	pusha  
c000afd5:	04 00                	add    al,0x0
c000afd7:	00 03                	add    BYTE PTR [ebx],al
c000afd9:	87 00                	xchg   DWORD PTR [eax],eax
c000afdb:	c0 68 00 00          	shr    BYTE PTR [eax+0x0],0x0
c000afdf:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000afe2:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000afe8:	46                   	inc    esi
c000afe9:	83 05 86 04 87 03 53 	add    DWORD PTR ds:0x3870486,0x53
c000aff0:	2e 04 04             	cs add al,0x4
c000aff3:	05 00 00 00 2e       	add    eax,0x2e000000
c000aff8:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000affb:	0c 45                	or     al,0x45
c000affd:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000b001:	00 74 c3 41          	add    BYTE PTR [ebx+eax*8+0x41],dh
c000b005:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000b009:	0c 04                	or     al,0x4
c000b00b:	04 c5                	add    al,0xc5
c000b00d:	00 00                	add    BYTE PTR [eax],al
c000b00f:	00 38                	add    BYTE PTR [eax],bh
c000b011:	00 00                	add    BYTE PTR [eax],al
c000b013:	00 a0 04 00 00 6c    	add    BYTE PTR [eax+0x6c000004],ah
c000b019:	87 00                	xchg   DWORD PTR [eax],eax
c000b01b:	c0 a1 00 00 00 41 0e 	shl    BYTE PTR [ecx+0x41000000],0xe
c000b022:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b028:	4b                   	dec    ebx
c000b029:	2e 0c 45             	cs or  al,0x45
c000b02c:	2e 10 52 2e          	adc    BYTE PTR cs:[edx+0x2e],dl
c000b030:	0c 43                	or     al,0x43
c000b032:	2e 10 5e 2e          	adc    BYTE PTR cs:[esi+0x2e],bl
c000b036:	0c 43                	or     al,0x43
c000b038:	2e 10 5e 2e          	adc    BYTE PTR cs:[esi+0x2e],bl
c000b03c:	0c 43                	or     al,0x43
c000b03e:	2e 10 5e 2e          	adc    BYTE PTR cs:[esi+0x2e],bl
c000b042:	0c 43                	or     al,0x43
c000b044:	2e 10 54 2e 00       	adc    BYTE PTR cs:[esi+ebp*1+0x0],dl
c000b049:	00 00                	add    BYTE PTR [eax],al
c000b04b:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b04e:	00 00                	add    BYTE PTR [eax],al
c000b050:	dc 04 00             	fadd   QWORD PTR [eax+eax*1]
c000b053:	00 10                	add    BYTE PTR [eax],dl
c000b055:	88 00                	mov    BYTE PTR [eax],al
c000b057:	c0 25 00 00 00 41 0e 	shl    BYTE PTR ds:0x41000000,0xe
c000b05e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b064:	61                   	popa   
c000b065:	0c 04                	or     al,0x4
c000b067:	04 c5                	add    al,0xc5
c000b069:	00 00                	add    BYTE PTR [eax],al
c000b06b:	00 28                	add    BYTE PTR [eax],ch
c000b06d:	00 00                	add    BYTE PTR [eax],al
c000b06f:	00 fc                	add    ah,bh
c000b071:	04 00                	add    al,0x0
c000b073:	00 35 88 00 c0 93    	add    BYTE PTR ds:0x93c00088,dh
c000b079:	00 00                	add    BYTE PTR [eax],al
c000b07b:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b07e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b084:	49                   	dec    ecx
c000b085:	83 05 86 04 87 03 02 	add    DWORD PTR ds:0x3870486,0x2
c000b08c:	83 c3 41             	add    ebx,0x41
c000b08f:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000b093:	0c 04                	or     al,0x4
c000b095:	04 c5                	add    al,0xc5
c000b097:	00 28                	add    BYTE PTR [eax],ch
c000b099:	00 00                	add    BYTE PTR [eax],al
c000b09b:	00 28                	add    BYTE PTR [eax],ch
c000b09d:	05 00 00 c8 88       	add    eax,0x88c80000
c000b0a2:	00 c0                	add    al,al
c000b0a4:	80 00 00             	add    BYTE PTR [eax],0x0
c000b0a7:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b0aa:	08 85 02 45 0d 05    	or     BYTE PTR [ebp+0x50d4502],al
c000b0b0:	49                   	dec    ecx
c000b0b1:	83 05 86 04 87 03 02 	add    DWORD PTR ds:0x3870486,0x2
c000b0b8:	6d                   	ins    DWORD PTR es:[edi],dx
c000b0b9:	c3                   	ret    
c000b0ba:	41                   	inc    ecx
c000b0bb:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000b0bf:	0c 04                	or     al,0x4
c000b0c1:	04 c5                	add    al,0xc5
c000b0c3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b0c6:	00 00                	add    BYTE PTR [eax],al
c000b0c8:	54                   	push   esp
c000b0c9:	05 00 00 48 89       	add    eax,0x89480000
c000b0ce:	00 c0                	add    al,al
c000b0d0:	14 00                	adc    al,0x0
c000b0d2:	00 00                	add    BYTE PTR [eax],al
c000b0d4:	41                   	inc    ecx
c000b0d5:	0e                   	push   cs
c000b0d6:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b0dc:	44                   	inc    esp
c000b0dd:	0c 04                	or     al,0x4
c000b0df:	04 c5                	add    al,0xc5
c000b0e1:	00 00                	add    BYTE PTR [eax],al
c000b0e3:	00 28                	add    BYTE PTR [eax],ch
c000b0e5:	00 00                	add    BYTE PTR [eax],al
c000b0e7:	00 74 05 00          	add    BYTE PTR [ebp+eax*1+0x0],dh
c000b0eb:	00 5c 89 00          	add    BYTE PTR [ecx+ecx*4+0x0],bl
c000b0ef:	c0 4d 00 00          	ror    BYTE PTR [ebp+0x0],0x0
c000b0f3:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b0f6:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b0fc:	49                   	dec    ecx
c000b0fd:	83 05 86 04 87 03 7d 	add    DWORD PTR ds:0x3870486,0x7d
c000b104:	c3                   	ret    
c000b105:	41                   	inc    ecx
c000b106:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000b10a:	0c 04                	or     al,0x4
c000b10c:	04 c5                	add    al,0xc5
c000b10e:	00 00                	add    BYTE PTR [eax],al
c000b110:	1c 00                	sbb    al,0x0
c000b112:	00 00                	add    BYTE PTR [eax],al
c000b114:	a0 05 00 00 a9       	mov    al,ds:0xa9000005
c000b119:	89 00                	mov    DWORD PTR [eax],eax
c000b11b:	c0 25 00 00 00 41 0e 	shl    BYTE PTR ds:0x41000000,0xe
c000b122:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b128:	61                   	popa   
c000b129:	0c 04                	or     al,0x4
c000b12b:	04 c5                	add    al,0xc5
c000b12d:	00 00                	add    BYTE PTR [eax],al
c000b12f:	00 a0 00 00 00 c0    	add    BYTE PTR [eax-0x40000000],ah
c000b135:	05 00 00 ce 89       	add    eax,0x89ce0000
c000b13a:	00 c0                	add    al,al
c000b13c:	f8                   	clc    
c000b13d:	00 00                	add    BYTE PTR [eax],al
c000b13f:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b142:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b148:	41                   	inc    ecx
c000b149:	83 03 7e             	add    DWORD PTR [ebx],0x7e
c000b14c:	2e 04 04             	cs add al,0x4
c000b14f:	07                   	pop    es
c000b150:	00 00                	add    BYTE PTR [eax],al
c000b152:	00 2e                	add    BYTE PTR [esi],ch
c000b154:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000b157:	0c 42                	or     al,0x42
c000b159:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000b15d:	14 41                	adc    al,0x41
c000b15f:	2e 18 51 2e          	sbb    BYTE PTR cs:[ecx+0x2e],dl
c000b163:	1c 48                	sbb    al,0x48
c000b165:	2e 20 41 2e          	and    BYTE PTR cs:[ecx+0x2e],al
c000b169:	24 42                	and    al,0x42
c000b16b:	2e 28 45 2e          	sub    BYTE PTR cs:[ebp+0x2e],al
c000b16f:	2c 41                	sub    al,0x41
c000b171:	2e 30 4d 2e          	xor    BYTE PTR cs:[ebp+0x2e],cl
c000b175:	00 47 2e             	add    BYTE PTR [edi+0x2e],al
c000b178:	04 04                	add    al,0x4
c000b17a:	02 00                	add    al,BYTE PTR [eax]
c000b17c:	00 00                	add    BYTE PTR [eax],al
c000b17e:	2e 08 41 2e          	or     BYTE PTR cs:[ecx+0x2e],al
c000b182:	0c 42                	or     al,0x42
c000b184:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000b188:	14 41                	adc    al,0x41
c000b18a:	2e 18 51 2e          	sbb    BYTE PTR cs:[ecx+0x2e],dl
c000b18e:	1c 42                	sbb    al,0x42
c000b190:	2e 20 41 2e          	and    BYTE PTR cs:[ecx+0x2e],al
c000b194:	24 42                	and    al,0x42
c000b196:	2e 28 45 2e          	sub    BYTE PTR cs:[ebp+0x2e],al
c000b19a:	2c 41                	sub    al,0x41
c000b19c:	2e 30 4d 2e          	xor    BYTE PTR cs:[ebp+0x2e],cl
c000b1a0:	00 47 2e             	add    BYTE PTR [edi+0x2e],al
c000b1a3:	04 04                	add    al,0x4
c000b1a5:	02 00                	add    al,BYTE PTR [eax]
c000b1a7:	00 00                	add    BYTE PTR [eax],al
c000b1a9:	2e 08 41 2e          	or     BYTE PTR cs:[ecx+0x2e],al
c000b1ad:	0c 42                	or     al,0x42
c000b1af:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000b1b3:	14 41                	adc    al,0x41
c000b1b5:	2e 18 51 2e          	sbb    BYTE PTR cs:[ecx+0x2e],dl
c000b1b9:	1c 42                	sbb    al,0x42
c000b1bb:	2e 20 41 2e          	and    BYTE PTR cs:[ecx+0x2e],al
c000b1bf:	24 42                	and    al,0x42
c000b1c1:	2e 28 45 2e          	sub    BYTE PTR cs:[ebp+0x2e],al
c000b1c5:	2c 41                	sub    al,0x41
c000b1c7:	2e 30 48 2e          	xor    BYTE PTR cs:[eax+0x2e],cl
c000b1cb:	00 44 c5 0c          	add    BYTE PTR [ebp+eax*8+0xc],al
c000b1cf:	04 04                	add    al,0x4
c000b1d1:	c3                   	ret    
c000b1d2:	00 00                	add    BYTE PTR [eax],al
c000b1d4:	28 00                	sub    BYTE PTR [eax],al
c000b1d6:	00 00                	add    BYTE PTR [eax],al
c000b1d8:	64 06                	fs push es
c000b1da:	00 00                	add    BYTE PTR [eax],al
c000b1dc:	c6                   	(bad)  
c000b1dd:	8a 00                	mov    al,BYTE PTR [eax]
c000b1df:	c0 8b 00 00 00 41 0e 	ror    BYTE PTR [ebx+0x41000000],0xe
c000b1e6:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b1ec:	43                   	inc    ebx
c000b1ed:	83 05 86 04 87 03 02 	add    DWORD PTR ds:0x3870486,0x2
c000b1f4:	81 c3 41 c6 41 c7    	add    ebx,0xc741c641
c000b1fa:	41                   	inc    ecx
c000b1fb:	0c 04                	or     al,0x4
c000b1fd:	04 c5                	add    al,0xc5
c000b1ff:	00 44 00 00          	add    BYTE PTR [eax+eax*1+0x0],al
c000b203:	00 90 06 00 00 51    	add    BYTE PTR [eax+0x51000006],dl
c000b209:	8b 00                	mov    eax,DWORD PTR [eax]
c000b20b:	c0 39 00             	sar    BYTE PTR [ecx],0x0
c000b20e:	00 00                	add    BYTE PTR [eax],al
c000b210:	41                   	inc    ecx
c000b211:	0e                   	push   cs
c000b212:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b218:	41                   	inc    ecx
c000b219:	87 03                	xchg   DWORD PTR [ebx],eax
c000b21b:	44                   	inc    esp
c000b21c:	86 04 04             	xchg   BYTE PTR [esp+eax*1],al
c000b21f:	04 00                	add    al,0x0
c000b221:	00 00                	add    BYTE PTR [eax],al
c000b223:	83 05 4d 2e 04 04 01 	add    DWORD PTR ds:0x4042e4d,0x1
c000b22a:	00 00                	add    BYTE PTR [eax],al
c000b22c:	00 2e                	add    BYTE PTR [esi],ch
c000b22e:	08 43 2e             	or     BYTE PTR [ebx+0x2e],al
c000b231:	0c 41                	or     al,0x41
c000b233:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000b237:	14 48                	adc    al,0x48
c000b239:	2e 00 49 c3          	add    BYTE PTR cs:[ecx-0x3d],cl
c000b23d:	41                   	inc    ecx
c000b23e:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000b242:	0c 04                	or     al,0x4
c000b244:	04 c5                	add    al,0xc5
c000b246:	00 00                	add    BYTE PTR [eax],al
c000b248:	24 00                	and    al,0x0
c000b24a:	00 00                	add    BYTE PTR [eax],al
c000b24c:	d8 06                	fadd   DWORD PTR [esi]
c000b24e:	00 00                	add    BYTE PTR [eax],al
c000b250:	8c 8b 00 c0 2c 00    	mov    WORD PTR [ebx+0x2cc000],cs
c000b256:	00 00                	add    BYTE PTR [eax],al
c000b258:	41                   	inc    ecx
c000b259:	0e                   	push   cs
c000b25a:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b260:	5a                   	pop    edx
c000b261:	2e 0c 45             	cs or  al,0x45
c000b264:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000b268:	00 41 c5             	add    BYTE PTR [ecx-0x3b],al
c000b26b:	0c 04                	or     al,0x4
c000b26d:	04 00                	add    al,0x0
c000b26f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b272:	00 00                	add    BYTE PTR [eax],al
c000b274:	00 07                	add    BYTE PTR [edi],al
c000b276:	00 00                	add    BYTE PTR [eax],al
c000b278:	d8 8b 00 c0 3d 00    	fmul   DWORD PTR [ebx+0x3dc000]
c000b27e:	00 00                	add    BYTE PTR [eax],al
c000b280:	41                   	inc    ecx
c000b281:	0e                   	push   cs
c000b282:	08 85 02 47 0d 05    	or     BYTE PTR [ebp+0x50d4702],al
c000b288:	74 0c                	je     c000b296 <_edata+0x722>
c000b28a:	04 04                	add    al,0x4
c000b28c:	c5 00                	lds    eax,FWORD PTR [eax]
c000b28e:	00 00                	add    BYTE PTR [eax],al
c000b290:	1c 00                	sbb    al,0x0
c000b292:	00 00                	add    BYTE PTR [eax],al
c000b294:	20 07                	and    BYTE PTR [edi],al
c000b296:	00 00                	add    BYTE PTR [eax],al
c000b298:	15 8c 00 c0 42       	adc    eax,0x42c0008c
c000b29d:	00 00                	add    BYTE PTR [eax],al
c000b29f:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b2a2:	08 85 02 44 0d 05    	or     BYTE PTR [ebp+0x50d4402],al
c000b2a8:	7c 0c                	jl     c000b2b6 <_edata+0x742>
c000b2aa:	04 04                	add    al,0x4
c000b2ac:	c5 00                	lds    eax,FWORD PTR [eax]
c000b2ae:	00 00                	add    BYTE PTR [eax],al
c000b2b0:	20 00                	and    BYTE PTR [eax],al
c000b2b2:	00 00                	add    BYTE PTR [eax],al
c000b2b4:	40                   	inc    eax
c000b2b5:	07                   	pop    es
c000b2b6:	00 00                	add    BYTE PTR [eax],al
c000b2b8:	57                   	push   edi
c000b2b9:	8c 00                	mov    WORD PTR [eax],es
c000b2bb:	c0 2c 00 00          	shr    BYTE PTR [eax+eax*1],0x0
c000b2bf:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b2c2:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b2c8:	44                   	inc    esp
c000b2c9:	83 03 63             	add    DWORD PTR [ebx],0x63
c000b2cc:	c3                   	ret    
c000b2cd:	41                   	inc    ecx
c000b2ce:	0c 04                	or     al,0x4
c000b2d0:	04 c5                	add    al,0xc5
c000b2d2:	00 00                	add    BYTE PTR [eax],al
c000b2d4:	38 00                	cmp    BYTE PTR [eax],al
c000b2d6:	00 00                	add    BYTE PTR [eax],al
c000b2d8:	64 07                	fs pop es
c000b2da:	00 00                	add    BYTE PTR [eax],al
c000b2dc:	83 8c 00 c0 5b 00 00 	or     DWORD PTR [eax+eax*1+0x5bc0],0x0
c000b2e3:	00 
c000b2e4:	41                   	inc    ecx
c000b2e5:	0e                   	push   cs
c000b2e6:	08 85 02 47 0d 05    	or     BYTE PTR [ebp+0x50d4702],al
c000b2ec:	44                   	inc    esp
c000b2ed:	83 04 86 03          	add    DWORD PTR [esi+eax*4],0x3
c000b2f1:	4a                   	dec    edx
c000b2f2:	2e 0c 48             	cs or  al,0x48
c000b2f5:	2e 10 5c 2e 00       	adc    BYTE PTR cs:[esi+ebp*1+0x0],bl
c000b2fa:	53                   	push   ebx
c000b2fb:	0a c3                	or     al,bl
c000b2fd:	41                   	inc    ecx
c000b2fe:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000b302:	04 c5                	add    al,0xc5
c000b304:	45                   	inc    ebp
c000b305:	0b 44 c3 41          	or     eax,DWORD PTR [ebx+eax*8+0x41]
c000b309:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000b30d:	04 c5                	add    al,0xc5
c000b30f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b312:	00 00                	add    BYTE PTR [eax],al
c000b314:	a0 07 00 00 de       	mov    al,ds:0xde000007
c000b319:	8c 00                	mov    WORD PTR [eax],es
c000b31b:	c0 cd 00             	ror    ch,0x0
c000b31e:	00 00                	add    BYTE PTR [eax],al
c000b320:	41                   	inc    ecx
c000b321:	0e                   	push   cs
c000b322:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b328:	02 c9                	add    cl,cl
c000b32a:	0c 04                	or     al,0x4
c000b32c:	04 c5                	add    al,0xc5
c000b32e:	00 00                	add    BYTE PTR [eax],al
c000b330:	1c 00                	sbb    al,0x0
c000b332:	00 00                	add    BYTE PTR [eax],al
c000b334:	c0 07 00             	rol    BYTE PTR [edi],0x0
c000b337:	00 ab 8d 00 c0 32    	add    BYTE PTR [ebx+0x32c0008d],ch
c000b33d:	00 00                	add    BYTE PTR [eax],al
c000b33f:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b342:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b348:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b349:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
c000b34c:	04 00                	add    al,0x0
c000b34e:	00 00                	add    BYTE PTR [eax],al
c000b350:	1c 00                	sbb    al,0x0
c000b352:	00 00                	add    BYTE PTR [eax],al
c000b354:	e0 07                	loopne c000b35d <_edata+0x7e9>
c000b356:	00 00                	add    BYTE PTR [eax],al
c000b358:	dd 8d 00 c0 10 00    	fisttp QWORD PTR [ebp+0x10c000]
c000b35e:	00 00                	add    BYTE PTR [eax],al
c000b360:	41                   	inc    ecx
c000b361:	0e                   	push   cs
c000b362:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b368:	4c                   	dec    esp
c000b369:	0c 04                	or     al,0x4
c000b36b:	04 c5                	add    al,0xc5
c000b36d:	00 00                	add    BYTE PTR [eax],al
c000b36f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b372:	00 00                	add    BYTE PTR [eax],al
c000b374:	00 08                	add    BYTE PTR [eax],cl
c000b376:	00 00                	add    BYTE PTR [eax],al
c000b378:	ed                   	in     eax,dx
c000b379:	8d 00                	lea    eax,[eax]
c000b37b:	c0 14 00 00          	rcl    BYTE PTR [eax+eax*1],0x0
c000b37f:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b382:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b388:	50                   	push   eax
c000b389:	0c 04                	or     al,0x4
c000b38b:	04 c5                	add    al,0xc5
c000b38d:	00 00                	add    BYTE PTR [eax],al
c000b38f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b392:	00 00                	add    BYTE PTR [eax],al
c000b394:	20 08                	and    BYTE PTR [eax],cl
c000b396:	00 00                	add    BYTE PTR [eax],al
c000b398:	01 8e 00 c0 17 00    	add    DWORD PTR [esi+0x17c000],ecx
c000b39e:	00 00                	add    BYTE PTR [eax],al
c000b3a0:	41                   	inc    ecx
c000b3a1:	0e                   	push   cs
c000b3a2:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b3a8:	53                   	push   ebx
c000b3a9:	0c 04                	or     al,0x4
c000b3ab:	04 c5                	add    al,0xc5
c000b3ad:	00 00                	add    BYTE PTR [eax],al
c000b3af:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
c000b3b2:	00 00                	add    BYTE PTR [eax],al
c000b3b4:	40                   	inc    eax
c000b3b5:	08 00                	or     BYTE PTR [eax],al
c000b3b7:	00 18                	add    BYTE PTR [eax],bl
c000b3b9:	8e 00                	mov    es,WORD PTR [eax]
c000b3bb:	c0 15 00 00 00 41 0e 	rcl    BYTE PTR ds:0x41000000,0xe
c000b3c2:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b3c8:	47                   	inc    edi
c000b3c9:	0a 0c 04             	or     cl,BYTE PTR [esp+eax*1]
c000b3cc:	04 c5                	add    al,0xc5
c000b3ce:	45                   	inc    ebp
c000b3cf:	0b 41 0c             	or     eax,DWORD PTR [ecx+0xc]
c000b3d2:	04 04                	add    al,0x4
c000b3d4:	c5 00                	lds    eax,FWORD PTR [eax]
c000b3d6:	00 00                	add    BYTE PTR [eax],al
c000b3d8:	1c 00                	sbb    al,0x0
c000b3da:	00 00                	add    BYTE PTR [eax],al
c000b3dc:	68 08 00 00 30       	push   0x30000008
c000b3e1:	8e 00                	mov    es,WORD PTR [eax]
c000b3e3:	c0 1e 00             	rcr    BYTE PTR [esi],0x0
c000b3e6:	00 00                	add    BYTE PTR [eax],al
c000b3e8:	41                   	inc    ecx
c000b3e9:	0e                   	push   cs
c000b3ea:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b3f0:	5a                   	pop    edx
c000b3f1:	0c 04                	or     al,0x4
c000b3f3:	04 c5                	add    al,0xc5
c000b3f5:	00 00                	add    BYTE PTR [eax],al
c000b3f7:	00 28                	add    BYTE PTR [eax],ch
c000b3f9:	00 00                	add    BYTE PTR [eax],al
c000b3fb:	00 88 08 00 00 4e    	add    BYTE PTR [eax+0x4e000008],cl
c000b401:	8e 00                	mov    es,WORD PTR [eax]
c000b403:	c0 29 00             	shr    BYTE PTR [ecx],0x0
c000b406:	00 00                	add    BYTE PTR [eax],al
c000b408:	41                   	inc    ecx
c000b409:	0e                   	push   cs
c000b40a:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b410:	41                   	inc    ecx
c000b411:	86 03                	xchg   BYTE PTR [ebx],al
c000b413:	44                   	inc    esp
c000b414:	83 04 04 1a          	add    DWORD PTR [esp+eax*1],0x1a
c000b418:	00 00                	add    BYTE PTR [eax],al
c000b41a:	00 c3                	add    bl,al
c000b41c:	41                   	inc    ecx
c000b41d:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000b421:	04 c5                	add    al,0xc5
c000b423:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b426:	00 00                	add    BYTE PTR [eax],al
c000b428:	b4 08                	mov    ah,0x8
c000b42a:	00 00                	add    BYTE PTR [eax],al
c000b42c:	77 8e                	ja     c000b3bc <_edata+0x848>
c000b42e:	00 c0                	add    al,al
c000b430:	18 00                	sbb    BYTE PTR [eax],al
c000b432:	00 00                	add    BYTE PTR [eax],al
c000b434:	41                   	inc    ecx
c000b435:	0e                   	push   cs
c000b436:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b43c:	50                   	push   eax
c000b43d:	0c 04                	or     al,0x4
c000b43f:	04 c5                	add    al,0xc5
c000b441:	00 00                	add    BYTE PTR [eax],al
c000b443:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b446:	00 00                	add    BYTE PTR [eax],al
c000b448:	d4 08                	aam    0x8
c000b44a:	00 00                	add    BYTE PTR [eax],al
c000b44c:	8f                   	(bad)  
c000b44d:	8e 00                	mov    es,WORD PTR [eax]
c000b44f:	c0 18 00             	rcr    BYTE PTR [eax],0x0
c000b452:	00 00                	add    BYTE PTR [eax],al
c000b454:	41                   	inc    ecx
c000b455:	0e                   	push   cs
c000b456:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b45c:	50                   	push   eax
c000b45d:	0c 04                	or     al,0x4
c000b45f:	04 c5                	add    al,0xc5
c000b461:	00 00                	add    BYTE PTR [eax],al
c000b463:	00 28                	add    BYTE PTR [eax],ch
c000b465:	00 00                	add    BYTE PTR [eax],al
c000b467:	00 f4                	add    ah,dh
c000b469:	08 00                	or     BYTE PTR [eax],al
c000b46b:	00 a7 8e 00 c0 3f    	add    BYTE PTR [edi+0x3fc0008e],ah
c000b471:	00 00                	add    BYTE PTR [eax],al
c000b473:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b476:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b47c:	42                   	inc    edx
c000b47d:	83 03 6d             	add    DWORD PTR [ebx],0x6d
c000b480:	2e 0c 41             	cs or  al,0x41
c000b483:	2e 10 4b c5          	adc    BYTE PTR cs:[ebx-0x3b],cl
c000b487:	0c 04                	or     al,0x4
c000b489:	04 c3                	add    al,0xc3
c000b48b:	41                   	inc    ecx
c000b48c:	13 03                	adc    eax,DWORD PTR [ebx]
c000b48e:	2e 00 1c 00          	add    BYTE PTR cs:[eax+eax*1],bl
c000b492:	00 00                	add    BYTE PTR [eax],al
c000b494:	20 09                	and    BYTE PTR [ecx],cl
c000b496:	00 00                	add    BYTE PTR [eax],al
c000b498:	e6 8e                	out    0x8e,al
c000b49a:	00 c0                	add    al,al
c000b49c:	12 00                	adc    al,BYTE PTR [eax]
c000b49e:	00 00                	add    BYTE PTR [eax],al
c000b4a0:	41                   	inc    ecx
c000b4a1:	0e                   	push   cs
c000b4a2:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b4a8:	4a                   	dec    edx
c000b4a9:	0c 04                	or     al,0x4
c000b4ab:	04 c5                	add    al,0xc5
c000b4ad:	00 00                	add    BYTE PTR [eax],al
c000b4af:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b4b2:	00 00                	add    BYTE PTR [eax],al
c000b4b4:	40                   	inc    eax
c000b4b5:	09 00                	or     DWORD PTR [eax],eax
c000b4b7:	00 f8                	add    al,bh
c000b4b9:	8e 00                	mov    es,WORD PTR [eax]
c000b4bb:	c0 27 00             	shl    BYTE PTR [edi],0x0
c000b4be:	00 00                	add    BYTE PTR [eax],al
c000b4c0:	41                   	inc    ecx
c000b4c1:	0e                   	push   cs
c000b4c2:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b4c8:	63 0c 04             	arpl   WORD PTR [esp+eax*1],cx
c000b4cb:	04 c5                	add    al,0xc5
c000b4cd:	00 00                	add    BYTE PTR [eax],al
c000b4cf:	00 3c 00             	add    BYTE PTR [eax+eax*1],bh
c000b4d2:	00 00                	add    BYTE PTR [eax],al
c000b4d4:	60                   	pusha  
c000b4d5:	09 00                	or     DWORD PTR [eax],eax
c000b4d7:	00 1f                	add    BYTE PTR [edi],bl
c000b4d9:	8f 00                	pop    DWORD PTR [eax]
c000b4db:	c0                   	(bad)  
c000b4dc:	34 00                	xor    al,0x0
c000b4de:	00 00                	add    BYTE PTR [eax],al
c000b4e0:	41                   	inc    ecx
c000b4e1:	0e                   	push   cs
c000b4e2:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b4e8:	46                   	inc    esi
c000b4e9:	83 05 86 04 87 03 4f 	add    DWORD PTR ds:0x3870486,0x4f
c000b4f0:	2e 04 04             	cs add al,0x4
c000b4f3:	01 00                	add    DWORD PTR [eax],eax
c000b4f5:	00 00                	add    BYTE PTR [eax],al
c000b4f7:	2e 08 41 2e          	or     BYTE PTR cs:[ecx+0x2e],al
c000b4fb:	0c 41                	or     al,0x41
c000b4fd:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000b501:	00 4f c3             	add    BYTE PTR [edi-0x3d],cl
c000b504:	41                   	inc    ecx
c000b505:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000b509:	0c 04                	or     al,0x4
c000b50b:	04 c5                	add    al,0xc5
c000b50d:	00 00                	add    BYTE PTR [eax],al
c000b50f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b512:	00 00                	add    BYTE PTR [eax],al
c000b514:	a0 09 00 00 53       	mov    al,ds:0x53000009
c000b519:	8f 00                	pop    DWORD PTR [eax]
c000b51b:	c0 1a 00             	rcr    BYTE PTR [edx],0x0
c000b51e:	00 00                	add    BYTE PTR [eax],al
c000b520:	41                   	inc    ecx
c000b521:	0e                   	push   cs
c000b522:	08 85 02 44 0d 05    	or     BYTE PTR [ebp+0x50d4402],al
c000b528:	54                   	push   esp
c000b529:	0c 04                	or     al,0x4
c000b52b:	04 c5                	add    al,0xc5
c000b52d:	00 00                	add    BYTE PTR [eax],al
c000b52f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b532:	00 00                	add    BYTE PTR [eax],al
c000b534:	c0 09 00             	ror    BYTE PTR [ecx],0x0
c000b537:	00 6d 8f             	add    BYTE PTR [ebp-0x71],ch
c000b53a:	00 c0                	add    al,al
c000b53c:	14 00                	adc    al,0x0
c000b53e:	00 00                	add    BYTE PTR [eax],al
c000b540:	41                   	inc    ecx
c000b541:	0e                   	push   cs
c000b542:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b548:	44                   	inc    esp
c000b549:	0c 04                	or     al,0x4
c000b54b:	04 c5                	add    al,0xc5
c000b54d:	00 00                	add    BYTE PTR [eax],al
c000b54f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b552:	00 00                	add    BYTE PTR [eax],al
c000b554:	e0 09                	loopne c000b55f <_edata+0x9eb>
c000b556:	00 00                	add    BYTE PTR [eax],al
c000b558:	84 8f 00 c0 23 00    	test   BYTE PTR [edi+0x23c000],cl
c000b55e:	00 00                	add    BYTE PTR [eax],al
c000b560:	41                   	inc    ecx
c000b561:	0e                   	push   cs
c000b562:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b568:	5f                   	pop    edi
c000b569:	0c 04                	or     al,0x4
c000b56b:	04 c5                	add    al,0xc5
c000b56d:	00 00                	add    BYTE PTR [eax],al
c000b56f:	00 20                	add    BYTE PTR [eax],ah
c000b571:	00 00                	add    BYTE PTR [eax],al
c000b573:	00 00                	add    BYTE PTR [eax],al
c000b575:	0a 00                	or     al,BYTE PTR [eax]
c000b577:	00 a7 8f 00 c0 1b    	add    BYTE PTR [edi+0x1bc0008f],ah
c000b57d:	00 00                	add    BYTE PTR [eax],al
c000b57f:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b582:	08 85 02 44 0d 05    	or     BYTE PTR [ebp+0x50d4402],al
c000b588:	46                   	inc    esi
c000b589:	83 03 4e             	add    DWORD PTR [ebx],0x4e
c000b58c:	c3                   	ret    
c000b58d:	41                   	inc    ecx
c000b58e:	0c 04                	or     al,0x4
c000b590:	04 c5                	add    al,0xc5
c000b592:	00 00                	add    BYTE PTR [eax],al
c000b594:	28 00                	sub    BYTE PTR [eax],al
c000b596:	00 00                	add    BYTE PTR [eax],al
c000b598:	24 0a                	and    al,0xa
c000b59a:	00 00                	add    BYTE PTR [eax],al
c000b59c:	c2 8f 00             	ret    0x8f
c000b59f:	c0 62 00 00          	shl    BYTE PTR [edx+0x0],0x0
c000b5a3:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b5a6:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b5ac:	44                   	inc    esp
c000b5ad:	83 05 86 04 87 03 02 	add    DWORD PTR ds:0x3870486,0x2
c000b5b4:	57                   	push   edi
c000b5b5:	c3                   	ret    
c000b5b6:	41                   	inc    ecx
c000b5b7:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000b5bb:	0c 04                	or     al,0x4
c000b5bd:	04 c5                	add    al,0xc5
c000b5bf:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b5c2:	00 00                	add    BYTE PTR [eax],al
c000b5c4:	50                   	push   eax
c000b5c5:	0a 00                	or     al,BYTE PTR [eax]
c000b5c7:	00 24 90             	add    BYTE PTR [eax+edx*4],ah
c000b5ca:	00 c0                	add    al,al
c000b5cc:	0d 00 00 00 41       	or     eax,0x41000000
c000b5d1:	0e                   	push   cs
c000b5d2:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b5d8:	45                   	inc    ebp
c000b5d9:	0c 04                	or     al,0x4
c000b5db:	04 c5                	add    al,0xc5
c000b5dd:	00 00                	add    BYTE PTR [eax],al
c000b5df:	00 28                	add    BYTE PTR [eax],ch
c000b5e1:	00 00                	add    BYTE PTR [eax],al
c000b5e3:	00 70 0a             	add    BYTE PTR [eax+0xa],dh
c000b5e6:	00 00                	add    BYTE PTR [eax],al
c000b5e8:	31 90 00 c0 0a 01    	xor    DWORD PTR [eax+0x10ac000],edx
c000b5ee:	00 00                	add    BYTE PTR [eax],al
c000b5f0:	41                   	inc    ecx
c000b5f1:	0e                   	push   cs
c000b5f2:	08 85 02 44 0d 05    	or     BYTE PTR [ebp+0x50d4402],al
c000b5f8:	46                   	inc    esi
c000b5f9:	83 05 86 04 87 03 02 	add    DWORD PTR ds:0x3870486,0x2
c000b600:	fb                   	sti    
c000b601:	c3                   	ret    
c000b602:	41                   	inc    ecx
c000b603:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000b607:	0c 04                	or     al,0x4
c000b609:	04 c5                	add    al,0xc5
c000b60b:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b60e:	00 00                	add    BYTE PTR [eax],al
c000b610:	9c                   	pushf  
c000b611:	0a 00                	or     al,BYTE PTR [eax]
c000b613:	00 3b                	add    BYTE PTR [ebx],bh
c000b615:	91                   	xchg   ecx,eax
c000b616:	00 c0                	add    al,al
c000b618:	0d 00 00 00 41       	or     eax,0x41000000
c000b61d:	0e                   	push   cs
c000b61e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b624:	45                   	inc    ebp
c000b625:	0c 04                	or     al,0x4
c000b627:	04 c5                	add    al,0xc5
c000b629:	00 00                	add    BYTE PTR [eax],al
c000b62b:	00 54 00 00          	add    BYTE PTR [eax+eax*1+0x0],dl
c000b62f:	00 bc 0a 00 00 48 91 	add    BYTE PTR [edx+ecx*1-0x6eb80000],bh
c000b636:	00 c0                	add    al,al
c000b638:	69 00 00 00 41 0e    	imul   eax,DWORD PTR [eax],0xe410000
c000b63e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b644:	42                   	inc    edx
c000b645:	83 04 86 03          	add    DWORD PTR [esi+eax*4],0x3
c000b649:	4f                   	dec    edi
c000b64a:	2e 04 04             	cs add al,0x4
c000b64d:	07                   	pop    es
c000b64e:	00 00                	add    BYTE PTR [eax],al
c000b650:	00 2e                	add    BYTE PTR [esi],ch
c000b652:	08 4b 2e             	or     BYTE PTR [ebx+0x2e],cl
c000b655:	0c 46                	or     al,0x46
c000b657:	2e 10 41 2e          	adc    BYTE PTR cs:[ecx+0x2e],al
c000b65b:	14 45                	adc    al,0x45
c000b65d:	2e 18 4a 2e          	sbb    BYTE PTR cs:[edx+0x2e],cl
c000b661:	1c 42                	sbb    al,0x42
c000b663:	2e 20 45 2e          	and    BYTE PTR cs:[ebp+0x2e],al
c000b667:	24 48                	and    al,0x48
c000b669:	2e 00 45 2e          	add    BYTE PTR cs:[ebp+0x2e],al
c000b66d:	04 04                	add    al,0x4
c000b66f:	05 00 00 00 2e       	add    eax,0x2e000000
c000b674:	08 45 2e             	or     BYTE PTR [ebp+0x2e],al
c000b677:	0c 48                	or     al,0x48
c000b679:	2e 00 44 c3 41       	add    BYTE PTR cs:[ebx+eax*8+0x41],al
c000b67e:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000b682:	04 c5                	add    al,0xc5
c000b684:	1c 00                	sbb    al,0x0
c000b686:	00 00                	add    BYTE PTR [eax],al
c000b688:	14 0b                	adc    al,0xb
c000b68a:	00 00                	add    BYTE PTR [eax],al
c000b68c:	b1 91                	mov    cl,0x91
c000b68e:	00 c0                	add    al,al
c000b690:	12 00                	adc    al,BYTE PTR [eax]
c000b692:	00 00                	add    BYTE PTR [eax],al
c000b694:	41                   	inc    ecx
c000b695:	0e                   	push   cs
c000b696:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b69c:	44                   	inc    esp
c000b69d:	0c 04                	or     al,0x4
c000b69f:	04 c5                	add    al,0xc5
c000b6a1:	00 00                	add    BYTE PTR [eax],al
c000b6a3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b6a6:	00 00                	add    BYTE PTR [eax],al
c000b6a8:	34 0b                	xor    al,0xb
c000b6aa:	00 00                	add    BYTE PTR [eax],al
c000b6ac:	c3                   	ret    
c000b6ad:	91                   	xchg   ecx,eax
c000b6ae:	00 c0                	add    al,al
c000b6b0:	22 00                	and    al,BYTE PTR [eax]
c000b6b2:	00 00                	add    BYTE PTR [eax],al
c000b6b4:	41                   	inc    ecx
c000b6b5:	0e                   	push   cs
c000b6b6:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b6bc:	44                   	inc    esp
c000b6bd:	0c 04                	or     al,0x4
c000b6bf:	04 c5                	add    al,0xc5
c000b6c1:	00 00                	add    BYTE PTR [eax],al
c000b6c3:	00 4c 00 00          	add    BYTE PTR [eax+eax*1+0x0],cl
c000b6c7:	00 54 0b 00          	add    BYTE PTR [ebx+ecx*1+0x0],dl
c000b6cb:	00 e5                	add    ch,ah
c000b6cd:	91                   	xchg   ecx,eax
c000b6ce:	00 c0                	add    al,al
c000b6d0:	70 00                	jo     c000b6d2 <_edata+0xb5e>
c000b6d2:	00 00                	add    BYTE PTR [eax],al
c000b6d4:	41                   	inc    ecx
c000b6d5:	0e                   	push   cs
c000b6d6:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b6dc:	46                   	inc    esi
c000b6dd:	83 05 86 04 87 03 47 	add    DWORD PTR ds:0x3870486,0x47
c000b6e4:	2e 04 04             	cs add al,0x4
c000b6e7:	13 00                	adc    eax,DWORD PTR [eax]
c000b6e9:	00 00                	add    BYTE PTR [eax],al
c000b6eb:	2e 00 52 2e          	add    BYTE PTR cs:[edx+0x2e],dl
c000b6ef:	04 04                	add    al,0x4
c000b6f1:	08 00                	or     BYTE PTR [eax],al
c000b6f3:	00 00                	add    BYTE PTR [eax],al
c000b6f5:	2e 08 48 2e          	or     BYTE PTR cs:[eax+0x2e],cl
c000b6f9:	14 51                	adc    al,0x51
c000b6fb:	2e 18 47 2e          	sbb    BYTE PTR cs:[edi+0x2e],al
c000b6ff:	1c 41                	sbb    al,0x41
c000b701:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000b705:	00 46 c3             	add    BYTE PTR [esi-0x3d],al
c000b708:	41                   	inc    ecx
c000b709:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000b70d:	0c 04                	or     al,0x4
c000b70f:	04 c5                	add    al,0xc5
c000b711:	00 00                	add    BYTE PTR [eax],al
c000b713:	00 64 00 00          	add    BYTE PTR [eax+eax*1+0x0],ah
c000b717:	00 a4 0b 00 00 55 92 	add    BYTE PTR [ebx+ecx*1-0x6dab0000],ah
c000b71e:	00 c0                	add    al,al
c000b720:	6a 00                	push   0x0
c000b722:	00 00                	add    BYTE PTR [eax],al
c000b724:	41                   	inc    ecx
c000b725:	0e                   	push   cs
c000b726:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b72c:	46                   	inc    esi
c000b72d:	83 05 86 04 87 03 58 	add    DWORD PTR ds:0x3870486,0x58
c000b734:	2e 04 04             	cs add al,0x4
c000b737:	03 00                	add    eax,DWORD PTR [eax]
c000b739:	00 00                	add    BYTE PTR [eax],al
c000b73b:	2e 08 46 2e          	or     BYTE PTR cs:[esi+0x2e],al
c000b73f:	04 04                	add    al,0x4
c000b741:	01 00                	add    DWORD PTR [eax],eax
c000b743:	00 00                	add    BYTE PTR [eax],al
c000b745:	2e 00 4c 2e 04       	add    BYTE PTR cs:[esi+ebp*1+0x4],cl
c000b74a:	04 03                	add    al,0x3
c000b74c:	00 00                	add    BYTE PTR [eax],al
c000b74e:	00 2e                	add    BYTE PTR [esi],ch
c000b750:	08 46 2e             	or     BYTE PTR [esi+0x2e],al
c000b753:	04 04                	add    al,0x4
c000b755:	01 00                	add    DWORD PTR [eax],eax
c000b757:	00 00                	add    BYTE PTR [eax],al
c000b759:	2e 00 45 2e          	add    BYTE PTR cs:[ebp+0x2e],al
c000b75d:	04 04                	add    al,0x4
c000b75f:	02 00                	add    al,BYTE PTR [eax]
c000b761:	00 00                	add    BYTE PTR [eax],al
c000b763:	2e 08 41 2e          	or     BYTE PTR cs:[ecx+0x2e],al
c000b767:	0c 41                	or     al,0x41
c000b769:	2e 10 4e 2e          	adc    BYTE PTR cs:[esi+0x2e],cl
c000b76d:	00 4e c3             	add    BYTE PTR [esi-0x3d],cl
c000b770:	41                   	inc    ecx
c000b771:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000b775:	0c 04                	or     al,0x4
c000b777:	04 c5                	add    al,0xc5
c000b779:	00 00                	add    BYTE PTR [eax],al
c000b77b:	00 3c 00             	add    BYTE PTR [eax+eax*1],bh
c000b77e:	00 00                	add    BYTE PTR [eax],al
c000b780:	0c 0c                	or     al,0xc
c000b782:	00 00                	add    BYTE PTR [eax],al
c000b784:	bf 92 00 c0 34       	mov    edi,0x34c00092
c000b789:	00 00                	add    BYTE PTR [eax],al
c000b78b:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b78e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b794:	44                   	inc    esp
c000b795:	2e 08 83 03 44 2e 0c 	or     BYTE PTR cs:[ebx+0xc2e4403],al
c000b79c:	42                   	inc    edx
c000b79d:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000b7a1:	00 48 2e             	add    BYTE PTR [eax+0x2e],cl
c000b7a4:	04 04                	add    al,0x4
c000b7a6:	01 00                	add    DWORD PTR [eax],eax
c000b7a8:	00 00                	add    BYTE PTR [eax],al
c000b7aa:	2e 08 42 2e          	or     BYTE PTR cs:[edx+0x2e],al
c000b7ae:	0c 41                	or     al,0x41
c000b7b0:	2e 10 4e 2e          	adc    BYTE PTR cs:[esi+0x2e],cl
c000b7b4:	00 44 c5 0c          	add    BYTE PTR [ebp+eax*8+0xc],al
c000b7b8:	04 04                	add    al,0x4
c000b7ba:	c3                   	ret    
c000b7bb:	00 28                	add    BYTE PTR [eax],ch
c000b7bd:	00 00                	add    BYTE PTR [eax],al
c000b7bf:	00 4c 0c 00          	add    BYTE PTR [esp+ecx*1+0x0],cl
c000b7c3:	00 f4                	add    ah,dh
c000b7c5:	92                   	xchg   edx,eax
c000b7c6:	00 c0                	add    al,al
c000b7c8:	5f                   	pop    edi
c000b7c9:	00 00                	add    BYTE PTR [eax],al
c000b7cb:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b7ce:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b7d4:	45                   	inc    ebp
c000b7d5:	86 04 87             	xchg   BYTE PTR [edi+eax*4],al
c000b7d8:	03 44 83 05          	add    eax,DWORD PTR [ebx+eax*4+0x5]
c000b7dc:	02 4f c3             	add    cl,BYTE PTR [edi-0x3d]
c000b7df:	41                   	inc    ecx
c000b7e0:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000b7e4:	0c 04                	or     al,0x4
c000b7e6:	04 c5                	add    al,0xc5
c000b7e8:	24 00                	and    al,0x0
c000b7ea:	00 00                	add    BYTE PTR [eax],al
c000b7ec:	78 0c                	js     c000b7fa <_edata+0xc86>
c000b7ee:	00 00                	add    BYTE PTR [eax],al
c000b7f0:	53                   	push   ebx
c000b7f1:	93                   	xchg   ebx,eax
c000b7f2:	00 c0                	add    al,al
c000b7f4:	31 00                	xor    DWORD PTR [eax],eax
c000b7f6:	00 00                	add    BYTE PTR [eax],al
c000b7f8:	41                   	inc    ecx
c000b7f9:	0e                   	push   cs
c000b7fa:	08 85 02 44 0d 05    	or     BYTE PTR [ebp+0x50d4402],al
c000b800:	42                   	inc    edx
c000b801:	83 04 86 03          	add    DWORD PTR [esi+eax*4],0x3
c000b805:	67 c3                	addr16 ret 
c000b807:	41                   	inc    ecx
c000b808:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000b80c:	04 c5                	add    al,0xc5
c000b80e:	00 00                	add    BYTE PTR [eax],al
c000b810:	20 00                	and    BYTE PTR [eax],al
c000b812:	00 00                	add    BYTE PTR [eax],al
c000b814:	a0 0c 00 00 84       	mov    al,ds:0x8400000c
c000b819:	93                   	xchg   ebx,eax
c000b81a:	00 c0                	add    al,al
c000b81c:	2e 00 00             	add    BYTE PTR cs:[eax],al
c000b81f:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b822:	08 85 02 47 0d 05    	or     BYTE PTR [ebp+0x50d4702],al
c000b828:	46                   	inc    esi
c000b829:	83 03 5e             	add    DWORD PTR [ebx],0x5e
c000b82c:	c3                   	ret    
c000b82d:	41                   	inc    ecx
c000b82e:	0c 04                	or     al,0x4
c000b830:	04 c5                	add    al,0xc5
c000b832:	00 00                	add    BYTE PTR [eax],al
c000b834:	1c 00                	sbb    al,0x0
c000b836:	00 00                	add    BYTE PTR [eax],al
c000b838:	c4 0c 00             	les    ecx,FWORD PTR [eax+eax*1]
c000b83b:	00 b2 93 00 c0 27    	add    BYTE PTR [edx+0x27c00093],dh
c000b841:	00 00                	add    BYTE PTR [eax],al
c000b843:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b846:	08 85 02 47 0d 05    	or     BYTE PTR [ebp+0x50d4702],al
c000b84c:	5e                   	pop    esi
c000b84d:	0c 04                	or     al,0x4
c000b84f:	04 c5                	add    al,0xc5
c000b851:	00 00                	add    BYTE PTR [eax],al
c000b853:	00 34 00             	add    BYTE PTR [eax+eax*1],dh
c000b856:	00 00                	add    BYTE PTR [eax],al
c000b858:	e4 0c                	in     al,0xc
c000b85a:	00 00                	add    BYTE PTR [eax],al
c000b85c:	d9 93 00 c0 8a 00    	fst    DWORD PTR [ebx+0x8ac000]
c000b862:	00 00                	add    BYTE PTR [eax],al
c000b864:	41                   	inc    ecx
c000b865:	0e                   	push   cs
c000b866:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b86c:	41                   	inc    ecx
c000b86d:	86 03                	xchg   BYTE PTR [ebx],al
c000b86f:	44                   	inc    esp
c000b870:	83 04 04 74          	add    DWORD PTR [esp+eax*1],0x74
c000b874:	00 00                	add    BYTE PTR [eax],al
c000b876:	00 0a                	add    BYTE PTR [edx],cl
c000b878:	c3                   	ret    
c000b879:	44                   	inc    esp
c000b87a:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000b87e:	04 c5                	add    al,0xc5
c000b880:	45                   	inc    ebp
c000b881:	0b 41 c3             	or     eax,DWORD PTR [ecx-0x3d]
c000b884:	41                   	inc    ecx
c000b885:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000b889:	04 c5                	add    al,0xc5
c000b88b:	00 28                	add    BYTE PTR [eax],ch
c000b88d:	00 00                	add    BYTE PTR [eax],al
c000b88f:	00 1c 0d 00 00 63 94 	add    BYTE PTR [ecx*1-0x6b9d0000],bl
c000b896:	00 c0                	add    al,al
c000b898:	1f                   	pop    ds
c000b899:	00 00                	add    BYTE PTR [eax],al
c000b89b:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b89e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b8a4:	41                   	inc    ecx
c000b8a5:	83 03 4a             	add    DWORD PTR [ebx],0x4a
c000b8a8:	2e 04 04             	cs add al,0x4
c000b8ab:	06                   	push   es
c000b8ac:	00 00                	add    BYTE PTR [eax],al
c000b8ae:	00 2e                	add    BYTE PTR [esi],ch
c000b8b0:	00 4a c5             	add    BYTE PTR [edx-0x3b],cl
c000b8b3:	0c 04                	or     al,0x4
c000b8b5:	04 c3                	add    al,0xc3
c000b8b7:	00 30                	add    BYTE PTR [eax],dh
c000b8b9:	00 00                	add    BYTE PTR [eax],al
c000b8bb:	00 48 0d             	add    BYTE PTR [eax+0xd],cl
c000b8be:	00 00                	add    BYTE PTR [eax],al
c000b8c0:	82                   	(bad)  
c000b8c1:	94                   	xchg   esp,eax
c000b8c2:	00 c0                	add    al,al
c000b8c4:	2f                   	das    
c000b8c5:	00 00                	add    BYTE PTR [eax],al
c000b8c7:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b8ca:	08 85 02 44 0d 05    	or     BYTE PTR [ebp+0x50d4402],al
c000b8d0:	46                   	inc    esi
c000b8d1:	87 03                	xchg   DWORD PTR [ebx],eax
c000b8d3:	4d                   	dec    ebp
c000b8d4:	2e 04 04             	cs add al,0x4
c000b8d7:	01 00                	add    DWORD PTR [eax],eax
c000b8d9:	00 00                	add    BYTE PTR [eax],al
c000b8db:	2e 08 43 2e          	or     BYTE PTR cs:[ebx+0x2e],al
c000b8df:	0c 46                	or     al,0x46
c000b8e1:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000b8e5:	00 44 c5 0c          	add    BYTE PTR [ebp+eax*8+0xc],al
c000b8e9:	04 04                	add    al,0x4
c000b8eb:	c7                   	(bad)  
c000b8ec:	38 00                	cmp    BYTE PTR [eax],al
c000b8ee:	00 00                	add    BYTE PTR [eax],al
c000b8f0:	7c 0d                	jl     c000b8ff <_edata+0xd8b>
c000b8f2:	00 00                	add    BYTE PTR [eax],al
c000b8f4:	b4 94                	mov    ah,0x94
c000b8f6:	00 c0                	add    al,al
c000b8f8:	47                   	inc    edi
c000b8f9:	00 00                	add    BYTE PTR [eax],al
c000b8fb:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b8fe:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b904:	45                   	inc    ebp
c000b905:	83 04 86 03          	add    DWORD PTR [esi+eax*4],0x3
c000b909:	52                   	push   edx
c000b90a:	2e 04 04             	cs add al,0x4
c000b90d:	05 00 00 00 2e       	add    eax,0x2e000000
c000b912:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000b915:	0c 45                	or     al,0x45
c000b917:	2e 10 4e 2e          	adc    BYTE PTR cs:[esi+0x2e],cl
c000b91b:	00 50 c3             	add    BYTE PTR [eax-0x3d],dl
c000b91e:	41                   	inc    ecx
c000b91f:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000b923:	04 c5                	add    al,0xc5
c000b925:	00 00                	add    BYTE PTR [eax],al
c000b927:	00 3c 00             	add    BYTE PTR [eax+eax*1],bh
c000b92a:	00 00                	add    BYTE PTR [eax],al
c000b92c:	b8 0d 00 00 fb       	mov    eax,0xfb00000d
c000b931:	94                   	xchg   esp,eax
c000b932:	00 c0                	add    al,al
c000b934:	4a                   	dec    edx
c000b935:	00 00                	add    BYTE PTR [eax],al
c000b937:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b93a:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b940:	46                   	inc    esi
c000b941:	83 05 86 04 87 03 56 	add    DWORD PTR ds:0x3870486,0x56
c000b948:	2e 04 04             	cs add al,0x4
c000b94b:	05 00 00 00 2e       	add    eax,0x2e000000
c000b950:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000b953:	0c 45                	or     al,0x45
c000b955:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000b959:	00 53 c3             	add    BYTE PTR [ebx-0x3d],dl
c000b95c:	41                   	inc    ecx
c000b95d:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000b961:	0c 04                	or     al,0x4
c000b963:	04 c5                	add    al,0xc5
c000b965:	00 00                	add    BYTE PTR [eax],al
c000b967:	00 3c 00             	add    BYTE PTR [eax+eax*1],bh
c000b96a:	00 00                	add    BYTE PTR [eax],al
c000b96c:	f8                   	clc    
c000b96d:	0d 00 00 45 95       	or     eax,0x95450000
c000b972:	00 c0                	add    al,al
c000b974:	42                   	inc    edx
c000b975:	00 00                	add    BYTE PTR [eax],al
c000b977:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b97a:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b980:	41                   	inc    ecx
c000b981:	86 03                	xchg   BYTE PTR [ebx],al
c000b983:	44                   	inc    esp
c000b984:	83 04 04 10          	add    DWORD PTR [esp+eax*1],0x10
c000b988:	00 00                	add    BYTE PTR [eax],al
c000b98a:	00 2e                	add    BYTE PTR [esi],ch
c000b98c:	04 04                	add    al,0x4
c000b98e:	05 00 00 00 2e       	add    eax,0x2e000000
c000b993:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000b996:	0c 45                	or     al,0x45
c000b998:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000b99c:	00 53 c3             	add    BYTE PTR [ebx-0x3d],dl
c000b99f:	41                   	inc    ecx
c000b9a0:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000b9a4:	04 c5                	add    al,0xc5
c000b9a6:	00 00                	add    BYTE PTR [eax],al
c000b9a8:	20 00                	and    BYTE PTR [eax],al
c000b9aa:	00 00                	add    BYTE PTR [eax],al
c000b9ac:	38 0e                	cmp    BYTE PTR [esi],cl
c000b9ae:	00 00                	add    BYTE PTR [eax],al
c000b9b0:	87 95 00 c0 1a 00    	xchg   DWORD PTR [ebp+0x1ac000],edx
c000b9b6:	00 00                	add    BYTE PTR [eax],al
c000b9b8:	41                   	inc    ecx
c000b9b9:	0e                   	push   cs
c000b9ba:	08 85 02 44 0d 05    	or     BYTE PTR [ebp+0x50d4402],al
c000b9c0:	44                   	inc    esp
c000b9c1:	83 03 4f             	add    DWORD PTR [ebx],0x4f
c000b9c4:	c3                   	ret    
c000b9c5:	41                   	inc    ecx
c000b9c6:	0c 04                	or     al,0x4
c000b9c8:	04 c5                	add    al,0xc5
c000b9ca:	00 00                	add    BYTE PTR [eax],al
c000b9cc:	28 00                	sub    BYTE PTR [eax],al
c000b9ce:	00 00                	add    BYTE PTR [eax],al
c000b9d0:	5c                   	pop    esp
c000b9d1:	0e                   	push   cs
c000b9d2:	00 00                	add    BYTE PTR [eax],al
c000b9d4:	c8 95 00 c0          	enter  0x95,0xc0
c000b9d8:	1a 00                	sbb    al,BYTE PTR [eax]
c000b9da:	00 00                	add    BYTE PTR [eax],al
c000b9dc:	41                   	inc    ecx
c000b9dd:	0e                   	push   cs
c000b9de:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b9e4:	41                   	inc    ecx
c000b9e5:	86 03                	xchg   BYTE PTR [ebx],al
c000b9e7:	44                   	inc    esp
c000b9e8:	83 04 04 0e          	add    DWORD PTR [esp+eax*1],0xe
c000b9ec:	00 00                	add    BYTE PTR [eax],al
c000b9ee:	00 c3                	add    bl,al
c000b9f0:	41                   	inc    ecx
c000b9f1:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000b9f5:	04 c5                	add    al,0xc5
c000b9f7:	00 48 00             	add    BYTE PTR [eax+0x0],cl
c000b9fa:	00 00                	add    BYTE PTR [eax],al
c000b9fc:	88 0e                	mov    BYTE PTR [esi],cl
c000b9fe:	00 00                	add    BYTE PTR [eax],al
c000ba00:	e2 95                	loop   c000b997 <_edata+0xe23>
c000ba02:	00 c0                	add    al,al
c000ba04:	50                   	push   eax
c000ba05:	00 00                	add    BYTE PTR [eax],al
c000ba07:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000ba0a:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ba10:	41                   	inc    ecx
c000ba11:	86 03                	xchg   BYTE PTR [ebx],al
c000ba13:	44                   	inc    esp
c000ba14:	83 04 04 04          	add    DWORD PTR [esp+eax*1],0x4
c000ba18:	00 00                	add    BYTE PTR [eax],al
c000ba1a:	00 2e                	add    BYTE PTR [esi],ch
c000ba1c:	04 04                	add    al,0x4
c000ba1e:	02 00                	add    al,BYTE PTR [eax]
c000ba20:	00 00                	add    BYTE PTR [eax],al
c000ba22:	2e 08 42 2e          	or     BYTE PTR cs:[edx+0x2e],al
c000ba26:	0c 41                	or     al,0x41
c000ba28:	2e 10 49 2e          	adc    BYTE PTR cs:[ecx+0x2e],cl
c000ba2c:	0c 41                	or     al,0x41
c000ba2e:	2e 08 43 2e          	or     BYTE PTR cs:[ebx+0x2e],al
c000ba32:	0c 41                	or     al,0x41
c000ba34:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000ba38:	00 66 c3             	add    BYTE PTR [esi-0x3d],ah
c000ba3b:	41                   	inc    ecx
c000ba3c:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000ba40:	04 c5                	add    al,0xc5
c000ba42:	00 00                	add    BYTE PTR [eax],al
c000ba44:	1c 00                	sbb    al,0x0
c000ba46:	00 00                	add    BYTE PTR [eax],al
c000ba48:	d4 0e                	aam    0xe
c000ba4a:	00 00                	add    BYTE PTR [eax],al
c000ba4c:	32 96 00 c0 0c 00    	xor    dl,BYTE PTR [esi+0xcc000]
c000ba52:	00 00                	add    BYTE PTR [eax],al
c000ba54:	41                   	inc    ecx
c000ba55:	0e                   	push   cs
c000ba56:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ba5c:	48                   	dec    eax
c000ba5d:	0c 04                	or     al,0x4
c000ba5f:	04 c5                	add    al,0xc5
c000ba61:	00 00                	add    BYTE PTR [eax],al
c000ba63:	00 60 00             	add    BYTE PTR [eax+0x0],ah
c000ba66:	00 00                	add    BYTE PTR [eax],al
c000ba68:	f4                   	hlt    
c000ba69:	0e                   	push   cs
c000ba6a:	00 00                	add    BYTE PTR [eax],al
c000ba6c:	3e 96                	ds xchg esi,eax
c000ba6e:	00 c0                	add    al,al
c000ba70:	6c                   	ins    BYTE PTR es:[edi],dx
c000ba71:	00 00                	add    BYTE PTR [eax],al
c000ba73:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000ba76:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ba7c:	43                   	inc    ebx
c000ba7d:	2e 0c 42             	cs or  al,0x42
c000ba80:	2e 10 4a 2e          	adc    BYTE PTR cs:[edx+0x2e],cl
c000ba84:	14 42                	adc    al,0x42
c000ba86:	2e 18 41 2e          	sbb    BYTE PTR cs:[ecx+0x2e],al
c000ba8a:	1c 45                	sbb    al,0x45
c000ba8c:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ba90:	0c 42                	or     al,0x42
c000ba92:	2e 10 4a 2e          	adc    BYTE PTR cs:[edx+0x2e],cl
c000ba96:	14 42                	adc    al,0x42
c000ba98:	2e 18 41 2e          	sbb    BYTE PTR cs:[ecx+0x2e],al
c000ba9c:	1c 45                	sbb    al,0x45
c000ba9e:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000baa2:	00 46 2e             	add    BYTE PTR [esi+0x2e],al
c000baa5:	04 04                	add    al,0x4
c000baa7:	02 00                	add    al,BYTE PTR [eax]
c000baa9:	00 00                	add    BYTE PTR [eax],al
c000baab:	2e 08 45 2e          	or     BYTE PTR cs:[ebp+0x2e],al
c000baaf:	0c 41                	or     al,0x41
c000bab1:	2e 10 4b 2e          	adc    BYTE PTR cs:[ebx+0x2e],cl
c000bab5:	0c 41                	or     al,0x41
c000bab7:	2e 08 45 2e          	or     BYTE PTR cs:[ebp+0x2e],al
c000babb:	0c 45                	or     al,0x45
c000babd:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000bac1:	00 41 c5             	add    BYTE PTR [ecx-0x3b],al
c000bac4:	0c 04                	or     al,0x4
c000bac6:	04 00                	add    al,0x0
c000bac8:	1c 00                	sbb    al,0x0
c000baca:	00 00                	add    BYTE PTR [eax],al
c000bacc:	58                   	pop    eax
c000bacd:	0f 00 00             	sldt   WORD PTR [eax]
c000bad0:	aa                   	stos   BYTE PTR es:[edi],al
c000bad1:	96                   	xchg   esi,eax
c000bad2:	00 c0                	add    al,al
c000bad4:	56                   	push   esi
c000bad5:	00 00                	add    BYTE PTR [eax],al
c000bad7:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000bada:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000bae0:	02 52 0c             	add    dl,BYTE PTR [edx+0xc]
c000bae3:	04 04                	add    al,0x4
c000bae5:	c5 00                	lds    eax,FWORD PTR [eax]
c000bae7:	00 60 00             	add    BYTE PTR [eax+0x0],ah
c000baea:	00 00                	add    BYTE PTR [eax],al
c000baec:	78 0f                	js     c000bafd <_edata+0xf89>
c000baee:	00 00                	add    BYTE PTR [eax],al
c000baf0:	00 97 00 c0 5a 00    	add    BYTE PTR [edi+0x5ac000],dl
c000baf6:	00 00                	add    BYTE PTR [eax],al
c000baf8:	41                   	inc    ecx
c000baf9:	0e                   	push   cs
c000bafa:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000bb00:	44                   	inc    esp
c000bb01:	2e 0c 83             	cs or  al,0x83
c000bb04:	03 45 2e             	add    eax,DWORD PTR [ebp+0x2e]
c000bb07:	10 48 2e             	adc    BYTE PTR [eax+0x2e],cl
c000bb0a:	04 04                	add    al,0x4
c000bb0c:	04 00                	add    al,0x0
c000bb0e:	00 00                	add    BYTE PTR [eax],al
c000bb10:	2e 08 43 2e          	or     BYTE PTR cs:[ebx+0x2e],al
c000bb14:	0c 47                	or     al,0x47
c000bb16:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000bb1a:	04 04                	add    al,0x4
c000bb1c:	03 00                	add    eax,DWORD PTR [eax]
c000bb1e:	00 00                	add    BYTE PTR [eax],al
c000bb20:	2e 08 43 2e          	or     BYTE PTR cs:[ebx+0x2e],al
c000bb24:	0c 43                	or     al,0x43
c000bb26:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000bb2a:	0c 41                	or     al,0x41
c000bb2c:	2e 08 41 2e          	or     BYTE PTR cs:[ecx+0x2e],al
c000bb30:	0c 45                	or     al,0x45
c000bb32:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000bb36:	0c 41                	or     al,0x41
c000bb38:	2e 08 41 2e          	or     BYTE PTR cs:[ecx+0x2e],al
c000bb3c:	0c 45                	or     al,0x45
c000bb3e:	2e 10 4c c5 0c       	adc    BYTE PTR cs:[ebp+eax*8+0xc],cl
c000bb43:	04 04                	add    al,0x4
c000bb45:	c3                   	ret    
c000bb46:	41                   	inc    ecx
c000bb47:	13 03                	adc    eax,DWORD PTR [ebx]
c000bb49:	2e 00 00             	add    BYTE PTR cs:[eax],al
c000bb4c:	4c                   	dec    esp
c000bb4d:	00 00                	add    BYTE PTR [eax],al
c000bb4f:	00 dc                	add    ah,bl
c000bb51:	0f 00 00             	sldt   WORD PTR [eax]
c000bb54:	5a                   	pop    edx
c000bb55:	97                   	xchg   edi,eax
c000bb56:	00 c0                	add    al,al
c000bb58:	61                   	popa   
c000bb59:	00 00                	add    BYTE PTR [eax],al
c000bb5b:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000bb5e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000bb64:	52                   	push   edx
c000bb65:	2e 04 04             	cs add al,0x4
c000bb68:	01 00                	add    DWORD PTR [eax],eax
c000bb6a:	00 00                	add    BYTE PTR [eax],al
c000bb6c:	2e 08 44 2e 0c       	or     BYTE PTR cs:[esi+ebp*1+0xc],al
c000bb71:	45                   	inc    ebp
c000bb72:	2e 10 4b 2e          	adc    BYTE PTR cs:[ebx+0x2e],cl
c000bb76:	00 4e 2e             	add    BYTE PTR [esi+0x2e],cl
c000bb79:	04 04                	add    al,0x4
c000bb7b:	01 00                	add    DWORD PTR [eax],eax
c000bb7d:	00 00                	add    BYTE PTR [eax],al
c000bb7f:	2e 08 44 2e 0c       	or     BYTE PTR cs:[esi+ebp*1+0xc],al
c000bb84:	45                   	inc    ebp
c000bb85:	2e 10 50 2e          	adc    BYTE PTR cs:[eax+0x2e],dl
c000bb89:	0c 41                	or     al,0x41
c000bb8b:	2e 08 41 2e          	or     BYTE PTR cs:[ecx+0x2e],al
c000bb8f:	0c 43                	or     al,0x43
c000bb91:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000bb95:	00 41 c5             	add    BYTE PTR [ecx-0x3b],al
c000bb98:	0c 04                	or     al,0x4
c000bb9a:	04 00                	add    al,0x0
c000bb9c:	28 00                	sub    BYTE PTR [eax],al
c000bb9e:	00 00                	add    BYTE PTR [eax],al
c000bba0:	2c 10                	sub    al,0x10
c000bba2:	00 00                	add    BYTE PTR [eax],al
c000bba4:	bc 97 00 c0 ac       	mov    esp,0xacc00097
c000bba9:	00 00                	add    BYTE PTR [eax],al
c000bbab:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000bbae:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000bbb4:	42                   	inc    edx
c000bbb5:	86 04 87             	xchg   BYTE PTR [edi+eax*4],al
c000bbb8:	03 49 83             	add    ecx,DWORD PTR [ecx-0x7d]
c000bbbb:	05 02 96 c3 41       	add    eax,0x41c39602
c000bbc0:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000bbc4:	0c 04                	or     al,0x4
c000bbc6:	04 c5                	add    al,0xc5
c000bbc8:	1c 00                	sbb    al,0x0
c000bbca:	00 00                	add    BYTE PTR [eax],al
c000bbcc:	58                   	pop    eax
c000bbcd:	10 00                	adc    BYTE PTR [eax],al
c000bbcf:	00 68 98             	add    BYTE PTR [eax-0x68],ch
c000bbd2:	00 c0                	add    al,al
c000bbd4:	18 00                	sbb    BYTE PTR [eax],al
c000bbd6:	00 00                	add    BYTE PTR [eax],al
c000bbd8:	41                   	inc    ecx
c000bbd9:	0e                   	push   cs
c000bbda:	08 85 02 47 0d 05    	or     BYTE PTR [ebp+0x50d4702],al
c000bbe0:	4f                   	dec    edi
c000bbe1:	0c 04                	or     al,0x4
c000bbe3:	04 c5                	add    al,0xc5
c000bbe5:	00 00                	add    BYTE PTR [eax],al
c000bbe7:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
c000bbea:	00 00                	add    BYTE PTR [eax],al
c000bbec:	78 10                	js     c000bbfe <_edata+0x108a>
c000bbee:	00 00                	add    BYTE PTR [eax],al
c000bbf0:	80 98 00 c0 2f 00 00 	sbb    BYTE PTR [eax+0x2fc000],0x0
c000bbf7:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000bbfa:	08 85 02 47 0d 05    	or     BYTE PTR [ebp+0x50d4702],al
c000bc00:	5c                   	pop    esp
c000bc01:	0a c5                	or     al,ch
c000bc03:	0c 04                	or     al,0x4
c000bc05:	04 45                	add    al,0x45
c000bc07:	0b 45 c5             	or     eax,DWORD PTR [ebp-0x3b]
c000bc0a:	0c 04                	or     al,0x4
c000bc0c:	04 00                	add    al,0x0
	...

Disassembly of section .rodata:

c000bc10 <_rodata>:
c000bc10:	48                   	dec    eax
c000bc11:	65 6c                	gs ins BYTE PTR es:[edi],dx
c000bc13:	6c                   	ins    BYTE PTR es:[edi],dx
c000bc14:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000bc15:	20 77 6f             	and    BYTE PTR [edi+0x6f],dh
c000bc18:	72 6c                	jb     c000bc86 <__func__.857+0xe>
c000bc1a:	64 0a 00             	or     al,BYTE PTR fs:[eax]
c000bc1d:	50                   	push   eax
c000bc1e:	4b                   	dec    ebx
c000bc1f:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000bc20:	00 6b 5f             	add    BYTE PTR [ebx+0x5f],ch
c000bc23:	61                   	popa   
c000bc24:	00 6b 5f             	add    BYTE PTR [ebx+0x5f],ch
c000bc27:	62 00                	bound  eax,QWORD PTR [eax]
c000bc29:	00 00                	add    BYTE PTR [eax],al
c000bc2b:	00 62 79             	add    BYTE PTR [edx+0x79],ah
c000bc2e:	74 65                	je     c000bc95 <__func__.874+0xd>
c000bc30:	5f                   	pop    edi
c000bc31:	69 6e 64 65 78 20 3c 	imul   ebp,DWORD PTR [esi+0x64],0x3c207865
c000bc38:	20 28                	and    BYTE PTR [eax],ch
c000bc3a:	62 74 6d 70          	bound  esi,QWORD PTR [ebp+ebp*2+0x70]
c000bc3e:	2d 3e 62 74 6d       	sub    eax,0x6d74623e
c000bc43:	70 5f                	jo     c000bca4 <__func__.874+0x1c>
c000bc45:	62 79 74             	bound  edi,QWORD PTR [ecx+0x74]
c000bc48:	65 73 5f             	gs jae c000bcaa <__func__.874+0x22>
c000bc4b:	6c                   	ins    BYTE PTR es:[edi],dx
c000bc4c:	65 6e                	outs   dx,BYTE PTR gs:[esi]
c000bc4e:	29 00                	sub    DWORD PTR [eax],eax
c000bc50:	6c                   	ins    BYTE PTR es:[edi],dx
c000bc51:	69 62 2f 62 69 74 6d 	imul   esp,DWORD PTR [edx+0x2f],0x6d746962
c000bc58:	61                   	popa   
c000bc59:	70 2e                	jo     c000bc89 <__func__.874+0x1>
c000bc5b:	63 00                	arpl   WORD PTR [eax],ax
c000bc5d:	76 61                	jbe    c000bcc0 <__func__.874+0x38>
c000bc5f:	6c                   	ins    BYTE PTR es:[edi],dx
c000bc60:	75 65                	jne    c000bcc7 <__func__.874+0x3f>
c000bc62:	20 3d 3d 20 30 20    	and    BYTE PTR ds:0x2030203d,bh
c000bc68:	7c 7c                	jl     c000bce6 <__func__.874+0x5e>
c000bc6a:	20 76 61             	and    BYTE PTR [esi+0x61],dh
c000bc6d:	6c                   	ins    BYTE PTR es:[edi],dx
c000bc6e:	75 65                	jne    c000bcd5 <__func__.874+0x4d>
c000bc70:	20 3d 3d 20 31 00    	and    BYTE PTR ds:0x31203d,bh
	...

c000bc78 <__func__.857>:
c000bc78:	62 69 74             	bound  ebp,QWORD PTR [ecx+0x74]
c000bc7b:	6d                   	ins    DWORD PTR es:[edi],dx
c000bc7c:	61                   	popa   
c000bc7d:	70 5f                	jo     c000bcde <__func__.874+0x56>
c000bc7f:	61                   	popa   
c000bc80:	6c                   	ins    BYTE PTR es:[edi],dx
c000bc81:	6c                   	ins    BYTE PTR es:[edi],dx
c000bc82:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000bc83:	63 00                	arpl   WORD PTR [eax],ax
c000bc85:	00 00                	add    BYTE PTR [eax],al
	...

c000bc88 <__func__.874>:
c000bc88:	62 69 74             	bound  ebp,QWORD PTR [ecx+0x74]
c000bc8b:	6d                   	ins    DWORD PTR es:[edi],dx
c000bc8c:	61                   	popa   
c000bc8d:	70 5f                	jo     c000bcee <__func__.874+0x66>
c000bc8f:	73 65                	jae    c000bcf6 <__func__.874+0x6e>
c000bc91:	74 00                	je     c000bc93 <__func__.874+0xb>
c000bc93:	45                   	inc    ebp
c000bc94:	72 72                	jb     c000bd08 <__func__.874+0x80>
c000bc96:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000bc97:	72 0a                	jb     c000bca3 <__func__.874+0x1b>
c000bc99:	00 46 69             	add    BYTE PTR [esi+0x69],al
c000bc9c:	6c                   	ins    BYTE PTR es:[edi],dx
c000bc9d:	65 3a 00             	cmp    al,BYTE PTR gs:[eax]
c000bca0:	49                   	dec    ecx
c000bca1:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000bca2:	20 66 75             	and    BYTE PTR [esi+0x75],ah
c000bca5:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000bca6:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
c000bcaa:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000bcab:	3a 20                	cmp    ah,BYTE PTR [eax]
c000bcad:	00 4c 69 6e          	add    BYTE PTR [ecx+ebp*2+0x6e],cl
c000bcb1:	65 3a 00             	cmp    al,BYTE PTR gs:[eax]
c000bcb4:	43                   	inc    ebx
c000bcb5:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000bcb6:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000bcb7:	64 69 74 69 6f 6e 3a 	imul   esi,DWORD PTR fs:[ecx+ebp*2+0x6f],0x203a6e
c000bcbe:	20 00 
c000bcc0:	69 6e 74 72 3a 00 23 	imul   ebp,DWORD PTR [esi+0x74],0x23003a72
c000bcc7:	44                   	inc    esp
c000bcc8:	45                   	inc    ebp
c000bcc9:	20 44 69 76          	and    BYTE PTR [ecx+ebp*2+0x76],al
c000bccd:	69 64 65 20 45 72 72 	imul   esp,DWORD PTR [ebp+eiz*2+0x20],0x6f727245
c000bcd4:	6f 
c000bcd5:	72 00                	jb     c000bcd7 <__func__.874+0x4f>
c000bcd7:	23 44 42 20          	and    eax,DWORD PTR [edx+eax*2+0x20]
c000bcdb:	44                   	inc    esp
c000bcdc:	65 62 75 67          	bound  esi,QWORD PTR gs:[ebp+0x67]
c000bce0:	20 45 78             	and    BYTE PTR [ebp+0x78],al
c000bce3:	63 65 70             	arpl   WORD PTR [ebp+0x70],sp
c000bce6:	74 69                	je     c000bd51 <__func__.874+0xc9>
c000bce8:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000bce9:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000bcea:	00 4e 4d             	add    BYTE PTR [esi+0x4d],cl
c000bced:	49                   	dec    ecx
c000bcee:	20 49 6e             	and    BYTE PTR [ecx+0x6e],cl
c000bcf1:	74 65                	je     c000bd58 <__func__.874+0xd0>
c000bcf3:	72 72                	jb     c000bd67 <__func__.874+0xdf>
c000bcf5:	75 70                	jne    c000bd67 <__func__.874+0xdf>
c000bcf7:	74 00                	je     c000bcf9 <__func__.874+0x71>
c000bcf9:	23 42 50             	and    eax,DWORD PTR [edx+0x50]
c000bcfc:	20 42 72             	and    BYTE PTR [edx+0x72],al
c000bcff:	65 61                	gs popa 
c000bd01:	6b 70 6f 69          	imul   esi,DWORD PTR [eax+0x6f],0x69
c000bd05:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000bd06:	74 20                	je     c000bd28 <__func__.874+0xa0>
c000bd08:	45                   	inc    ebp
c000bd09:	78 63                	js     c000bd6e <__func__.874+0xe6>
c000bd0b:	65 70 74             	gs jo  c000bd82 <__func__.874+0xfa>
c000bd0e:	69 6f 6e 00 23 4f 46 	imul   ebp,DWORD PTR [edi+0x6e],0x464f2300
c000bd15:	20 4f 76             	and    BYTE PTR [edi+0x76],cl
c000bd18:	65 72 66             	gs jb  c000bd81 <__func__.874+0xf9>
c000bd1b:	6c                   	ins    BYTE PTR es:[edi],dx
c000bd1c:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000bd1d:	77 20                	ja     c000bd3f <__func__.874+0xb7>
c000bd1f:	45                   	inc    ebp
c000bd20:	78 63                	js     c000bd85 <__func__.874+0xfd>
c000bd22:	65 70 74             	gs jo  c000bd99 <__func__.874+0x111>
c000bd25:	69 6f 6e 00 23 42 52 	imul   ebp,DWORD PTR [edi+0x6e],0x52422300
c000bd2c:	20 42 4f             	and    BYTE PTR [edx+0x4f],al
c000bd2f:	55                   	push   ebp
c000bd30:	4e                   	dec    esi
c000bd31:	44                   	inc    esp
c000bd32:	20 52 61             	and    BYTE PTR [edx+0x61],dl
c000bd35:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000bd36:	67 65 20 45 78       	and    BYTE PTR gs:[di+0x78],al
c000bd3b:	63 65 65             	arpl   WORD PTR [ebp+0x65],sp
c000bd3e:	64 65 64 20 45 78    	fs gs and BYTE PTR fs:[ebp+0x78],al
c000bd44:	63 65 70             	arpl   WORD PTR [ebp+0x70],sp
c000bd47:	74 69                	je     c000bdb2 <__func__.874+0x12a>
c000bd49:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000bd4a:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000bd4b:	00 23                	add    BYTE PTR [ebx],ah
c000bd4d:	55                   	push   ebp
c000bd4e:	44                   	inc    esp
c000bd4f:	20 49 6e             	and    BYTE PTR [ecx+0x6e],cl
c000bd52:	76 61                	jbe    c000bdb5 <__func__.874+0x12d>
c000bd54:	6c                   	ins    BYTE PTR es:[edi],dx
c000bd55:	69 64 20 4f 70 63 6f 	imul   esp,DWORD PTR [eax+eiz*1+0x4f],0x646f6370
c000bd5c:	64 
c000bd5d:	65 20 45 78          	and    BYTE PTR gs:[ebp+0x78],al
c000bd61:	63 65 70             	arpl   WORD PTR [ebp+0x70],sp
c000bd64:	74 69                	je     c000bdcf <__func__.874+0x147>
c000bd66:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000bd67:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000bd68:	00 23                	add    BYTE PTR [ebx],ah
c000bd6a:	4e                   	dec    esi
c000bd6b:	4d                   	dec    ebp
c000bd6c:	20 44 65 76          	and    BYTE PTR [ebp+eiz*2+0x76],al
c000bd70:	69 63 65 20 4e 6f 74 	imul   esp,DWORD PTR [ebx+0x65],0x746f4e20
c000bd77:	20 41 76             	and    BYTE PTR [ecx+0x76],al
c000bd7a:	61                   	popa   
c000bd7b:	69 6c 61 62 6c 65 20 	imul   ebp,DWORD PTR [ecx+eiz*2+0x62],0x4520656c
c000bd82:	45 
c000bd83:	78 63                	js     c000bde8 <__func__.874+0x160>
c000bd85:	65 70 74             	gs jo  c000bdfc <__func__.874+0x174>
c000bd88:	69 6f 6e 00 23 44 46 	imul   ebp,DWORD PTR [edi+0x6e],0x46442300
c000bd8f:	20 44 6f 75          	and    BYTE PTR [edi+ebp*2+0x75],al
c000bd93:	62 6c 65 20          	bound  ebp,QWORD PTR [ebp+eiz*2+0x20]
c000bd97:	46                   	inc    esi
c000bd98:	61                   	popa   
c000bd99:	75 6c                	jne    c000be07 <__func__.874+0x17f>
c000bd9b:	74 20                	je     c000bdbd <__func__.874+0x135>
c000bd9d:	45                   	inc    ebp
c000bd9e:	78 63                	js     c000be03 <__func__.874+0x17b>
c000bda0:	65 70 74             	gs jo  c000be17 <__func__.874+0x18f>
c000bda3:	69 6f 6e 00 43 6f 70 	imul   ebp,DWORD PTR [edi+0x6e],0x706f4300
c000bdaa:	72 6f                	jb     c000be1b <__func__.874+0x193>
c000bdac:	63 65 73             	arpl   WORD PTR [ebp+0x73],sp
c000bdaf:	73 6f                	jae    c000be20 <__func__.874+0x198>
c000bdb1:	72 20                	jb     c000bdd3 <__func__.874+0x14b>
c000bdb3:	53                   	push   ebx
c000bdb4:	65 67 6d             	gs ins DWORD PTR es:[di],dx
c000bdb7:	65 6e                	outs   dx,BYTE PTR gs:[esi]
c000bdb9:	74 20                	je     c000bddb <__func__.874+0x153>
c000bdbb:	4f                   	dec    edi
c000bdbc:	76 65                	jbe    c000be23 <__func__.874+0x19b>
c000bdbe:	72 72                	jb     c000be32 <__func__.874+0x1aa>
c000bdc0:	75 6e                	jne    c000be30 <__func__.874+0x1a8>
c000bdc2:	00 23                	add    BYTE PTR [ebx],ah
c000bdc4:	54                   	push   esp
c000bdc5:	53                   	push   ebx
c000bdc6:	20 49 6e             	and    BYTE PTR [ecx+0x6e],cl
c000bdc9:	76 61                	jbe    c000be2c <__func__.874+0x1a4>
c000bdcb:	6c                   	ins    BYTE PTR es:[edi],dx
c000bdcc:	69 64 20 54 53 53 20 	imul   esp,DWORD PTR [eax+eiz*1+0x54],0x45205353
c000bdd3:	45 
c000bdd4:	78 63                	js     c000be39 <__func__.874+0x1b1>
c000bdd6:	65 70 74             	gs jo  c000be4d <__func__.874+0x1c5>
c000bdd9:	69 6f 6e 00 23 4e 50 	imul   ebp,DWORD PTR [edi+0x6e],0x504e2300
c000bde0:	20 53 65             	and    BYTE PTR [ebx+0x65],dl
c000bde3:	67 6d                	ins    DWORD PTR es:[di],dx
c000bde5:	65 6e                	outs   dx,BYTE PTR gs:[esi]
c000bde7:	74 20                	je     c000be09 <__func__.874+0x181>
c000bde9:	4e                   	dec    esi
c000bdea:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000bdeb:	74 20                	je     c000be0d <__func__.874+0x185>
c000bded:	50                   	push   eax
c000bdee:	72 65                	jb     c000be55 <__func__.874+0x1cd>
c000bdf0:	73 65                	jae    c000be57 <__func__.874+0x1cf>
c000bdf2:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000bdf3:	74 00                	je     c000bdf5 <__func__.874+0x16d>
c000bdf5:	23 53 53             	and    edx,DWORD PTR [ebx+0x53]
c000bdf8:	20 53 74             	and    BYTE PTR [ebx+0x74],dl
c000bdfb:	61                   	popa   
c000bdfc:	63 6b 20             	arpl   WORD PTR [ebx+0x20],bp
c000bdff:	46                   	inc    esi
c000be00:	61                   	popa   
c000be01:	75 6c                	jne    c000be6f <__func__.874+0x1e7>
c000be03:	74 20                	je     c000be25 <__func__.874+0x19d>
c000be05:	45                   	inc    ebp
c000be06:	78 63                	js     c000be6b <__func__.874+0x1e3>
c000be08:	65 70 74             	gs jo  c000be7f <__func__.874+0x1f7>
c000be0b:	69 6f 6e 00 23 47 50 	imul   ebp,DWORD PTR [edi+0x6e],0x50472300
c000be12:	20 47 65             	and    BYTE PTR [edi+0x65],al
c000be15:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000be16:	65 72 61             	gs jb  c000be7a <__func__.874+0x1f2>
c000be19:	6c                   	ins    BYTE PTR es:[edi],dx
c000be1a:	20 50 72             	and    BYTE PTR [eax+0x72],dl
c000be1d:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000be1e:	74 65                	je     c000be85 <__func__.874+0x1fd>
c000be20:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
c000be24:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000be25:	20 45 78             	and    BYTE PTR [ebp+0x78],al
c000be28:	63 65 70             	arpl   WORD PTR [ebp+0x70],sp
c000be2b:	74 69                	je     c000be96 <__func__.874+0x20e>
c000be2d:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000be2e:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000be2f:	00 23                	add    BYTE PTR [ebx],ah
c000be31:	50                   	push   eax
c000be32:	46                   	inc    esi
c000be33:	20 50 61             	and    BYTE PTR [eax+0x61],dl
c000be36:	67 65 2d 46 61 75 6c 	addr16 gs sub eax,0x6c756146
c000be3d:	74 20                	je     c000be5f <__func__.874+0x1d7>
c000be3f:	45                   	inc    ebp
c000be40:	78 63                	js     c000bea5 <__func__.874+0x21d>
c000be42:	65 70 74             	gs jo  c000beb9 <__func__.874+0x231>
c000be45:	69 6f 6e 00 52 65 73 	imul   ebp,DWORD PTR [edi+0x6e],0x73655200
c000be4c:	65 72 76             	gs jb  c000bec5 <__func__.874+0x23d>
c000be4f:	65 64 00 23          	gs add BYTE PTR fs:[ebx],ah
c000be53:	4d                   	dec    ebp
c000be54:	46                   	inc    esi
c000be55:	20 78 38             	and    BYTE PTR [eax+0x38],bh
c000be58:	37                   	aaa    
c000be59:	20 46 50             	and    BYTE PTR [esi+0x50],al
c000be5c:	55                   	push   ebp
c000be5d:	20 46 6c             	and    BYTE PTR [esi+0x6c],al
c000be60:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000be61:	61                   	popa   
c000be62:	74 69                	je     c000becd <__func__.874+0x245>
c000be64:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000be65:	67 2d 50 6f 69 6e    	addr16 sub eax,0x6e696f50
c000be6b:	74 20                	je     c000be8d <__func__.874+0x205>
c000be6d:	45                   	inc    ebp
c000be6e:	72 72                	jb     c000bee2 <digits.958+0x12>
c000be70:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000be71:	72 00                	jb     c000be73 <__func__.874+0x1eb>
c000be73:	23 41 43             	and    eax,DWORD PTR [ecx+0x43]
c000be76:	20 41 6c             	and    BYTE PTR [ecx+0x6c],al
c000be79:	69 67 6e 6d 65 6e 74 	imul   esp,DWORD PTR [edi+0x6e],0x746e656d
c000be80:	20 43 68             	and    BYTE PTR [ebx+0x68],al
c000be83:	65 63 6b 20          	arpl   WORD PTR gs:[ebx+0x20],bp
c000be87:	45                   	inc    ebp
c000be88:	78 63                	js     c000beed <digits.958+0x1d>
c000be8a:	65 70 74             	gs jo  c000bf01 <digits.958+0x31>
c000be8d:	69 6f 6e 00 23 4d 43 	imul   ebp,DWORD PTR [edi+0x6e],0x434d2300
c000be94:	20 4d 61             	and    BYTE PTR [ebp+0x61],cl
c000be97:	63 68 69             	arpl   WORD PTR [eax+0x69],bp
c000be9a:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000be9b:	65 2d 43 68 65 63    	gs sub eax,0x63656843
c000bea1:	6b 20 45             	imul   esp,DWORD PTR [eax],0x45
c000bea4:	78 63                	js     c000bf09 <digits.958+0x39>
c000bea6:	65 70 74             	gs jo  c000bf1d <digits.958+0x4d>
c000bea9:	69 6f 6e 00 23 58 46 	imul   ebp,DWORD PTR [edi+0x6e],0x46582300
c000beb0:	20 53 49             	and    BYTE PTR [ebx+0x49],dl
c000beb3:	4d                   	dec    ebp
c000beb4:	44                   	inc    esp
c000beb5:	20 46 6c             	and    BYTE PTR [esi+0x6c],al
c000beb8:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000beb9:	61                   	popa   
c000beba:	74 69                	je     c000bf25 <digits.958+0x55>
c000bebc:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000bebd:	67 2d 50 6f 69 6e    	addr16 sub eax,0x6e696f50
c000bec3:	74 20                	je     c000bee5 <digits.958+0x15>
c000bec5:	45                   	inc    ebp
c000bec6:	78 63                	js     c000bf2b <digits.958+0x5b>
c000bec8:	65 70 74             	gs jo  c000bf3f <digits.958+0x6f>
c000becb:	69 6f 6e 00 00 30 31 	imul   ebp,DWORD PTR [edi+0x6e],0x31300000

c000bed0 <digits.958>:
c000bed0:	30 31                	xor    BYTE PTR [ecx],dh
c000bed2:	32 33                	xor    dh,BYTE PTR [ebx]
c000bed4:	34 35                	xor    al,0x35
c000bed6:	36 37                	ss aaa 
c000bed8:	38 39                	cmp    BYTE PTR [ecx],bh
c000beda:	41                   	inc    ecx
c000bedb:	42                   	inc    edx
c000bedc:	43                   	inc    ebx
c000bedd:	44                   	inc    esp
c000bede:	45                   	inc    ebp
c000bedf:	46                   	inc    esi
c000bee0:	47                   	inc    edi
c000bee1:	48                   	dec    eax
c000bee2:	49                   	dec    ecx
c000bee3:	4a                   	dec    edx
c000bee4:	4b                   	dec    ebx
c000bee5:	4c                   	dec    esp
c000bee6:	4d                   	dec    ebp
c000bee7:	4e                   	dec    esi
c000bee8:	4f                   	dec    edi
c000bee9:	50                   	push   eax
c000beea:	51                   	push   ecx
c000beeb:	52                   	push   edx
c000beec:	53                   	push   ebx
c000beed:	54                   	push   esp
c000beee:	55                   	push   ebp
c000beef:	56                   	push   esi
c000bef0:	57                   	push   edi
c000bef1:	58                   	pop    eax
c000bef2:	59                   	pop    ecx
c000bef3:	5a                   	pop    edx
c000bef4:	00 00                	add    BYTE PTR [eax],al
c000bef6:	00 00                	add    BYTE PTR [eax],al
c000bef8:	64 73 74             	fs jae c000bf6f <_erodata+0x3>
c000befb:	5f                   	pop    edi
c000befc:	5f                   	pop    edi
c000befd:	20 21                	and    BYTE PTR [ecx],ah
c000beff:	3d 20 4e 55 4c       	cmp    eax,0x4c554e20
c000bf04:	4c                   	dec    esp
c000bf05:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
c000bf09:	2f                   	das    
c000bf0a:	73 74                	jae    c000bf80 <_ebss+0xc>
c000bf0c:	72 69                	jb     c000bf77 <_ebss+0x3>
c000bf0e:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000bf0f:	67 2e 63 00          	arpl   WORD PTR cs:[bx+si],ax
c000bf13:	64 73 74             	fs jae c000bf8a <_ebss+0x16>
c000bf16:	5f                   	pop    edi
c000bf17:	5f                   	pop    edi
c000bf18:	20 21                	and    BYTE PTR [ecx],ah
c000bf1a:	3d 20 4e 55 4c       	cmp    eax,0x4c554e20
c000bf1f:	4c                   	dec    esp
c000bf20:	20 26                	and    BYTE PTR [esi],ah
c000bf22:	26 20 73 72          	and    BYTE PTR es:[ebx+0x72],dh
c000bf26:	63 5f 5f             	arpl   WORD PTR [edi+0x5f],bx
c000bf29:	20 21                	and    BYTE PTR [ecx],ah
c000bf2b:	3d 20 4e 55 4c       	cmp    eax,0x4c554e20
c000bf30:	4c                   	dec    esp
c000bf31:	00 70 31             	add    BYTE PTR [eax+0x31],dh
c000bf34:	5f                   	pop    edi
c000bf35:	5f                   	pop    edi
c000bf36:	20 21                	and    BYTE PTR [ecx],ah
c000bf38:	3d 20 4e 55 4c       	cmp    eax,0x4c554e20
c000bf3d:	4c                   	dec    esp
c000bf3e:	20 26                	and    BYTE PTR [esi],ah
c000bf40:	26 20 70 32          	and    BYTE PTR es:[eax+0x32],dh
c000bf44:	5f                   	pop    edi
c000bf45:	5f                   	pop    edi
c000bf46:	20 21                	and    BYTE PTR [ecx],ah
c000bf48:	3d 20 4e 55 4c       	cmp    eax,0x4c554e20
c000bf4d:	4c                   	dec    esp
	...

c000bf50 <__func__.830>:
c000bf50:	6d                   	ins    DWORD PTR es:[edi],dx
c000bf51:	65 6d                	gs ins DWORD PTR es:[edi],dx
c000bf53:	73 65                	jae    c000bfba <Screen+0x2e>
c000bf55:	74 00                	je     c000bf57 <__func__.830+0x7>
	...

c000bf58 <__func__.841>:
c000bf58:	6d                   	ins    DWORD PTR es:[edi],dx
c000bf59:	65 6d                	gs ins DWORD PTR es:[edi],dx
c000bf5b:	63 70 79             	arpl   WORD PTR [eax+0x79],si
	...

c000bf60 <__func__.853>:
c000bf60:	6d                   	ins    DWORD PTR es:[edi],dx
c000bf61:	65 6d                	gs ins DWORD PTR es:[edi],dx
c000bf63:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
c000bf66:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
c000bf69:	69                   	.byte 0x69
c000bf6a:	6e                   	outs   dx,BYTE PTR ds:[esi]
	...

Disassembly of section .bss:

c000bf6c <_bss>:
c000bf6c:	00 00                	add    BYTE PTR [eax],al
	...

c000bf70 <ticks>:
c000bf70:	00 00                	add    BYTE PTR [eax],al
	...

c000bf74 <_ebss>:
	...

c000bf8c <Screen>:
	...

c000bfd8 <intr_name>:
	...

c000c094 <idt>:
	...

c000c20c <user_pool>:
	...

c0013f1c <user_vaddr>:
	...

c001bc2c <kernel_vaddr>:
	...

c002393c <kernel_pool>:
	...

c002b64c <all_thread>:
	...

c002b668 <main_thread>:
c002b668:	00 00                	add    BYTE PTR [eax],al
	...

c002b66c <ready_thread>:
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
