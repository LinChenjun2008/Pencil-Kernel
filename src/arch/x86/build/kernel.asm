
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
c0007f47:	0f 01 15 a8 9b 00 c0 	lgdtd  ds:0xc0009ba8
c0007f4e:	e9 d4 17 00 00       	jmp    c0009727 <_etext>
c0007f53:	e9 fb ff ff ff       	jmp    c0007f53 <_start+0x53>

c0007f58 <k_thread_a>:
c0007f58:	55                   	push   ebp
c0007f59:	89 e5                	mov    ebp,esp
c0007f5b:	eb fe                	jmp    c0007f5b <k_thread_a+0x3>
c0007f5d:	00 00                	add    BYTE PTR [eax],al
	...

c0007f60 <bitmap_init>:
c0007f60:	55                   	push   ebp
c0007f61:	89 e5                	mov    ebp,esp
c0007f63:	83 ec 0c             	sub    esp,0xc
c0007f66:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0007f69:	ff 30                	push   DWORD PTR [eax]
c0007f6b:	6a 00                	push   0x0
c0007f6d:	ff 70 04             	push   DWORD PTR [eax+0x4]
c0007f70:	e8 b3 15 00 00       	call   c0009528 <memset>
c0007f75:	83 c4 10             	add    esp,0x10
c0007f78:	c9                   	leave  
c0007f79:	c3                   	ret    

c0007f7a <bitmap_scan_test>:
c0007f7a:	55                   	push   ebp
c0007f7b:	89 e5                	mov    ebp,esp
c0007f7d:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
c0007f80:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
c0007f83:	5d                   	pop    ebp
c0007f84:	8b 52 04             	mov    edx,DWORD PTR [edx+0x4]
c0007f87:	89 c8                	mov    eax,ecx
c0007f89:	83 e1 07             	and    ecx,0x7
c0007f8c:	c1 e8 03             	shr    eax,0x3
c0007f8f:	0f b6 04 02          	movzx  eax,BYTE PTR [edx+eax*1]
c0007f93:	ba 01 00 00 00       	mov    edx,0x1
c0007f98:	d3 e2                	shl    edx,cl
c0007f9a:	21 d0                	and    eax,edx
c0007f9c:	c3                   	ret    

c0007f9d <bitmap_alloc>:
c0007f9d:	55                   	push   ebp
c0007f9e:	89 e5                	mov    ebp,esp
c0007fa0:	57                   	push   edi
c0007fa1:	56                   	push   esi
c0007fa2:	31 f6                	xor    esi,esi
c0007fa4:	53                   	push   ebx
c0007fa5:	83 ec 1c             	sub    esp,0x1c
c0007fa8:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c0007fab:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
c0007fae:	eb 01                	jmp    c0007fb1 <bitmap_alloc+0x14>
c0007fb0:	46                   	inc    esi
c0007fb1:	80 3c 30 ff          	cmp    BYTE PTR [eax+esi*1],0xff
c0007fb5:	75 04                	jne    c0007fbb <bitmap_alloc+0x1e>
c0007fb7:	3b 33                	cmp    esi,DWORD PTR [ebx]
c0007fb9:	72 f5                	jb     c0007fb0 <bitmap_alloc+0x13>
c0007fbb:	3b 33                	cmp    esi,DWORD PTR [ebx]
c0007fbd:	72 19                	jb     c0007fd8 <bitmap_alloc+0x3b>
c0007fbf:	68 1c b9 00 c0       	push   0xc000b91c
c0007fc4:	68 68 b9 00 c0       	push   0xc000b968
c0007fc9:	6a 2e                	push   0x2e
c0007fcb:	68 40 b9 00 c0       	push   0xc000b940
c0007fd0:	e8 ef 00 00 00       	call   c00080c4 <panic_spin>
c0007fd5:	83 c4 10             	add    esp,0x10
c0007fd8:	8b 13                	mov    edx,DWORD PTR [ebx]
c0007fda:	83 c8 ff             	or     eax,0xffffffff
c0007fdd:	39 d6                	cmp    esi,edx
c0007fdf:	74 72                	je     c0008053 <bitmap_alloc+0xb6>
c0007fe1:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
c0007fe4:	31 c9                	xor    ecx,ecx
c0007fe6:	bf 01 00 00 00       	mov    edi,0x1
c0007feb:	89 75 e4             	mov    DWORD PTR [ebp-0x1c],esi
c0007fee:	89 55 dc             	mov    DWORD PTR [ebp-0x24],edx
c0007ff1:	8a 04 30             	mov    al,BYTE PTR [eax+esi*1]
c0007ff4:	eb 01                	jmp    c0007ff7 <bitmap_alloc+0x5a>
c0007ff6:	41                   	inc    ecx
c0007ff7:	89 fe                	mov    esi,edi
c0007ff9:	d3 e6                	shl    esi,cl
c0007ffb:	89 f2                	mov    edx,esi
c0007ffd:	84 d0                	test   al,dl
c0007fff:	75 f5                	jne    c0007ff6 <bitmap_alloc+0x59>
c0008001:	8b 75 e4             	mov    esi,DWORD PTR [ebp-0x1c]
c0008004:	83 7d 0c 01          	cmp    DWORD PTR [ebp+0xc],0x1
c0008008:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
c000800b:	8d 0c f1             	lea    ecx,[ecx+esi*8]
c000800e:	89 c8                	mov    eax,ecx
c0008010:	74 41                	je     c0008053 <bitmap_alloc+0xb6>
c0008012:	8d 3c d5 00 00 00 00 	lea    edi,[edx*8+0x0]
c0008019:	be 01 00 00 00       	mov    esi,0x1
c000801e:	29 cf                	sub    edi,ecx
c0008020:	8d 51 01             	lea    edx,[ecx+0x1]
c0008023:	eb 27                	jmp    c000804c <bitmap_alloc+0xaf>
c0008025:	50                   	push   eax
c0008026:	46                   	inc    esi
c0008027:	50                   	push   eax
c0008028:	52                   	push   edx
c0008029:	53                   	push   ebx
c000802a:	89 55 e0             	mov    DWORD PTR [ebp-0x20],edx
c000802d:	e8 48 ff ff ff       	call   c0007f7a <bitmap_scan_test>
c0008032:	83 c4 10             	add    esp,0x10
c0008035:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
c0008038:	85 c0                	test   eax,eax
c000803a:	74 02                	je     c000803e <bitmap_alloc+0xa1>
c000803c:	31 f6                	xor    esi,esi
c000803e:	3b 75 0c             	cmp    esi,DWORD PTR [ebp+0xc]
c0008041:	75 07                	jne    c000804a <bitmap_alloc+0xad>
c0008043:	29 f2                	sub    edx,esi
c0008045:	8d 42 01             	lea    eax,[edx+0x1]
c0008048:	eb 09                	jmp    c0008053 <bitmap_alloc+0xb6>
c000804a:	4f                   	dec    edi
c000804b:	42                   	inc    edx
c000804c:	85 ff                	test   edi,edi
c000804e:	75 d5                	jne    c0008025 <bitmap_alloc+0x88>
c0008050:	83 c8 ff             	or     eax,0xffffffff
c0008053:	8d 65 f4             	lea    esp,[ebp-0xc]
c0008056:	5b                   	pop    ebx
c0008057:	5e                   	pop    esi
c0008058:	5f                   	pop    edi
c0008059:	5d                   	pop    ebp
c000805a:	c3                   	ret    

c000805b <bitmap_set>:
c000805b:	55                   	push   ebp
c000805c:	89 e5                	mov    ebp,esp
c000805e:	57                   	push   edi
c000805f:	56                   	push   esi
c0008060:	53                   	push   ebx
c0008061:	83 ec 0c             	sub    esp,0xc
c0008064:	8a 5d 10             	mov    bl,BYTE PTR [ebp+0x10]
c0008067:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
c000806a:	8b 7d 0c             	mov    edi,DWORD PTR [ebp+0xc]
c000806d:	80 fb 01             	cmp    bl,0x1
c0008070:	76 19                	jbe    c000808b <bitmap_set+0x30>
c0008072:	68 4d b9 00 c0       	push   0xc000b94d
c0008077:	68 78 b9 00 c0       	push   0xc000b978
c000807c:	6a 65                	push   0x65
c000807e:	68 40 b9 00 c0       	push   0xc000b940
c0008083:	e8 3c 00 00 00       	call   c00080c4 <panic_spin>
c0008088:	83 c4 10             	add    esp,0x10
c000808b:	89 fa                	mov    edx,edi
c000808d:	89 f9                	mov    ecx,edi
c000808f:	c1 ea 03             	shr    edx,0x3
c0008092:	83 e1 07             	and    ecx,0x7
c0008095:	84 db                	test   bl,bl
c0008097:	74 06                	je     c000809f <bitmap_set+0x44>
c0008099:	fe cb                	dec    bl
c000809b:	75 1e                	jne    c00080bb <bitmap_set+0x60>
c000809d:	eb 10                	jmp    c00080af <bitmap_set+0x54>
c000809f:	03 56 04             	add    edx,DWORD PTR [esi+0x4]
c00080a2:	b8 01 00 00 00       	mov    eax,0x1
c00080a7:	d3 e0                	shl    eax,cl
c00080a9:	f7 d0                	not    eax
c00080ab:	20 02                	and    BYTE PTR [edx],al
c00080ad:	eb 0c                	jmp    c00080bb <bitmap_set+0x60>
c00080af:	03 56 04             	add    edx,DWORD PTR [esi+0x4]
c00080b2:	b8 01 00 00 00       	mov    eax,0x1
c00080b7:	d3 e0                	shl    eax,cl
c00080b9:	08 02                	or     BYTE PTR [edx],al
c00080bb:	8d 65 f4             	lea    esp,[ebp-0xc]
c00080be:	5b                   	pop    ebx
c00080bf:	5e                   	pop    esi
c00080c0:	5f                   	pop    edi
c00080c1:	5d                   	pop    ebp
c00080c2:	c3                   	ret    
	...

c00080c4 <panic_spin>:
c00080c4:	55                   	push   ebp
c00080c5:	89 e5                	mov    ebp,esp
c00080c7:	83 ec 08             	sub    esp,0x8
c00080ca:	e8 50 0d 00 00       	call   c0008e1f <intr_disable>
c00080cf:	83 ec 0c             	sub    esp,0xc
c00080d2:	68 83 b9 00 c0       	push   0xc000b983
c00080d7:	e8 fe 13 00 00       	call   c00094da <put_str>
c00080dc:	c7 04 24 8a b9 00 c0 	mov    DWORD PTR [esp],0xc000b98a
c00080e3:	e8 f2 13 00 00       	call   c00094da <put_str>
c00080e8:	5a                   	pop    edx
c00080e9:	ff 75 08             	push   DWORD PTR [ebp+0x8]
c00080ec:	e8 e9 13 00 00       	call   c00094da <put_str>
c00080f1:	c7 04 24 0a 00 00 00 	mov    DWORD PTR [esp],0xa
c00080f8:	e8 46 13 00 00       	call   c0009443 <put_char>
c00080fd:	c7 04 24 90 b9 00 c0 	mov    DWORD PTR [esp],0xc000b990
c0008104:	e8 d1 13 00 00       	call   c00094da <put_str>
c0008109:	59                   	pop    ecx
c000810a:	ff 75 10             	push   DWORD PTR [ebp+0x10]
c000810d:	e8 c8 13 00 00       	call   c00094da <put_str>
c0008112:	c7 04 24 0a 00 00 00 	mov    DWORD PTR [esp],0xa
c0008119:	e8 25 13 00 00       	call   c0009443 <put_char>
c000811e:	c7 04 24 9e b9 00 c0 	mov    DWORD PTR [esp],0xc000b99e
c0008125:	e8 b0 13 00 00       	call   c00094da <put_str>
c000812a:	58                   	pop    eax
c000812b:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
c000812e:	e8 c6 13 00 00       	call   c00094f9 <put_int>
c0008133:	c7 04 24 0a 00 00 00 	mov    DWORD PTR [esp],0xa
c000813a:	e8 04 13 00 00       	call   c0009443 <put_char>
c000813f:	c7 04 24 a4 b9 00 c0 	mov    DWORD PTR [esp],0xc000b9a4
c0008146:	e8 8f 13 00 00       	call   c00094da <put_str>
c000814b:	58                   	pop    eax
c000814c:	ff 75 14             	push   DWORD PTR [ebp+0x14]
c000814f:	e8 86 13 00 00       	call   c00094da <put_str>
c0008154:	c7 04 24 0a 00 00 00 	mov    DWORD PTR [esp],0xa
c000815b:	e8 e3 12 00 00       	call   c0009443 <put_char>
c0008160:	83 c4 10             	add    esp,0x10
c0008163:	eb fe                	jmp    c0008163 <panic_spin+0x9f>
c0008165:	00 00                	add    BYTE PTR [eax],al
	...

c0008168 <RectangleFill>:
c0008168:	55                   	push   ebp
c0008169:	89 e5                	mov    ebp,esp
c000816b:	57                   	push   edi
c000816c:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
c000816f:	56                   	push   esi
c0008170:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
c0008173:	53                   	push   ebx
c0008174:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c0008177:	83 3d 0c 7c 00 00 01 	cmp    DWORD PTR ds:0x7c0c,0x1
c000817e:	75 30                	jne    c00081b0 <RectangleFill+0x48>
c0008180:	89 ca                	mov    edx,ecx
c0008182:	81 e2 00 00 00 ff    	and    edx,0xff000000
c0008188:	81 fa 00 00 00 ff    	cmp    edx,0xff000000
c000818e:	75 16                	jne    c00081a6 <RectangleFill+0x3e>
c0008190:	eb 1e                	jmp    c00081b0 <RectangleFill+0x48>
c0008192:	8b 7b 04             	mov    edi,DWORD PTR [ebx+0x4]
c0008195:	8b 33                	mov    esi,DWORD PTR [ebx]
c0008197:	0f af f8             	imul   edi,eax
c000819a:	01 d7                	add    edi,edx
c000819c:	42                   	inc    edx
c000819d:	89 0c be             	mov    DWORD PTR [esi+edi*4],ecx
c00081a0:	3b 55 18             	cmp    edx,DWORD PTR [ebp+0x18]
c00081a3:	7e ed                	jle    c0008192 <RectangleFill+0x2a>
c00081a5:	40                   	inc    eax
c00081a6:	3b 45 1c             	cmp    eax,DWORD PTR [ebp+0x1c]
c00081a9:	7f 05                	jg     c00081b0 <RectangleFill+0x48>
c00081ab:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
c00081ae:	eb f0                	jmp    c00081a0 <RectangleFill+0x38>
c00081b0:	5b                   	pop    ebx
c00081b1:	5e                   	pop    esi
c00081b2:	5f                   	pop    edi
c00081b3:	5d                   	pop    ebp
c00081b4:	c3                   	ret    

c00081b5 <init_Rectangle>:
c00081b5:	55                   	push   ebp
c00081b6:	89 e5                	mov    ebp,esp
c00081b8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c00081bb:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
c00081be:	89 10                	mov    DWORD PTR [eax],edx
c00081c0:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
c00081c3:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
c00081c6:	8b 55 14             	mov    edx,DWORD PTR [ebp+0x14]
c00081c9:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
c00081cc:	8b 55 18             	mov    edx,DWORD PTR [ebp+0x18]
c00081cf:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
c00081d2:	8b 55 1c             	mov    edx,DWORD PTR [ebp+0x1c]
c00081d5:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
c00081d8:	5d                   	pop    ebp
c00081d9:	c3                   	ret    

c00081da <init_screen>:
c00081da:	55                   	push   ebp
c00081db:	89 e5                	mov    ebp,esp
c00081dd:	53                   	push   ebx
c00081de:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c00081e1:	83 3d 0c 7c 00 00 01 	cmp    DWORD PTR ds:0x7c0c,0x1
c00081e8:	0f 85 df 00 00 00    	jne    c00082cd <init_screen+0xf3>
c00081ee:	a1 1c 7c 00 00       	mov    eax,ds:0x7c1c
c00081f3:	8b 15 18 7c 00 00    	mov    edx,DWORD PTR ds:0x7c18
c00081f9:	c7 43 0c 00 00 00 00 	mov    DWORD PTR [ebx+0xc],0x0
c0008200:	c7 43 10 00 00 00 00 	mov    DWORD PTR [ebx+0x10],0x0
c0008207:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
c000820a:	89 53 04             	mov    DWORD PTR [ebx+0x4],edx
c000820d:	a1 1c 7c 00 00       	mov    eax,ds:0x7c1c
c0008212:	c7 03 00 00 00 fe    	mov    DWORD PTR [ebx],0xfe000000
c0008218:	83 e8 33             	sub    eax,0x33
c000821b:	50                   	push   eax
c000821c:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c0008221:	48                   	dec    eax
c0008222:	50                   	push   eax
c0008223:	6a 00                	push   0x0
c0008225:	6a 00                	push   0x0
c0008227:	68 84 84 00 00       	push   0x8484
c000822c:	53                   	push   ebx
c000822d:	e8 36 ff ff ff       	call   c0008168 <RectangleFill>
c0008232:	a1 1c 7c 00 00       	mov    eax,ds:0x7c1c
c0008237:	8d 50 ff             	lea    edx,[eax-0x1]
c000823a:	83 e8 33             	sub    eax,0x33
c000823d:	52                   	push   edx
c000823e:	8b 15 18 7c 00 00    	mov    edx,DWORD PTR ds:0x7c18
c0008244:	4a                   	dec    edx
c0008245:	52                   	push   edx
c0008246:	50                   	push   eax
c0008247:	6a 00                	push   0x0
c0008249:	68 c6 c6 c6 00       	push   0xc6c6c6
c000824e:	53                   	push   ebx
c000824f:	e8 14 ff ff ff       	call   c0008168 <RectangleFill>
c0008254:	a1 1c 7c 00 00       	mov    eax,ds:0x7c1c
c0008259:	83 c4 30             	add    esp,0x30
c000825c:	8d 50 f8             	lea    edx,[eax-0x8]
c000825f:	83 e8 26             	sub    eax,0x26
c0008262:	52                   	push   edx
c0008263:	6a 2b                	push   0x2b
c0008265:	50                   	push   eax
c0008266:	6a 0d                	push   0xd
c0008268:	68 84 84 84 00       	push   0x848484
c000826d:	53                   	push   ebx
c000826e:	e8 f5 fe ff ff       	call   c0008168 <RectangleFill>
c0008273:	a1 1c 7c 00 00       	mov    eax,ds:0x7c1c
c0008278:	8d 50 f5             	lea    edx,[eax-0xb]
c000827b:	83 e8 29             	sub    eax,0x29
c000827e:	52                   	push   edx
c000827f:	6a 28                	push   0x28
c0008281:	50                   	push   eax
c0008282:	6a 0a                	push   0xa
c0008284:	68 ff ff ff 00       	push   0xffffff
c0008289:	53                   	push   ebx
c000828a:	e8 d9 fe ff ff       	call   c0008168 <RectangleFill>
c000828f:	a1 1c 7c 00 00       	mov    eax,ds:0x7c1c
c0008294:	83 c4 30             	add    esp,0x30
c0008297:	8d 50 f8             	lea    edx,[eax-0x8]
c000829a:	83 e8 26             	sub    eax,0x26
c000829d:	52                   	push   edx
c000829e:	6a 3a                	push   0x3a
c00082a0:	50                   	push   eax
c00082a1:	6a 35                	push   0x35
c00082a3:	68 84 84 84 00       	push   0x848484
c00082a8:	53                   	push   ebx
c00082a9:	e8 ba fe ff ff       	call   c0008168 <RectangleFill>
c00082ae:	a1 1c 7c 00 00       	mov    eax,ds:0x7c1c
c00082b3:	8d 50 f5             	lea    edx,[eax-0xb]
c00082b6:	83 e8 29             	sub    eax,0x29
c00082b9:	52                   	push   edx
c00082ba:	6a 37                	push   0x37
c00082bc:	50                   	push   eax
c00082bd:	6a 32                	push   0x32
c00082bf:	68 ff ff ff 00       	push   0xffffff
c00082c4:	53                   	push   ebx
c00082c5:	e8 9e fe ff ff       	call   c0008168 <RectangleFill>
c00082ca:	83 c4 30             	add    esp,0x30
c00082cd:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
c00082d0:	c9                   	leave  
c00082d1:	c3                   	ret    

c00082d2 <put_char_graphic>:
c00082d2:	55                   	push   ebp
c00082d3:	89 e5                	mov    ebp,esp
c00082d5:	57                   	push   edi
c00082d6:	56                   	push   esi
c00082d7:	53                   	push   ebx
c00082d8:	31 db                	xor    ebx,ebx
c00082da:	83 ec 08             	sub    esp,0x8
c00082dd:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
c00082e0:	0f be 55 18          	movsx  edx,BYTE PTR [ebp+0x18]
c00082e4:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
c00082e7:	8b 3e                	mov    edi,DWORD PTR [esi]
c00082e9:	c1 e2 04             	shl    edx,0x4
c00082ec:	81 c2 b0 9b 00 c0    	add    edx,0xc0009bb0
c00082f2:	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
c00082f5:	89 75 ec             	mov    DWORD PTR [ebp-0x14],esi
c00082f8:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
c00082fb:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
c00082fe:	8b 75 f0             	mov    esi,DWORD PTR [ebp-0x10]
c0008301:	01 da                	add    edx,ebx
c0008303:	0f af 51 04          	imul   edx,DWORD PTR [ecx+0x4]
c0008307:	0f be 0c 1e          	movsx  ecx,BYTE PTR [esi+ebx*1]
c000830b:	03 55 0c             	add    edx,DWORD PTR [ebp+0xc]
c000830e:	f6 c1 80             	test   cl,0x80
c0008311:	8d 14 97             	lea    edx,[edi+edx*4]
c0008314:	74 02                	je     c0008318 <put_char_graphic+0x46>
c0008316:	89 02                	mov    DWORD PTR [edx],eax
c0008318:	f6 c1 40             	test   cl,0x40
c000831b:	74 03                	je     c0008320 <put_char_graphic+0x4e>
c000831d:	89 42 04             	mov    DWORD PTR [edx+0x4],eax
c0008320:	f6 c1 20             	test   cl,0x20
c0008323:	74 03                	je     c0008328 <put_char_graphic+0x56>
c0008325:	89 42 08             	mov    DWORD PTR [edx+0x8],eax
c0008328:	f6 c1 10             	test   cl,0x10
c000832b:	74 03                	je     c0008330 <put_char_graphic+0x5e>
c000832d:	89 42 0c             	mov    DWORD PTR [edx+0xc],eax
c0008330:	f6 c1 08             	test   cl,0x8
c0008333:	74 03                	je     c0008338 <put_char_graphic+0x66>
c0008335:	89 42 10             	mov    DWORD PTR [edx+0x10],eax
c0008338:	f6 c1 04             	test   cl,0x4
c000833b:	74 03                	je     c0008340 <put_char_graphic+0x6e>
c000833d:	89 42 14             	mov    DWORD PTR [edx+0x14],eax
c0008340:	f6 c1 02             	test   cl,0x2
c0008343:	74 03                	je     c0008348 <put_char_graphic+0x76>
c0008345:	89 42 18             	mov    DWORD PTR [edx+0x18],eax
c0008348:	80 e1 01             	and    cl,0x1
c000834b:	74 03                	je     c0008350 <put_char_graphic+0x7e>
c000834d:	89 42 1c             	mov    DWORD PTR [edx+0x1c],eax
c0008350:	43                   	inc    ebx
c0008351:	83 fb 10             	cmp    ebx,0x10
c0008354:	75 a2                	jne    c00082f8 <put_char_graphic+0x26>
c0008356:	58                   	pop    eax
c0008357:	5a                   	pop    edx
c0008358:	5b                   	pop    ebx
c0008359:	5e                   	pop    esi
c000835a:	5f                   	pop    edi
c000835b:	5d                   	pop    ebp
c000835c:	c3                   	ret    

c000835d <put_str_graphic>:
c000835d:	55                   	push   ebp
c000835e:	89 e5                	mov    ebp,esp
c0008360:	57                   	push   edi
c0008361:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
c0008364:	56                   	push   esi
c0008365:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
c0008368:	53                   	push   ebx
c0008369:	8b 5d 18             	mov    ebx,DWORD PTR [ebp+0x18]
c000836c:	eb 33                	jmp    c00083a1 <put_str_graphic+0x44>
c000836e:	0f be c0             	movsx  eax,al
c0008371:	50                   	push   eax
c0008372:	ff 75 14             	push   DWORD PTR [ebp+0x14]
c0008375:	ff 75 10             	push   DWORD PTR [ebp+0x10]
c0008378:	56                   	push   esi
c0008379:	83 c6 0a             	add    esi,0xa
c000837c:	57                   	push   edi
c000837d:	e8 50 ff ff ff       	call   c00082d2 <put_char_graphic>
c0008382:	a1 1c 7c 00 00       	mov    eax,ds:0x7c1c
c0008387:	83 e8 33             	sub    eax,0x33
c000838a:	50                   	push   eax
c000838b:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c0008390:	48                   	dec    eax
c0008391:	50                   	push   eax
c0008392:	6a 00                	push   0x0
c0008394:	6a 00                	push   0x0
c0008396:	6a 00                	push   0x0
c0008398:	57                   	push   edi
c0008399:	e8 ca fd ff ff       	call   c0008168 <RectangleFill>
c000839e:	83 c4 2c             	add    esp,0x2c
c00083a1:	43                   	inc    ebx
c00083a2:	8a 43 ff             	mov    al,BYTE PTR [ebx-0x1]
c00083a5:	84 c0                	test   al,al
c00083a7:	75 c5                	jne    c000836e <put_str_graphic+0x11>
c00083a9:	8d 65 f4             	lea    esp,[ebp-0xc]
c00083ac:	5b                   	pop    ebx
c00083ad:	5e                   	pop    esi
c00083ae:	5f                   	pop    edi
c00083af:	5d                   	pop    ebp
c00083b0:	c3                   	ret    
c00083b1:	00 00                	add    BYTE PTR [eax],al
	...

c00083b4 <init_all>:
c00083b4:	55                   	push   ebp
c00083b5:	89 e5                	mov    ebp,esp
c00083b7:	83 ec 08             	sub    esp,0x8
c00083ba:	e8 f3 09 00 00       	call   c0008db2 <init_idt>
c00083bf:	e8 38 13 00 00       	call   c00096fc <init_pit>
c00083c4:	e8 4b 0d 00 00       	call   c0009114 <init_memory>
c00083c9:	83 ec 0c             	sub    esp,0xc
c00083cc:	68 68 bc 00 c0       	push   0xc000bc68
c00083d1:	e8 04 fe ff ff       	call   c00081da <init_screen>
c00083d6:	83 c4 10             	add    esp,0x10
c00083d9:	c9                   	leave  
c00083da:	c3                   	ret    
c00083db:	00 00                	add    BYTE PTR [eax],al
c00083dd:	00 00                	add    BYTE PTR [eax],al
	...

c00083e0 <load_idt>:
c00083e0:	55                   	push   ebp
c00083e1:	89 e5                	mov    ebp,esp
c00083e3:	0f 01 5d 0e          	lidtd  [ebp+0xe]
c00083e7:	5d                   	pop    ebp
c00083e8:	c3                   	ret    

c00083e9 <intr0x00_entry>:
c00083e9:	68 00 00 00 00       	push   0x0
c00083ee:	1e                   	push   ds
c00083ef:	06                   	push   es
c00083f0:	0f a0                	push   fs
c00083f2:	0f a8                	push   gs
c00083f4:	60                   	pusha  
c00083f5:	68 00 00 00 00       	push   0x0
c00083fa:	ff 15 e8 be 00 c0    	call   DWORD PTR ds:0xc000bee8
c0008400:	81 c4 04 00 00 00    	add    esp,0x4
c0008406:	61                   	popa   
c0008407:	0f a9                	pop    gs
c0008409:	0f a1                	pop    fs
c000840b:	07                   	pop    es
c000840c:	1f                   	pop    ds
c000840d:	81 c4 04 00 00 00    	add    esp,0x4
c0008413:	cf                   	iret   

c0008414 <intr0x01_entry>:
c0008414:	68 00 00 00 00       	push   0x0
c0008419:	1e                   	push   ds
c000841a:	06                   	push   es
c000841b:	0f a0                	push   fs
c000841d:	0f a8                	push   gs
c000841f:	60                   	pusha  
c0008420:	68 01 00 00 00       	push   0x1
c0008425:	ff 15 ec be 00 c0    	call   DWORD PTR ds:0xc000beec
c000842b:	81 c4 04 00 00 00    	add    esp,0x4
c0008431:	61                   	popa   
c0008432:	0f a9                	pop    gs
c0008434:	0f a1                	pop    fs
c0008436:	07                   	pop    es
c0008437:	1f                   	pop    ds
c0008438:	81 c4 04 00 00 00    	add    esp,0x4
c000843e:	cf                   	iret   

c000843f <intr0x02_entry>:
c000843f:	68 00 00 00 00       	push   0x0
c0008444:	1e                   	push   ds
c0008445:	06                   	push   es
c0008446:	0f a0                	push   fs
c0008448:	0f a8                	push   gs
c000844a:	60                   	pusha  
c000844b:	68 02 00 00 00       	push   0x2
c0008450:	ff 15 f0 be 00 c0    	call   DWORD PTR ds:0xc000bef0
c0008456:	81 c4 04 00 00 00    	add    esp,0x4
c000845c:	61                   	popa   
c000845d:	0f a9                	pop    gs
c000845f:	0f a1                	pop    fs
c0008461:	07                   	pop    es
c0008462:	1f                   	pop    ds
c0008463:	81 c4 04 00 00 00    	add    esp,0x4
c0008469:	cf                   	iret   

c000846a <intr0x03_entry>:
c000846a:	68 00 00 00 00       	push   0x0
c000846f:	1e                   	push   ds
c0008470:	06                   	push   es
c0008471:	0f a0                	push   fs
c0008473:	0f a8                	push   gs
c0008475:	60                   	pusha  
c0008476:	68 03 00 00 00       	push   0x3
c000847b:	ff 15 f4 be 00 c0    	call   DWORD PTR ds:0xc000bef4
c0008481:	81 c4 04 00 00 00    	add    esp,0x4
c0008487:	61                   	popa   
c0008488:	0f a9                	pop    gs
c000848a:	0f a1                	pop    fs
c000848c:	07                   	pop    es
c000848d:	1f                   	pop    ds
c000848e:	81 c4 04 00 00 00    	add    esp,0x4
c0008494:	cf                   	iret   

c0008495 <intr0x04_entry>:
c0008495:	68 00 00 00 00       	push   0x0
c000849a:	1e                   	push   ds
c000849b:	06                   	push   es
c000849c:	0f a0                	push   fs
c000849e:	0f a8                	push   gs
c00084a0:	60                   	pusha  
c00084a1:	68 04 00 00 00       	push   0x4
c00084a6:	ff 15 f8 be 00 c0    	call   DWORD PTR ds:0xc000bef8
c00084ac:	81 c4 04 00 00 00    	add    esp,0x4
c00084b2:	61                   	popa   
c00084b3:	0f a9                	pop    gs
c00084b5:	0f a1                	pop    fs
c00084b7:	07                   	pop    es
c00084b8:	1f                   	pop    ds
c00084b9:	81 c4 04 00 00 00    	add    esp,0x4
c00084bf:	cf                   	iret   

c00084c0 <intr0x05_entry>:
c00084c0:	68 00 00 00 00       	push   0x0
c00084c5:	1e                   	push   ds
c00084c6:	06                   	push   es
c00084c7:	0f a0                	push   fs
c00084c9:	0f a8                	push   gs
c00084cb:	60                   	pusha  
c00084cc:	68 05 00 00 00       	push   0x5
c00084d1:	ff 15 fc be 00 c0    	call   DWORD PTR ds:0xc000befc
c00084d7:	81 c4 04 00 00 00    	add    esp,0x4
c00084dd:	61                   	popa   
c00084de:	0f a9                	pop    gs
c00084e0:	0f a1                	pop    fs
c00084e2:	07                   	pop    es
c00084e3:	1f                   	pop    ds
c00084e4:	81 c4 04 00 00 00    	add    esp,0x4
c00084ea:	cf                   	iret   

c00084eb <intr0x06_entry>:
c00084eb:	68 00 00 00 00       	push   0x0
c00084f0:	1e                   	push   ds
c00084f1:	06                   	push   es
c00084f2:	0f a0                	push   fs
c00084f4:	0f a8                	push   gs
c00084f6:	60                   	pusha  
c00084f7:	68 06 00 00 00       	push   0x6
c00084fc:	ff 15 00 bf 00 c0    	call   DWORD PTR ds:0xc000bf00
c0008502:	81 c4 04 00 00 00    	add    esp,0x4
c0008508:	61                   	popa   
c0008509:	0f a9                	pop    gs
c000850b:	0f a1                	pop    fs
c000850d:	07                   	pop    es
c000850e:	1f                   	pop    ds
c000850f:	81 c4 04 00 00 00    	add    esp,0x4
c0008515:	cf                   	iret   

c0008516 <intr0x07_entry>:
c0008516:	68 00 00 00 00       	push   0x0
c000851b:	1e                   	push   ds
c000851c:	06                   	push   es
c000851d:	0f a0                	push   fs
c000851f:	0f a8                	push   gs
c0008521:	60                   	pusha  
c0008522:	68 07 00 00 00       	push   0x7
c0008527:	ff 15 04 bf 00 c0    	call   DWORD PTR ds:0xc000bf04
c000852d:	81 c4 04 00 00 00    	add    esp,0x4
c0008533:	61                   	popa   
c0008534:	0f a9                	pop    gs
c0008536:	0f a1                	pop    fs
c0008538:	07                   	pop    es
c0008539:	1f                   	pop    ds
c000853a:	81 c4 04 00 00 00    	add    esp,0x4
c0008540:	cf                   	iret   

c0008541 <intr0x08_entry>:
c0008541:	90                   	nop
c0008542:	1e                   	push   ds
c0008543:	06                   	push   es
c0008544:	0f a0                	push   fs
c0008546:	0f a8                	push   gs
c0008548:	60                   	pusha  
c0008549:	68 08 00 00 00       	push   0x8
c000854e:	ff 15 08 bf 00 c0    	call   DWORD PTR ds:0xc000bf08
c0008554:	81 c4 04 00 00 00    	add    esp,0x4
c000855a:	61                   	popa   
c000855b:	0f a9                	pop    gs
c000855d:	0f a1                	pop    fs
c000855f:	07                   	pop    es
c0008560:	1f                   	pop    ds
c0008561:	81 c4 04 00 00 00    	add    esp,0x4
c0008567:	cf                   	iret   

c0008568 <intr0x09_entry>:
c0008568:	68 00 00 00 00       	push   0x0
c000856d:	1e                   	push   ds
c000856e:	06                   	push   es
c000856f:	0f a0                	push   fs
c0008571:	0f a8                	push   gs
c0008573:	60                   	pusha  
c0008574:	68 09 00 00 00       	push   0x9
c0008579:	ff 15 0c bf 00 c0    	call   DWORD PTR ds:0xc000bf0c
c000857f:	81 c4 04 00 00 00    	add    esp,0x4
c0008585:	61                   	popa   
c0008586:	0f a9                	pop    gs
c0008588:	0f a1                	pop    fs
c000858a:	07                   	pop    es
c000858b:	1f                   	pop    ds
c000858c:	81 c4 04 00 00 00    	add    esp,0x4
c0008592:	cf                   	iret   

c0008593 <intr0x0a_entry>:
c0008593:	90                   	nop
c0008594:	1e                   	push   ds
c0008595:	06                   	push   es
c0008596:	0f a0                	push   fs
c0008598:	0f a8                	push   gs
c000859a:	60                   	pusha  
c000859b:	68 0a 00 00 00       	push   0xa
c00085a0:	ff 15 10 bf 00 c0    	call   DWORD PTR ds:0xc000bf10
c00085a6:	81 c4 04 00 00 00    	add    esp,0x4
c00085ac:	61                   	popa   
c00085ad:	0f a9                	pop    gs
c00085af:	0f a1                	pop    fs
c00085b1:	07                   	pop    es
c00085b2:	1f                   	pop    ds
c00085b3:	81 c4 04 00 00 00    	add    esp,0x4
c00085b9:	cf                   	iret   

c00085ba <intr0x0b_entry>:
c00085ba:	90                   	nop
c00085bb:	1e                   	push   ds
c00085bc:	06                   	push   es
c00085bd:	0f a0                	push   fs
c00085bf:	0f a8                	push   gs
c00085c1:	60                   	pusha  
c00085c2:	68 0b 00 00 00       	push   0xb
c00085c7:	ff 15 14 bf 00 c0    	call   DWORD PTR ds:0xc000bf14
c00085cd:	81 c4 04 00 00 00    	add    esp,0x4
c00085d3:	61                   	popa   
c00085d4:	0f a9                	pop    gs
c00085d6:	0f a1                	pop    fs
c00085d8:	07                   	pop    es
c00085d9:	1f                   	pop    ds
c00085da:	81 c4 04 00 00 00    	add    esp,0x4
c00085e0:	cf                   	iret   

c00085e1 <intr0x0c_entry>:
c00085e1:	68 00 00 00 00       	push   0x0
c00085e6:	1e                   	push   ds
c00085e7:	06                   	push   es
c00085e8:	0f a0                	push   fs
c00085ea:	0f a8                	push   gs
c00085ec:	60                   	pusha  
c00085ed:	68 0c 00 00 00       	push   0xc
c00085f2:	ff 15 18 bf 00 c0    	call   DWORD PTR ds:0xc000bf18
c00085f8:	81 c4 04 00 00 00    	add    esp,0x4
c00085fe:	61                   	popa   
c00085ff:	0f a9                	pop    gs
c0008601:	0f a1                	pop    fs
c0008603:	07                   	pop    es
c0008604:	1f                   	pop    ds
c0008605:	81 c4 04 00 00 00    	add    esp,0x4
c000860b:	cf                   	iret   

c000860c <intr0x0d_entry>:
c000860c:	90                   	nop
c000860d:	1e                   	push   ds
c000860e:	06                   	push   es
c000860f:	0f a0                	push   fs
c0008611:	0f a8                	push   gs
c0008613:	60                   	pusha  
c0008614:	68 0d 00 00 00       	push   0xd
c0008619:	ff 15 1c bf 00 c0    	call   DWORD PTR ds:0xc000bf1c
c000861f:	81 c4 04 00 00 00    	add    esp,0x4
c0008625:	61                   	popa   
c0008626:	0f a9                	pop    gs
c0008628:	0f a1                	pop    fs
c000862a:	07                   	pop    es
c000862b:	1f                   	pop    ds
c000862c:	81 c4 04 00 00 00    	add    esp,0x4
c0008632:	cf                   	iret   

c0008633 <intr0x0e_entry>:
c0008633:	90                   	nop
c0008634:	1e                   	push   ds
c0008635:	06                   	push   es
c0008636:	0f a0                	push   fs
c0008638:	0f a8                	push   gs
c000863a:	60                   	pusha  
c000863b:	68 0e 00 00 00       	push   0xe
c0008640:	ff 15 20 bf 00 c0    	call   DWORD PTR ds:0xc000bf20
c0008646:	81 c4 04 00 00 00    	add    esp,0x4
c000864c:	61                   	popa   
c000864d:	0f a9                	pop    gs
c000864f:	0f a1                	pop    fs
c0008651:	07                   	pop    es
c0008652:	1f                   	pop    ds
c0008653:	81 c4 04 00 00 00    	add    esp,0x4
c0008659:	cf                   	iret   

c000865a <intr0x0f_entry>:
c000865a:	68 00 00 00 00       	push   0x0
c000865f:	1e                   	push   ds
c0008660:	06                   	push   es
c0008661:	0f a0                	push   fs
c0008663:	0f a8                	push   gs
c0008665:	60                   	pusha  
c0008666:	68 0f 00 00 00       	push   0xf
c000866b:	ff 15 24 bf 00 c0    	call   DWORD PTR ds:0xc000bf24
c0008671:	81 c4 04 00 00 00    	add    esp,0x4
c0008677:	61                   	popa   
c0008678:	0f a9                	pop    gs
c000867a:	0f a1                	pop    fs
c000867c:	07                   	pop    es
c000867d:	1f                   	pop    ds
c000867e:	81 c4 04 00 00 00    	add    esp,0x4
c0008684:	cf                   	iret   

c0008685 <intr0x10_entry>:
c0008685:	68 00 00 00 00       	push   0x0
c000868a:	1e                   	push   ds
c000868b:	06                   	push   es
c000868c:	0f a0                	push   fs
c000868e:	0f a8                	push   gs
c0008690:	60                   	pusha  
c0008691:	68 10 00 00 00       	push   0x10
c0008696:	ff 15 28 bf 00 c0    	call   DWORD PTR ds:0xc000bf28
c000869c:	81 c4 04 00 00 00    	add    esp,0x4
c00086a2:	61                   	popa   
c00086a3:	0f a9                	pop    gs
c00086a5:	0f a1                	pop    fs
c00086a7:	07                   	pop    es
c00086a8:	1f                   	pop    ds
c00086a9:	81 c4 04 00 00 00    	add    esp,0x4
c00086af:	cf                   	iret   

c00086b0 <intr0x11_entry>:
c00086b0:	90                   	nop
c00086b1:	1e                   	push   ds
c00086b2:	06                   	push   es
c00086b3:	0f a0                	push   fs
c00086b5:	0f a8                	push   gs
c00086b7:	60                   	pusha  
c00086b8:	68 11 00 00 00       	push   0x11
c00086bd:	ff 15 2c bf 00 c0    	call   DWORD PTR ds:0xc000bf2c
c00086c3:	81 c4 04 00 00 00    	add    esp,0x4
c00086c9:	61                   	popa   
c00086ca:	0f a9                	pop    gs
c00086cc:	0f a1                	pop    fs
c00086ce:	07                   	pop    es
c00086cf:	1f                   	pop    ds
c00086d0:	81 c4 04 00 00 00    	add    esp,0x4
c00086d6:	cf                   	iret   

c00086d7 <intr0x12_entry>:
c00086d7:	68 00 00 00 00       	push   0x0
c00086dc:	1e                   	push   ds
c00086dd:	06                   	push   es
c00086de:	0f a0                	push   fs
c00086e0:	0f a8                	push   gs
c00086e2:	60                   	pusha  
c00086e3:	68 12 00 00 00       	push   0x12
c00086e8:	ff 15 30 bf 00 c0    	call   DWORD PTR ds:0xc000bf30
c00086ee:	81 c4 04 00 00 00    	add    esp,0x4
c00086f4:	61                   	popa   
c00086f5:	0f a9                	pop    gs
c00086f7:	0f a1                	pop    fs
c00086f9:	07                   	pop    es
c00086fa:	1f                   	pop    ds
c00086fb:	81 c4 04 00 00 00    	add    esp,0x4
c0008701:	cf                   	iret   

c0008702 <intr0x13_entry>:
c0008702:	68 00 00 00 00       	push   0x0
c0008707:	1e                   	push   ds
c0008708:	06                   	push   es
c0008709:	0f a0                	push   fs
c000870b:	0f a8                	push   gs
c000870d:	60                   	pusha  
c000870e:	68 13 00 00 00       	push   0x13
c0008713:	ff 15 34 bf 00 c0    	call   DWORD PTR ds:0xc000bf34
c0008719:	81 c4 04 00 00 00    	add    esp,0x4
c000871f:	61                   	popa   
c0008720:	0f a9                	pop    gs
c0008722:	0f a1                	pop    fs
c0008724:	07                   	pop    es
c0008725:	1f                   	pop    ds
c0008726:	81 c4 04 00 00 00    	add    esp,0x4
c000872c:	cf                   	iret   

c000872d <intr0x14_entry>:
c000872d:	68 00 00 00 00       	push   0x0
c0008732:	1e                   	push   ds
c0008733:	06                   	push   es
c0008734:	0f a0                	push   fs
c0008736:	0f a8                	push   gs
c0008738:	60                   	pusha  
c0008739:	68 14 00 00 00       	push   0x14
c000873e:	ff 15 38 bf 00 c0    	call   DWORD PTR ds:0xc000bf38
c0008744:	81 c4 04 00 00 00    	add    esp,0x4
c000874a:	61                   	popa   
c000874b:	0f a9                	pop    gs
c000874d:	0f a1                	pop    fs
c000874f:	07                   	pop    es
c0008750:	1f                   	pop    ds
c0008751:	81 c4 04 00 00 00    	add    esp,0x4
c0008757:	cf                   	iret   

c0008758 <intr0x15_entry>:
c0008758:	68 00 00 00 00       	push   0x0
c000875d:	1e                   	push   ds
c000875e:	06                   	push   es
c000875f:	0f a0                	push   fs
c0008761:	0f a8                	push   gs
c0008763:	60                   	pusha  
c0008764:	68 15 00 00 00       	push   0x15
c0008769:	ff 15 3c bf 00 c0    	call   DWORD PTR ds:0xc000bf3c
c000876f:	81 c4 04 00 00 00    	add    esp,0x4
c0008775:	61                   	popa   
c0008776:	0f a9                	pop    gs
c0008778:	0f a1                	pop    fs
c000877a:	07                   	pop    es
c000877b:	1f                   	pop    ds
c000877c:	81 c4 04 00 00 00    	add    esp,0x4
c0008782:	cf                   	iret   

c0008783 <intr0x16_entry>:
c0008783:	68 00 00 00 00       	push   0x0
c0008788:	1e                   	push   ds
c0008789:	06                   	push   es
c000878a:	0f a0                	push   fs
c000878c:	0f a8                	push   gs
c000878e:	60                   	pusha  
c000878f:	68 16 00 00 00       	push   0x16
c0008794:	ff 15 40 bf 00 c0    	call   DWORD PTR ds:0xc000bf40
c000879a:	81 c4 04 00 00 00    	add    esp,0x4
c00087a0:	61                   	popa   
c00087a1:	0f a9                	pop    gs
c00087a3:	0f a1                	pop    fs
c00087a5:	07                   	pop    es
c00087a6:	1f                   	pop    ds
c00087a7:	81 c4 04 00 00 00    	add    esp,0x4
c00087ad:	cf                   	iret   

c00087ae <intr0x17_entry>:
c00087ae:	68 00 00 00 00       	push   0x0
c00087b3:	1e                   	push   ds
c00087b4:	06                   	push   es
c00087b5:	0f a0                	push   fs
c00087b7:	0f a8                	push   gs
c00087b9:	60                   	pusha  
c00087ba:	68 17 00 00 00       	push   0x17
c00087bf:	ff 15 44 bf 00 c0    	call   DWORD PTR ds:0xc000bf44
c00087c5:	81 c4 04 00 00 00    	add    esp,0x4
c00087cb:	61                   	popa   
c00087cc:	0f a9                	pop    gs
c00087ce:	0f a1                	pop    fs
c00087d0:	07                   	pop    es
c00087d1:	1f                   	pop    ds
c00087d2:	81 c4 04 00 00 00    	add    esp,0x4
c00087d8:	cf                   	iret   

c00087d9 <intr0x18_entry>:
c00087d9:	90                   	nop
c00087da:	1e                   	push   ds
c00087db:	06                   	push   es
c00087dc:	0f a0                	push   fs
c00087de:	0f a8                	push   gs
c00087e0:	60                   	pusha  
c00087e1:	68 18 00 00 00       	push   0x18
c00087e6:	ff 15 48 bf 00 c0    	call   DWORD PTR ds:0xc000bf48
c00087ec:	81 c4 04 00 00 00    	add    esp,0x4
c00087f2:	61                   	popa   
c00087f3:	0f a9                	pop    gs
c00087f5:	0f a1                	pop    fs
c00087f7:	07                   	pop    es
c00087f8:	1f                   	pop    ds
c00087f9:	81 c4 04 00 00 00    	add    esp,0x4
c00087ff:	cf                   	iret   

c0008800 <intr0x19_entry>:
c0008800:	68 00 00 00 00       	push   0x0
c0008805:	1e                   	push   ds
c0008806:	06                   	push   es
c0008807:	0f a0                	push   fs
c0008809:	0f a8                	push   gs
c000880b:	60                   	pusha  
c000880c:	68 19 00 00 00       	push   0x19
c0008811:	ff 15 4c bf 00 c0    	call   DWORD PTR ds:0xc000bf4c
c0008817:	81 c4 04 00 00 00    	add    esp,0x4
c000881d:	61                   	popa   
c000881e:	0f a9                	pop    gs
c0008820:	0f a1                	pop    fs
c0008822:	07                   	pop    es
c0008823:	1f                   	pop    ds
c0008824:	81 c4 04 00 00 00    	add    esp,0x4
c000882a:	cf                   	iret   

c000882b <intr0x1a_entry>:
c000882b:	90                   	nop
c000882c:	1e                   	push   ds
c000882d:	06                   	push   es
c000882e:	0f a0                	push   fs
c0008830:	0f a8                	push   gs
c0008832:	60                   	pusha  
c0008833:	68 1a 00 00 00       	push   0x1a
c0008838:	ff 15 50 bf 00 c0    	call   DWORD PTR ds:0xc000bf50
c000883e:	81 c4 04 00 00 00    	add    esp,0x4
c0008844:	61                   	popa   
c0008845:	0f a9                	pop    gs
c0008847:	0f a1                	pop    fs
c0008849:	07                   	pop    es
c000884a:	1f                   	pop    ds
c000884b:	81 c4 04 00 00 00    	add    esp,0x4
c0008851:	cf                   	iret   

c0008852 <intr0x1b_entry>:
c0008852:	90                   	nop
c0008853:	1e                   	push   ds
c0008854:	06                   	push   es
c0008855:	0f a0                	push   fs
c0008857:	0f a8                	push   gs
c0008859:	60                   	pusha  
c000885a:	68 1b 00 00 00       	push   0x1b
c000885f:	ff 15 54 bf 00 c0    	call   DWORD PTR ds:0xc000bf54
c0008865:	81 c4 04 00 00 00    	add    esp,0x4
c000886b:	61                   	popa   
c000886c:	0f a9                	pop    gs
c000886e:	0f a1                	pop    fs
c0008870:	07                   	pop    es
c0008871:	1f                   	pop    ds
c0008872:	81 c4 04 00 00 00    	add    esp,0x4
c0008878:	cf                   	iret   

c0008879 <intr0x1c_entry>:
c0008879:	68 00 00 00 00       	push   0x0
c000887e:	1e                   	push   ds
c000887f:	06                   	push   es
c0008880:	0f a0                	push   fs
c0008882:	0f a8                	push   gs
c0008884:	60                   	pusha  
c0008885:	68 1c 00 00 00       	push   0x1c
c000888a:	ff 15 58 bf 00 c0    	call   DWORD PTR ds:0xc000bf58
c0008890:	81 c4 04 00 00 00    	add    esp,0x4
c0008896:	61                   	popa   
c0008897:	0f a9                	pop    gs
c0008899:	0f a1                	pop    fs
c000889b:	07                   	pop    es
c000889c:	1f                   	pop    ds
c000889d:	81 c4 04 00 00 00    	add    esp,0x4
c00088a3:	cf                   	iret   

c00088a4 <intr0x1d_entry>:
c00088a4:	90                   	nop
c00088a5:	1e                   	push   ds
c00088a6:	06                   	push   es
c00088a7:	0f a0                	push   fs
c00088a9:	0f a8                	push   gs
c00088ab:	60                   	pusha  
c00088ac:	68 1d 00 00 00       	push   0x1d
c00088b1:	ff 15 5c bf 00 c0    	call   DWORD PTR ds:0xc000bf5c
c00088b7:	81 c4 04 00 00 00    	add    esp,0x4
c00088bd:	61                   	popa   
c00088be:	0f a9                	pop    gs
c00088c0:	0f a1                	pop    fs
c00088c2:	07                   	pop    es
c00088c3:	1f                   	pop    ds
c00088c4:	81 c4 04 00 00 00    	add    esp,0x4
c00088ca:	cf                   	iret   

c00088cb <intr0x1e_entry>:
c00088cb:	90                   	nop
c00088cc:	1e                   	push   ds
c00088cd:	06                   	push   es
c00088ce:	0f a0                	push   fs
c00088d0:	0f a8                	push   gs
c00088d2:	60                   	pusha  
c00088d3:	68 1e 00 00 00       	push   0x1e
c00088d8:	ff 15 60 bf 00 c0    	call   DWORD PTR ds:0xc000bf60
c00088de:	81 c4 04 00 00 00    	add    esp,0x4
c00088e4:	61                   	popa   
c00088e5:	0f a9                	pop    gs
c00088e7:	0f a1                	pop    fs
c00088e9:	07                   	pop    es
c00088ea:	1f                   	pop    ds
c00088eb:	81 c4 04 00 00 00    	add    esp,0x4
c00088f1:	cf                   	iret   

c00088f2 <intr0x1f_entry>:
c00088f2:	68 00 00 00 00       	push   0x0
c00088f7:	1e                   	push   ds
c00088f8:	06                   	push   es
c00088f9:	0f a0                	push   fs
c00088fb:	0f a8                	push   gs
c00088fd:	60                   	pusha  
c00088fe:	68 1f 00 00 00       	push   0x1f
c0008903:	ff 15 64 bf 00 c0    	call   DWORD PTR ds:0xc000bf64
c0008909:	81 c4 04 00 00 00    	add    esp,0x4
c000890f:	61                   	popa   
c0008910:	0f a9                	pop    gs
c0008912:	0f a1                	pop    fs
c0008914:	07                   	pop    es
c0008915:	1f                   	pop    ds
c0008916:	81 c4 04 00 00 00    	add    esp,0x4
c000891c:	cf                   	iret   

c000891d <intr0x20_entry>:
c000891d:	68 00 00 00 00       	push   0x0
c0008922:	1e                   	push   ds
c0008923:	06                   	push   es
c0008924:	0f a0                	push   fs
c0008926:	0f a8                	push   gs
c0008928:	60                   	pusha  
c0008929:	68 20 00 00 00       	push   0x20
c000892e:	ff 15 68 bf 00 c0    	call   DWORD PTR ds:0xc000bf68
c0008934:	81 c4 04 00 00 00    	add    esp,0x4
c000893a:	61                   	popa   
c000893b:	0f a9                	pop    gs
c000893d:	0f a1                	pop    fs
c000893f:	07                   	pop    es
c0008940:	1f                   	pop    ds
c0008941:	81 c4 04 00 00 00    	add    esp,0x4
c0008947:	cf                   	iret   

c0008948 <intr0x21_entry>:
c0008948:	68 00 00 00 00       	push   0x0
c000894d:	1e                   	push   ds
c000894e:	06                   	push   es
c000894f:	0f a0                	push   fs
c0008951:	0f a8                	push   gs
c0008953:	60                   	pusha  
c0008954:	68 21 00 00 00       	push   0x21
c0008959:	ff 15 6c bf 00 c0    	call   DWORD PTR ds:0xc000bf6c
c000895f:	81 c4 04 00 00 00    	add    esp,0x4
c0008965:	61                   	popa   
c0008966:	0f a9                	pop    gs
c0008968:	0f a1                	pop    fs
c000896a:	07                   	pop    es
c000896b:	1f                   	pop    ds
c000896c:	81 c4 04 00 00 00    	add    esp,0x4
c0008972:	cf                   	iret   

c0008973 <intr0x22_entry>:
c0008973:	68 00 00 00 00       	push   0x0
c0008978:	1e                   	push   ds
c0008979:	06                   	push   es
c000897a:	0f a0                	push   fs
c000897c:	0f a8                	push   gs
c000897e:	60                   	pusha  
c000897f:	68 22 00 00 00       	push   0x22
c0008984:	ff 15 70 bf 00 c0    	call   DWORD PTR ds:0xc000bf70
c000898a:	81 c4 04 00 00 00    	add    esp,0x4
c0008990:	61                   	popa   
c0008991:	0f a9                	pop    gs
c0008993:	0f a1                	pop    fs
c0008995:	07                   	pop    es
c0008996:	1f                   	pop    ds
c0008997:	81 c4 04 00 00 00    	add    esp,0x4
c000899d:	cf                   	iret   

c000899e <intr0x23_entry>:
c000899e:	68 00 00 00 00       	push   0x0
c00089a3:	1e                   	push   ds
c00089a4:	06                   	push   es
c00089a5:	0f a0                	push   fs
c00089a7:	0f a8                	push   gs
c00089a9:	60                   	pusha  
c00089aa:	68 23 00 00 00       	push   0x23
c00089af:	ff 15 74 bf 00 c0    	call   DWORD PTR ds:0xc000bf74
c00089b5:	81 c4 04 00 00 00    	add    esp,0x4
c00089bb:	61                   	popa   
c00089bc:	0f a9                	pop    gs
c00089be:	0f a1                	pop    fs
c00089c0:	07                   	pop    es
c00089c1:	1f                   	pop    ds
c00089c2:	81 c4 04 00 00 00    	add    esp,0x4
c00089c8:	cf                   	iret   

c00089c9 <intr0x24_entry>:
c00089c9:	68 00 00 00 00       	push   0x0
c00089ce:	1e                   	push   ds
c00089cf:	06                   	push   es
c00089d0:	0f a0                	push   fs
c00089d2:	0f a8                	push   gs
c00089d4:	60                   	pusha  
c00089d5:	68 24 00 00 00       	push   0x24
c00089da:	ff 15 78 bf 00 c0    	call   DWORD PTR ds:0xc000bf78
c00089e0:	81 c4 04 00 00 00    	add    esp,0x4
c00089e6:	61                   	popa   
c00089e7:	0f a9                	pop    gs
c00089e9:	0f a1                	pop    fs
c00089eb:	07                   	pop    es
c00089ec:	1f                   	pop    ds
c00089ed:	81 c4 04 00 00 00    	add    esp,0x4
c00089f3:	cf                   	iret   

c00089f4 <intr0x25_entry>:
c00089f4:	68 00 00 00 00       	push   0x0
c00089f9:	1e                   	push   ds
c00089fa:	06                   	push   es
c00089fb:	0f a0                	push   fs
c00089fd:	0f a8                	push   gs
c00089ff:	60                   	pusha  
c0008a00:	68 25 00 00 00       	push   0x25
c0008a05:	ff 15 7c bf 00 c0    	call   DWORD PTR ds:0xc000bf7c
c0008a0b:	81 c4 04 00 00 00    	add    esp,0x4
c0008a11:	61                   	popa   
c0008a12:	0f a9                	pop    gs
c0008a14:	0f a1                	pop    fs
c0008a16:	07                   	pop    es
c0008a17:	1f                   	pop    ds
c0008a18:	81 c4 04 00 00 00    	add    esp,0x4
c0008a1e:	cf                   	iret   

c0008a1f <intr0x26_entry>:
c0008a1f:	68 00 00 00 00       	push   0x0
c0008a24:	1e                   	push   ds
c0008a25:	06                   	push   es
c0008a26:	0f a0                	push   fs
c0008a28:	0f a8                	push   gs
c0008a2a:	60                   	pusha  
c0008a2b:	68 26 00 00 00       	push   0x26
c0008a30:	ff 15 80 bf 00 c0    	call   DWORD PTR ds:0xc000bf80
c0008a36:	81 c4 04 00 00 00    	add    esp,0x4
c0008a3c:	61                   	popa   
c0008a3d:	0f a9                	pop    gs
c0008a3f:	0f a1                	pop    fs
c0008a41:	07                   	pop    es
c0008a42:	1f                   	pop    ds
c0008a43:	81 c4 04 00 00 00    	add    esp,0x4
c0008a49:	cf                   	iret   

c0008a4a <intr0x27_entry>:
c0008a4a:	68 00 00 00 00       	push   0x0
c0008a4f:	1e                   	push   ds
c0008a50:	06                   	push   es
c0008a51:	0f a0                	push   fs
c0008a53:	0f a8                	push   gs
c0008a55:	60                   	pusha  
c0008a56:	68 27 00 00 00       	push   0x27
c0008a5b:	ff 15 84 bf 00 c0    	call   DWORD PTR ds:0xc000bf84
c0008a61:	81 c4 04 00 00 00    	add    esp,0x4
c0008a67:	61                   	popa   
c0008a68:	0f a9                	pop    gs
c0008a6a:	0f a1                	pop    fs
c0008a6c:	07                   	pop    es
c0008a6d:	1f                   	pop    ds
c0008a6e:	81 c4 04 00 00 00    	add    esp,0x4
c0008a74:	cf                   	iret   

c0008a75 <intr0x28_entry>:
c0008a75:	68 00 00 00 00       	push   0x0
c0008a7a:	1e                   	push   ds
c0008a7b:	06                   	push   es
c0008a7c:	0f a0                	push   fs
c0008a7e:	0f a8                	push   gs
c0008a80:	60                   	pusha  
c0008a81:	68 28 00 00 00       	push   0x28
c0008a86:	ff 15 88 bf 00 c0    	call   DWORD PTR ds:0xc000bf88
c0008a8c:	81 c4 04 00 00 00    	add    esp,0x4
c0008a92:	61                   	popa   
c0008a93:	0f a9                	pop    gs
c0008a95:	0f a1                	pop    fs
c0008a97:	07                   	pop    es
c0008a98:	1f                   	pop    ds
c0008a99:	81 c4 04 00 00 00    	add    esp,0x4
c0008a9f:	cf                   	iret   

c0008aa0 <intr0x29_entry>:
c0008aa0:	68 00 00 00 00       	push   0x0
c0008aa5:	1e                   	push   ds
c0008aa6:	06                   	push   es
c0008aa7:	0f a0                	push   fs
c0008aa9:	0f a8                	push   gs
c0008aab:	60                   	pusha  
c0008aac:	68 29 00 00 00       	push   0x29
c0008ab1:	ff 15 8c bf 00 c0    	call   DWORD PTR ds:0xc000bf8c
c0008ab7:	81 c4 04 00 00 00    	add    esp,0x4
c0008abd:	61                   	popa   
c0008abe:	0f a9                	pop    gs
c0008ac0:	0f a1                	pop    fs
c0008ac2:	07                   	pop    es
c0008ac3:	1f                   	pop    ds
c0008ac4:	81 c4 04 00 00 00    	add    esp,0x4
c0008aca:	cf                   	iret   

c0008acb <intr0x2a_entry>:
c0008acb:	68 00 00 00 00       	push   0x0
c0008ad0:	1e                   	push   ds
c0008ad1:	06                   	push   es
c0008ad2:	0f a0                	push   fs
c0008ad4:	0f a8                	push   gs
c0008ad6:	60                   	pusha  
c0008ad7:	68 2a 00 00 00       	push   0x2a
c0008adc:	ff 15 90 bf 00 c0    	call   DWORD PTR ds:0xc000bf90
c0008ae2:	81 c4 04 00 00 00    	add    esp,0x4
c0008ae8:	61                   	popa   
c0008ae9:	0f a9                	pop    gs
c0008aeb:	0f a1                	pop    fs
c0008aed:	07                   	pop    es
c0008aee:	1f                   	pop    ds
c0008aef:	81 c4 04 00 00 00    	add    esp,0x4
c0008af5:	cf                   	iret   

c0008af6 <intr0x2b_entry>:
c0008af6:	68 00 00 00 00       	push   0x0
c0008afb:	1e                   	push   ds
c0008afc:	06                   	push   es
c0008afd:	0f a0                	push   fs
c0008aff:	0f a8                	push   gs
c0008b01:	60                   	pusha  
c0008b02:	68 2b 00 00 00       	push   0x2b
c0008b07:	ff 15 94 bf 00 c0    	call   DWORD PTR ds:0xc000bf94
c0008b0d:	81 c4 04 00 00 00    	add    esp,0x4
c0008b13:	61                   	popa   
c0008b14:	0f a9                	pop    gs
c0008b16:	0f a1                	pop    fs
c0008b18:	07                   	pop    es
c0008b19:	1f                   	pop    ds
c0008b1a:	81 c4 04 00 00 00    	add    esp,0x4
c0008b20:	cf                   	iret   

c0008b21 <intr0x2c_entry>:
c0008b21:	68 00 00 00 00       	push   0x0
c0008b26:	1e                   	push   ds
c0008b27:	06                   	push   es
c0008b28:	0f a0                	push   fs
c0008b2a:	0f a8                	push   gs
c0008b2c:	60                   	pusha  
c0008b2d:	68 2c 00 00 00       	push   0x2c
c0008b32:	ff 15 98 bf 00 c0    	call   DWORD PTR ds:0xc000bf98
c0008b38:	81 c4 04 00 00 00    	add    esp,0x4
c0008b3e:	61                   	popa   
c0008b3f:	0f a9                	pop    gs
c0008b41:	0f a1                	pop    fs
c0008b43:	07                   	pop    es
c0008b44:	1f                   	pop    ds
c0008b45:	81 c4 04 00 00 00    	add    esp,0x4
c0008b4b:	cf                   	iret   

c0008b4c <intr0x2d_entry>:
c0008b4c:	68 00 00 00 00       	push   0x0
c0008b51:	1e                   	push   ds
c0008b52:	06                   	push   es
c0008b53:	0f a0                	push   fs
c0008b55:	0f a8                	push   gs
c0008b57:	60                   	pusha  
c0008b58:	68 2d 00 00 00       	push   0x2d
c0008b5d:	ff 15 9c bf 00 c0    	call   DWORD PTR ds:0xc000bf9c
c0008b63:	81 c4 04 00 00 00    	add    esp,0x4
c0008b69:	61                   	popa   
c0008b6a:	0f a9                	pop    gs
c0008b6c:	0f a1                	pop    fs
c0008b6e:	07                   	pop    es
c0008b6f:	1f                   	pop    ds
c0008b70:	81 c4 04 00 00 00    	add    esp,0x4
c0008b76:	cf                   	iret   

c0008b77 <intr0x2e_entry>:
c0008b77:	68 00 00 00 00       	push   0x0
c0008b7c:	1e                   	push   ds
c0008b7d:	06                   	push   es
c0008b7e:	0f a0                	push   fs
c0008b80:	0f a8                	push   gs
c0008b82:	60                   	pusha  
c0008b83:	68 2e 00 00 00       	push   0x2e
c0008b88:	ff 15 a0 bf 00 c0    	call   DWORD PTR ds:0xc000bfa0
c0008b8e:	81 c4 04 00 00 00    	add    esp,0x4
c0008b94:	61                   	popa   
c0008b95:	0f a9                	pop    gs
c0008b97:	0f a1                	pop    fs
c0008b99:	07                   	pop    es
c0008b9a:	1f                   	pop    ds
c0008b9b:	81 c4 04 00 00 00    	add    esp,0x4
c0008ba1:	cf                   	iret   

c0008ba2 <intr0x2f_entry>:
c0008ba2:	68 00 00 00 00       	push   0x0
c0008ba7:	1e                   	push   ds
c0008ba8:	06                   	push   es
c0008ba9:	0f a0                	push   fs
c0008bab:	0f a8                	push   gs
c0008bad:	60                   	pusha  
c0008bae:	68 2f 00 00 00       	push   0x2f
c0008bb3:	ff 15 a4 bf 00 c0    	call   DWORD PTR ds:0xc000bfa4
c0008bb9:	81 c4 04 00 00 00    	add    esp,0x4
c0008bbf:	61                   	popa   
c0008bc0:	0f a9                	pop    gs
c0008bc2:	0f a1                	pop    fs
c0008bc4:	07                   	pop    es
c0008bc5:	1f                   	pop    ds
c0008bc6:	81 c4 04 00 00 00    	add    esp,0x4
c0008bcc:	cf                   	iret   
c0008bcd:	00 00                	add    BYTE PTR [eax],al
	...

c0008bd0 <general_intr_handler>:
c0008bd0:	55                   	push   ebp
c0008bd1:	b8 20 00 00 00       	mov    eax,0x20
c0008bd6:	89 e5                	mov    ebp,esp
c0008bd8:	ba a0 00 00 00       	mov    edx,0xa0
c0008bdd:	56                   	push   esi
c0008bde:	53                   	push   ebx
c0008bdf:	8a 5d 08             	mov    bl,BYTE PTR [ebp+0x8]
c0008be2:	ee                   	out    dx,al
c0008be3:	89 c2                	mov    edx,eax
c0008be5:	ee                   	out    dx,al
c0008be6:	83 ec 0c             	sub    esp,0xc
c0008be9:	0f b6 f3             	movzx  esi,bl
c0008bec:	68 b0 b9 00 c0       	push   0xc000b9b0
c0008bf1:	e8 e4 08 00 00       	call   c00094da <put_str>
c0008bf6:	89 34 24             	mov    DWORD PTR [esp],esi
c0008bf9:	e8 fb 08 00 00       	call   c00094f9 <put_int>
c0008bfe:	c7 04 24 20 00 00 00 	mov    DWORD PTR [esp],0x20
c0008c05:	e8 39 08 00 00       	call   c0009443 <put_char>
c0008c0a:	83 c4 10             	add    esp,0x10
c0008c0d:	80 fb 14             	cmp    bl,0x14
c0008c10:	77 15                	ja     c0008c27 <general_intr_handler+0x57>
c0008c12:	8b 04 b5 b4 bc 00 c0 	mov    eax,DWORD PTR [esi*4-0x3fff434c]
c0008c19:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
c0008c1c:	8d 65 f8             	lea    esp,[ebp-0x8]
c0008c1f:	5b                   	pop    ebx
c0008c20:	5e                   	pop    esi
c0008c21:	5d                   	pop    ebp
c0008c22:	e9 b3 08 00 00       	jmp    c00094da <put_str>
c0008c27:	8d 65 f8             	lea    esp,[ebp-0x8]
c0008c2a:	5b                   	pop    ebx
c0008c2b:	5e                   	pop    esi
c0008c2c:	5d                   	pop    ebp
c0008c2d:	c3                   	ret    

c0008c2e <init_pic>:
c0008c2e:	55                   	push   ebp
c0008c2f:	ba 20 00 00 00       	mov    edx,0x20
c0008c34:	89 e5                	mov    ebp,esp
c0008c36:	b8 11 00 00 00       	mov    eax,0x11
c0008c3b:	ee                   	out    dx,al
c0008c3c:	b2 21                	mov    dl,0x21
c0008c3e:	b0 20                	mov    al,0x20
c0008c40:	ee                   	out    dx,al
c0008c41:	b0 04                	mov    al,0x4
c0008c43:	ee                   	out    dx,al
c0008c44:	b0 01                	mov    al,0x1
c0008c46:	ee                   	out    dx,al
c0008c47:	b2 a0                	mov    dl,0xa0
c0008c49:	b0 11                	mov    al,0x11
c0008c4b:	ee                   	out    dx,al
c0008c4c:	b2 a1                	mov    dl,0xa1
c0008c4e:	b0 28                	mov    al,0x28
c0008c50:	ee                   	out    dx,al
c0008c51:	b0 02                	mov    al,0x2
c0008c53:	ee                   	out    dx,al
c0008c54:	b0 01                	mov    al,0x1
c0008c56:	ee                   	out    dx,al
c0008c57:	b2 21                	mov    dl,0x21
c0008c59:	b0 fe                	mov    al,0xfe
c0008c5b:	ee                   	out    dx,al
c0008c5c:	b2 a1                	mov    dl,0xa1
c0008c5e:	b0 ff                	mov    al,0xff
c0008c60:	ee                   	out    dx,al
c0008c61:	5d                   	pop    ebp
c0008c62:	c3                   	ret    

c0008c63 <idt_desc_init>:
c0008c63:	55                   	push   ebp
c0008c64:	31 c0                	xor    eax,eax
c0008c66:	89 e5                	mov    ebp,esp
c0008c68:	8b 0c 85 b0 ab 00 c0 	mov    ecx,DWORD PTR [eax*4-0x3fff5450]
c0008c6f:	8d 14 c5 70 bd 00 c0 	lea    edx,[eax*8-0x3fff4290]
c0008c76:	66 c7 42 02 08 00    	mov    WORD PTR [edx+0x2],0x8
c0008c7c:	c6 42 04 00          	mov    BYTE PTR [edx+0x4],0x0
c0008c80:	c6 42 05 8e          	mov    BYTE PTR [edx+0x5],0x8e
c0008c84:	66 89 0c c5 70 bd 00 	mov    WORD PTR [eax*8-0x3fff4290],cx
c0008c8b:	c0 
c0008c8c:	40                   	inc    eax
c0008c8d:	c1 e9 10             	shr    ecx,0x10
c0008c90:	83 f8 2f             	cmp    eax,0x2f
c0008c93:	66 89 4a 06          	mov    WORD PTR [edx+0x6],cx
c0008c97:	75 cf                	jne    c0008c68 <idt_desc_init+0x5>
c0008c99:	5d                   	pop    ebp
c0008c9a:	c3                   	ret    

c0008c9b <set_gatedesc>:
c0008c9b:	55                   	push   ebp
c0008c9c:	89 e5                	mov    ebp,esp
c0008c9e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0008ca1:	53                   	push   ebx
c0008ca2:	8b 4d 14             	mov    ecx,DWORD PTR [ebp+0x14]
c0008ca5:	8b 5d 10             	mov    ebx,DWORD PTR [ebp+0x10]
c0008ca8:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
c0008cab:	88 48 05             	mov    BYTE PTR [eax+0x5],cl
c0008cae:	66 89 58 02          	mov    WORD PTR [eax+0x2],bx
c0008cb2:	89 cb                	mov    ebx,ecx
c0008cb4:	66 89 10             	mov    WORD PTR [eax],dx
c0008cb7:	c1 fb 08             	sar    ebx,0x8
c0008cba:	c1 ea 10             	shr    edx,0x10
c0008cbd:	88 58 04             	mov    BYTE PTR [eax+0x4],bl
c0008cc0:	66 89 50 06          	mov    WORD PTR [eax+0x6],dx
c0008cc4:	5b                   	pop    ebx
c0008cc5:	5d                   	pop    ebp
c0008cc6:	c3                   	ret    

c0008cc7 <exception_init>:
c0008cc7:	55                   	push   ebp
c0008cc8:	31 c0                	xor    eax,eax
c0008cca:	89 e5                	mov    ebp,esp
c0008ccc:	c7 04 85 e8 be 00 c0 	mov    DWORD PTR [eax*4-0x3fff4118],0xc0008bd0
c0008cd3:	d0 8b 00 c0 
c0008cd7:	c7 04 85 b4 bc 00 c0 	mov    DWORD PTR [eax*4-0x3fff434c],0xc000b9b6
c0008cde:	b6 b9 00 c0 
c0008ce2:	40                   	inc    eax
c0008ce3:	83 f8 2f             	cmp    eax,0x2f
c0008ce6:	75 e4                	jne    c0008ccc <exception_init+0x5>
c0008ce8:	c7 05 b4 bc 00 c0 be 	mov    DWORD PTR ds:0xc000bcb4,0xc000b9be
c0008cef:	b9 00 c0 
c0008cf2:	c7 05 b8 bc 00 c0 cf 	mov    DWORD PTR ds:0xc000bcb8,0xc000b9cf
c0008cf9:	b9 00 c0 
c0008cfc:	c7 05 bc bc 00 c0 e3 	mov    DWORD PTR ds:0xc000bcbc,0xc000b9e3
c0008d03:	b9 00 c0 
c0008d06:	c7 05 c0 bc 00 c0 f1 	mov    DWORD PTR ds:0xc000bcc0,0xc000b9f1
c0008d0d:	b9 00 c0 
c0008d10:	c7 05 c4 bc 00 c0 0a 	mov    DWORD PTR ds:0xc000bcc4,0xc000ba0a
c0008d17:	ba 00 c0 
c0008d1a:	c7 05 c8 bc 00 c0 21 	mov    DWORD PTR ds:0xc000bcc8,0xc000ba21
c0008d21:	ba 00 c0 
c0008d24:	c7 05 cc bc 00 c0 44 	mov    DWORD PTR ds:0xc000bccc,0xc000ba44
c0008d2b:	ba 00 c0 
c0008d2e:	c7 05 d0 bc 00 c0 61 	mov    DWORD PTR ds:0xc000bcd0,0xc000ba61
c0008d35:	ba 00 c0 
c0008d38:	c7 05 d4 bc 00 c0 84 	mov    DWORD PTR ds:0xc000bcd4,0xc000ba84
c0008d3f:	ba 00 c0 
c0008d42:	c7 05 d8 bc 00 c0 9f 	mov    DWORD PTR ds:0xc000bcd8,0xc000ba9f
c0008d49:	ba 00 c0 
c0008d4c:	c7 05 dc bc 00 c0 bb 	mov    DWORD PTR ds:0xc000bcdc,0xc000babb
c0008d53:	ba 00 c0 
c0008d56:	c7 05 e0 bc 00 c0 d5 	mov    DWORD PTR ds:0xc000bce0,0xc000bad5
c0008d5d:	ba 00 c0 
c0008d60:	c7 05 e4 bc 00 c0 ed 	mov    DWORD PTR ds:0xc000bce4,0xc000baed
c0008d67:	ba 00 c0 
c0008d6a:	c7 05 e8 bc 00 c0 07 	mov    DWORD PTR ds:0xc000bce8,0xc000bb07
c0008d71:	bb 00 c0 
c0008d74:	c7 05 ec bc 00 c0 28 	mov    DWORD PTR ds:0xc000bcec,0xc000bb28
c0008d7b:	bb 00 c0 
c0008d7e:	c7 05 f0 bc 00 c0 41 	mov    DWORD PTR ds:0xc000bcf0,0xc000bb41
c0008d85:	bb 00 c0 
c0008d88:	c7 05 f4 bc 00 c0 4a 	mov    DWORD PTR ds:0xc000bcf4,0xc000bb4a
c0008d8f:	bb 00 c0 
c0008d92:	c7 05 f8 bc 00 c0 6b 	mov    DWORD PTR ds:0xc000bcf8,0xc000bb6b
c0008d99:	bb 00 c0 
c0008d9c:	c7 05 fc bc 00 c0 89 	mov    DWORD PTR ds:0xc000bcfc,0xc000bb89
c0008da3:	bb 00 c0 
c0008da6:	c7 05 00 bd 00 c0 a5 	mov    DWORD PTR ds:0xc000bd00,0xc000bba5
c0008dad:	bb 00 c0 
c0008db0:	5d                   	pop    ebp
c0008db1:	c3                   	ret    

c0008db2 <init_idt>:
c0008db2:	55                   	push   ebp
c0008db3:	89 e5                	mov    ebp,esp
c0008db5:	83 ec 18             	sub    esp,0x18
c0008db8:	e8 a6 fe ff ff       	call   c0008c63 <idt_desc_init>
c0008dbd:	e8 6c fe ff ff       	call   c0008c2e <init_pic>
c0008dc2:	b8 70 bd 00 c0       	mov    eax,0xc000bd70
c0008dc7:	c1 e0 10             	shl    eax,0x10
c0008dca:	0d 77 01 00 00       	or     eax,0x177
c0008dcf:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
c0008dd2:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
c0008dd9:	e8 e9 fe ff ff       	call   c0008cc7 <exception_init>
c0008dde:	50                   	push   eax
c0008ddf:	50                   	push   eax
c0008de0:	68 70 bd 00 c0       	push   0xc000bd70
c0008de5:	68 77 01 00 00       	push   0x177
c0008dea:	e8 f1 f5 ff ff       	call   c00083e0 <load_idt>
c0008def:	0f 01 5d f0          	lidtd  [ebp-0x10]
c0008df3:	83 c4 10             	add    esp,0x10
c0008df6:	c9                   	leave  
c0008df7:	c3                   	ret    

c0008df8 <register_handler>:
c0008df8:	55                   	push   ebp
c0008df9:	89 e5                	mov    ebp,esp
c0008dfb:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
c0008dfe:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0008e01:	5d                   	pop    ebp
c0008e02:	89 14 85 e8 be 00 c0 	mov    DWORD PTR [eax*4-0x3fff4118],edx
c0008e09:	c3                   	ret    

c0008e0a <intr_get_status>:
c0008e0a:	55                   	push   ebp
c0008e0b:	89 e5                	mov    ebp,esp
c0008e0d:	83 ec 10             	sub    esp,0x10
c0008e10:	9c                   	pushf  
c0008e11:	8f 45 fc             	pop    DWORD PTR [ebp-0x4]
c0008e14:	31 c0                	xor    eax,eax
c0008e16:	f6 45 fd 02          	test   BYTE PTR [ebp-0x3],0x2
c0008e1a:	c9                   	leave  
c0008e1b:	0f 95 c0             	setne  al
c0008e1e:	c3                   	ret    

c0008e1f <intr_disable>:
c0008e1f:	55                   	push   ebp
c0008e20:	89 e5                	mov    ebp,esp
c0008e22:	e8 e3 ff ff ff       	call   c0008e0a <intr_get_status>
c0008e27:	31 d2                	xor    edx,edx
c0008e29:	48                   	dec    eax
c0008e2a:	75 03                	jne    c0008e2f <intr_disable+0x10>
c0008e2c:	fa                   	cli    
c0008e2d:	b2 01                	mov    dl,0x1
c0008e2f:	89 d0                	mov    eax,edx
c0008e31:	5d                   	pop    ebp
c0008e32:	c3                   	ret    

c0008e33 <intr_enable>:
c0008e33:	55                   	push   ebp
c0008e34:	89 e5                	mov    ebp,esp
c0008e36:	e8 cf ff ff ff       	call   c0008e0a <intr_get_status>
c0008e3b:	ba 01 00 00 00       	mov    edx,0x1
c0008e40:	48                   	dec    eax
c0008e41:	74 03                	je     c0008e46 <intr_enable+0x13>
c0008e43:	fb                   	sti    
c0008e44:	30 d2                	xor    dl,dl
c0008e46:	89 d0                	mov    eax,edx
c0008e48:	5d                   	pop    ebp
c0008e49:	c3                   	ret    

c0008e4a <intr_set_status>:
c0008e4a:	55                   	push   ebp
c0008e4b:	89 e5                	mov    ebp,esp
c0008e4d:	83 7d 08 01          	cmp    DWORD PTR [ebp+0x8],0x1
c0008e51:	75 06                	jne    c0008e59 <intr_set_status+0xf>
c0008e53:	5d                   	pop    ebp
c0008e54:	e9 da ff ff ff       	jmp    c0008e33 <intr_enable>
c0008e59:	5d                   	pop    ebp
c0008e5a:	e9 c0 ff ff ff       	jmp    c0008e1f <intr_disable>
	...

c0008e60 <list_init>:
c0008e60:	55                   	push   ebp
c0008e61:	89 e5                	mov    ebp,esp
c0008e63:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0008e66:	8d 50 08             	lea    edx,[eax+0x8]
c0008e69:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
c0008e6f:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
c0008e72:	89 40 08             	mov    DWORD PTR [eax+0x8],eax
c0008e75:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [eax+0xc],0x0
c0008e7c:	5d                   	pop    ebp
c0008e7d:	c3                   	ret    

c0008e7e <list_in>:
c0008e7e:	55                   	push   ebp
c0008e7f:	89 e5                	mov    ebp,esp
c0008e81:	56                   	push   esi
c0008e82:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
c0008e85:	53                   	push   ebx
c0008e86:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
c0008e89:	e8 91 ff ff ff       	call   c0008e1f <intr_disable>
c0008e8e:	8b 13                	mov    edx,DWORD PTR [ebx]
c0008e90:	89 5e 04             	mov    DWORD PTR [esi+0x4],ebx
c0008e93:	89 16                	mov    DWORD PTR [esi],edx
c0008e95:	8b 13                	mov    edx,DWORD PTR [ebx]
c0008e97:	89 33                	mov    DWORD PTR [ebx],esi
c0008e99:	89 72 04             	mov    DWORD PTR [edx+0x4],esi
c0008e9c:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
c0008e9f:	5b                   	pop    ebx
c0008ea0:	5e                   	pop    esi
c0008ea1:	5d                   	pop    ebp
c0008ea2:	e9 a3 ff ff ff       	jmp    c0008e4a <intr_set_status>

c0008ea7 <list_push>:
c0008ea7:	55                   	push   ebp
c0008ea8:	89 e5                	mov    ebp,esp
c0008eaa:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
c0008ead:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
c0008eb0:	8b 52 04             	mov    edx,DWORD PTR [edx+0x4]
c0008eb3:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
c0008eb6:	89 55 0c             	mov    DWORD PTR [ebp+0xc],edx
c0008eb9:	5d                   	pop    ebp
c0008eba:	e9 bf ff ff ff       	jmp    c0008e7e <list_in>

c0008ebf <list_append>:
c0008ebf:	55                   	push   ebp
c0008ec0:	89 e5                	mov    ebp,esp
c0008ec2:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
c0008ec5:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
c0008ec8:	8b 52 08             	mov    edx,DWORD PTR [edx+0x8]
c0008ecb:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
c0008ece:	89 55 0c             	mov    DWORD PTR [ebp+0xc],edx
c0008ed1:	5d                   	pop    ebp
c0008ed2:	e9 a7 ff ff ff       	jmp    c0008e7e <list_in>

c0008ed7 <list_remove>:
c0008ed7:	55                   	push   ebp
c0008ed8:	89 e5                	mov    ebp,esp
c0008eda:	53                   	push   ebx
c0008edb:	50                   	push   eax
c0008edc:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c0008edf:	e8 3b ff ff ff       	call   c0008e1f <intr_disable>
c0008ee4:	8b 13                	mov    edx,DWORD PTR [ebx]
c0008ee6:	85 d2                	test   edx,edx
c0008ee8:	74 1c                	je     c0008f06 <list_remove+0x2f>
c0008eea:	8b 4b 04             	mov    ecx,DWORD PTR [ebx+0x4]
c0008eed:	85 c9                	test   ecx,ecx
c0008eef:	74 15                	je     c0008f06 <list_remove+0x2f>
c0008ef1:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
c0008ef4:	8b 4b 04             	mov    ecx,DWORD PTR [ebx+0x4]
c0008ef7:	c7 43 04 00 00 00 00 	mov    DWORD PTR [ebx+0x4],0x0
c0008efe:	89 11                	mov    DWORD PTR [ecx],edx
c0008f00:	c7 03 00 00 00 00    	mov    DWORD PTR [ebx],0x0
c0008f06:	83 ec 0c             	sub    esp,0xc
c0008f09:	50                   	push   eax
c0008f0a:	e8 3b ff ff ff       	call   c0008e4a <intr_set_status>
c0008f0f:	89 d8                	mov    eax,ebx
c0008f11:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
c0008f14:	c9                   	leave  
c0008f15:	c3                   	ret    

c0008f16 <list_pop>:
c0008f16:	55                   	push   ebp
c0008f17:	89 e5                	mov    ebp,esp
c0008f19:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0008f1c:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
c0008f1f:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
c0008f22:	5d                   	pop    ebp
c0008f23:	e9 af ff ff ff       	jmp    c0008ed7 <list_remove>

c0008f28 <list_find>:
c0008f28:	55                   	push   ebp
c0008f29:	89 e5                	mov    ebp,esp
c0008f2b:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
c0008f2e:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
c0008f31:	8b 42 04             	mov    eax,DWORD PTR [edx+0x4]
c0008f34:	83 c2 08             	add    edx,0x8
c0008f37:	eb 07                	jmp    c0008f40 <list_find+0x18>
c0008f39:	39 c8                	cmp    eax,ecx
c0008f3b:	74 0b                	je     c0008f48 <list_find+0x20>
c0008f3d:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
c0008f40:	39 d0                	cmp    eax,edx
c0008f42:	75 f5                	jne    c0008f39 <list_find+0x11>
c0008f44:	31 c0                	xor    eax,eax
c0008f46:	eb 05                	jmp    c0008f4d <list_find+0x25>
c0008f48:	b8 01 00 00 00       	mov    eax,0x1
c0008f4d:	5d                   	pop    ebp
c0008f4e:	c3                   	ret    
	...

c0008f50 <init_memmam>:
c0008f50:	55                   	push   ebp
c0008f51:	89 e5                	mov    ebp,esp
c0008f53:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0008f56:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
c0008f5c:	c7 40 04 00 00 00 00 	mov    DWORD PTR [eax+0x4],0x0
c0008f63:	c7 40 08 00 00 00 00 	mov    DWORD PTR [eax+0x8],0x0
c0008f6a:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [eax+0xc],0x0
c0008f71:	5d                   	pop    ebp
c0008f72:	c3                   	ret    

c0008f73 <TotalFreeSize>:
c0008f73:	55                   	push   ebp
c0008f74:	31 d2                	xor    edx,edx
c0008f76:	89 e5                	mov    ebp,esp
c0008f78:	31 c0                	xor    eax,eax
c0008f7a:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
c0008f7d:	53                   	push   ebx
c0008f7e:	8b 19                	mov    ebx,DWORD PTR [ecx]
c0008f80:	eb 05                	jmp    c0008f87 <TotalFreeSize+0x14>
c0008f82:	03 44 d1 14          	add    eax,DWORD PTR [ecx+edx*8+0x14]
c0008f86:	42                   	inc    edx
c0008f87:	39 da                	cmp    edx,ebx
c0008f89:	75 f7                	jne    c0008f82 <TotalFreeSize+0xf>
c0008f8b:	5b                   	pop    ebx
c0008f8c:	5d                   	pop    ebp
c0008f8d:	c3                   	ret    

c0008f8e <mem_alloc>:
c0008f8e:	55                   	push   ebp
c0008f8f:	89 e5                	mov    ebp,esp
c0008f91:	57                   	push   edi
c0008f92:	56                   	push   esi
c0008f93:	53                   	push   ebx
c0008f94:	51                   	push   ecx
c0008f95:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
c0008f98:	31 c9                	xor    ecx,ecx
c0008f9a:	8b 02                	mov    eax,DWORD PTR [edx]
c0008f9c:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
c0008f9f:	eb 42                	jmp    c0008fe3 <mem_alloc+0x55>
c0008fa1:	8b 74 ca 14          	mov    esi,DWORD PTR [edx+ecx*8+0x14]
c0008fa5:	3b 75 0c             	cmp    esi,DWORD PTR [ebp+0xc]
c0008fa8:	72 38                	jb     c0008fe2 <mem_alloc+0x54>
c0008faa:	8d 59 02             	lea    ebx,[ecx+0x2]
c0008fad:	8b 7d 0c             	mov    edi,DWORD PTR [ebp+0xc]
c0008fb0:	8b 04 da             	mov    eax,DWORD PTR [edx+ebx*8]
c0008fb3:	2b 75 0c             	sub    esi,DWORD PTR [ebp+0xc]
c0008fb6:	01 c7                	add    edi,eax
c0008fb8:	85 f6                	test   esi,esi
c0008fba:	89 3c da             	mov    DWORD PTR [edx+ebx*8],edi
c0008fbd:	89 74 da 04          	mov    DWORD PTR [edx+ebx*8+0x4],esi
c0008fc1:	75 27                	jne    c0008fea <mem_alloc+0x5c>
c0008fc3:	8b 5d f0             	mov    ebx,DWORD PTR [ebp-0x10]
c0008fc6:	4b                   	dec    ebx
c0008fc7:	89 1a                	mov    DWORD PTR [edx],ebx
c0008fc9:	eb 11                	jmp    c0008fdc <mem_alloc+0x4e>
c0008fcb:	41                   	inc    ecx
c0008fcc:	8b 74 ca 10          	mov    esi,DWORD PTR [edx+ecx*8+0x10]
c0008fd0:	8b 7c ca 14          	mov    edi,DWORD PTR [edx+ecx*8+0x14]
c0008fd4:	89 74 ca 08          	mov    DWORD PTR [edx+ecx*8+0x8],esi
c0008fd8:	89 7c ca 0c          	mov    DWORD PTR [edx+ecx*8+0xc],edi
c0008fdc:	39 d9                	cmp    ecx,ebx
c0008fde:	72 eb                	jb     c0008fcb <mem_alloc+0x3d>
c0008fe0:	eb 08                	jmp    c0008fea <mem_alloc+0x5c>
c0008fe2:	41                   	inc    ecx
c0008fe3:	3b 4d f0             	cmp    ecx,DWORD PTR [ebp-0x10]
c0008fe6:	75 b9                	jne    c0008fa1 <mem_alloc+0x13>
c0008fe8:	31 c0                	xor    eax,eax
c0008fea:	5a                   	pop    edx
c0008feb:	5b                   	pop    ebx
c0008fec:	5e                   	pop    esi
c0008fed:	5f                   	pop    edi
c0008fee:	5d                   	pop    ebp
c0008fef:	c3                   	ret    

c0008ff0 <mem_alloc_page>:
c0008ff0:	55                   	push   ebp
c0008ff1:	89 e5                	mov    ebp,esp
c0008ff3:	c1 65 0c 0c          	shl    DWORD PTR [ebp+0xc],0xc
c0008ff7:	5d                   	pop    ebp
c0008ff8:	e9 91 ff ff ff       	jmp    c0008f8e <mem_alloc>

c0008ffd <mem_free>:
c0008ffd:	55                   	push   ebp
c0008ffe:	31 c9                	xor    ecx,ecx
c0009000:	89 e5                	mov    ebp,esp
c0009002:	57                   	push   edi
c0009003:	56                   	push   esi
c0009004:	53                   	push   ebx
c0009005:	83 ec 10             	sub    esp,0x10
c0009008:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
c000900b:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
c000900e:	8b 75 10             	mov    esi,DWORD PTR [ebp+0x10]
c0009011:	8b 02                	mov    eax,DWORD PTR [edx]
c0009013:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
c0009016:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
c0009019:	eb 07                	jmp    c0009022 <mem_free+0x25>
c000901b:	39 5c ca 10          	cmp    DWORD PTR [edx+ecx*8+0x10],ebx
c000901f:	77 06                	ja     c0009027 <mem_free+0x2a>
c0009021:	41                   	inc    ecx
c0009022:	3b 4d ec             	cmp    ecx,DWORD PTR [ebp-0x14]
c0009025:	75 f4                	jne    c000901b <mem_free+0x1e>
c0009027:	85 c9                	test   ecx,ecx
c0009029:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
c000902c:	74 60                	je     c000908e <mem_free+0x91>
c000902e:	8d 79 01             	lea    edi,[ecx+0x1]
c0009031:	8b 44 fa 04          	mov    eax,DWORD PTR [edx+edi*8+0x4]
c0009035:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
c0009038:	03 04 fa             	add    eax,DWORD PTR [edx+edi*8]
c000903b:	39 d8                	cmp    eax,ebx
c000903d:	75 4f                	jne    c000908e <mem_free+0x91>
c000903f:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
c0009042:	01 f0                	add    eax,esi
c0009044:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
c0009047:	89 44 fa 04          	mov    DWORD PTR [edx+edi*8+0x4],eax
c000904b:	31 c0                	xor    eax,eax
c000904d:	3b 4d ec             	cmp    ecx,DWORD PTR [ebp-0x14]
c0009050:	0f 83 a9 00 00 00    	jae    c00090ff <mem_free+0x102>
c0009056:	01 de                	add    esi,ebx
c0009058:	8d 59 02             	lea    ebx,[ecx+0x2]
c000905b:	39 34 da             	cmp    DWORD PTR [edx+ebx*8],esi
c000905e:	0f 85 9b 00 00 00    	jne    c00090ff <mem_free+0x102>
c0009064:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
c0009067:	03 44 da 04          	add    eax,DWORD PTR [edx+ebx*8+0x4]
c000906b:	89 44 fa 04          	mov    DWORD PTR [edx+edi*8+0x4],eax
c000906f:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
c0009072:	48                   	dec    eax
c0009073:	89 02                	mov    DWORD PTR [edx],eax
c0009075:	eb 11                	jmp    c0009088 <mem_free+0x8b>
c0009077:	41                   	inc    ecx
c0009078:	8b 74 ca 10          	mov    esi,DWORD PTR [edx+ecx*8+0x10]
c000907c:	8b 7c ca 14          	mov    edi,DWORD PTR [edx+ecx*8+0x14]
c0009080:	89 74 ca 08          	mov    DWORD PTR [edx+ecx*8+0x8],esi
c0009084:	89 7c ca 0c          	mov    DWORD PTR [edx+ecx*8+0xc],edi
c0009088:	39 c1                	cmp    ecx,eax
c000908a:	72 eb                	jb     c0009077 <mem_free+0x7a>
c000908c:	eb 1d                	jmp    c00090ab <mem_free+0xae>
c000908e:	3b 4d ec             	cmp    ecx,DWORD PTR [ebp-0x14]
c0009091:	73 1c                	jae    c00090af <mem_free+0xb2>
c0009093:	8d 3c 33             	lea    edi,[ebx+esi*1]
c0009096:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
c0009099:	8d 79 02             	lea    edi,[ecx+0x2]
c000909c:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
c000909f:	39 04 fa             	cmp    DWORD PTR [edx+edi*8],eax
c00090a2:	75 0b                	jne    c00090af <mem_free+0xb2>
c00090a4:	01 74 fa 04          	add    DWORD PTR [edx+edi*8+0x4],esi
c00090a8:	89 1c fa             	mov    DWORD PTR [edx+edi*8],ebx
c00090ab:	31 c0                	xor    eax,eax
c00090ad:	eb 50                	jmp    c00090ff <mem_free+0x102>
c00090af:	81 7d ec 9f 0f 00 00 	cmp    DWORD PTR [ebp-0x14],0xf9f
c00090b6:	76 15                	jbe    c00090cd <mem_free+0xd0>
c00090b8:	eb 3a                	jmp    c00090f4 <mem_free+0xf7>
c00090ba:	8b 74 c2 08          	mov    esi,DWORD PTR [edx+eax*8+0x8]
c00090be:	8b 7c c2 0c          	mov    edi,DWORD PTR [edx+eax*8+0xc]
c00090c2:	89 74 c2 10          	mov    DWORD PTR [edx+eax*8+0x10],esi
c00090c6:	89 7c c2 14          	mov    DWORD PTR [edx+eax*8+0x14],edi
c00090ca:	40                   	inc    eax
c00090cb:	eb 06                	jmp    c00090d3 <mem_free+0xd6>
c00090cd:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
c00090d0:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
c00090d3:	39 c8                	cmp    eax,ecx
c00090d5:	7f e3                	jg     c00090ba <mem_free+0xbd>
c00090d7:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
c00090da:	8b 75 f0             	mov    esi,DWORD PTR [ebp-0x10]
c00090dd:	40                   	inc    eax
c00090de:	39 42 04             	cmp    DWORD PTR [edx+0x4],eax
c00090e1:	89 02                	mov    DWORD PTR [edx],eax
c00090e3:	73 03                	jae    c00090e8 <mem_free+0xeb>
c00090e5:	89 42 04             	mov    DWORD PTR [edx+0x4],eax
c00090e8:	83 c1 02             	add    ecx,0x2
c00090eb:	89 1c ca             	mov    DWORD PTR [edx+ecx*8],ebx
c00090ee:	89 74 ca 04          	mov    DWORD PTR [edx+ecx*8+0x4],esi
c00090f2:	eb b7                	jmp    c00090ab <mem_free+0xae>
c00090f4:	ff 42 0c             	inc    DWORD PTR [edx+0xc]
c00090f7:	b8 01 00 00 00       	mov    eax,0x1
c00090fc:	01 72 08             	add    DWORD PTR [edx+0x8],esi
c00090ff:	83 c4 10             	add    esp,0x10
c0009102:	5b                   	pop    ebx
c0009103:	5e                   	pop    esi
c0009104:	5f                   	pop    edi
c0009105:	5d                   	pop    ebp
c0009106:	c3                   	ret    

c0009107 <mem_free_page>:
c0009107:	55                   	push   ebp
c0009108:	89 e5                	mov    ebp,esp
c000910a:	c1 65 10 0c          	shl    DWORD PTR [ebp+0x10],0xc
c000910e:	5d                   	pop    ebp
c000910f:	e9 e9 fe ff ff       	jmp    c0008ffd <mem_free>

c0009114 <init_memory>:
c0009114:	55                   	push   ebp
c0009115:	89 e5                	mov    ebp,esp
c0009117:	56                   	push   esi
c0009118:	53                   	push   ebx
c0009119:	8b 35 00 7c 00 00    	mov    esi,DWORD PTR ds:0x7c00
c000911f:	8d 9e 00 e0 ef ff    	lea    ebx,[esi-0x102000]
c0009125:	d1 eb                	shr    ebx,1
c0009127:	53                   	push   ebx
c0009128:	29 de                	sub    esi,ebx
c000912a:	68 00 20 10 00       	push   0x102000
c000912f:	81 c3 00 20 10 00    	add    ebx,0x102000
c0009135:	68 d4 36 02 c0       	push   0xc00236d4
c000913a:	e8 c8 ff ff ff       	call   c0009107 <mem_free_page>
c000913f:	56                   	push   esi
c0009140:	53                   	push   ebx
c0009141:	68 a4 bf 00 c0       	push   0xc000bfa4
c0009146:	e8 bc ff ff ff       	call   c0009107 <mem_free_page>
c000914b:	68 00 00 10 00       	push   0x100000
c0009150:	6a 00                	push   0x0
c0009152:	68 c4 b9 01 c0       	push   0xc001b9c4
c0009157:	e8 ab ff ff ff       	call   c0009107 <mem_free_page>
c000915c:	83 c4 24             	add    esp,0x24
c000915f:	68 ff ff ff 3d       	push   0x3dffffff
c0009164:	68 00 00 00 c0       	push   0xc0000000
c0009169:	68 c4 b9 01 c0       	push   0xc001b9c4
c000916e:	e8 94 ff ff ff       	call   c0009107 <mem_free_page>
c0009173:	83 c4 0c             	add    esp,0xc
c0009176:	8d 65 f8             	lea    esp,[ebp-0x8]
c0009179:	5b                   	pop    ebx
c000917a:	5e                   	pop    esi
c000917b:	5d                   	pop    ebp
c000917c:	c3                   	ret    

c000917d <pde_ptr>:
c000917d:	55                   	push   ebp
c000917e:	89 e5                	mov    ebp,esp
c0009180:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0009183:	5d                   	pop    ebp
c0009184:	c1 e8 16             	shr    eax,0x16
c0009187:	8d 04 85 00 f0 ff ff 	lea    eax,[eax*4-0x1000]
c000918e:	c3                   	ret    

c000918f <pte_ptr>:
c000918f:	55                   	push   ebp
c0009190:	89 e5                	mov    ebp,esp
c0009192:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0009195:	5d                   	pop    ebp
c0009196:	89 c2                	mov    edx,eax
c0009198:	25 00 f0 3f 00       	and    eax,0x3ff000
c000919d:	81 e2 00 00 c0 ff    	and    edx,0xffc00000
c00091a3:	c1 ea 0a             	shr    edx,0xa
c00091a6:	c1 e8 0a             	shr    eax,0xa
c00091a9:	8d 84 02 00 00 c0 ff 	lea    eax,[edx+eax*1-0x400000]
c00091b0:	c3                   	ret    

c00091b1 <page_table_add>:
c00091b1:	55                   	push   ebp
c00091b2:	89 e5                	mov    ebp,esp
c00091b4:	57                   	push   edi
c00091b5:	56                   	push   esi
c00091b6:	53                   	push   ebx
c00091b7:	83 ec 0c             	sub    esp,0xc
c00091ba:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c00091bd:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
c00091c0:	50                   	push   eax
c00091c1:	89 c7                	mov    edi,eax
c00091c3:	e8 c7 ff ff ff       	call   c000918f <pte_ptr>
c00091c8:	c1 ef 16             	shr    edi,0x16
c00091cb:	f6 04 bd 00 f0 ff ff 	test   BYTE PTR [edi*4-0x1000],0x1
c00091d2:	01 
c00091d3:	5b                   	pop    ebx
c00091d4:	89 c3                	mov    ebx,eax
c00091d6:	74 0c                	je     c00091e4 <page_table_add+0x33>
c00091d8:	f6 00 01             	test   BYTE PTR [eax],0x1
c00091db:	75 3c                	jne    c0009219 <page_table_add+0x68>
c00091dd:	83 ce 07             	or     esi,0x7
c00091e0:	89 30                	mov    DWORD PTR [eax],esi
c00091e2:	eb 35                	jmp    c0009219 <page_table_add+0x68>
c00091e4:	6a 01                	push   0x1
c00091e6:	83 ce 07             	or     esi,0x7
c00091e9:	68 d4 36 02 c0       	push   0xc00236d4
c00091ee:	e8 fd fd ff ff       	call   c0008ff0 <mem_alloc_page>
c00091f3:	83 ec 0c             	sub    esp,0xc
c00091f6:	83 c8 07             	or     eax,0x7
c00091f9:	89 04 bd 00 f0 ff ff 	mov    DWORD PTR [edi*4-0x1000],eax
c0009200:	89 d8                	mov    eax,ebx
c0009202:	68 00 10 00 00       	push   0x1000
c0009207:	25 00 f0 ff ff       	and    eax,0xfffff000
c000920c:	6a 00                	push   0x0
c000920e:	50                   	push   eax
c000920f:	e8 14 03 00 00       	call   c0009528 <memset>
c0009214:	83 c4 20             	add    esp,0x20
c0009217:	89 33                	mov    DWORD PTR [ebx],esi
c0009219:	8d 65 f4             	lea    esp,[ebp-0xc]
c000921c:	5b                   	pop    ebx
c000921d:	5e                   	pop    esi
c000921e:	5f                   	pop    edi
c000921f:	5d                   	pop    ebp
c0009220:	c3                   	ret    

c0009221 <page_alloc>:
c0009221:	55                   	push   ebp
c0009222:	89 e5                	mov    ebp,esp
c0009224:	57                   	push   edi
c0009225:	56                   	push   esi
c0009226:	53                   	push   ebx
c0009227:	83 ec 1c             	sub    esp,0x1c
c000922a:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
c000922d:	83 7d 08 01          	cmp    DWORD PTR [ebp+0x8],0x1
c0009231:	c7 45 e4 a4 bf 00 c0 	mov    DWORD PTR [ebp-0x1c],0xc000bfa4
c0009238:	75 07                	jne    c0009241 <page_alloc+0x20>
c000923a:	c7 45 e4 d4 36 02 c0 	mov    DWORD PTR [ebp-0x1c],0xc00236d4
c0009241:	56                   	push   esi
c0009242:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
c0009245:	e8 a6 fd ff ff       	call   c0008ff0 <mem_alloc_page>
c000924a:	59                   	pop    ecx
c000924b:	5f                   	pop    edi
c000924c:	85 c0                	test   eax,eax
c000924e:	89 c3                	mov    ebx,eax
c0009250:	89 c7                	mov    edi,eax
c0009252:	75 25                	jne    c0009279 <page_alloc+0x58>
c0009254:	eb 2b                	jmp    c0009281 <page_alloc+0x60>
c0009256:	6a 01                	push   0x1
c0009258:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
c000925b:	e8 90 fd ff ff       	call   c0008ff0 <mem_alloc_page>
c0009260:	59                   	pop    ecx
c0009261:	5a                   	pop    edx
c0009262:	85 c0                	test   eax,eax
c0009264:	74 19                	je     c000927f <page_alloc+0x5e>
c0009266:	52                   	push   edx
c0009267:	4e                   	dec    esi
c0009268:	52                   	push   edx
c0009269:	50                   	push   eax
c000926a:	57                   	push   edi
c000926b:	81 c7 00 10 00 00    	add    edi,0x1000
c0009271:	e8 3b ff ff ff       	call   c00091b1 <page_table_add>
c0009276:	83 c4 10             	add    esp,0x10
c0009279:	85 f6                	test   esi,esi
c000927b:	75 d9                	jne    c0009256 <page_alloc+0x35>
c000927d:	eb 02                	jmp    c0009281 <page_alloc+0x60>
c000927f:	31 db                	xor    ebx,ebx
c0009281:	8d 65 f4             	lea    esp,[ebp-0xc]
c0009284:	89 d8                	mov    eax,ebx
c0009286:	5b                   	pop    ebx
c0009287:	5e                   	pop    esi
c0009288:	5f                   	pop    edi
c0009289:	5d                   	pop    ebp
c000928a:	c3                   	ret    

c000928b <get_kernel_page>:
c000928b:	55                   	push   ebp
c000928c:	89 e5                	mov    ebp,esp
c000928e:	53                   	push   ebx
c000928f:	83 ec 1c             	sub    esp,0x1c
c0009292:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c0009295:	53                   	push   ebx
c0009296:	6a 01                	push   0x1
c0009298:	e8 84 ff ff ff       	call   c0009221 <page_alloc>
c000929d:	83 c4 10             	add    esp,0x10
c00092a0:	85 c0                	test   eax,eax
c00092a2:	74 16                	je     c00092ba <get_kernel_page+0x2f>
c00092a4:	c1 e3 0c             	shl    ebx,0xc
c00092a7:	52                   	push   edx
c00092a8:	53                   	push   ebx
c00092a9:	6a 00                	push   0x0
c00092ab:	50                   	push   eax
c00092ac:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
c00092af:	e8 74 02 00 00       	call   c0009528 <memset>
c00092b4:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
c00092b7:	83 c4 10             	add    esp,0x10
c00092ba:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
c00092bd:	c9                   	leave  
c00092be:	c3                   	ret    
c00092bf:	00 55 89             	add    BYTE PTR [ebp-0x77],dl
c00092c2:	e5 57                	in     eax,0x57
c00092c4:	56                   	push   esi
c00092c5:	53                   	push   ebx
c00092c6:	83 ec 08             	sub    esp,0x8
c00092c9:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c00092cc:	83 3d 0c 7c 00 00 01 	cmp    DWORD PTR ds:0x7c0c,0x1
c00092d3:	8a 45 18             	mov    al,BYTE PTR [ebp+0x18]
c00092d6:	75 47                	jne    c000931f <get_kernel_page+0x94>
c00092d8:	0f be c0             	movsx  eax,al
c00092db:	8b 33                	mov    esi,DWORD PTR [ebx]
c00092dd:	c1 e0 04             	shl    eax,0x4
c00092e0:	05 b0 9b 00 c0       	add    eax,0xc0009bb0
c00092e5:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
c00092e8:	31 c0                	xor    eax,eax
c00092ea:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
c00092ed:	b1 ff                	mov    cl,0xff
c00092ef:	89 5d ec             	mov    DWORD PTR [ebp-0x14],ebx
c00092f2:	01 c2                	add    edx,eax
c00092f4:	0f af 53 04          	imul   edx,DWORD PTR [ebx+0x4]
c00092f8:	03 55 0c             	add    edx,DWORD PTR [ebp+0xc]
c00092fb:	8d 3c 96             	lea    edi,[esi+edx*4]
c00092fe:	31 d2                	xor    edx,edx
c0009300:	8b 5d f0             	mov    ebx,DWORD PTR [ebp-0x10]
c0009303:	84 0c 03             	test   BYTE PTR [ebx+eax*1],cl
c0009306:	74 06                	je     c000930e <get_kernel_page+0x83>
c0009308:	8b 5d 14             	mov    ebx,DWORD PTR [ebp+0x14]
c000930b:	89 1c 97             	mov    DWORD PTR [edi+edx*4],ebx
c000930e:	42                   	inc    edx
c000930f:	d0 e9                	shr    cl,1
c0009311:	83 fa 08             	cmp    edx,0x8
c0009314:	75 ea                	jne    c0009300 <get_kernel_page+0x75>
c0009316:	40                   	inc    eax
c0009317:	8b 5d ec             	mov    ebx,DWORD PTR [ebp-0x14]
c000931a:	83 f8 10             	cmp    eax,0x10
c000931d:	75 cb                	jne    c00092ea <get_kernel_page+0x5f>
c000931f:	58                   	pop    eax
c0009320:	5a                   	pop    edx
c0009321:	5b                   	pop    ebx
c0009322:	5e                   	pop    esi
c0009323:	5f                   	pop    edi
c0009324:	5d                   	pop    ebp
c0009325:	c3                   	ret    
c0009326:	55                   	push   ebp
c0009327:	89 e5                	mov    ebp,esp
c0009329:	57                   	push   edi
c000932a:	8b 7d 14             	mov    edi,DWORD PTR [ebp+0x14]
c000932d:	56                   	push   esi
c000932e:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
c0009331:	53                   	push   ebx
c0009332:	8b 5d 18             	mov    ebx,DWORD PTR [ebp+0x18]
c0009335:	eb 17                	jmp    c000934e <get_kernel_page+0xc3>
c0009337:	0f be c0             	movsx  eax,al
c000933a:	50                   	push   eax
c000933b:	57                   	push   edi
c000933c:	ff 75 10             	push   DWORD PTR [ebp+0x10]
c000933f:	56                   	push   esi
c0009340:	83 c6 0a             	add    esi,0xa
c0009343:	ff 75 08             	push   DWORD PTR [ebp+0x8]
c0009346:	e8 87 ef ff ff       	call   c00082d2 <put_char_graphic>
c000934b:	83 c4 14             	add    esp,0x14
c000934e:	43                   	inc    ebx
c000934f:	8a 43 ff             	mov    al,BYTE PTR [ebx-0x1]
c0009352:	84 c0                	test   al,al
c0009354:	75 e1                	jne    c0009337 <get_kernel_page+0xac>
c0009356:	8d 65 f4             	lea    esp,[ebp-0xc]
c0009359:	5b                   	pop    ebx
c000935a:	5e                   	pop    esi
c000935b:	5f                   	pop    edi
c000935c:	5d                   	pop    ebp
c000935d:	c3                   	ret    

c000935e <itoa>:
c000935e:	55                   	push   ebp
c000935f:	89 e5                	mov    ebp,esp
c0009361:	57                   	push   edi
c0009362:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
c0009365:	56                   	push   esi
c0009366:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
c0009369:	53                   	push   ebx
c000936a:	8b 7d 10             	mov    edi,DWORD PTR [ebp+0x10]
c000936d:	31 db                	xor    ebx,ebx
c000936f:	89 f0                	mov    eax,esi
c0009371:	99                   	cdq    
c0009372:	89 d0                	mov    eax,edx
c0009374:	31 f0                	xor    eax,esi
c0009376:	29 d0                	sub    eax,edx
c0009378:	eb 02                	jmp    c000937c <itoa+0x1e>
c000937a:	89 d3                	mov    ebx,edx
c000937c:	99                   	cdq    
c000937d:	f7 ff                	idiv   edi
c000937f:	8a 92 c8 bb 00 c0    	mov    dl,BYTE PTR [edx-0x3fff4438]
c0009385:	85 c0                	test   eax,eax
c0009387:	88 14 19             	mov    BYTE PTR [ecx+ebx*1],dl
c000938a:	8d 53 01             	lea    edx,[ebx+0x1]
c000938d:	7f eb                	jg     c000937a <itoa+0x1c>
c000938f:	85 f6                	test   esi,esi
c0009391:	79 07                	jns    c000939a <itoa+0x3c>
c0009393:	c6 04 11 2d          	mov    BYTE PTR [ecx+edx*1],0x2d
c0009397:	8d 53 02             	lea    edx,[ebx+0x2]
c000939a:	c6 04 11 00          	mov    BYTE PTR [ecx+edx*1],0x0
c000939e:	89 c8                	mov    eax,ecx
c00093a0:	eb 01                	jmp    c00093a3 <itoa+0x45>
c00093a2:	40                   	inc    eax
c00093a3:	80 38 00             	cmp    BYTE PTR [eax],0x0
c00093a6:	75 fa                	jne    c00093a2 <itoa+0x44>
c00093a8:	eb 09                	jmp    c00093b3 <itoa+0x55>
c00093aa:	8a 11                	mov    dl,BYTE PTR [ecx]
c00093ac:	8a 18                	mov    bl,BYTE PTR [eax]
c00093ae:	88 19                	mov    BYTE PTR [ecx],bl
c00093b0:	41                   	inc    ecx
c00093b1:	88 10                	mov    BYTE PTR [eax],dl
c00093b3:	48                   	dec    eax
c00093b4:	39 c8                	cmp    eax,ecx
c00093b6:	77 f2                	ja     c00093aa <itoa+0x4c>
c00093b8:	5b                   	pop    ebx
c00093b9:	5e                   	pop    esi
c00093ba:	5f                   	pop    edi
c00093bb:	5d                   	pop    ebp
c00093bc:	c3                   	ret    

c00093bd <roll_screen>:
c00093bd:	55                   	push   ebp
c00093be:	31 c0                	xor    eax,eax
c00093c0:	89 e5                	mov    ebp,esp
c00093c2:	56                   	push   esi
c00093c3:	53                   	push   ebx
c00093c4:	8b 15 18 7c 00 00    	mov    edx,DWORD PTR ds:0x7c18
c00093ca:	8b 0d 10 7c 00 00    	mov    ecx,DWORD PTR ds:0x7c10
c00093d0:	8d 1c 51             	lea    ebx,[ecx+edx*2]
c00093d3:	4a                   	dec    edx
c00093d4:	0f af 15 1c 7c 00 00 	imul   edx,DWORD PTR ds:0x7c1c
c00093db:	eb 09                	jmp    c00093e6 <roll_screen+0x29>
c00093dd:	66 8b 34 43          	mov    si,WORD PTR [ebx+eax*2]
c00093e1:	66 89 34 41          	mov    WORD PTR [ecx+eax*2],si
c00093e5:	40                   	inc    eax
c00093e6:	39 d0                	cmp    eax,edx
c00093e8:	75 f3                	jne    c00093dd <roll_screen+0x20>
c00093ea:	5b                   	pop    ebx
c00093eb:	5e                   	pop    esi
c00093ec:	5d                   	pop    ebp
c00093ed:	c3                   	ret    

c00093ee <get_cursor>:
c00093ee:	55                   	push   ebp
c00093ef:	ba d4 03 00 00       	mov    edx,0x3d4
c00093f4:	89 e5                	mov    ebp,esp
c00093f6:	b8 0e 00 00 00       	mov    eax,0xe
c00093fb:	53                   	push   ebx
c00093fc:	ee                   	out    dx,al
c00093fd:	bb d5 03 00 00       	mov    ebx,0x3d5
c0009402:	89 da                	mov    edx,ebx
c0009404:	ec                   	in     al,dx
c0009405:	89 c1                	mov    ecx,eax
c0009407:	b2 d4                	mov    dl,0xd4
c0009409:	b8 0f 00 00 00       	mov    eax,0xf
c000940e:	ee                   	out    dx,al
c000940f:	89 da                	mov    edx,ebx
c0009411:	ec                   	in     al,dx
c0009412:	c1 e1 08             	shl    ecx,0x8
c0009415:	09 c1                	or     ecx,eax
c0009417:	89 c8                	mov    eax,ecx
c0009419:	5b                   	pop    ebx
c000941a:	5d                   	pop    ebp
c000941b:	c3                   	ret    

c000941c <set_cursor>:
c000941c:	55                   	push   ebp
c000941d:	ba d4 03 00 00       	mov    edx,0x3d4
c0009422:	89 e5                	mov    ebp,esp
c0009424:	b8 0e 00 00 00       	mov    eax,0xe
c0009429:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
c000942c:	ee                   	out    dx,al
c000942d:	0f b6 c5             	movzx  eax,ch
c0009430:	b2 d5                	mov    dl,0xd5
c0009432:	ee                   	out    dx,al
c0009433:	b8 0f 00 00 00       	mov    eax,0xf
c0009438:	b2 d4                	mov    dl,0xd4
c000943a:	ee                   	out    dx,al
c000943b:	0f b6 c1             	movzx  eax,cl
c000943e:	b2 d5                	mov    dl,0xd5
c0009440:	ee                   	out    dx,al
c0009441:	5d                   	pop    ebp
c0009442:	c3                   	ret    

c0009443 <put_char>:
c0009443:	55                   	push   ebp
c0009444:	89 e5                	mov    ebp,esp
c0009446:	53                   	push   ebx
c0009447:	8a 5d 08             	mov    bl,BYTE PTR [ebp+0x8]
c000944a:	83 3d 0c 7c 00 00 00 	cmp    DWORD PTR ds:0x7c0c,0x0
c0009451:	0f 85 80 00 00 00    	jne    c00094d7 <put_char+0x94>
c0009457:	e8 92 ff ff ff       	call   c00093ee <get_cursor>
c000945c:	80 fb 08             	cmp    bl,0x8
c000945f:	74 14                	je     c0009475 <put_char+0x32>
c0009461:	77 06                	ja     c0009469 <put_char+0x26>
c0009463:	84 db                	test   bl,bl
c0009465:	74 43                	je     c00094aa <put_char+0x67>
c0009467:	eb 2c                	jmp    c0009495 <put_char+0x52>
c0009469:	80 fb 0a             	cmp    bl,0xa
c000946c:	74 14                	je     c0009482 <put_char+0x3f>
c000946e:	80 fb 0d             	cmp    bl,0xd
c0009471:	75 22                	jne    c0009495 <put_char+0x52>
c0009473:	eb 0d                	jmp    c0009482 <put_char+0x3f>
c0009475:	8b 15 10 7c 00 00    	mov    edx,DWORD PTR ds:0x7c10
c000947b:	48                   	dec    eax
c000947c:	c6 04 42 20          	mov    BYTE PTR [edx+eax*2],0x20
c0009480:	eb 28                	jmp    c00094aa <put_char+0x67>
c0009482:	8b 1d 18 7c 00 00    	mov    ebx,DWORD PTR ds:0x7c18
c0009488:	31 d2                	xor    edx,edx
c000948a:	8d 0c 18             	lea    ecx,[eax+ebx*1]
c000948d:	f7 f3                	div    ebx
c000948f:	89 c8                	mov    eax,ecx
c0009491:	29 d0                	sub    eax,edx
c0009493:	eb 15                	jmp    c00094aa <put_char+0x67>
c0009495:	8b 15 10 7c 00 00    	mov    edx,DWORD PTR ds:0x7c10
c000949b:	88 1c 42             	mov    BYTE PTR [edx+eax*2],bl
c000949e:	8b 15 10 7c 00 00    	mov    edx,DWORD PTR ds:0x7c10
c00094a4:	c6 44 42 01 07       	mov    BYTE PTR [edx+eax*2+0x1],0x7
c00094a9:	40                   	inc    eax
c00094aa:	8b 15 1c 7c 00 00    	mov    edx,DWORD PTR ds:0x7c1c
c00094b0:	0f af 15 18 7c 00 00 	imul   edx,DWORD PTR ds:0x7c18
c00094b7:	39 d0                	cmp    eax,edx
c00094b9:	72 12                	jb     c00094cd <put_char+0x8a>
c00094bb:	e8 fd fe ff ff       	call   c00093bd <roll_screen>
c00094c0:	a1 1c 7c 00 00       	mov    eax,ds:0x7c1c
c00094c5:	48                   	dec    eax
c00094c6:	0f af 05 18 7c 00 00 	imul   eax,DWORD PTR ds:0x7c18
c00094cd:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
c00094d0:	5b                   	pop    ebx
c00094d1:	5d                   	pop    ebp
c00094d2:	e9 45 ff ff ff       	jmp    c000941c <set_cursor>
c00094d7:	5b                   	pop    ebx
c00094d8:	5d                   	pop    ebp
c00094d9:	c3                   	ret    

c00094da <put_str>:
c00094da:	55                   	push   ebp
c00094db:	89 e5                	mov    ebp,esp
c00094dd:	53                   	push   ebx
c00094de:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c00094e1:	eb 0b                	jmp    c00094ee <put_str+0x14>
c00094e3:	0f b6 c0             	movzx  eax,al
c00094e6:	43                   	inc    ebx
c00094e7:	50                   	push   eax
c00094e8:	e8 56 ff ff ff       	call   c0009443 <put_char>
c00094ed:	58                   	pop    eax
c00094ee:	8a 03                	mov    al,BYTE PTR [ebx]
c00094f0:	84 c0                	test   al,al
c00094f2:	75 ef                	jne    c00094e3 <put_str+0x9>
c00094f4:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
c00094f7:	c9                   	leave  
c00094f8:	c3                   	ret    

c00094f9 <put_int>:
c00094f9:	55                   	push   ebp
c00094fa:	31 c0                	xor    eax,eax
c00094fc:	89 e5                	mov    ebp,esp
c00094fe:	b9 42 00 00 00       	mov    ecx,0x42
c0009503:	57                   	push   edi
c0009504:	8d 7d ba             	lea    edi,[ebp-0x46]
c0009507:	83 ec 50             	sub    esp,0x50
c000950a:	f3 aa                	rep stos BYTE PTR es:[edi],al
c000950c:	8d 7d ba             	lea    edi,[ebp-0x46]
c000950f:	6a 10                	push   0x10
c0009511:	57                   	push   edi
c0009512:	ff 75 08             	push   DWORD PTR [ebp+0x8]
c0009515:	e8 44 fe ff ff       	call   c000935e <itoa>
c000951a:	57                   	push   edi
c000951b:	e8 ba ff ff ff       	call   c00094da <put_str>
c0009520:	83 c4 10             	add    esp,0x10
c0009523:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
c0009526:	c9                   	leave  
c0009527:	c3                   	ret    

c0009528 <memset>:
c0009528:	55                   	push   ebp
c0009529:	89 e5                	mov    ebp,esp
c000952b:	56                   	push   esi
c000952c:	53                   	push   ebx
c000952d:	83 ec 10             	sub    esp,0x10
c0009530:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c0009533:	8b 75 10             	mov    esi,DWORD PTR [ebp+0x10]
c0009536:	8a 55 0c             	mov    dl,BYTE PTR [ebp+0xc]
c0009539:	85 db                	test   ebx,ebx
c000953b:	75 1f                	jne    c000955c <memset+0x34>
c000953d:	68 f0 bb 00 c0       	push   0xc000bbf0
c0009542:	68 48 bc 00 c0       	push   0xc000bc48
c0009547:	6a 0f                	push   0xf
c0009549:	68 fe bb 00 c0       	push   0xc000bbfe
c000954e:	88 55 f4             	mov    BYTE PTR [ebp-0xc],dl
c0009551:	e8 6e eb ff ff       	call   c00080c4 <panic_spin>
c0009556:	8a 55 f4             	mov    dl,BYTE PTR [ebp-0xc]
c0009559:	83 c4 10             	add    esp,0x10
c000955c:	31 c0                	xor    eax,eax
c000955e:	eb 04                	jmp    c0009564 <memset+0x3c>
c0009560:	88 14 03             	mov    BYTE PTR [ebx+eax*1],dl
c0009563:	40                   	inc    eax
c0009564:	39 f0                	cmp    eax,esi
c0009566:	75 f8                	jne    c0009560 <memset+0x38>
c0009568:	8d 65 f8             	lea    esp,[ebp-0x8]
c000956b:	5b                   	pop    ebx
c000956c:	5e                   	pop    esi
c000956d:	5d                   	pop    ebp
c000956e:	c3                   	ret    

c000956f <memcpy>:
c000956f:	55                   	push   ebp
c0009570:	89 e5                	mov    ebp,esp
c0009572:	57                   	push   edi
c0009573:	56                   	push   esi
c0009574:	53                   	push   ebx
c0009575:	83 ec 0c             	sub    esp,0xc
c0009578:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
c000957b:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c000957e:	8b 7d 10             	mov    edi,DWORD PTR [ebp+0x10]
c0009581:	85 f6                	test   esi,esi
c0009583:	74 04                	je     c0009589 <memcpy+0x1a>
c0009585:	85 db                	test   ebx,ebx
c0009587:	75 19                	jne    c00095a2 <memcpy+0x33>
c0009589:	68 0b bc 00 c0       	push   0xc000bc0b
c000958e:	68 50 bc 00 c0       	push   0xc000bc50
c0009593:	6a 22                	push   0x22
c0009595:	68 fe bb 00 c0       	push   0xc000bbfe
c000959a:	e8 25 eb ff ff       	call   c00080c4 <panic_spin>
c000959f:	83 c4 10             	add    esp,0x10
c00095a2:	31 c0                	xor    eax,eax
c00095a4:	eb 07                	jmp    c00095ad <memcpy+0x3e>
c00095a6:	8a 14 06             	mov    dl,BYTE PTR [esi+eax*1]
c00095a9:	88 14 03             	mov    BYTE PTR [ebx+eax*1],dl
c00095ac:	40                   	inc    eax
c00095ad:	39 f8                	cmp    eax,edi
c00095af:	75 f5                	jne    c00095a6 <memcpy+0x37>
c00095b1:	8d 65 f4             	lea    esp,[ebp-0xc]
c00095b4:	5b                   	pop    ebx
c00095b5:	5e                   	pop    esi
c00095b6:	5f                   	pop    edi
c00095b7:	5d                   	pop    ebp
c00095b8:	c3                   	ret    

c00095b9 <memcmp>:
c00095b9:	55                   	push   ebp
c00095ba:	89 e5                	mov    ebp,esp
c00095bc:	56                   	push   esi
c00095bd:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
c00095c0:	53                   	push   ebx
c00095c1:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
c00095c4:	85 db                	test   ebx,ebx
c00095c6:	74 04                	je     c00095cc <memcmp+0x13>
c00095c8:	85 f6                	test   esi,esi
c00095ca:	75 19                	jne    c00095e5 <memcmp+0x2c>
c00095cc:	68 2a bc 00 c0       	push   0xc000bc2a
c00095d1:	68 58 bc 00 c0       	push   0xc000bc58
c00095d6:	6a 3b                	push   0x3b
c00095d8:	68 fe bb 00 c0       	push   0xc000bbfe
c00095dd:	e8 e2 ea ff ff       	call   c00080c4 <panic_spin>
c00095e2:	83 c4 10             	add    esp,0x10
c00095e5:	8a 13                	mov    dl,BYTE PTR [ebx]
c00095e7:	83 c8 ff             	or     eax,0xffffffff
c00095ea:	38 16                	cmp    BYTE PTR [esi],dl
c00095ec:	72 06                	jb     c00095f4 <memcmp+0x3b>
c00095ee:	0f 97 c0             	seta   al
c00095f1:	0f b6 c0             	movzx  eax,al
c00095f4:	8d 65 f8             	lea    esp,[ebp-0x8]
c00095f7:	5b                   	pop    ebx
c00095f8:	5e                   	pop    esi
c00095f9:	5d                   	pop    ebp
c00095fa:	c3                   	ret    

c00095fb <strcpy>:
c00095fb:	55                   	push   ebp
c00095fc:	31 d2                	xor    edx,edx
c00095fe:	89 e5                	mov    ebp,esp
c0009600:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0009603:	53                   	push   ebx
c0009604:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
c0009607:	8a 0c 13             	mov    cl,BYTE PTR [ebx+edx*1]
c000960a:	88 0c 10             	mov    BYTE PTR [eax+edx*1],cl
c000960d:	42                   	inc    edx
c000960e:	84 c9                	test   cl,cl
c0009610:	75 f5                	jne    c0009607 <strcpy+0xc>
c0009612:	5b                   	pop    ebx
c0009613:	5d                   	pop    ebp
c0009614:	c3                   	ret    
c0009615:	00 00                	add    BYTE PTR [eax],al
	...

c0009618 <kernel_thread>:
c0009618:	55                   	push   ebp
c0009619:	89 e5                	mov    ebp,esp
c000961b:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
c000961e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0009621:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
c0009624:	5d                   	pop    ebp
c0009625:	ff e0                	jmp    eax

c0009627 <init_thread>:
c0009627:	55                   	push   ebp
c0009628:	89 e5                	mov    ebp,esp
c000962a:	56                   	push   esi
c000962b:	8b 75 10             	mov    esi,DWORD PTR [ebp+0x10]
c000962e:	53                   	push   ebx
c000962f:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c0009632:	50                   	push   eax
c0009633:	6a 20                	push   0x20
c0009635:	6a 00                	push   0x0
c0009637:	53                   	push   ebx
c0009638:	e8 eb fe ff ff       	call   c0009528 <memset>
c000963d:	89 f0                	mov    eax,esi
c000963f:	83 c4 10             	add    esp,0x10
c0009642:	88 43 08             	mov    BYTE PTR [ebx+0x8],al
c0009645:	8d 83 00 10 00 00    	lea    eax,[ebx+0x1000]
c000964b:	c7 43 04 00 00 00 00 	mov    DWORD PTR [ebx+0x4],0x0
c0009652:	89 03                	mov    DWORD PTR [ebx],eax
c0009654:	c7 43 1c 78 56 34 12 	mov    DWORD PTR [ebx+0x1c],0x12345678
c000965b:	8d 65 f8             	lea    esp,[ebp-0x8]
c000965e:	5b                   	pop    ebx
c000965f:	5e                   	pop    esi
c0009660:	5d                   	pop    ebp
c0009661:	c3                   	ret    

c0009662 <thread_create>:
c0009662:	55                   	push   ebp
c0009663:	89 e5                	mov    ebp,esp
c0009665:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
c0009668:	8b 02                	mov    eax,DWORD PTR [edx]
c000966a:	8d 88 50 fe ff ff    	lea    ecx,[eax-0x1b0]
c0009670:	89 0a                	mov    DWORD PTR [edx],ecx
c0009672:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
c0009675:	c7 80 60 fe ff ff 18 	mov    DWORD PTR [eax-0x1a0],0xc0009618
c000967c:	96 00 c0 
c000967f:	c7 80 50 fe ff ff 00 	mov    DWORD PTR [eax-0x1b0],0x0
c0009686:	00 00 00 
c0009689:	c7 80 54 fe ff ff 00 	mov    DWORD PTR [eax-0x1ac],0x0
c0009690:	00 00 00 
c0009693:	89 90 68 fe ff ff    	mov    DWORD PTR [eax-0x198],edx
c0009699:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
c000969c:	c7 80 5c fe ff ff 00 	mov    DWORD PTR [eax-0x1a4],0x0
c00096a3:	00 00 00 
c00096a6:	c7 80 58 fe ff ff 00 	mov    DWORD PTR [eax-0x1a8],0x0
c00096ad:	00 00 00 
c00096b0:	89 90 6c fe ff ff    	mov    DWORD PTR [eax-0x194],edx
c00096b6:	5d                   	pop    ebp
c00096b7:	c3                   	ret    

c00096b8 <thread_start>:
c00096b8:	55                   	push   ebp
c00096b9:	89 e5                	mov    ebp,esp
c00096bb:	56                   	push   esi
c00096bc:	53                   	push   ebx
c00096bd:	8a 5d 0c             	mov    bl,BYTE PTR [ebp+0xc]
c00096c0:	83 ec 0c             	sub    esp,0xc
c00096c3:	6a 01                	push   0x1
c00096c5:	e8 c1 fb ff ff       	call   c000928b <get_kernel_page>
c00096ca:	83 c4 0c             	add    esp,0xc
c00096cd:	0f b6 db             	movzx  ebx,bl
c00096d0:	53                   	push   ebx
c00096d1:	ff 75 08             	push   DWORD PTR [ebp+0x8]
c00096d4:	89 c6                	mov    esi,eax
c00096d6:	50                   	push   eax
c00096d7:	e8 4b ff ff ff       	call   c0009627 <init_thread>
c00096dc:	83 c4 0c             	add    esp,0xc
c00096df:	ff 75 14             	push   DWORD PTR [ebp+0x14]
c00096e2:	ff 75 10             	push   DWORD PTR [ebp+0x10]
c00096e5:	56                   	push   esi
c00096e6:	e8 77 ff ff ff       	call   c0009662 <thread_create>
c00096eb:	8b 26                	mov    esp,DWORD PTR [esi]
c00096ed:	5d                   	pop    ebp
c00096ee:	5b                   	pop    ebx
c00096ef:	5f                   	pop    edi
c00096f0:	5e                   	pop    esi
c00096f1:	c3                   	ret    
c00096f2:	8d 65 f8             	lea    esp,[ebp-0x8]
c00096f5:	89 f0                	mov    eax,esi
c00096f7:	5b                   	pop    ebx
c00096f8:	5e                   	pop    esi
c00096f9:	5d                   	pop    ebp
c00096fa:	c3                   	ret    
	...

c00096fc <init_pit>:
c00096fc:	55                   	push   ebp
c00096fd:	ba 43 00 00 00       	mov    edx,0x43
c0009702:	89 e5                	mov    ebp,esp
c0009704:	b8 34 00 00 00       	mov    eax,0x34
c0009709:	ee                   	out    dx,al
c000970a:	b2 40                	mov    dl,0x40
c000970c:	b0 9c                	mov    al,0x9c
c000970e:	ee                   	out    dx,al
c000970f:	b0 2e                	mov    al,0x2e
c0009711:	ee                   	out    dx,al
c0009712:	5d                   	pop    ebp
c0009713:	c3                   	ret    

c0009714 <intr0x20_handler>:
c0009714:	55                   	push   ebp
c0009715:	ba a0 00 00 00       	mov    edx,0xa0
c000971a:	89 e5                	mov    ebp,esp
c000971c:	b8 60 00 00 00       	mov    eax,0x60
c0009721:	ee                   	out    dx,al
c0009722:	b2 20                	mov    dl,0x20
c0009724:	ee                   	out    dx,al
c0009725:	5d                   	pop    ebp
c0009726:	c3                   	ret    

Disassembly of section .text.startup:

c0009727 <main>:
c0009727:	8d 4c 24 04          	lea    ecx,[esp+0x4]
c000972b:	83 e4 f0             	and    esp,0xfffffff0
c000972e:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
c0009731:	55                   	push   ebp
c0009732:	89 e5                	mov    ebp,esp
c0009734:	51                   	push   ecx
c0009735:	83 ec 10             	sub    esp,0x10
c0009738:	6a 50                	push   0x50
c000973a:	e8 04 fd ff ff       	call   c0009443 <put_char>
c000973f:	c7 04 24 65 00 00 00 	mov    DWORD PTR [esp],0x65
c0009746:	e8 f8 fc ff ff       	call   c0009443 <put_char>
c000974b:	c7 04 24 6e 00 00 00 	mov    DWORD PTR [esp],0x6e
c0009752:	e8 ec fc ff ff       	call   c0009443 <put_char>
c0009757:	c7 04 24 63 00 00 00 	mov    DWORD PTR [esp],0x63
c000975e:	e8 e0 fc ff ff       	call   c0009443 <put_char>
c0009763:	c7 04 24 69 00 00 00 	mov    DWORD PTR [esp],0x69
c000976a:	e8 d4 fc ff ff       	call   c0009443 <put_char>
c000976f:	c7 04 24 6c 00 00 00 	mov    DWORD PTR [esp],0x6c
c0009776:	e8 c8 fc ff ff       	call   c0009443 <put_char>
c000977b:	c7 04 24 2d 00 00 00 	mov    DWORD PTR [esp],0x2d
c0009782:	e8 bc fc ff ff       	call   c0009443 <put_char>
c0009787:	c7 04 24 4b 00 00 00 	mov    DWORD PTR [esp],0x4b
c000978e:	e8 b0 fc ff ff       	call   c0009443 <put_char>
c0009793:	c7 04 24 65 00 00 00 	mov    DWORD PTR [esp],0x65
c000979a:	e8 a4 fc ff ff       	call   c0009443 <put_char>
c000979f:	c7 04 24 72 00 00 00 	mov    DWORD PTR [esp],0x72
c00097a6:	e8 98 fc ff ff       	call   c0009443 <put_char>
c00097ab:	c7 04 24 6e 00 00 00 	mov    DWORD PTR [esp],0x6e
c00097b2:	e8 8c fc ff ff       	call   c0009443 <put_char>
c00097b7:	c7 04 24 65 00 00 00 	mov    DWORD PTR [esp],0x65
c00097be:	e8 80 fc ff ff       	call   c0009443 <put_char>
c00097c3:	c7 04 24 6c 00 00 00 	mov    DWORD PTR [esp],0x6c
c00097ca:	e8 74 fc ff ff       	call   c0009443 <put_char>
c00097cf:	c7 04 24 20 00 00 00 	mov    DWORD PTR [esp],0x20
c00097d6:	e8 68 fc ff ff       	call   c0009443 <put_char>
c00097db:	c7 04 24 28 00 00 00 	mov    DWORD PTR [esp],0x28
c00097e2:	e8 5c fc ff ff       	call   c0009443 <put_char>
c00097e7:	c7 04 24 50 00 00 00 	mov    DWORD PTR [esp],0x50
c00097ee:	e8 50 fc ff ff       	call   c0009443 <put_char>
c00097f3:	c7 04 24 4b 00 00 00 	mov    DWORD PTR [esp],0x4b
c00097fa:	e8 44 fc ff ff       	call   c0009443 <put_char>
c00097ff:	c7 04 24 6e 00 00 00 	mov    DWORD PTR [esp],0x6e
c0009806:	e8 38 fc ff ff       	call   c0009443 <put_char>
c000980b:	c7 04 24 29 00 00 00 	mov    DWORD PTR [esp],0x29
c0009812:	e8 2c fc ff ff       	call   c0009443 <put_char>
c0009817:	c7 04 24 0a 00 00 00 	mov    DWORD PTR [esp],0xa
c000981e:	e8 20 fc ff ff       	call   c0009443 <put_char>
c0009823:	e8 8c eb ff ff       	call   c00083b4 <init_all>
c0009828:	c7 04 24 50 00 00 00 	mov    DWORD PTR [esp],0x50
c000982f:	68 ff ff ff 00       	push   0xffffff
c0009834:	6a 14                	push   0x14
c0009836:	6a 14                	push   0x14
c0009838:	68 68 bc 00 c0       	push   0xc000bc68
c000983d:	e8 90 ea ff ff       	call   c00082d2 <put_char_graphic>
c0009842:	83 c4 14             	add    esp,0x14
c0009845:	6a 65                	push   0x65
c0009847:	68 ff ff ff 00       	push   0xffffff
c000984c:	6a 14                	push   0x14
c000984e:	6a 1e                	push   0x1e
c0009850:	68 68 bc 00 c0       	push   0xc000bc68
c0009855:	e8 78 ea ff ff       	call   c00082d2 <put_char_graphic>
c000985a:	83 c4 14             	add    esp,0x14
c000985d:	6a 6e                	push   0x6e
c000985f:	68 ff ff ff 00       	push   0xffffff
c0009864:	6a 14                	push   0x14
c0009866:	6a 28                	push   0x28
c0009868:	68 68 bc 00 c0       	push   0xc000bc68
c000986d:	e8 60 ea ff ff       	call   c00082d2 <put_char_graphic>
c0009872:	83 c4 14             	add    esp,0x14
c0009875:	6a 63                	push   0x63
c0009877:	68 ff ff ff 00       	push   0xffffff
c000987c:	6a 14                	push   0x14
c000987e:	6a 32                	push   0x32
c0009880:	68 68 bc 00 c0       	push   0xc000bc68
c0009885:	e8 48 ea ff ff       	call   c00082d2 <put_char_graphic>
c000988a:	83 c4 14             	add    esp,0x14
c000988d:	6a 69                	push   0x69
c000988f:	68 ff ff ff 00       	push   0xffffff
c0009894:	6a 14                	push   0x14
c0009896:	6a 3c                	push   0x3c
c0009898:	68 68 bc 00 c0       	push   0xc000bc68
c000989d:	e8 30 ea ff ff       	call   c00082d2 <put_char_graphic>
c00098a2:	83 c4 14             	add    esp,0x14
c00098a5:	6a 6c                	push   0x6c
c00098a7:	68 ff ff ff 00       	push   0xffffff
c00098ac:	6a 14                	push   0x14
c00098ae:	6a 46                	push   0x46
c00098b0:	68 68 bc 00 c0       	push   0xc000bc68
c00098b5:	e8 18 ea ff ff       	call   c00082d2 <put_char_graphic>
c00098ba:	83 c4 14             	add    esp,0x14
c00098bd:	6a 2d                	push   0x2d
c00098bf:	68 ff ff ff 00       	push   0xffffff
c00098c4:	6a 14                	push   0x14
c00098c6:	6a 50                	push   0x50
c00098c8:	68 68 bc 00 c0       	push   0xc000bc68
c00098cd:	e8 00 ea ff ff       	call   c00082d2 <put_char_graphic>
c00098d2:	83 c4 14             	add    esp,0x14
c00098d5:	6a 4b                	push   0x4b
c00098d7:	68 ff ff ff 00       	push   0xffffff
c00098dc:	6a 14                	push   0x14
c00098de:	6a 5a                	push   0x5a
c00098e0:	68 68 bc 00 c0       	push   0xc000bc68
c00098e5:	e8 e8 e9 ff ff       	call   c00082d2 <put_char_graphic>
c00098ea:	83 c4 14             	add    esp,0x14
c00098ed:	6a 65                	push   0x65
c00098ef:	68 ff ff ff 00       	push   0xffffff
c00098f4:	6a 14                	push   0x14
c00098f6:	6a 64                	push   0x64
c00098f8:	68 68 bc 00 c0       	push   0xc000bc68
c00098fd:	e8 d0 e9 ff ff       	call   c00082d2 <put_char_graphic>
c0009902:	83 c4 14             	add    esp,0x14
c0009905:	6a 72                	push   0x72
c0009907:	68 ff ff ff 00       	push   0xffffff
c000990c:	6a 14                	push   0x14
c000990e:	6a 6e                	push   0x6e
c0009910:	68 68 bc 00 c0       	push   0xc000bc68
c0009915:	e8 b8 e9 ff ff       	call   c00082d2 <put_char_graphic>
c000991a:	83 c4 14             	add    esp,0x14
c000991d:	6a 6e                	push   0x6e
c000991f:	68 ff ff ff 00       	push   0xffffff
c0009924:	6a 14                	push   0x14
c0009926:	6a 78                	push   0x78
c0009928:	68 68 bc 00 c0       	push   0xc000bc68
c000992d:	e8 a0 e9 ff ff       	call   c00082d2 <put_char_graphic>
c0009932:	83 c4 14             	add    esp,0x14
c0009935:	6a 65                	push   0x65
c0009937:	68 ff ff ff 00       	push   0xffffff
c000993c:	6a 14                	push   0x14
c000993e:	68 82 00 00 00       	push   0x82
c0009943:	68 68 bc 00 c0       	push   0xc000bc68
c0009948:	e8 85 e9 ff ff       	call   c00082d2 <put_char_graphic>
c000994d:	83 c4 14             	add    esp,0x14
c0009950:	6a 6c                	push   0x6c
c0009952:	68 ff ff ff 00       	push   0xffffff
c0009957:	6a 14                	push   0x14
c0009959:	68 8c 00 00 00       	push   0x8c
c000995e:	68 68 bc 00 c0       	push   0xc000bc68
c0009963:	e8 6a e9 ff ff       	call   c00082d2 <put_char_graphic>
c0009968:	83 c4 14             	add    esp,0x14
c000996b:	6a 20                	push   0x20
c000996d:	68 ff ff ff 00       	push   0xffffff
c0009972:	6a 14                	push   0x14
c0009974:	68 96 00 00 00       	push   0x96
c0009979:	68 68 bc 00 c0       	push   0xc000bc68
c000997e:	e8 4f e9 ff ff       	call   c00082d2 <put_char_graphic>
c0009983:	83 c4 20             	add    esp,0x20
c0009986:	e8 a8 f4 ff ff       	call   c0008e33 <intr_enable>
c000998b:	6a 00                	push   0x0
c000998d:	68 58 7f 00 c0       	push   0xc0007f58
c0009992:	6a 1f                	push   0x1f
c0009994:	68 18 b9 00 c0       	push   0xc000b918
c0009999:	e8 1a fd ff ff       	call   c00096b8 <thread_start>
c000999e:	83 c4 10             	add    esp,0x10
c00099a1:	eb fe                	jmp    c00099a1 <main+0x27a>

Disassembly of section .data:

c00099a8 <_data>:
	...

c00099b0 <SectionCode32>:
c00099b0:	ff                   	(bad)  
c00099b1:	ff 00                	inc    DWORD PTR [eax]
c00099b3:	00 00                	add    BYTE PTR [eax],al
c00099b5:	98                   	cwde   
c00099b6:	cf                   	iret   
	...

c00099b8 <SectionData32>:
c00099b8:	ff                   	(bad)  
c00099b9:	ff 00                	inc    DWORD PTR [eax]
c00099bb:	00 00                	add    BYTE PTR [eax],al
c00099bd:	92                   	xchg   edx,eax
c00099be:	cf                   	iret   
	...

c00099c0 <SectionVideo>:
c00099c0:	07                   	pop    es
c00099c1:	00 00                	add    BYTE PTR [eax],al
c00099c3:	80 0b 92             	or     BYTE PTR [ebx],0x92
c00099c6:	c0 00 00             	rol    BYTE PTR [eax],0x0
	...

c0009ba8 <gdt_ptr>:
c0009ba8:	1f                   	pop    ds
c0009ba9:	00 a8 99 00 c0 00    	add    BYTE PTR [eax+0xc00099],ch
	...

c0009bb0 <PKnFont>:
	...
c0009dc0:	00 10                	add    BYTE PTR [eax],dl
c0009dc2:	10 10                	adc    BYTE PTR [eax],dl
c0009dc4:	10 10                	adc    BYTE PTR [eax],dl
c0009dc6:	10 10                	adc    BYTE PTR [eax],dl
c0009dc8:	10 10                	adc    BYTE PTR [eax],dl
c0009dca:	00 00                	add    BYTE PTR [eax],al
c0009dcc:	10 10                	adc    BYTE PTR [eax],dl
c0009dce:	00 00                	add    BYTE PTR [eax],al
c0009dd0:	28 28                	sub    BYTE PTR [eax],ch
c0009dd2:	28 00                	sub    BYTE PTR [eax],al
	...
c0009de0:	00 44 44 44          	add    BYTE PTR [esp+eax*2+0x44],al
c0009de4:	fe 44 44 44          	inc    BYTE PTR [esp+eax*2+0x44]
c0009de8:	44                   	inc    esp
c0009de9:	44                   	inc    esp
c0009dea:	fe 44 44 44          	inc    BYTE PTR [esp+eax*2+0x44]
c0009dee:	00 00                	add    BYTE PTR [eax],al
c0009df0:	10 3a                	adc    BYTE PTR [edx],bh
c0009df2:	56                   	push   esi
c0009df3:	92                   	xchg   edx,eax
c0009df4:	92                   	xchg   edx,eax
c0009df5:	90                   	nop
c0009df6:	50                   	push   eax
c0009df7:	38 14 12             	cmp    BYTE PTR [edx+edx*1],dl
c0009dfa:	92                   	xchg   edx,eax
c0009dfb:	92                   	xchg   edx,eax
c0009dfc:	d4 b8                	aam    0xb8
c0009dfe:	10 10                	adc    BYTE PTR [eax],dl
c0009e00:	62 92 94 94 68 08    	bound  edx,QWORD PTR [edx+0x8689494]
c0009e06:	10 10                	adc    BYTE PTR [eax],dl
c0009e08:	20 2c 52             	and    BYTE PTR [edx+edx*2],ch
c0009e0b:	52                   	push   edx
c0009e0c:	92                   	xchg   edx,eax
c0009e0d:	8c 00                	mov    WORD PTR [eax],es
c0009e0f:	00 00                	add    BYTE PTR [eax],al
c0009e11:	70 88                	jo     c0009d9b <PKnFont+0x1eb>
c0009e13:	88 88 90 60 47 a2    	mov    BYTE PTR [eax-0x5db89f70],cl
c0009e19:	92                   	xchg   edx,eax
c0009e1a:	8a 84 46 39 00 00 04 	mov    al,BYTE PTR [esi+eax*2+0x4000039]
c0009e21:	08 10                	or     BYTE PTR [eax],dl
	...
c0009e2f:	00 02                	add    BYTE PTR [edx],al
c0009e31:	04 08                	add    al,0x8
c0009e33:	08 10                	or     BYTE PTR [eax],dl
c0009e35:	10 10                	adc    BYTE PTR [eax],dl
c0009e37:	10 10                	adc    BYTE PTR [eax],dl
c0009e39:	10 10                	adc    BYTE PTR [eax],dl
c0009e3b:	08 08                	or     BYTE PTR [eax],cl
c0009e3d:	04 02                	add    al,0x2
c0009e3f:	00 80 40 20 20 10    	add    BYTE PTR [eax+0x10202040],al
c0009e45:	10 10                	adc    BYTE PTR [eax],dl
c0009e47:	10 10                	adc    BYTE PTR [eax],dl
c0009e49:	10 10                	adc    BYTE PTR [eax],dl
c0009e4b:	20 20                	and    BYTE PTR [eax],ah
c0009e4d:	40                   	inc    eax
c0009e4e:	80 00 00             	add    BYTE PTR [eax],0x0
c0009e51:	00 00                	add    BYTE PTR [eax],al
c0009e53:	00 00                	add    BYTE PTR [eax],al
c0009e55:	10 92 54 38 54 92    	adc    BYTE PTR [edx-0x6dabc7ac],dl
c0009e5b:	10 00                	adc    BYTE PTR [eax],al
	...
c0009e65:	10 10                	adc    BYTE PTR [eax],dl
c0009e67:	10 fe                	adc    dh,bh
c0009e69:	10 10                	adc    BYTE PTR [eax],dl
c0009e6b:	10 00                	adc    BYTE PTR [eax],al
	...
c0009e79:	00 00                	add    BYTE PTR [eax],al
c0009e7b:	18 18                	sbb    BYTE PTR [eax],bl
c0009e7d:	08 08                	or     BYTE PTR [eax],cl
c0009e7f:	10 00                	adc    BYTE PTR [eax],al
c0009e81:	00 00                	add    BYTE PTR [eax],al
c0009e83:	00 00                	add    BYTE PTR [eax],al
c0009e85:	00 00                	add    BYTE PTR [eax],al
c0009e87:	00 fe                	add    dh,bh
	...
c0009e99:	00 00                	add    BYTE PTR [eax],al
c0009e9b:	00 18                	add    BYTE PTR [eax],bl
c0009e9d:	18 00                	sbb    BYTE PTR [eax],al
c0009e9f:	00 02                	add    BYTE PTR [edx],al
c0009ea1:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
c0009ea4:	08 08                	or     BYTE PTR [eax],cl
c0009ea6:	08 10                	or     BYTE PTR [eax],dl
c0009ea8:	10 20                	adc    BYTE PTR [eax],ah
c0009eaa:	20 40 40             	and    BYTE PTR [eax+0x40],al
c0009ead:	40                   	inc    eax
c0009eae:	80 80 00 18 24 24 42 	add    BYTE PTR [eax+0x24241800],0x42
c0009eb5:	42                   	inc    edx
c0009eb6:	42                   	inc    edx
c0009eb7:	42                   	inc    edx
c0009eb8:	42                   	inc    edx
c0009eb9:	42                   	inc    edx
c0009eba:	42                   	inc    edx
c0009ebb:	24 24                	and    al,0x24
c0009ebd:	18 00                	sbb    BYTE PTR [eax],al
c0009ebf:	00 00                	add    BYTE PTR [eax],al
c0009ec1:	08 18                	or     BYTE PTR [eax],bl
c0009ec3:	28 08                	sub    BYTE PTR [eax],cl
c0009ec5:	08 08                	or     BYTE PTR [eax],cl
c0009ec7:	08 08                	or     BYTE PTR [eax],cl
c0009ec9:	08 08                	or     BYTE PTR [eax],cl
c0009ecb:	08 08                	or     BYTE PTR [eax],cl
c0009ecd:	3e 00 00             	add    BYTE PTR ds:[eax],al
c0009ed0:	00 18                	add    BYTE PTR [eax],bl
c0009ed2:	24 42                	and    al,0x42
c0009ed4:	42                   	inc    edx
c0009ed5:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
c0009ed8:	10 20                	adc    BYTE PTR [eax],ah
c0009eda:	20 40 40             	and    BYTE PTR [eax+0x40],al
c0009edd:	7e 00                	jle    c0009edf <PKnFont+0x32f>
c0009edf:	00 00                	add    BYTE PTR [eax],al
c0009ee1:	18 24 42             	sbb    BYTE PTR [edx+eax*2],ah
c0009ee4:	02 02                	add    al,BYTE PTR [edx]
c0009ee6:	04 18                	add    al,0x18
c0009ee8:	04 02                	add    al,0x2
c0009eea:	02 42 24             	add    al,BYTE PTR [edx+0x24]
c0009eed:	18 00                	sbb    BYTE PTR [eax],al
c0009eef:	00 00                	add    BYTE PTR [eax],al
c0009ef1:	0c 0c                	or     al,0xc
c0009ef3:	0c 14                	or     al,0x14
c0009ef5:	14 14                	adc    al,0x14
c0009ef7:	24 24                	and    al,0x24
c0009ef9:	44                   	inc    esp
c0009efa:	7e 04                	jle    c0009f00 <PKnFont+0x350>
c0009efc:	04 1e                	add    al,0x1e
c0009efe:	00 00                	add    BYTE PTR [eax],al
c0009f00:	00 7c 40 40          	add    BYTE PTR [eax+eax*2+0x40],bh
c0009f04:	40                   	inc    eax
c0009f05:	58                   	pop    eax
c0009f06:	64 02 02             	add    al,BYTE PTR fs:[edx]
c0009f09:	02 02                	add    al,BYTE PTR [edx]
c0009f0b:	42                   	inc    edx
c0009f0c:	24 18                	and    al,0x18
c0009f0e:	00 00                	add    BYTE PTR [eax],al
c0009f10:	00 18                	add    BYTE PTR [eax],bl
c0009f12:	24 42                	and    al,0x42
c0009f14:	40                   	inc    eax
c0009f15:	58                   	pop    eax
c0009f16:	64 42                	fs inc edx
c0009f18:	42                   	inc    edx
c0009f19:	42                   	inc    edx
c0009f1a:	42                   	inc    edx
c0009f1b:	42                   	inc    edx
c0009f1c:	24 18                	and    al,0x18
c0009f1e:	00 00                	add    BYTE PTR [eax],al
c0009f20:	00 7e 42             	add    BYTE PTR [esi+0x42],bh
c0009f23:	42                   	inc    edx
c0009f24:	04 04                	add    al,0x4
c0009f26:	08 08                	or     BYTE PTR [eax],cl
c0009f28:	08 10                	or     BYTE PTR [eax],dl
c0009f2a:	10 10                	adc    BYTE PTR [eax],dl
c0009f2c:	10 38                	adc    BYTE PTR [eax],bh
c0009f2e:	00 00                	add    BYTE PTR [eax],al
c0009f30:	00 18                	add    BYTE PTR [eax],bl
c0009f32:	24 42                	and    al,0x42
c0009f34:	42                   	inc    edx
c0009f35:	42                   	inc    edx
c0009f36:	24 18                	and    al,0x18
c0009f38:	24 42                	and    al,0x42
c0009f3a:	42                   	inc    edx
c0009f3b:	42                   	inc    edx
c0009f3c:	24 18                	and    al,0x18
c0009f3e:	00 00                	add    BYTE PTR [eax],al
c0009f40:	00 18                	add    BYTE PTR [eax],bl
c0009f42:	24 42                	and    al,0x42
c0009f44:	42                   	inc    edx
c0009f45:	42                   	inc    edx
c0009f46:	42                   	inc    edx
c0009f47:	42                   	inc    edx
c0009f48:	26 1a 02             	sbb    al,BYTE PTR es:[edx]
c0009f4b:	42                   	inc    edx
c0009f4c:	24 18                	and    al,0x18
c0009f4e:	00 00                	add    BYTE PTR [eax],al
c0009f50:	00 00                	add    BYTE PTR [eax],al
c0009f52:	00 00                	add    BYTE PTR [eax],al
c0009f54:	00 18                	add    BYTE PTR [eax],bl
c0009f56:	18 00                	sbb    BYTE PTR [eax],al
c0009f58:	00 00                	add    BYTE PTR [eax],al
c0009f5a:	00 00                	add    BYTE PTR [eax],al
c0009f5c:	18 18                	sbb    BYTE PTR [eax],bl
c0009f5e:	00 00                	add    BYTE PTR [eax],al
c0009f60:	00 00                	add    BYTE PTR [eax],al
c0009f62:	00 00                	add    BYTE PTR [eax],al
c0009f64:	00 18                	add    BYTE PTR [eax],bl
c0009f66:	18 00                	sbb    BYTE PTR [eax],al
c0009f68:	00 00                	add    BYTE PTR [eax],al
c0009f6a:	00 18                	add    BYTE PTR [eax],bl
c0009f6c:	18 08                	sbb    BYTE PTR [eax],cl
c0009f6e:	08 10                	or     BYTE PTR [eax],dl
c0009f70:	00 02                	add    BYTE PTR [edx],al
c0009f72:	04 08                	add    al,0x8
c0009f74:	10 20                	adc    BYTE PTR [eax],ah
c0009f76:	40                   	inc    eax
c0009f77:	80 80 40 20 10 08 04 	add    BYTE PTR [eax+0x8102040],0x4
c0009f7e:	02 00                	add    al,BYTE PTR [eax]
c0009f80:	00 00                	add    BYTE PTR [eax],al
c0009f82:	00 00                	add    BYTE PTR [eax],al
c0009f84:	00 00                	add    BYTE PTR [eax],al
c0009f86:	fe 00                	inc    BYTE PTR [eax]
c0009f88:	00 fe                	add    dh,bh
c0009f8a:	00 00                	add    BYTE PTR [eax],al
c0009f8c:	00 00                	add    BYTE PTR [eax],al
c0009f8e:	00 00                	add    BYTE PTR [eax],al
c0009f90:	00 80 40 20 10 08    	add    BYTE PTR [eax+0x8102040],al
c0009f96:	04 02                	add    al,0x2
c0009f98:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
c0009f9b:	10 20                	adc    BYTE PTR [eax],ah
c0009f9d:	40                   	inc    eax
c0009f9e:	80 00 00             	add    BYTE PTR [eax],0x0
c0009fa1:	38 44 82 82          	cmp    BYTE PTR [edx+eax*4-0x7e],al
c0009fa5:	82                   	(bad)  
c0009fa6:	04 08                	add    al,0x8
c0009fa8:	10 10                	adc    BYTE PTR [eax],dl
c0009faa:	00 00                	add    BYTE PTR [eax],al
c0009fac:	18 18                	sbb    BYTE PTR [eax],bl
c0009fae:	00 00                	add    BYTE PTR [eax],al
c0009fb0:	00 38                	add    BYTE PTR [eax],bh
c0009fb2:	44                   	inc    esp
c0009fb3:	82                   	(bad)  
c0009fb4:	9a aa aa aa aa aa 9c 	call   0x9caa:0xaaaaaaaa
c0009fbb:	80 46 38 00          	add    BYTE PTR [esi+0x38],0x0
c0009fbf:	00 00                	add    BYTE PTR [eax],al
c0009fc1:	18 18                	sbb    BYTE PTR [eax],bl
c0009fc3:	18 18                	sbb    BYTE PTR [eax],bl
c0009fc5:	24 24                	and    al,0x24
c0009fc7:	24 24                	and    al,0x24
c0009fc9:	7e 42                	jle    c000a00d <PKnFont+0x45d>
c0009fcb:	42                   	inc    edx
c0009fcc:	42                   	inc    edx
c0009fcd:	e7 00                	out    0x0,eax
c0009fcf:	00 00                	add    BYTE PTR [eax],al
c0009fd1:	f0 48                	lock dec eax
c0009fd3:	44                   	inc    esp
c0009fd4:	44                   	inc    esp
c0009fd5:	44                   	inc    esp
c0009fd6:	48                   	dec    eax
c0009fd7:	78 44                	js     c000a01d <PKnFont+0x46d>
c0009fd9:	42                   	inc    edx
c0009fda:	42                   	inc    edx
c0009fdb:	42                   	inc    edx
c0009fdc:	44                   	inc    esp
c0009fdd:	f8                   	clc    
c0009fde:	00 00                	add    BYTE PTR [eax],al
c0009fe0:	00 3a                	add    BYTE PTR [edx],bh
c0009fe2:	46                   	inc    esi
c0009fe3:	42                   	inc    edx
c0009fe4:	82                   	(bad)  
c0009fe5:	80 80 80 80 80 82 42 	add    BYTE PTR [eax-0x7d7f7f80],0x42
c0009fec:	44                   	inc    esp
c0009fed:	38 00                	cmp    BYTE PTR [eax],al
c0009fef:	00 00                	add    BYTE PTR [eax],al
c0009ff1:	f8                   	clc    
c0009ff2:	44                   	inc    esp
c0009ff3:	44                   	inc    esp
c0009ff4:	42                   	inc    edx
c0009ff5:	42                   	inc    edx
c0009ff6:	42                   	inc    edx
c0009ff7:	42                   	inc    edx
c0009ff8:	42                   	inc    edx
c0009ff9:	42                   	inc    edx
c0009ffa:	42                   	inc    edx
c0009ffb:	44                   	inc    esp
c0009ffc:	44                   	inc    esp
c0009ffd:	f8                   	clc    
c0009ffe:	00 00                	add    BYTE PTR [eax],al
c000a000:	00 fe                	add    dh,bh
c000a002:	42                   	inc    edx
c000a003:	42                   	inc    edx
c000a004:	40                   	inc    eax
c000a005:	40                   	inc    eax
c000a006:	44                   	inc    esp
c000a007:	7c 44                	jl     c000a04d <PKnFont+0x49d>
c000a009:	40                   	inc    eax
c000a00a:	40                   	inc    eax
c000a00b:	42                   	inc    edx
c000a00c:	42                   	inc    edx
c000a00d:	fe 00                	inc    BYTE PTR [eax]
c000a00f:	00 00                	add    BYTE PTR [eax],al
c000a011:	fe 42 42             	inc    BYTE PTR [edx+0x42]
c000a014:	40                   	inc    eax
c000a015:	40                   	inc    eax
c000a016:	44                   	inc    esp
c000a017:	7c 44                	jl     c000a05d <PKnFont+0x4ad>
c000a019:	44                   	inc    esp
c000a01a:	40                   	inc    eax
c000a01b:	40                   	inc    eax
c000a01c:	40                   	inc    eax
c000a01d:	f0 00 00             	lock add BYTE PTR [eax],al
c000a020:	00 3a                	add    BYTE PTR [edx],bh
c000a022:	46                   	inc    esi
c000a023:	42                   	inc    edx
c000a024:	82                   	(bad)  
c000a025:	80 80 9e 82 82 82 42 	add    BYTE PTR [eax-0x7d7d7d62],0x42
c000a02c:	46                   	inc    esi
c000a02d:	38 00                	cmp    BYTE PTR [eax],al
c000a02f:	00 00                	add    BYTE PTR [eax],al
c000a031:	e7 42                	out    0x42,eax
c000a033:	42                   	inc    edx
c000a034:	42                   	inc    edx
c000a035:	42                   	inc    edx
c000a036:	42                   	inc    edx
c000a037:	7e 42                	jle    c000a07b <PKnFont+0x4cb>
c000a039:	42                   	inc    edx
c000a03a:	42                   	inc    edx
c000a03b:	42                   	inc    edx
c000a03c:	42                   	inc    edx
c000a03d:	e7 00                	out    0x0,eax
c000a03f:	00 00                	add    BYTE PTR [eax],al
c000a041:	7c 10                	jl     c000a053 <PKnFont+0x4a3>
c000a043:	10 10                	adc    BYTE PTR [eax],dl
c000a045:	10 10                	adc    BYTE PTR [eax],dl
c000a047:	10 10                	adc    BYTE PTR [eax],dl
c000a049:	10 10                	adc    BYTE PTR [eax],dl
c000a04b:	10 10                	adc    BYTE PTR [eax],dl
c000a04d:	7c 00                	jl     c000a04f <PKnFont+0x49f>
c000a04f:	00 00                	add    BYTE PTR [eax],al
c000a051:	1f                   	pop    ds
c000a052:	04 04                	add    al,0x4
c000a054:	04 04                	add    al,0x4
c000a056:	04 04                	add    al,0x4
c000a058:	04 04                	add    al,0x4
c000a05a:	04 04                	add    al,0x4
c000a05c:	84 48 30             	test   BYTE PTR [eax+0x30],cl
c000a05f:	00 00                	add    BYTE PTR [eax],al
c000a061:	e7 42                	out    0x42,eax
c000a063:	44                   	inc    esp
c000a064:	48                   	dec    eax
c000a065:	50                   	push   eax
c000a066:	50                   	push   eax
c000a067:	60                   	pusha  
c000a068:	50                   	push   eax
c000a069:	50                   	push   eax
c000a06a:	48                   	dec    eax
c000a06b:	44                   	inc    esp
c000a06c:	42                   	inc    edx
c000a06d:	e7 00                	out    0x0,eax
c000a06f:	00 00                	add    BYTE PTR [eax],al
c000a071:	f0 40                	lock inc eax
c000a073:	40                   	inc    eax
c000a074:	40                   	inc    eax
c000a075:	40                   	inc    eax
c000a076:	40                   	inc    eax
c000a077:	40                   	inc    eax
c000a078:	40                   	inc    eax
c000a079:	40                   	inc    eax
c000a07a:	40                   	inc    eax
c000a07b:	42                   	inc    edx
c000a07c:	42                   	inc    edx
c000a07d:	fe 00                	inc    BYTE PTR [eax]
c000a07f:	00 00                	add    BYTE PTR [eax],al
c000a081:	c3                   	ret    
c000a082:	42                   	inc    edx
c000a083:	66 66 66 5a          	data16 data16 pop dx
c000a087:	5a                   	pop    edx
c000a088:	5a                   	pop    edx
c000a089:	42                   	inc    edx
c000a08a:	42                   	inc    edx
c000a08b:	42                   	inc    edx
c000a08c:	42                   	inc    edx
c000a08d:	e7 00                	out    0x0,eax
c000a08f:	00 00                	add    BYTE PTR [eax],al
c000a091:	c7 42 62 62 52 52 52 	mov    DWORD PTR [edx+0x62],0x52525262
c000a098:	4a                   	dec    edx
c000a099:	4a                   	dec    edx
c000a09a:	4a                   	dec    edx
c000a09b:	46                   	inc    esi
c000a09c:	46                   	inc    esi
c000a09d:	e2 00                	loop   c000a09f <PKnFont+0x4ef>
c000a09f:	00 00                	add    BYTE PTR [eax],al
c000a0a1:	38 44 82 82          	cmp    BYTE PTR [edx+eax*4-0x7e],al
c000a0a5:	82                   	(bad)  
c000a0a6:	82                   	(bad)  
c000a0a7:	82                   	(bad)  
c000a0a8:	82                   	(bad)  
c000a0a9:	82                   	(bad)  
c000a0aa:	82                   	(bad)  
c000a0ab:	82                   	(bad)  
c000a0ac:	44                   	inc    esp
c000a0ad:	38 00                	cmp    BYTE PTR [eax],al
c000a0af:	00 00                	add    BYTE PTR [eax],al
c000a0b1:	f8                   	clc    
c000a0b2:	44                   	inc    esp
c000a0b3:	42                   	inc    edx
c000a0b4:	42                   	inc    edx
c000a0b5:	42                   	inc    edx
c000a0b6:	44                   	inc    esp
c000a0b7:	78 40                	js     c000a0f9 <PKnFont+0x549>
c000a0b9:	40                   	inc    eax
c000a0ba:	40                   	inc    eax
c000a0bb:	40                   	inc    eax
c000a0bc:	40                   	inc    eax
c000a0bd:	f0 00 00             	lock add BYTE PTR [eax],al
c000a0c0:	00 38                	add    BYTE PTR [eax],bh
c000a0c2:	44                   	inc    esp
c000a0c3:	82                   	(bad)  
c000a0c4:	82                   	(bad)  
c000a0c5:	82                   	(bad)  
c000a0c6:	82                   	(bad)  
c000a0c7:	82                   	(bad)  
c000a0c8:	82                   	(bad)  
c000a0c9:	82                   	(bad)  
c000a0ca:	92                   	xchg   edx,eax
c000a0cb:	8a 44 3a 00          	mov    al,BYTE PTR [edx+edi*1+0x0]
c000a0cf:	00 00                	add    BYTE PTR [eax],al
c000a0d1:	fc                   	cld    
c000a0d2:	42                   	inc    edx
c000a0d3:	42                   	inc    edx
c000a0d4:	42                   	inc    edx
c000a0d5:	42                   	inc    edx
c000a0d6:	7c 44                	jl     c000a11c <PKnFont+0x56c>
c000a0d8:	42                   	inc    edx
c000a0d9:	42                   	inc    edx
c000a0da:	42                   	inc    edx
c000a0db:	42                   	inc    edx
c000a0dc:	42                   	inc    edx
c000a0dd:	e7 00                	out    0x0,eax
c000a0df:	00 00                	add    BYTE PTR [eax],al
c000a0e1:	3a 46 82             	cmp    al,BYTE PTR [esi-0x7e]
c000a0e4:	82                   	(bad)  
c000a0e5:	80 40 38 04          	add    BYTE PTR [eax+0x38],0x4
c000a0e9:	02 82 82 c4 b8 00    	add    al,BYTE PTR [edx+0xb8c482]
c000a0ef:	00 00                	add    BYTE PTR [eax],al
c000a0f1:	fe                   	(bad)  
c000a0f2:	92                   	xchg   edx,eax
c000a0f3:	92                   	xchg   edx,eax
c000a0f4:	10 10                	adc    BYTE PTR [eax],dl
c000a0f6:	10 10                	adc    BYTE PTR [eax],dl
c000a0f8:	10 10                	adc    BYTE PTR [eax],dl
c000a0fa:	10 10                	adc    BYTE PTR [eax],dl
c000a0fc:	10 7c 00 00          	adc    BYTE PTR [eax+eax*1+0x0],bh
c000a100:	00 e7                	add    bh,ah
c000a102:	42                   	inc    edx
c000a103:	42                   	inc    edx
c000a104:	42                   	inc    edx
c000a105:	42                   	inc    edx
c000a106:	42                   	inc    edx
c000a107:	42                   	inc    edx
c000a108:	42                   	inc    edx
c000a109:	42                   	inc    edx
c000a10a:	42                   	inc    edx
c000a10b:	42                   	inc    edx
c000a10c:	24 3c                	and    al,0x3c
c000a10e:	00 00                	add    BYTE PTR [eax],al
c000a110:	00 e7                	add    bh,ah
c000a112:	42                   	inc    edx
c000a113:	42                   	inc    edx
c000a114:	42                   	inc    edx
c000a115:	42                   	inc    edx
c000a116:	24 24                	and    al,0x24
c000a118:	24 24                	and    al,0x24
c000a11a:	18 18                	sbb    BYTE PTR [eax],bl
c000a11c:	18 18                	sbb    BYTE PTR [eax],bl
c000a11e:	00 00                	add    BYTE PTR [eax],al
c000a120:	00 e7                	add    bh,ah
c000a122:	42                   	inc    edx
c000a123:	42                   	inc    edx
c000a124:	42                   	inc    edx
c000a125:	5a                   	pop    edx
c000a126:	5a                   	pop    edx
c000a127:	5a                   	pop    edx
c000a128:	5a                   	pop    edx
c000a129:	24 24                	and    al,0x24
c000a12b:	24 24                	and    al,0x24
c000a12d:	24 00                	and    al,0x0
c000a12f:	00 00                	add    BYTE PTR [eax],al
c000a131:	e7 42                	out    0x42,eax
c000a133:	42                   	inc    edx
c000a134:	24 24                	and    al,0x24
c000a136:	24 18                	and    al,0x18
c000a138:	24 24                	and    al,0x24
c000a13a:	24 42                	and    al,0x42
c000a13c:	42                   	inc    edx
c000a13d:	e7 00                	out    0x0,eax
c000a13f:	00 00                	add    BYTE PTR [eax],al
c000a141:	ee                   	out    dx,al
c000a142:	44                   	inc    esp
c000a143:	44                   	inc    esp
c000a144:	44                   	inc    esp
c000a145:	28 28                	sub    BYTE PTR [eax],ch
c000a147:	28 10                	sub    BYTE PTR [eax],dl
c000a149:	10 10                	adc    BYTE PTR [eax],dl
c000a14b:	10 10                	adc    BYTE PTR [eax],dl
c000a14d:	7c 00                	jl     c000a14f <PKnFont+0x59f>
c000a14f:	00 00                	add    BYTE PTR [eax],al
c000a151:	fe 84 84 08 08 10 10 	inc    BYTE PTR [esp+eax*4+0x10100808]
c000a158:	20 20                	and    BYTE PTR [eax],ah
c000a15a:	40                   	inc    eax
c000a15b:	42                   	inc    edx
c000a15c:	82                   	(bad)  
c000a15d:	fe 00                	inc    BYTE PTR [eax]
c000a15f:	00 00                	add    BYTE PTR [eax],al
c000a161:	3e 20 20             	and    BYTE PTR ds:[eax],ah
c000a164:	20 20                	and    BYTE PTR [eax],ah
c000a166:	20 20                	and    BYTE PTR [eax],ah
c000a168:	20 20                	and    BYTE PTR [eax],ah
c000a16a:	20 20                	and    BYTE PTR [eax],ah
c000a16c:	20 20                	and    BYTE PTR [eax],ah
c000a16e:	3e 00 80 80 40 40 20 	add    BYTE PTR ds:[eax+0x20404080],al
c000a175:	20 20                	and    BYTE PTR [eax],ah
c000a177:	10 10                	adc    BYTE PTR [eax],dl
c000a179:	08 08                	or     BYTE PTR [eax],cl
c000a17b:	04 04                	add    al,0x4
c000a17d:	04 02                	add    al,0x2
c000a17f:	02 00                	add    al,BYTE PTR [eax]
c000a181:	7c 04                	jl     c000a187 <PKnFont+0x5d7>
c000a183:	04 04                	add    al,0x4
c000a185:	04 04                	add    al,0x4
c000a187:	04 04                	add    al,0x4
c000a189:	04 04                	add    al,0x4
c000a18b:	04 04                	add    al,0x4
c000a18d:	04 7c                	add    al,0x7c
c000a18f:	00 00                	add    BYTE PTR [eax],al
c000a191:	10 28                	adc    BYTE PTR [eax],ch
c000a193:	44                   	inc    esp
c000a194:	82                   	(bad)  
	...
c000a1ad:	00 fe                	add    dh,bh
c000a1af:	00 10                	add    BYTE PTR [eax],dl
c000a1b1:	08 04 00             	or     BYTE PTR [eax+eax*1],al
	...
c000a1c4:	00 70 08             	add    BYTE PTR [eax+0x8],dh
c000a1c7:	04 3c                	add    al,0x3c
c000a1c9:	44                   	inc    esp
c000a1ca:	84 84 8c 76 00 00 c0 	test   BYTE PTR [esp+ecx*4-0x3fffff8a],al
c000a1d1:	40                   	inc    eax
c000a1d2:	40                   	inc    eax
c000a1d3:	40                   	inc    eax
c000a1d4:	40                   	inc    eax
c000a1d5:	58                   	pop    eax
c000a1d6:	64 42                	fs inc edx
c000a1d8:	42                   	inc    edx
c000a1d9:	42                   	inc    edx
c000a1da:	42                   	inc    edx
c000a1db:	42                   	inc    edx
c000a1dc:	64 58                	fs pop eax
c000a1de:	00 00                	add    BYTE PTR [eax],al
c000a1e0:	00 00                	add    BYTE PTR [eax],al
c000a1e2:	00 00                	add    BYTE PTR [eax],al
c000a1e4:	00 30                	add    BYTE PTR [eax],dh
c000a1e6:	4c                   	dec    esp
c000a1e7:	84 84 80 80 82 44 38 	test   BYTE PTR [eax+eax*4+0x38448280],al
c000a1ee:	00 00                	add    BYTE PTR [eax],al
c000a1f0:	0c 04                	or     al,0x4
c000a1f2:	04 04                	add    al,0x4
c000a1f4:	04 34                	add    al,0x34
c000a1f6:	4c                   	dec    esp
c000a1f7:	84 84 84 84 84 4c 36 	test   BYTE PTR [esp+eax*4+0x364c8484],al
c000a1fe:	00 00                	add    BYTE PTR [eax],al
c000a200:	00 00                	add    BYTE PTR [eax],al
c000a202:	00 00                	add    BYTE PTR [eax],al
c000a204:	00 38                	add    BYTE PTR [eax],bh
c000a206:	44                   	inc    esp
c000a207:	82                   	(bad)  
c000a208:	82                   	(bad)  
c000a209:	fc                   	cld    
c000a20a:	80 82 42 3c 00 00 0e 	add    BYTE PTR [edx+0x3c42],0xe
c000a211:	10 10                	adc    BYTE PTR [eax],dl
c000a213:	10 10                	adc    BYTE PTR [eax],dl
c000a215:	7c 10                	jl     c000a227 <PKnFont+0x677>
c000a217:	10 10                	adc    BYTE PTR [eax],dl
c000a219:	10 10                	adc    BYTE PTR [eax],dl
c000a21b:	10 10                	adc    BYTE PTR [eax],dl
c000a21d:	7c 00                	jl     c000a21f <PKnFont+0x66f>
c000a21f:	00 00                	add    BYTE PTR [eax],al
c000a221:	00 00                	add    BYTE PTR [eax],al
c000a223:	00 00                	add    BYTE PTR [eax],al
c000a225:	36 4c                	ss dec esp
c000a227:	84 84 84 84 4c 34 04 	test   BYTE PTR [esp+eax*4+0x4344c84],al
c000a22e:	04 38                	add    al,0x38
c000a230:	c0 40 40 40          	rol    BYTE PTR [eax+0x40],0x40
c000a234:	40                   	inc    eax
c000a235:	58                   	pop    eax
c000a236:	64 42                	fs inc edx
c000a238:	42                   	inc    edx
c000a239:	42                   	inc    edx
c000a23a:	42                   	inc    edx
c000a23b:	42                   	inc    edx
c000a23c:	42                   	inc    edx
c000a23d:	e3 00                	jecxz  c000a23f <PKnFont+0x68f>
c000a23f:	00 00                	add    BYTE PTR [eax],al
c000a241:	10 10                	adc    BYTE PTR [eax],dl
c000a243:	00 00                	add    BYTE PTR [eax],al
c000a245:	30 10                	xor    BYTE PTR [eax],dl
c000a247:	10 10                	adc    BYTE PTR [eax],dl
c000a249:	10 10                	adc    BYTE PTR [eax],dl
c000a24b:	10 10                	adc    BYTE PTR [eax],dl
c000a24d:	38 00                	cmp    BYTE PTR [eax],al
c000a24f:	00 00                	add    BYTE PTR [eax],al
c000a251:	04 04                	add    al,0x4
c000a253:	00 00                	add    BYTE PTR [eax],al
c000a255:	0c 04                	or     al,0x4
c000a257:	04 04                	add    al,0x4
c000a259:	04 04                	add    al,0x4
c000a25b:	04 04                	add    al,0x4
c000a25d:	08 08                	or     BYTE PTR [eax],cl
c000a25f:	30 c0                	xor    al,al
c000a261:	40                   	inc    eax
c000a262:	40                   	inc    eax
c000a263:	40                   	inc    eax
c000a264:	40                   	inc    eax
c000a265:	4e                   	dec    esi
c000a266:	44                   	inc    esp
c000a267:	48                   	dec    eax
c000a268:	50                   	push   eax
c000a269:	60                   	pusha  
c000a26a:	50                   	push   eax
c000a26b:	48                   	dec    eax
c000a26c:	44                   	inc    esp
c000a26d:	e6 00                	out    0x0,al
c000a26f:	00 30                	add    BYTE PTR [eax],dh
c000a271:	10 10                	adc    BYTE PTR [eax],dl
c000a273:	10 10                	adc    BYTE PTR [eax],dl
c000a275:	10 10                	adc    BYTE PTR [eax],dl
c000a277:	10 10                	adc    BYTE PTR [eax],dl
c000a279:	10 10                	adc    BYTE PTR [eax],dl
c000a27b:	10 10                	adc    BYTE PTR [eax],dl
c000a27d:	38 00                	cmp    BYTE PTR [eax],al
c000a27f:	00 00                	add    BYTE PTR [eax],al
c000a281:	00 00                	add    BYTE PTR [eax],al
c000a283:	00 00                	add    BYTE PTR [eax],al
c000a285:	f6                   	(bad)  
c000a286:	49                   	dec    ecx
c000a287:	49                   	dec    ecx
c000a288:	49                   	dec    ecx
c000a289:	49                   	dec    ecx
c000a28a:	49                   	dec    ecx
c000a28b:	49                   	dec    ecx
c000a28c:	49                   	dec    ecx
c000a28d:	db 00                	fild   DWORD PTR [eax]
c000a28f:	00 00                	add    BYTE PTR [eax],al
c000a291:	00 00                	add    BYTE PTR [eax],al
c000a293:	00 00                	add    BYTE PTR [eax],al
c000a295:	d8 64 42 42          	fsub   DWORD PTR [edx+eax*2+0x42]
c000a299:	42                   	inc    edx
c000a29a:	42                   	inc    edx
c000a29b:	42                   	inc    edx
c000a29c:	42                   	inc    edx
c000a29d:	e3 00                	jecxz  c000a29f <PKnFont+0x6ef>
c000a29f:	00 00                	add    BYTE PTR [eax],al
c000a2a1:	00 00                	add    BYTE PTR [eax],al
c000a2a3:	00 00                	add    BYTE PTR [eax],al
c000a2a5:	38 44 82 82          	cmp    BYTE PTR [edx+eax*4-0x7e],al
c000a2a9:	82                   	(bad)  
c000a2aa:	82                   	(bad)  
c000a2ab:	82                   	(bad)  
c000a2ac:	44                   	inc    esp
c000a2ad:	38 00                	cmp    BYTE PTR [eax],al
c000a2af:	00 00                	add    BYTE PTR [eax],al
c000a2b1:	00 00                	add    BYTE PTR [eax],al
c000a2b3:	00 d8                	add    al,bl
c000a2b5:	64 42                	fs inc edx
c000a2b7:	42                   	inc    edx
c000a2b8:	42                   	inc    edx
c000a2b9:	42                   	inc    edx
c000a2ba:	42                   	inc    edx
c000a2bb:	64 58                	fs pop eax
c000a2bd:	40                   	inc    eax
c000a2be:	40                   	inc    eax
c000a2bf:	e0 00                	loopne c000a2c1 <PKnFont+0x711>
c000a2c1:	00 00                	add    BYTE PTR [eax],al
c000a2c3:	00 34 4c             	add    BYTE PTR [esp+ecx*2],dh
c000a2c6:	84 84 84 84 84 4c 34 	test   BYTE PTR [esp+eax*4+0x344c8484],al
c000a2cd:	04 04                	add    al,0x4
c000a2cf:	0e                   	push   cs
c000a2d0:	00 00                	add    BYTE PTR [eax],al
c000a2d2:	00 00                	add    BYTE PTR [eax],al
c000a2d4:	00 dc                	add    ah,bl
c000a2d6:	62 42 40             	bound  eax,QWORD PTR [edx+0x40]
c000a2d9:	40                   	inc    eax
c000a2da:	40                   	inc    eax
c000a2db:	40                   	inc    eax
c000a2dc:	40                   	inc    eax
c000a2dd:	e0 00                	loopne c000a2df <PKnFont+0x72f>
c000a2df:	00 00                	add    BYTE PTR [eax],al
c000a2e1:	00 00                	add    BYTE PTR [eax],al
c000a2e3:	00 00                	add    BYTE PTR [eax],al
c000a2e5:	7a 86                	jp     c000a26d <PKnFont+0x6bd>
c000a2e7:	82                   	(bad)  
c000a2e8:	c0 38 06             	sar    BYTE PTR [eax],0x6
c000a2eb:	82                   	(bad)  
c000a2ec:	c2 bc 00             	ret    0xbc
c000a2ef:	00 00                	add    BYTE PTR [eax],al
c000a2f1:	00 10                	add    BYTE PTR [eax],dl
c000a2f3:	10 10                	adc    BYTE PTR [eax],dl
c000a2f5:	7c 10                	jl     c000a307 <PKnFont+0x757>
c000a2f7:	10 10                	adc    BYTE PTR [eax],dl
c000a2f9:	10 10                	adc    BYTE PTR [eax],dl
c000a2fb:	10 10                	adc    BYTE PTR [eax],dl
c000a2fd:	0e                   	push   cs
c000a2fe:	00 00                	add    BYTE PTR [eax],al
c000a300:	00 00                	add    BYTE PTR [eax],al
c000a302:	00 00                	add    BYTE PTR [eax],al
c000a304:	00 c6                	add    dh,al
c000a306:	42                   	inc    edx
c000a307:	42                   	inc    edx
c000a308:	42                   	inc    edx
c000a309:	42                   	inc    edx
c000a30a:	42                   	inc    edx
c000a30b:	42                   	inc    edx
c000a30c:	46                   	inc    esi
c000a30d:	3b 00                	cmp    eax,DWORD PTR [eax]
c000a30f:	00 00                	add    BYTE PTR [eax],al
c000a311:	00 00                	add    BYTE PTR [eax],al
c000a313:	00 00                	add    BYTE PTR [eax],al
c000a315:	e7 42                	out    0x42,eax
c000a317:	42                   	inc    edx
c000a318:	42                   	inc    edx
c000a319:	24 24                	and    al,0x24
c000a31b:	24 18                	and    al,0x18
c000a31d:	18 00                	sbb    BYTE PTR [eax],al
c000a31f:	00 00                	add    BYTE PTR [eax],al
c000a321:	00 00                	add    BYTE PTR [eax],al
c000a323:	00 00                	add    BYTE PTR [eax],al
c000a325:	e7 42                	out    0x42,eax
c000a327:	42                   	inc    edx
c000a328:	5a                   	pop    edx
c000a329:	5a                   	pop    edx
c000a32a:	5a                   	pop    edx
c000a32b:	24 24                	and    al,0x24
c000a32d:	24 00                	and    al,0x0
c000a32f:	00 00                	add    BYTE PTR [eax],al
c000a331:	00 00                	add    BYTE PTR [eax],al
c000a333:	00 00                	add    BYTE PTR [eax],al
c000a335:	c6 44 28 28 10       	mov    BYTE PTR [eax+ebp*1+0x28],0x10
c000a33a:	28 28                	sub    BYTE PTR [eax],ch
c000a33c:	44                   	inc    esp
c000a33d:	c6 00 00             	mov    BYTE PTR [eax],0x0
c000a340:	00 00                	add    BYTE PTR [eax],al
c000a342:	00 00                	add    BYTE PTR [eax],al
c000a344:	00 e7                	add    bh,ah
c000a346:	42                   	inc    edx
c000a347:	42                   	inc    edx
c000a348:	24 24                	and    al,0x24
c000a34a:	24 18                	and    al,0x18
c000a34c:	18 10                	sbb    BYTE PTR [eax],dl
c000a34e:	10 60 00             	adc    BYTE PTR [eax+0x0],ah
c000a351:	00 00                	add    BYTE PTR [eax],al
c000a353:	00 00                	add    BYTE PTR [eax],al
c000a355:	fe 82 84 08 10 20    	inc    BYTE PTR [edx+0x20100884]
c000a35b:	42                   	inc    edx
c000a35c:	82                   	(bad)  
c000a35d:	fe 00                	inc    BYTE PTR [eax]
c000a35f:	00 00                	add    BYTE PTR [eax],al
c000a361:	06                   	push   es
c000a362:	08 10                	or     BYTE PTR [eax],dl
c000a364:	10 10                	adc    BYTE PTR [eax],dl
c000a366:	10 60 10             	adc    BYTE PTR [eax+0x10],ah
c000a369:	10 10                	adc    BYTE PTR [eax],dl
c000a36b:	10 08                	adc    BYTE PTR [eax],cl
c000a36d:	06                   	push   es
c000a36e:	00 00                	add    BYTE PTR [eax],al
c000a370:	10 10                	adc    BYTE PTR [eax],dl
c000a372:	10 10                	adc    BYTE PTR [eax],dl
c000a374:	10 10                	adc    BYTE PTR [eax],dl
c000a376:	10 10                	adc    BYTE PTR [eax],dl
c000a378:	10 10                	adc    BYTE PTR [eax],dl
c000a37a:	10 10                	adc    BYTE PTR [eax],dl
c000a37c:	10 10                	adc    BYTE PTR [eax],dl
c000a37e:	10 10                	adc    BYTE PTR [eax],dl
c000a380:	00 60 10             	add    BYTE PTR [eax+0x10],ah
c000a383:	08 08                	or     BYTE PTR [eax],cl
c000a385:	08 08                	or     BYTE PTR [eax],cl
c000a387:	06                   	push   es
c000a388:	08 08                	or     BYTE PTR [eax],cl
c000a38a:	08 08                	or     BYTE PTR [eax],cl
c000a38c:	10 60 00             	adc    BYTE PTR [eax+0x0],ah
c000a38f:	00 00                	add    BYTE PTR [eax],al
c000a391:	72 8c                	jb     c000a31f <PKnFont+0x76f>
	...

c000abb0 <intr_entry_table>:
c000abb0:	e9 83 00 c0 14       	jmp    d4c0ac38 <kernel_pool+0x14be7564>
c000abb5:	84 00                	test   BYTE PTR [eax],al
c000abb7:	c0 3f 84             	sar    BYTE PTR [edi],0x84
c000abba:	00 c0                	add    al,al
c000abbc:	6a 84                	push   0xffffff84
c000abbe:	00 c0                	add    al,al
c000abc0:	95                   	xchg   ebp,eax
c000abc1:	84 00                	test   BYTE PTR [eax],al
c000abc3:	c0 c0 84             	rol    al,0x84
c000abc6:	00 c0                	add    al,al
c000abc8:	eb 84                	jmp    c000ab4e <PKnFont+0xf9e>
c000abca:	00 c0                	add    al,al
c000abcc:	16                   	push   ss
c000abcd:	85 00                	test   DWORD PTR [eax],eax
c000abcf:	c0 41 85 00          	rol    BYTE PTR [ecx-0x7b],0x0
c000abd3:	c0 68 85 00          	shr    BYTE PTR [eax-0x7b],0x0
c000abd7:	c0 93 85 00 c0 ba 85 	rcl    BYTE PTR [ebx-0x453fff7b],0x85
c000abde:	00 c0                	add    al,al
c000abe0:	e1 85                	loope  c000ab67 <PKnFont+0xfb7>
c000abe2:	00 c0                	add    al,al
c000abe4:	0c 86                	or     al,0x86
c000abe6:	00 c0                	add    al,al
c000abe8:	33 86 00 c0 5a 86    	xor    eax,DWORD PTR [esi-0x79a54000]
c000abee:	00 c0                	add    al,al
c000abf0:	85 86 00 c0 b0 86    	test   DWORD PTR [esi-0x794f4000],eax
c000abf6:	00 c0                	add    al,al
c000abf8:	d7                   	xlat   BYTE PTR ds:[ebx]
c000abf9:	86 00                	xchg   BYTE PTR [eax],al
c000abfb:	c0 02 87             	rol    BYTE PTR [edx],0x87
c000abfe:	00 c0                	add    al,al
c000ac00:	2d 87 00 c0 58       	sub    eax,0x58c00087
c000ac05:	87 00                	xchg   DWORD PTR [eax],eax
c000ac07:	c0 83 87 00 c0 ae 87 	rol    BYTE PTR [ebx-0x513fff79],0x87
c000ac0e:	00 c0                	add    al,al
c000ac10:	d9 87 00 c0 00 88    	fld    DWORD PTR [edi-0x77ff4000]
c000ac16:	00 c0                	add    al,al
c000ac18:	2b 88 00 c0 52 88    	sub    ecx,DWORD PTR [eax-0x77ad4000]
c000ac1e:	00 c0                	add    al,al
c000ac20:	79 88                	jns    c000abaa <PKnFont+0xffa>
c000ac22:	00 c0                	add    al,al
c000ac24:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
c000ac25:	88 00                	mov    BYTE PTR [eax],al
c000ac27:	c0 cb 88             	ror    bl,0x88
c000ac2a:	00 c0                	add    al,al
c000ac2c:	f2 88 00             	repnz mov BYTE PTR [eax],al
c000ac2f:	c0 1d 89 00 c0 48 89 	rcr    BYTE PTR ds:0x48c00089,0x89
c000ac36:	00 c0                	add    al,al
c000ac38:	73 89                	jae    c000abc3 <intr_entry_table+0x13>
c000ac3a:	00 c0                	add    al,al
c000ac3c:	9e                   	sahf   
c000ac3d:	89 00                	mov    DWORD PTR [eax],eax
c000ac3f:	c0 c9 89             	ror    cl,0x89
c000ac42:	00 c0                	add    al,al
c000ac44:	f4                   	hlt    
c000ac45:	89 00                	mov    DWORD PTR [eax],eax
c000ac47:	c0 1f 8a             	rcr    BYTE PTR [edi],0x8a
c000ac4a:	00 c0                	add    al,al
c000ac4c:	4a                   	dec    edx
c000ac4d:	8a 00                	mov    al,BYTE PTR [eax]
c000ac4f:	c0                   	(bad)  
c000ac50:	75 8a                	jne    c000abdc <intr_entry_table+0x2c>
c000ac52:	00 c0                	add    al,al
c000ac54:	a0 8a 00 c0 cb       	mov    al,ds:0xcbc0008a
c000ac59:	8a 00                	mov    al,BYTE PTR [eax]
c000ac5b:	c0                   	(bad)  
c000ac5c:	f6                   	(bad)  
c000ac5d:	8a 00                	mov    al,BYTE PTR [eax]
c000ac5f:	c0 21 8b             	shl    BYTE PTR [ecx],0x8b
c000ac62:	00 c0                	add    al,al
c000ac64:	4c                   	dec    esp
c000ac65:	8b 00                	mov    eax,DWORD PTR [eax]
c000ac67:	c0                   	(bad)  
c000ac68:	77 8b                	ja     c000abf5 <intr_entry_table+0x45>
c000ac6a:	00 c0                	add    al,al
c000ac6c:	a2                   	.byte 0xa2
c000ac6d:	8b 00                	mov    eax,DWORD PTR [eax]
c000ac6f:	c0                   	.byte 0xc0

Disassembly of section .eh_frame:

c000ac70 <.eh_frame>:
c000ac70:	10 00                	adc    BYTE PTR [eax],al
c000ac72:	00 00                	add    BYTE PTR [eax],al
c000ac74:	00 00                	add    BYTE PTR [eax],al
c000ac76:	00 00                	add    BYTE PTR [eax],al
c000ac78:	01 00                	add    DWORD PTR [eax],eax
c000ac7a:	01 7c 08 0c          	add    DWORD PTR [eax+ecx*1+0xc],edi
c000ac7e:	04 04                	add    al,0x4
c000ac80:	88 01                	mov    BYTE PTR [ecx],al
c000ac82:	00 00                	add    BYTE PTR [eax],al
c000ac84:	14 00                	adc    al,0x0
c000ac86:	00 00                	add    BYTE PTR [eax],al
c000ac88:	18 00                	sbb    BYTE PTR [eax],al
c000ac8a:	00 00                	add    BYTE PTR [eax],al
c000ac8c:	58                   	pop    eax
c000ac8d:	7f 00                	jg     c000ac8f <_edata+0x1f>
c000ac8f:	c0 05 00 00 00 41 0e 	rol    BYTE PTR ds:0x41000000,0xe
c000ac96:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ac9c:	30 01                	xor    BYTE PTR [ecx],al
c000ac9e:	00 00                	add    BYTE PTR [eax],al
c000aca0:	30 00                	xor    BYTE PTR [eax],al
c000aca2:	00 00                	add    BYTE PTR [eax],al
c000aca4:	27                   	daa    
c000aca5:	97                   	xchg   edi,eax
c000aca6:	00 c0                	add    al,al
c000aca8:	7c 02                	jl     c000acac <_edata+0x3c>
c000acaa:	00 00                	add    BYTE PTR [eax],al
c000acac:	44                   	inc    esp
c000acad:	0c 01                	or     al,0x1
c000acaf:	00 47 10             	add    BYTE PTR [edi+0x10],al
c000acb2:	05 02 75 00 43       	add    eax,0x43007502
c000acb7:	0f 03 75 7c          	lsl    esi,WORD PTR [ebp+0x7c]
c000acbb:	06                   	push   es
c000acbc:	43                   	inc    ebx
c000acbd:	2e 0c 42             	cs or  al,0x42
c000acc0:	2e 10 02             	adc    BYTE PTR cs:[edx],al
c000acc3:	fa                   	cli    
c000acc4:	2e 14 42             	cs adc al,0x42
c000acc7:	2e 18 42 2e          	sbb    BYTE PTR cs:[edx+0x2e],al
c000accb:	1c 45                	sbb    al,0x45
c000accd:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000acd1:	0c 42                	or     al,0x42
c000acd3:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000acd7:	14 42                	adc    al,0x42
c000acd9:	2e 18 42 2e          	sbb    BYTE PTR cs:[edx+0x2e],al
c000acdd:	1c 45                	sbb    al,0x45
c000acdf:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ace3:	0c 42                	or     al,0x42
c000ace5:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000ace9:	14 42                	adc    al,0x42
c000aceb:	2e 18 42 2e          	sbb    BYTE PTR cs:[edx+0x2e],al
c000acef:	1c 45                	sbb    al,0x45
c000acf1:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000acf5:	0c 42                	or     al,0x42
c000acf7:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000acfb:	14 42                	adc    al,0x42
c000acfd:	2e 18 42 2e          	sbb    BYTE PTR cs:[edx+0x2e],al
c000ad01:	1c 45                	sbb    al,0x45
c000ad03:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ad07:	0c 42                	or     al,0x42
c000ad09:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000ad0d:	14 42                	adc    al,0x42
c000ad0f:	2e 18 42 2e          	sbb    BYTE PTR cs:[edx+0x2e],al
c000ad13:	1c 45                	sbb    al,0x45
c000ad15:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ad19:	0c 42                	or     al,0x42
c000ad1b:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000ad1f:	14 42                	adc    al,0x42
c000ad21:	2e 18 42 2e          	sbb    BYTE PTR cs:[edx+0x2e],al
c000ad25:	1c 45                	sbb    al,0x45
c000ad27:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ad2b:	0c 42                	or     al,0x42
c000ad2d:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000ad31:	14 42                	adc    al,0x42
c000ad33:	2e 18 42 2e          	sbb    BYTE PTR cs:[edx+0x2e],al
c000ad37:	1c 45                	sbb    al,0x45
c000ad39:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ad3d:	0c 42                	or     al,0x42
c000ad3f:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000ad43:	14 42                	adc    al,0x42
c000ad45:	2e 18 42 2e          	sbb    BYTE PTR cs:[edx+0x2e],al
c000ad49:	1c 45                	sbb    al,0x45
c000ad4b:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ad4f:	0c 42                	or     al,0x42
c000ad51:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000ad55:	14 42                	adc    al,0x42
c000ad57:	2e 18 42 2e          	sbb    BYTE PTR cs:[edx+0x2e],al
c000ad5b:	1c 45                	sbb    al,0x45
c000ad5d:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ad61:	0c 42                	or     al,0x42
c000ad63:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000ad67:	14 42                	adc    al,0x42
c000ad69:	2e 18 42 2e          	sbb    BYTE PTR cs:[edx+0x2e],al
c000ad6d:	1c 45                	sbb    al,0x45
c000ad6f:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ad73:	0c 42                	or     al,0x42
c000ad75:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000ad79:	14 42                	adc    al,0x42
c000ad7b:	2e 18 42 2e          	sbb    BYTE PTR cs:[edx+0x2e],al
c000ad7f:	1c 45                	sbb    al,0x45
c000ad81:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ad85:	0c 42                	or     al,0x42
c000ad87:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000ad8b:	14 42                	adc    al,0x42
c000ad8d:	2e 18 45 2e          	sbb    BYTE PTR cs:[ebp+0x2e],al
c000ad91:	1c 45                	sbb    al,0x45
c000ad93:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ad97:	0c 42                	or     al,0x42
c000ad99:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000ad9d:	14 42                	adc    al,0x42
c000ad9f:	2e 18 45 2e          	sbb    BYTE PTR cs:[ebp+0x2e],al
c000ada3:	1c 45                	sbb    al,0x45
c000ada5:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000ada9:	0c 42                	or     al,0x42
c000adab:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000adaf:	14 42                	adc    al,0x42
c000adb1:	2e 18 45 2e          	sbb    BYTE PTR cs:[ebp+0x2e],al
c000adb5:	1c 45                	sbb    al,0x45
c000adb7:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000adbb:	00 47 2e             	add    BYTE PTR [edi+0x2e],al
c000adbe:	04 04                	add    al,0x4
c000adc0:	05 00 00 00 2e       	add    eax,0x2e000000
c000adc5:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000adc8:	0c 45                	or     al,0x45
c000adca:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000adce:	00 00                	add    BYTE PTR [eax],al
c000add0:	2c 00                	sub    al,0x0
c000add2:	00 00                	add    BYTE PTR [eax],al
c000add4:	64 01 00             	add    DWORD PTR fs:[eax],eax
c000add7:	00 60 7f             	add    BYTE PTR [eax+0x7f],ah
c000adda:	00 c0                	add    al,al
c000addc:	1a 00                	sbb    al,BYTE PTR [eax]
c000adde:	00 00                	add    BYTE PTR [eax],al
c000ade0:	41                   	inc    ecx
c000ade1:	0e                   	push   cs
c000ade2:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ade8:	43                   	inc    ebx
c000ade9:	2e 04 04             	cs add al,0x4
c000adec:	05 00 00 00 2e       	add    eax,0x2e000000
c000adf1:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000adf4:	0c 43                	or     al,0x43
c000adf6:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000adfa:	00 41 c5             	add    BYTE PTR [ecx-0x3b],al
c000adfd:	0c 04                	or     al,0x4
c000adff:	04 1c                	add    al,0x1c
c000ae01:	00 00                	add    BYTE PTR [eax],al
c000ae03:	00 94 01 00 00 7a 7f 	add    BYTE PTR [ecx+eax*1+0x7f7a0000],dl
c000ae0a:	00 c0                	add    al,al
c000ae0c:	23 00                	and    eax,DWORD PTR [eax]
c000ae0e:	00 00                	add    BYTE PTR [eax],al
c000ae10:	41                   	inc    ecx
c000ae11:	0e                   	push   cs
c000ae12:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ae18:	47                   	inc    edi
c000ae19:	0c 04                	or     al,0x4
c000ae1b:	04 c5                	add    al,0xc5
c000ae1d:	00 00                	add    BYTE PTR [eax],al
c000ae1f:	00 50 00             	add    BYTE PTR [eax+0x0],dl
c000ae22:	00 00                	add    BYTE PTR [eax],al
c000ae24:	b4 01                	mov    ah,0x1
c000ae26:	00 00                	add    BYTE PTR [eax],al
c000ae28:	9d                   	popf   
c000ae29:	7f 00                	jg     c000ae2b <_edata+0x1bb>
c000ae2b:	c0 be 00 00 00 41 0e 	sar    BYTE PTR [esi+0x41000000],0xe
c000ae32:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ae38:	42                   	inc    edx
c000ae39:	86 04 87             	xchg   BYTE PTR [edi+eax*4],al
c000ae3c:	03 46 83             	add    eax,DWORD PTR [esi-0x7d]
c000ae3f:	05 5c 2e 04 04       	add    eax,0x4042e5c
c000ae44:	05 00 00 00 2e       	add    eax,0x2e000000
c000ae49:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000ae4c:	0c 45                	or     al,0x45
c000ae4e:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000ae52:	00 02                	add    BYTE PTR [edx],al
c000ae54:	4e                   	dec    esi
c000ae55:	2e 04 04             	cs add al,0x4
c000ae58:	02 00                	add    al,BYTE PTR [eax]
c000ae5a:	00 00                	add    BYTE PTR [eax],al
c000ae5c:	2e 08 41 2e          	or     BYTE PTR cs:[ecx+0x2e],al
c000ae60:	0c 41                	or     al,0x41
c000ae62:	2e 10 4b 2e          	adc    BYTE PTR cs:[ebx+0x2e],cl
c000ae66:	00 62 c3             	add    BYTE PTR [edx-0x3d],ah
c000ae69:	41                   	inc    ecx
c000ae6a:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000ae6e:	0c 04                	or     al,0x4
c000ae70:	04 c5                	add    al,0xc5
c000ae72:	00 00                	add    BYTE PTR [eax],al
c000ae74:	3c 00                	cmp    al,0x0
c000ae76:	00 00                	add    BYTE PTR [eax],al
c000ae78:	08 02                	or     BYTE PTR [edx],al
c000ae7a:	00 00                	add    BYTE PTR [eax],al
c000ae7c:	5b                   	pop    ebx
c000ae7d:	80 00 c0             	add    BYTE PTR [eax],0xc0
c000ae80:	68 00 00 00 41       	push   0x41000000
c000ae85:	0e                   	push   cs
c000ae86:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ae8c:	46                   	inc    esi
c000ae8d:	83 05 86 04 87 03 53 	add    DWORD PTR ds:0x3870486,0x53
c000ae94:	2e 04 04             	cs add al,0x4
c000ae97:	05 00 00 00 2e       	add    eax,0x2e000000
c000ae9c:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000ae9f:	0c 45                	or     al,0x45
c000aea1:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000aea5:	00 74 c3 41          	add    BYTE PTR [ebx+eax*8+0x41],dh
c000aea9:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000aead:	0c 04                	or     al,0x4
c000aeaf:	04 c5                	add    al,0xc5
c000aeb1:	00 00                	add    BYTE PTR [eax],al
c000aeb3:	00 38                	add    BYTE PTR [eax],bh
c000aeb5:	00 00                	add    BYTE PTR [eax],al
c000aeb7:	00 48 02             	add    BYTE PTR [eax+0x2],cl
c000aeba:	00 00                	add    BYTE PTR [eax],al
c000aebc:	c4 80 00 c0 a1 00    	les    eax,FWORD PTR [eax+0xa1c000]
c000aec2:	00 00                	add    BYTE PTR [eax],al
c000aec4:	41                   	inc    ecx
c000aec5:	0e                   	push   cs
c000aec6:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000aecc:	4b                   	dec    ebx
c000aecd:	2e 0c 45             	cs or  al,0x45
c000aed0:	2e 10 52 2e          	adc    BYTE PTR cs:[edx+0x2e],dl
c000aed4:	0c 43                	or     al,0x43
c000aed6:	2e 10 5e 2e          	adc    BYTE PTR cs:[esi+0x2e],bl
c000aeda:	0c 43                	or     al,0x43
c000aedc:	2e 10 5e 2e          	adc    BYTE PTR cs:[esi+0x2e],bl
c000aee0:	0c 43                	or     al,0x43
c000aee2:	2e 10 5e 2e          	adc    BYTE PTR cs:[esi+0x2e],bl
c000aee6:	0c 43                	or     al,0x43
c000aee8:	2e 10 54 2e 00       	adc    BYTE PTR cs:[esi+ebp*1+0x0],dl
c000aeed:	00 00                	add    BYTE PTR [eax],al
c000aeef:	00 28                	add    BYTE PTR [eax],ch
c000aef1:	00 00                	add    BYTE PTR [eax],al
c000aef3:	00 84 02 00 00 68 81 	add    BYTE PTR [edx+eax*1-0x7e980000],al
c000aefa:	00 c0                	add    al,al
c000aefc:	4d                   	dec    ebp
c000aefd:	00 00                	add    BYTE PTR [eax],al
c000aeff:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000af02:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000af08:	49                   	dec    ecx
c000af09:	83 05 86 04 87 03 7d 	add    DWORD PTR ds:0x3870486,0x7d
c000af10:	c3                   	ret    
c000af11:	41                   	inc    ecx
c000af12:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000af16:	0c 04                	or     al,0x4
c000af18:	04 c5                	add    al,0xc5
c000af1a:	00 00                	add    BYTE PTR [eax],al
c000af1c:	1c 00                	sbb    al,0x0
c000af1e:	00 00                	add    BYTE PTR [eax],al
c000af20:	b0 02                	mov    al,0x2
c000af22:	00 00                	add    BYTE PTR [eax],al
c000af24:	b5 81                	mov    ch,0x81
c000af26:	00 c0                	add    al,al
c000af28:	25 00 00 00 41       	and    eax,0x41000000
c000af2d:	0e                   	push   cs
c000af2e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000af34:	61                   	popa   
c000af35:	0c 04                	or     al,0x4
c000af37:	04 c5                	add    al,0xc5
c000af39:	00 00                	add    BYTE PTR [eax],al
c000af3b:	00 a0 00 00 00 d0    	add    BYTE PTR [eax-0x30000000],ah
c000af41:	02 00                	add    al,BYTE PTR [eax]
c000af43:	00 da                	add    dl,bl
c000af45:	81 00 c0 f8 00 00    	add    DWORD PTR [eax],0xf8c0
c000af4b:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000af4e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000af54:	41                   	inc    ecx
c000af55:	83 03 7e             	add    DWORD PTR [ebx],0x7e
c000af58:	2e 04 04             	cs add al,0x4
c000af5b:	07                   	pop    es
c000af5c:	00 00                	add    BYTE PTR [eax],al
c000af5e:	00 2e                	add    BYTE PTR [esi],ch
c000af60:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000af63:	0c 42                	or     al,0x42
c000af65:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000af69:	14 41                	adc    al,0x41
c000af6b:	2e 18 51 2e          	sbb    BYTE PTR cs:[ecx+0x2e],dl
c000af6f:	1c 48                	sbb    al,0x48
c000af71:	2e 20 41 2e          	and    BYTE PTR cs:[ecx+0x2e],al
c000af75:	24 42                	and    al,0x42
c000af77:	2e 28 45 2e          	sub    BYTE PTR cs:[ebp+0x2e],al
c000af7b:	2c 41                	sub    al,0x41
c000af7d:	2e 30 4d 2e          	xor    BYTE PTR cs:[ebp+0x2e],cl
c000af81:	00 47 2e             	add    BYTE PTR [edi+0x2e],al
c000af84:	04 04                	add    al,0x4
c000af86:	02 00                	add    al,BYTE PTR [eax]
c000af88:	00 00                	add    BYTE PTR [eax],al
c000af8a:	2e 08 41 2e          	or     BYTE PTR cs:[ecx+0x2e],al
c000af8e:	0c 42                	or     al,0x42
c000af90:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000af94:	14 41                	adc    al,0x41
c000af96:	2e 18 51 2e          	sbb    BYTE PTR cs:[ecx+0x2e],dl
c000af9a:	1c 42                	sbb    al,0x42
c000af9c:	2e 20 41 2e          	and    BYTE PTR cs:[ecx+0x2e],al
c000afa0:	24 42                	and    al,0x42
c000afa2:	2e 28 45 2e          	sub    BYTE PTR cs:[ebp+0x2e],al
c000afa6:	2c 41                	sub    al,0x41
c000afa8:	2e 30 4d 2e          	xor    BYTE PTR cs:[ebp+0x2e],cl
c000afac:	00 47 2e             	add    BYTE PTR [edi+0x2e],al
c000afaf:	04 04                	add    al,0x4
c000afb1:	02 00                	add    al,BYTE PTR [eax]
c000afb3:	00 00                	add    BYTE PTR [eax],al
c000afb5:	2e 08 41 2e          	or     BYTE PTR cs:[ecx+0x2e],al
c000afb9:	0c 42                	or     al,0x42
c000afbb:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000afbf:	14 41                	adc    al,0x41
c000afc1:	2e 18 51 2e          	sbb    BYTE PTR cs:[ecx+0x2e],dl
c000afc5:	1c 42                	sbb    al,0x42
c000afc7:	2e 20 41 2e          	and    BYTE PTR cs:[ecx+0x2e],al
c000afcb:	24 42                	and    al,0x42
c000afcd:	2e 28 45 2e          	sub    BYTE PTR cs:[ebp+0x2e],al
c000afd1:	2c 41                	sub    al,0x41
c000afd3:	2e 30 48 2e          	xor    BYTE PTR cs:[eax+0x2e],cl
c000afd7:	00 44 c5 0c          	add    BYTE PTR [ebp+eax*8+0xc],al
c000afdb:	04 04                	add    al,0x4
c000afdd:	c3                   	ret    
c000afde:	00 00                	add    BYTE PTR [eax],al
c000afe0:	28 00                	sub    BYTE PTR [eax],al
c000afe2:	00 00                	add    BYTE PTR [eax],al
c000afe4:	74 03                	je     c000afe9 <_edata+0x379>
c000afe6:	00 00                	add    BYTE PTR [eax],al
c000afe8:	d2 82 00 c0 8b 00    	rol    BYTE PTR [edx+0x8bc000],cl
c000afee:	00 00                	add    BYTE PTR [eax],al
c000aff0:	41                   	inc    ecx
c000aff1:	0e                   	push   cs
c000aff2:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000aff8:	43                   	inc    ebx
c000aff9:	83 05 86 04 87 03 02 	add    DWORD PTR ds:0x3870486,0x2
c000b000:	81 c3 41 c6 41 c7    	add    ebx,0xc741c641
c000b006:	41                   	inc    ecx
c000b007:	0c 04                	or     al,0x4
c000b009:	04 c5                	add    al,0xc5
c000b00b:	00 54 00 00          	add    BYTE PTR [eax+eax*1+0x0],dl
c000b00f:	00 a0 03 00 00 5d    	add    BYTE PTR [eax+0x5d000003],ah
c000b015:	83 00 c0             	add    DWORD PTR [eax],0xffffffc0
c000b018:	54                   	push   esp
c000b019:	00 00                	add    BYTE PTR [eax],al
c000b01b:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b01e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b024:	41                   	inc    ecx
c000b025:	87 03                	xchg   DWORD PTR [ebx],eax
c000b027:	44                   	inc    esp
c000b028:	86 04 04             	xchg   BYTE PTR [esp+eax*1],al
c000b02b:	04 00                	add    al,0x0
c000b02d:	00 00                	add    BYTE PTR [eax],al
c000b02f:	83 05 49 2e 04 04 03 	add    DWORD PTR ds:0x4042e49,0x3
c000b036:	00 00                	add    BYTE PTR [eax],al
c000b038:	00 2e                	add    BYTE PTR [esi],ch
c000b03a:	08 43 2e             	or     BYTE PTR [ebx+0x2e],al
c000b03d:	0c 41                	or     al,0x41
c000b03f:	2e 10 44 2e 14       	adc    BYTE PTR cs:[esi+ebp*1+0x14],al
c000b044:	4e                   	dec    esi
c000b045:	2e 18 47 2e          	sbb    BYTE PTR cs:[edi+0x2e],al
c000b049:	1c 42                	sbb    al,0x42
c000b04b:	2e 20 42 2e          	and    BYTE PTR cs:[edx+0x2e],al
c000b04f:	24 42                	and    al,0x42
c000b051:	2e 28 41 2e          	sub    BYTE PTR cs:[ecx+0x2e],al
c000b055:	2c 48                	sub    al,0x48
c000b057:	2e 00 4c c3 41       	add    BYTE PTR cs:[ebx+eax*8+0x41],cl
c000b05c:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000b060:	0c 04                	or     al,0x4
c000b062:	04 c5                	add    al,0xc5
c000b064:	24 00                	and    al,0x0
c000b066:	00 00                	add    BYTE PTR [eax],al
c000b068:	f8                   	clc    
c000b069:	03 00                	add    eax,DWORD PTR [eax]
c000b06b:	00 b4 83 00 c0 27 00 	add    BYTE PTR [ebx+eax*4+0x27c000],dh
c000b072:	00 00                	add    BYTE PTR [eax],al
c000b074:	41                   	inc    ecx
c000b075:	0e                   	push   cs
c000b076:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b07c:	55                   	push   ebp
c000b07d:	2e 0c 45             	cs or  al,0x45
c000b080:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000b084:	00 41 c5             	add    BYTE PTR [ecx-0x3b],al
c000b087:	0c 04                	or     al,0x4
c000b089:	04 00                	add    al,0x0
c000b08b:	00 38                	add    BYTE PTR [eax],bh
c000b08d:	00 00                	add    BYTE PTR [eax],al
c000b08f:	00 20                	add    BYTE PTR [eax],ah
c000b091:	04 00                	add    al,0x0
c000b093:	00 d0                	add    al,dl
c000b095:	8b 00                	mov    eax,DWORD PTR [eax]
c000b097:	c0 5e 00 00          	rcr    BYTE PTR [esi+0x0],0x0
c000b09b:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b09e:	08 85 02 47 0d 05    	or     BYTE PTR [ebp+0x50d4702],al
c000b0a4:	47                   	inc    edi
c000b0a5:	83 04 86 03          	add    DWORD PTR [esi+eax*4],0x3
c000b0a9:	4a                   	dec    edx
c000b0aa:	2e 0c 48             	cs or  al,0x48
c000b0ad:	2e 10 5c 2e 00       	adc    BYTE PTR cs:[esi+ebp*1+0x0],bl
c000b0b2:	53                   	push   ebx
c000b0b3:	0a c3                	or     al,bl
c000b0b5:	41                   	inc    ecx
c000b0b6:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000b0ba:	04 c5                	add    al,0xc5
c000b0bc:	45                   	inc    ebp
c000b0bd:	0b 44 c3 41          	or     eax,DWORD PTR [ebx+eax*8+0x41]
c000b0c1:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000b0c5:	04 c5                	add    al,0xc5
c000b0c7:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b0ca:	00 00                	add    BYTE PTR [eax],al
c000b0cc:	5c                   	pop    esp
c000b0cd:	04 00                	add    al,0x0
c000b0cf:	00 2e                	add    BYTE PTR [esi],ch
c000b0d1:	8c 00                	mov    WORD PTR [eax],es
c000b0d3:	c0                   	(bad)  
c000b0d4:	35 00 00 00 41       	xor    eax,0x41000000
c000b0d9:	0e                   	push   cs
c000b0da:	08 85 02 47 0d 05    	or     BYTE PTR [ebp+0x50d4702],al
c000b0e0:	6c                   	ins    BYTE PTR es:[edi],dx
c000b0e1:	0c 04                	or     al,0x4
c000b0e3:	04 c5                	add    al,0xc5
c000b0e5:	00 00                	add    BYTE PTR [eax],al
c000b0e7:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b0ea:	00 00                	add    BYTE PTR [eax],al
c000b0ec:	7c 04                	jl     c000b0f2 <_edata+0x482>
c000b0ee:	00 00                	add    BYTE PTR [eax],al
c000b0f0:	63 8c 00 c0 38 00 00 	arpl   WORD PTR [eax+eax*1+0x38c0],cx
c000b0f7:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b0fa:	08 85 02 44 0d 05    	or     BYTE PTR [ebp+0x50d4402],al
c000b100:	72 0c                	jb     c000b10e <_edata+0x49e>
c000b102:	04 04                	add    al,0x4
c000b104:	c5 00                	lds    eax,FWORD PTR [eax]
c000b106:	00 00                	add    BYTE PTR [eax],al
c000b108:	20 00                	and    BYTE PTR [eax],al
c000b10a:	00 00                	add    BYTE PTR [eax],al
c000b10c:	9c                   	pushf  
c000b10d:	04 00                	add    al,0x0
c000b10f:	00 9b 8c 00 c0 2c    	add    BYTE PTR [ebx+0x2cc0008c],bl
c000b115:	00 00                	add    BYTE PTR [eax],al
c000b117:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b11a:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b120:	44                   	inc    esp
c000b121:	83 03 63             	add    DWORD PTR [ebx],0x63
c000b124:	c3                   	ret    
c000b125:	41                   	inc    ecx
c000b126:	0c 04                	or     al,0x4
c000b128:	04 c5                	add    al,0xc5
c000b12a:	00 00                	add    BYTE PTR [eax],al
c000b12c:	1c 00                	sbb    al,0x0
c000b12e:	00 00                	add    BYTE PTR [eax],al
c000b130:	c0 04 00 00          	rol    BYTE PTR [eax+eax*1],0x0
c000b134:	c7                   	(bad)  
c000b135:	8c 00                	mov    WORD PTR [eax],es
c000b137:	c0 eb 00             	shr    bl,0x0
c000b13a:	00 00                	add    BYTE PTR [eax],al
c000b13c:	41                   	inc    ecx
c000b13d:	0e                   	push   cs
c000b13e:	08 85 02 44 0d 05    	or     BYTE PTR [ebp+0x50d4402],al
c000b144:	02 e5                	add    ah,ch
c000b146:	0c 04                	or     al,0x4
c000b148:	04 c5                	add    al,0xc5
c000b14a:	00 00                	add    BYTE PTR [eax],al
c000b14c:	2c 00                	sub    al,0x0
c000b14e:	00 00                	add    BYTE PTR [eax],al
c000b150:	e0 04                	loopne c000b156 <_edata+0x4e6>
c000b152:	00 00                	add    BYTE PTR [eax],al
c000b154:	b2 8d                	mov    dl,0x8d
c000b156:	00 c0                	add    al,al
c000b158:	46                   	inc    esi
c000b159:	00 00                	add    BYTE PTR [eax],al
c000b15b:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b15e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b164:	6a 2e                	push   0x2e
c000b166:	04 04                	add    al,0x4
c000b168:	01 00                	add    DWORD PTR [eax],eax
c000b16a:	00 00                	add    BYTE PTR [eax],al
c000b16c:	2e 08 45 2e          	or     BYTE PTR cs:[ebp+0x2e],al
c000b170:	0c 45                	or     al,0x45
c000b172:	2e 10 4c 2e 00       	adc    BYTE PTR cs:[esi+ebp*1+0x0],cl
c000b177:	41                   	inc    ecx
c000b178:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
c000b17b:	04 1c                	add    al,0x1c
c000b17d:	00 00                	add    BYTE PTR [eax],al
c000b17f:	00 10                	add    BYTE PTR [eax],dl
c000b181:	05 00 00 f8 8d       	add    eax,0x8df80000
c000b186:	00 c0                	add    al,al
c000b188:	12 00                	adc    al,BYTE PTR [eax]
c000b18a:	00 00                	add    BYTE PTR [eax],al
c000b18c:	41                   	inc    ecx
c000b18d:	0e                   	push   cs
c000b18e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b194:	47                   	inc    edi
c000b195:	0c 04                	or     al,0x4
c000b197:	04 c5                	add    al,0xc5
c000b199:	00 00                	add    BYTE PTR [eax],al
c000b19b:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b19e:	00 00                	add    BYTE PTR [eax],al
c000b1a0:	30 05 00 00 0a 8e    	xor    BYTE PTR ds:0x8e0a0000,al
c000b1a6:	00 c0                	add    al,al
c000b1a8:	15 00 00 00 41       	adc    eax,0x41000000
c000b1ad:	0e                   	push   cs
c000b1ae:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b1b4:	4e                   	dec    esi
c000b1b5:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
c000b1b8:	04 00                	add    al,0x0
c000b1ba:	00 00                	add    BYTE PTR [eax],al
c000b1bc:	1c 00                	sbb    al,0x0
c000b1be:	00 00                	add    BYTE PTR [eax],al
c000b1c0:	50                   	push   eax
c000b1c1:	05 00 00 1f 8e       	add    eax,0x8e1f0000
c000b1c6:	00 c0                	add    al,al
c000b1c8:	14 00                	adc    al,0x0
c000b1ca:	00 00                	add    BYTE PTR [eax],al
c000b1cc:	41                   	inc    ecx
c000b1cd:	0e                   	push   cs
c000b1ce:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b1d4:	50                   	push   eax
c000b1d5:	0c 04                	or     al,0x4
c000b1d7:	04 c5                	add    al,0xc5
c000b1d9:	00 00                	add    BYTE PTR [eax],al
c000b1db:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b1de:	00 00                	add    BYTE PTR [eax],al
c000b1e0:	70 05                	jo     c000b1e7 <_edata+0x577>
c000b1e2:	00 00                	add    BYTE PTR [eax],al
c000b1e4:	33 8e 00 c0 17 00    	xor    ecx,DWORD PTR [esi+0x17c000]
c000b1ea:	00 00                	add    BYTE PTR [eax],al
c000b1ec:	41                   	inc    ecx
c000b1ed:	0e                   	push   cs
c000b1ee:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b1f4:	53                   	push   ebx
c000b1f5:	0c 04                	or     al,0x4
c000b1f7:	04 c5                	add    al,0xc5
c000b1f9:	00 00                	add    BYTE PTR [eax],al
c000b1fb:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
c000b1fe:	00 00                	add    BYTE PTR [eax],al
c000b200:	90                   	nop
c000b201:	05 00 00 4a 8e       	add    eax,0x8e4a0000
c000b206:	00 c0                	add    al,al
c000b208:	15 00 00 00 41       	adc    eax,0x41000000
c000b20d:	0e                   	push   cs
c000b20e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b214:	47                   	inc    edi
c000b215:	0a 0c 04             	or     cl,BYTE PTR [esp+eax*1]
c000b218:	04 c5                	add    al,0xc5
c000b21a:	45                   	inc    ebp
c000b21b:	0b 41 0c             	or     eax,DWORD PTR [ecx+0xc]
c000b21e:	04 04                	add    al,0x4
c000b220:	c5 00                	lds    eax,FWORD PTR [eax]
c000b222:	00 00                	add    BYTE PTR [eax],al
c000b224:	1c 00                	sbb    al,0x0
c000b226:	00 00                	add    BYTE PTR [eax],al
c000b228:	b8 05 00 00 60       	mov    eax,0x60000005
c000b22d:	8e 00                	mov    es,WORD PTR [eax]
c000b22f:	c0 1e 00             	rcr    BYTE PTR [esi],0x0
c000b232:	00 00                	add    BYTE PTR [eax],al
c000b234:	41                   	inc    ecx
c000b235:	0e                   	push   cs
c000b236:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b23c:	5a                   	pop    edx
c000b23d:	0c 04                	or     al,0x4
c000b23f:	04 c5                	add    al,0xc5
c000b241:	00 00                	add    BYTE PTR [eax],al
c000b243:	00 28                	add    BYTE PTR [eax],ch
c000b245:	00 00                	add    BYTE PTR [eax],al
c000b247:	00 d8                	add    al,bl
c000b249:	05 00 00 7e 8e       	add    eax,0x8e7e0000
c000b24e:	00 c0                	add    al,al
c000b250:	29 00                	sub    DWORD PTR [eax],eax
c000b252:	00 00                	add    BYTE PTR [eax],al
c000b254:	41                   	inc    ecx
c000b255:	0e                   	push   cs
c000b256:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b25c:	41                   	inc    ecx
c000b25d:	86 03                	xchg   BYTE PTR [ebx],al
c000b25f:	44                   	inc    esp
c000b260:	83 04 04 1a          	add    DWORD PTR [esp+eax*1],0x1a
c000b264:	00 00                	add    BYTE PTR [eax],al
c000b266:	00 c3                	add    bl,al
c000b268:	41                   	inc    ecx
c000b269:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000b26d:	04 c5                	add    al,0xc5
c000b26f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b272:	00 00                	add    BYTE PTR [eax],al
c000b274:	04 06                	add    al,0x6
c000b276:	00 00                	add    BYTE PTR [eax],al
c000b278:	a7                   	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
c000b279:	8e 00                	mov    es,WORD PTR [eax]
c000b27b:	c0 18 00             	rcr    BYTE PTR [eax],0x0
c000b27e:	00 00                	add    BYTE PTR [eax],al
c000b280:	41                   	inc    ecx
c000b281:	0e                   	push   cs
c000b282:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b288:	50                   	push   eax
c000b289:	0c 04                	or     al,0x4
c000b28b:	04 c5                	add    al,0xc5
c000b28d:	00 00                	add    BYTE PTR [eax],al
c000b28f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b292:	00 00                	add    BYTE PTR [eax],al
c000b294:	24 06                	and    al,0x6
c000b296:	00 00                	add    BYTE PTR [eax],al
c000b298:	bf 8e 00 c0 18       	mov    edi,0x18c0008e
c000b29d:	00 00                	add    BYTE PTR [eax],al
c000b29f:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b2a2:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b2a8:	50                   	push   eax
c000b2a9:	0c 04                	or     al,0x4
c000b2ab:	04 c5                	add    al,0xc5
c000b2ad:	00 00                	add    BYTE PTR [eax],al
c000b2af:	00 28                	add    BYTE PTR [eax],ch
c000b2b1:	00 00                	add    BYTE PTR [eax],al
c000b2b3:	00 44 06 00          	add    BYTE PTR [esi+eax*1+0x0],al
c000b2b7:	00 d7                	add    bh,dl
c000b2b9:	8e 00                	mov    es,WORD PTR [eax]
c000b2bb:	c0 3f 00             	sar    BYTE PTR [edi],0x0
c000b2be:	00 00                	add    BYTE PTR [eax],al
c000b2c0:	41                   	inc    ecx
c000b2c1:	0e                   	push   cs
c000b2c2:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b2c8:	42                   	inc    edx
c000b2c9:	83 03 6d             	add    DWORD PTR [ebx],0x6d
c000b2cc:	2e 0c 41             	cs or  al,0x41
c000b2cf:	2e 10 4b c5          	adc    BYTE PTR cs:[ebx-0x3b],cl
c000b2d3:	0c 04                	or     al,0x4
c000b2d5:	04 c3                	add    al,0xc3
c000b2d7:	41                   	inc    ecx
c000b2d8:	13 03                	adc    eax,DWORD PTR [ebx]
c000b2da:	2e 00 1c 00          	add    BYTE PTR cs:[eax+eax*1],bl
c000b2de:	00 00                	add    BYTE PTR [eax],al
c000b2e0:	70 06                	jo     c000b2e8 <_edata+0x678>
c000b2e2:	00 00                	add    BYTE PTR [eax],al
c000b2e4:	16                   	push   ss
c000b2e5:	8f 00                	pop    DWORD PTR [eax]
c000b2e7:	c0 12 00             	rcl    BYTE PTR [edx],0x0
c000b2ea:	00 00                	add    BYTE PTR [eax],al
c000b2ec:	41                   	inc    ecx
c000b2ed:	0e                   	push   cs
c000b2ee:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b2f4:	4a                   	dec    edx
c000b2f5:	0c 04                	or     al,0x4
c000b2f7:	04 c5                	add    al,0xc5
c000b2f9:	00 00                	add    BYTE PTR [eax],al
c000b2fb:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b2fe:	00 00                	add    BYTE PTR [eax],al
c000b300:	90                   	nop
c000b301:	06                   	push   es
c000b302:	00 00                	add    BYTE PTR [eax],al
c000b304:	28 8f 00 c0 27 00    	sub    BYTE PTR [edi+0x27c000],cl
c000b30a:	00 00                	add    BYTE PTR [eax],al
c000b30c:	41                   	inc    ecx
c000b30d:	0e                   	push   cs
c000b30e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b314:	63 0c 04             	arpl   WORD PTR [esp+eax*1],cx
c000b317:	04 c5                	add    al,0xc5
c000b319:	00 00                	add    BYTE PTR [eax],al
c000b31b:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b31e:	00 00                	add    BYTE PTR [eax],al
c000b320:	b0 06                	mov    al,0x6
c000b322:	00 00                	add    BYTE PTR [eax],al
c000b324:	50                   	push   eax
c000b325:	8f 00                	pop    DWORD PTR [eax]
c000b327:	c0 23 00             	shl    BYTE PTR [ebx],0x0
c000b32a:	00 00                	add    BYTE PTR [eax],al
c000b32c:	41                   	inc    ecx
c000b32d:	0e                   	push   cs
c000b32e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b334:	5f                   	pop    edi
c000b335:	0c 04                	or     al,0x4
c000b337:	04 c5                	add    al,0xc5
c000b339:	00 00                	add    BYTE PTR [eax],al
c000b33b:	00 20                	add    BYTE PTR [eax],ah
c000b33d:	00 00                	add    BYTE PTR [eax],al
c000b33f:	00 d0                	add    al,dl
c000b341:	06                   	push   es
c000b342:	00 00                	add    BYTE PTR [eax],al
c000b344:	73 8f                	jae    c000b2d5 <_edata+0x665>
c000b346:	00 c0                	add    al,al
c000b348:	1b 00                	sbb    eax,DWORD PTR [eax]
c000b34a:	00 00                	add    BYTE PTR [eax],al
c000b34c:	41                   	inc    ecx
c000b34d:	0e                   	push   cs
c000b34e:	08 85 02 44 0d 05    	or     BYTE PTR [ebp+0x50d4402],al
c000b354:	46                   	inc    esi
c000b355:	83 03 4e             	add    DWORD PTR [ebx],0x4e
c000b358:	c3                   	ret    
c000b359:	41                   	inc    ecx
c000b35a:	0c 04                	or     al,0x4
c000b35c:	04 c5                	add    al,0xc5
c000b35e:	00 00                	add    BYTE PTR [eax],al
c000b360:	28 00                	sub    BYTE PTR [eax],al
c000b362:	00 00                	add    BYTE PTR [eax],al
c000b364:	f4                   	hlt    
c000b365:	06                   	push   es
c000b366:	00 00                	add    BYTE PTR [eax],al
c000b368:	8e 8f 00 c0 62 00    	mov    cs,WORD PTR [edi+0x62c000]
c000b36e:	00 00                	add    BYTE PTR [eax],al
c000b370:	41                   	inc    ecx
c000b371:	0e                   	push   cs
c000b372:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b378:	44                   	inc    esp
c000b379:	83 05 86 04 87 03 02 	add    DWORD PTR ds:0x3870486,0x2
c000b380:	57                   	push   edi
c000b381:	c3                   	ret    
c000b382:	41                   	inc    ecx
c000b383:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000b387:	0c 04                	or     al,0x4
c000b389:	04 c5                	add    al,0xc5
c000b38b:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b38e:	00 00                	add    BYTE PTR [eax],al
c000b390:	20 07                	and    BYTE PTR [edi],al
c000b392:	00 00                	add    BYTE PTR [eax],al
c000b394:	f0 8f 00             	lock pop DWORD PTR [eax]
c000b397:	c0 0d 00 00 00 41 0e 	ror    BYTE PTR ds:0x41000000,0xe
c000b39e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b3a4:	45                   	inc    ebp
c000b3a5:	0c 04                	or     al,0x4
c000b3a7:	04 c5                	add    al,0xc5
c000b3a9:	00 00                	add    BYTE PTR [eax],al
c000b3ab:	00 28                	add    BYTE PTR [eax],ch
c000b3ad:	00 00                	add    BYTE PTR [eax],al
c000b3af:	00 40 07             	add    BYTE PTR [eax+0x7],al
c000b3b2:	00 00                	add    BYTE PTR [eax],al
c000b3b4:	fd                   	std    
c000b3b5:	8f 00                	pop    DWORD PTR [eax]
c000b3b7:	c0 0a 01             	ror    BYTE PTR [edx],0x1
c000b3ba:	00 00                	add    BYTE PTR [eax],al
c000b3bc:	41                   	inc    ecx
c000b3bd:	0e                   	push   cs
c000b3be:	08 85 02 44 0d 05    	or     BYTE PTR [ebp+0x50d4402],al
c000b3c4:	46                   	inc    esi
c000b3c5:	83 05 86 04 87 03 02 	add    DWORD PTR ds:0x3870486,0x2
c000b3cc:	fb                   	sti    
c000b3cd:	c3                   	ret    
c000b3ce:	41                   	inc    ecx
c000b3cf:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000b3d3:	0c 04                	or     al,0x4
c000b3d5:	04 c5                	add    al,0xc5
c000b3d7:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b3da:	00 00                	add    BYTE PTR [eax],al
c000b3dc:	6c                   	ins    BYTE PTR es:[edi],dx
c000b3dd:	07                   	pop    es
c000b3de:	00 00                	add    BYTE PTR [eax],al
c000b3e0:	07                   	pop    es
c000b3e1:	91                   	xchg   ecx,eax
c000b3e2:	00 c0                	add    al,al
c000b3e4:	0d 00 00 00 41       	or     eax,0x41000000
c000b3e9:	0e                   	push   cs
c000b3ea:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b3f0:	45                   	inc    ebp
c000b3f1:	0c 04                	or     al,0x4
c000b3f3:	04 c5                	add    al,0xc5
c000b3f5:	00 00                	add    BYTE PTR [eax],al
c000b3f7:	00 54 00 00          	add    BYTE PTR [eax+eax*1+0x0],dl
c000b3fb:	00 8c 07 00 00 14 91 	add    BYTE PTR [edi+eax*1-0x6eec0000],cl
c000b402:	00 c0                	add    al,al
c000b404:	69 00 00 00 41 0e    	imul   eax,DWORD PTR [eax],0xe410000
c000b40a:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b410:	42                   	inc    edx
c000b411:	83 04 86 03          	add    DWORD PTR [esi+eax*4],0x3
c000b415:	4f                   	dec    edi
c000b416:	2e 04 04             	cs add al,0x4
c000b419:	07                   	pop    es
c000b41a:	00 00                	add    BYTE PTR [eax],al
c000b41c:	00 2e                	add    BYTE PTR [esi],ch
c000b41e:	08 4b 2e             	or     BYTE PTR [ebx+0x2e],cl
c000b421:	0c 46                	or     al,0x46
c000b423:	2e 10 41 2e          	adc    BYTE PTR cs:[ecx+0x2e],al
c000b427:	14 45                	adc    al,0x45
c000b429:	2e 18 4a 2e          	sbb    BYTE PTR cs:[edx+0x2e],cl
c000b42d:	1c 42                	sbb    al,0x42
c000b42f:	2e 20 45 2e          	and    BYTE PTR cs:[ebp+0x2e],al
c000b433:	24 48                	and    al,0x48
c000b435:	2e 00 45 2e          	add    BYTE PTR cs:[ebp+0x2e],al
c000b439:	04 04                	add    al,0x4
c000b43b:	05 00 00 00 2e       	add    eax,0x2e000000
c000b440:	08 45 2e             	or     BYTE PTR [ebp+0x2e],al
c000b443:	0c 48                	or     al,0x48
c000b445:	2e 00 44 c3 41       	add    BYTE PTR cs:[ebx+eax*8+0x41],al
c000b44a:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000b44e:	04 c5                	add    al,0xc5
c000b450:	1c 00                	sbb    al,0x0
c000b452:	00 00                	add    BYTE PTR [eax],al
c000b454:	e4 07                	in     al,0x7
c000b456:	00 00                	add    BYTE PTR [eax],al
c000b458:	7d 91                	jge    c000b3eb <_edata+0x77b>
c000b45a:	00 c0                	add    al,al
c000b45c:	12 00                	adc    al,BYTE PTR [eax]
c000b45e:	00 00                	add    BYTE PTR [eax],al
c000b460:	41                   	inc    ecx
c000b461:	0e                   	push   cs
c000b462:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b468:	44                   	inc    esp
c000b469:	0c 04                	or     al,0x4
c000b46b:	04 c5                	add    al,0xc5
c000b46d:	00 00                	add    BYTE PTR [eax],al
c000b46f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b472:	00 00                	add    BYTE PTR [eax],al
c000b474:	04 08                	add    al,0x8
c000b476:	00 00                	add    BYTE PTR [eax],al
c000b478:	8f                   	(bad)  
c000b479:	91                   	xchg   ecx,eax
c000b47a:	00 c0                	add    al,al
c000b47c:	22 00                	and    al,BYTE PTR [eax]
c000b47e:	00 00                	add    BYTE PTR [eax],al
c000b480:	41                   	inc    ecx
c000b481:	0e                   	push   cs
c000b482:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b488:	44                   	inc    esp
c000b489:	0c 04                	or     al,0x4
c000b48b:	04 c5                	add    al,0xc5
c000b48d:	00 00                	add    BYTE PTR [eax],al
c000b48f:	00 4c 00 00          	add    BYTE PTR [eax+eax*1+0x0],cl
c000b493:	00 24 08             	add    BYTE PTR [eax+ecx*1],ah
c000b496:	00 00                	add    BYTE PTR [eax],al
c000b498:	b1 91                	mov    cl,0x91
c000b49a:	00 c0                	add    al,al
c000b49c:	70 00                	jo     c000b49e <_edata+0x82e>
c000b49e:	00 00                	add    BYTE PTR [eax],al
c000b4a0:	41                   	inc    ecx
c000b4a1:	0e                   	push   cs
c000b4a2:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b4a8:	46                   	inc    esi
c000b4a9:	83 05 86 04 87 03 47 	add    DWORD PTR ds:0x3870486,0x47
c000b4b0:	2e 04 04             	cs add al,0x4
c000b4b3:	13 00                	adc    eax,DWORD PTR [eax]
c000b4b5:	00 00                	add    BYTE PTR [eax],al
c000b4b7:	2e 00 52 2e          	add    BYTE PTR cs:[edx+0x2e],dl
c000b4bb:	04 04                	add    al,0x4
c000b4bd:	08 00                	or     BYTE PTR [eax],al
c000b4bf:	00 00                	add    BYTE PTR [eax],al
c000b4c1:	2e 08 48 2e          	or     BYTE PTR cs:[eax+0x2e],cl
c000b4c5:	14 51                	adc    al,0x51
c000b4c7:	2e 18 47 2e          	sbb    BYTE PTR cs:[edi+0x2e],al
c000b4cb:	1c 41                	sbb    al,0x41
c000b4cd:	2e 20 48 2e          	and    BYTE PTR cs:[eax+0x2e],cl
c000b4d1:	00 46 c3             	add    BYTE PTR [esi-0x3d],al
c000b4d4:	41                   	inc    ecx
c000b4d5:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000b4d9:	0c 04                	or     al,0x4
c000b4db:	04 c5                	add    al,0xc5
c000b4dd:	00 00                	add    BYTE PTR [eax],al
c000b4df:	00 64 00 00          	add    BYTE PTR [eax+eax*1+0x0],ah
c000b4e3:	00 74 08 00          	add    BYTE PTR [eax+ecx*1+0x0],dh
c000b4e7:	00 21                	add    BYTE PTR [ecx],ah
c000b4e9:	92                   	xchg   edx,eax
c000b4ea:	00 c0                	add    al,al
c000b4ec:	6a 00                	push   0x0
c000b4ee:	00 00                	add    BYTE PTR [eax],al
c000b4f0:	41                   	inc    ecx
c000b4f1:	0e                   	push   cs
c000b4f2:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b4f8:	46                   	inc    esi
c000b4f9:	83 05 86 04 87 03 58 	add    DWORD PTR ds:0x3870486,0x58
c000b500:	2e 04 04             	cs add al,0x4
c000b503:	03 00                	add    eax,DWORD PTR [eax]
c000b505:	00 00                	add    BYTE PTR [eax],al
c000b507:	2e 08 46 2e          	or     BYTE PTR cs:[esi+0x2e],al
c000b50b:	04 04                	add    al,0x4
c000b50d:	01 00                	add    DWORD PTR [eax],eax
c000b50f:	00 00                	add    BYTE PTR [eax],al
c000b511:	2e 00 4c 2e 04       	add    BYTE PTR cs:[esi+ebp*1+0x4],cl
c000b516:	04 03                	add    al,0x3
c000b518:	00 00                	add    BYTE PTR [eax],al
c000b51a:	00 2e                	add    BYTE PTR [esi],ch
c000b51c:	08 46 2e             	or     BYTE PTR [esi+0x2e],al
c000b51f:	04 04                	add    al,0x4
c000b521:	01 00                	add    DWORD PTR [eax],eax
c000b523:	00 00                	add    BYTE PTR [eax],al
c000b525:	2e 00 45 2e          	add    BYTE PTR cs:[ebp+0x2e],al
c000b529:	04 04                	add    al,0x4
c000b52b:	02 00                	add    al,BYTE PTR [eax]
c000b52d:	00 00                	add    BYTE PTR [eax],al
c000b52f:	2e 08 41 2e          	or     BYTE PTR cs:[ecx+0x2e],al
c000b533:	0c 41                	or     al,0x41
c000b535:	2e 10 4e 2e          	adc    BYTE PTR cs:[esi+0x2e],cl
c000b539:	00 4e c3             	add    BYTE PTR [esi-0x3d],cl
c000b53c:	41                   	inc    ecx
c000b53d:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000b541:	0c 04                	or     al,0x4
c000b543:	04 c5                	add    al,0xc5
c000b545:	00 00                	add    BYTE PTR [eax],al
c000b547:	00 3c 00             	add    BYTE PTR [eax+eax*1],bh
c000b54a:	00 00                	add    BYTE PTR [eax],al
c000b54c:	dc 08                	fmul   QWORD PTR [eax]
c000b54e:	00 00                	add    BYTE PTR [eax],al
c000b550:	8b 92 00 c0 34 00    	mov    edx,DWORD PTR [edx+0x34c000]
c000b556:	00 00                	add    BYTE PTR [eax],al
c000b558:	41                   	inc    ecx
c000b559:	0e                   	push   cs
c000b55a:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b560:	44                   	inc    esp
c000b561:	2e 08 83 03 44 2e 0c 	or     BYTE PTR cs:[ebx+0xc2e4403],al
c000b568:	42                   	inc    edx
c000b569:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000b56d:	00 48 2e             	add    BYTE PTR [eax+0x2e],cl
c000b570:	04 04                	add    al,0x4
c000b572:	01 00                	add    DWORD PTR [eax],eax
c000b574:	00 00                	add    BYTE PTR [eax],al
c000b576:	2e 08 42 2e          	or     BYTE PTR cs:[edx+0x2e],al
c000b57a:	0c 41                	or     al,0x41
c000b57c:	2e 10 4e 2e          	adc    BYTE PTR cs:[esi+0x2e],cl
c000b580:	00 44 c5 0c          	add    BYTE PTR [ebp+eax*8+0xc],al
c000b584:	04 04                	add    al,0x4
c000b586:	c3                   	ret    
c000b587:	00 28                	add    BYTE PTR [eax],ch
c000b589:	00 00                	add    BYTE PTR [eax],al
c000b58b:	00 1c 09             	add    BYTE PTR [ecx+ecx*1],bl
c000b58e:	00 00                	add    BYTE PTR [eax],al
c000b590:	c0 92 00 c0 66 00 00 	rcl    BYTE PTR [edx+0x66c000],0x0
c000b597:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b59a:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b5a0:	46                   	inc    esi
c000b5a1:	83 05 86 04 87 03 02 	add    DWORD PTR ds:0x3870486,0x2
c000b5a8:	59                   	pop    ecx
c000b5a9:	c3                   	ret    
c000b5aa:	41                   	inc    ecx
c000b5ab:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000b5af:	0c 04                	or     al,0x4
c000b5b1:	04 c5                	add    al,0xc5
c000b5b3:	00 44 00 00          	add    BYTE PTR [eax+eax*1+0x0],al
c000b5b7:	00 48 09             	add    BYTE PTR [eax+0x9],cl
c000b5ba:	00 00                	add    BYTE PTR [eax],al
c000b5bc:	26 93                	es xchg ebx,eax
c000b5be:	00 c0                	add    al,al
c000b5c0:	38 00                	cmp    BYTE PTR [eax],al
c000b5c2:	00 00                	add    BYTE PTR [eax],al
c000b5c4:	41                   	inc    ecx
c000b5c5:	0e                   	push   cs
c000b5c6:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b5cc:	41                   	inc    ecx
c000b5cd:	87 03                	xchg   DWORD PTR [ebx],eax
c000b5cf:	44                   	inc    esp
c000b5d0:	86 04 04             	xchg   BYTE PTR [esp+eax*1],al
c000b5d3:	04 00                	add    al,0x0
c000b5d5:	00 00                	add    BYTE PTR [eax],al
c000b5d7:	83 05 49 2e 04 04 01 	add    DWORD PTR ds:0x4042e49,0x1
c000b5de:	00 00                	add    BYTE PTR [eax],al
c000b5e0:	00 2e                	add    BYTE PTR [esi],ch
c000b5e2:	08 43 2e             	or     BYTE PTR [ebx+0x2e],al
c000b5e5:	0c 41                	or     al,0x41
c000b5e7:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000b5eb:	14 48                	adc    al,0x48
c000b5ed:	2e 00 4c c3 41       	add    BYTE PTR cs:[ebx+eax*8+0x41],cl
c000b5f2:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000b5f6:	0c 04                	or     al,0x4
c000b5f8:	04 c5                	add    al,0xc5
c000b5fa:	00 00                	add    BYTE PTR [eax],al
c000b5fc:	28 00                	sub    BYTE PTR [eax],al
c000b5fe:	00 00                	add    BYTE PTR [eax],al
c000b600:	90                   	nop
c000b601:	09 00                	or     DWORD PTR [eax],eax
c000b603:	00 5e 93             	add    BYTE PTR [esi-0x6d],bl
c000b606:	00 c0                	add    al,al
c000b608:	5f                   	pop    edi
c000b609:	00 00                	add    BYTE PTR [eax],al
c000b60b:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b60e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b614:	45                   	inc    ebp
c000b615:	86 04 87             	xchg   BYTE PTR [edi+eax*4],al
c000b618:	03 44 83 05          	add    eax,DWORD PTR [ebx+eax*4+0x5]
c000b61c:	02 4f c3             	add    cl,BYTE PTR [edi-0x3d]
c000b61f:	41                   	inc    ecx
c000b620:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000b624:	0c 04                	or     al,0x4
c000b626:	04 c5                	add    al,0xc5
c000b628:	24 00                	and    al,0x0
c000b62a:	00 00                	add    BYTE PTR [eax],al
c000b62c:	bc 09 00 00 bd       	mov    esp,0xbd000009
c000b631:	93                   	xchg   ebx,eax
c000b632:	00 c0                	add    al,al
c000b634:	31 00                	xor    DWORD PTR [eax],eax
c000b636:	00 00                	add    BYTE PTR [eax],al
c000b638:	41                   	inc    ecx
c000b639:	0e                   	push   cs
c000b63a:	08 85 02 44 0d 05    	or     BYTE PTR [ebp+0x50d4402],al
c000b640:	42                   	inc    edx
c000b641:	83 04 86 03          	add    DWORD PTR [esi+eax*4],0x3
c000b645:	67 c3                	addr16 ret 
c000b647:	41                   	inc    ecx
c000b648:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000b64c:	04 c5                	add    al,0xc5
c000b64e:	00 00                	add    BYTE PTR [eax],al
c000b650:	20 00                	and    BYTE PTR [eax],al
c000b652:	00 00                	add    BYTE PTR [eax],al
c000b654:	e4 09                	in     al,0x9
c000b656:	00 00                	add    BYTE PTR [eax],al
c000b658:	ee                   	out    dx,al
c000b659:	93                   	xchg   ebx,eax
c000b65a:	00 c0                	add    al,al
c000b65c:	2e 00 00             	add    BYTE PTR cs:[eax],al
c000b65f:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b662:	08 85 02 47 0d 05    	or     BYTE PTR [ebp+0x50d4702],al
c000b668:	46                   	inc    esi
c000b669:	83 03 5e             	add    DWORD PTR [ebx],0x5e
c000b66c:	c3                   	ret    
c000b66d:	41                   	inc    ecx
c000b66e:	0c 04                	or     al,0x4
c000b670:	04 c5                	add    al,0xc5
c000b672:	00 00                	add    BYTE PTR [eax],al
c000b674:	1c 00                	sbb    al,0x0
c000b676:	00 00                	add    BYTE PTR [eax],al
c000b678:	08 0a                	or     BYTE PTR [edx],cl
c000b67a:	00 00                	add    BYTE PTR [eax],al
c000b67c:	1c 94                	sbb    al,0x94
c000b67e:	00 c0                	add    al,al
c000b680:	27                   	daa    
c000b681:	00 00                	add    BYTE PTR [eax],al
c000b683:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b686:	08 85 02 47 0d 05    	or     BYTE PTR [ebp+0x50d4702],al
c000b68c:	5e                   	pop    esi
c000b68d:	0c 04                	or     al,0x4
c000b68f:	04 c5                	add    al,0xc5
c000b691:	00 00                	add    BYTE PTR [eax],al
c000b693:	00 2c 00             	add    BYTE PTR [eax+eax*1],ch
c000b696:	00 00                	add    BYTE PTR [eax],al
c000b698:	28 0a                	sub    BYTE PTR [edx],cl
c000b69a:	00 00                	add    BYTE PTR [eax],al
c000b69c:	43                   	inc    ebx
c000b69d:	94                   	xchg   esp,eax
c000b69e:	00 c0                	add    al,al
c000b6a0:	97                   	xchg   edi,eax
c000b6a1:	00 00                	add    BYTE PTR [eax],al
c000b6a3:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b6a6:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b6ac:	41                   	inc    ecx
c000b6ad:	83 03 02             	add    DWORD PTR [ebx],0x2
c000b6b0:	8a 0a                	mov    cl,BYTE PTR [edx]
c000b6b2:	c3                   	ret    
c000b6b3:	41                   	inc    ecx
c000b6b4:	0c 04                	or     al,0x4
c000b6b6:	04 c5                	add    al,0xc5
c000b6b8:	45                   	inc    ebp
c000b6b9:	0b 41 c3             	or     eax,DWORD PTR [ecx-0x3d]
c000b6bc:	41                   	inc    ecx
c000b6bd:	0c 04                	or     al,0x4
c000b6bf:	04 c5                	add    al,0xc5
c000b6c1:	00 00                	add    BYTE PTR [eax],al
c000b6c3:	00 28                	add    BYTE PTR [eax],ch
c000b6c5:	00 00                	add    BYTE PTR [eax],al
c000b6c7:	00 58 0a             	add    BYTE PTR [eax+0xa],bl
c000b6ca:	00 00                	add    BYTE PTR [eax],al
c000b6cc:	da 94 00 c0 1f 00 00 	ficom  DWORD PTR [eax+eax*1+0x1fc0]
c000b6d3:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b6d6:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b6dc:	41                   	inc    ecx
c000b6dd:	83 03 4a             	add    DWORD PTR [ebx],0x4a
c000b6e0:	2e 04 04             	cs add al,0x4
c000b6e3:	06                   	push   es
c000b6e4:	00 00                	add    BYTE PTR [eax],al
c000b6e6:	00 2e                	add    BYTE PTR [esi],ch
c000b6e8:	00 4a c5             	add    BYTE PTR [edx-0x3b],cl
c000b6eb:	0c 04                	or     al,0x4
c000b6ed:	04 c3                	add    al,0xc3
c000b6ef:	00 30                	add    BYTE PTR [eax],dh
c000b6f1:	00 00                	add    BYTE PTR [eax],al
c000b6f3:	00 84 0a 00 00 f9 94 	add    BYTE PTR [edx+ecx*1-0x6b070000],al
c000b6fa:	00 c0                	add    al,al
c000b6fc:	2f                   	das    
c000b6fd:	00 00                	add    BYTE PTR [eax],al
c000b6ff:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b702:	08 85 02 44 0d 05    	or     BYTE PTR [ebp+0x50d4402],al
c000b708:	46                   	inc    esi
c000b709:	87 03                	xchg   DWORD PTR [ebx],eax
c000b70b:	4d                   	dec    ebp
c000b70c:	2e 04 04             	cs add al,0x4
c000b70f:	01 00                	add    DWORD PTR [eax],eax
c000b711:	00 00                	add    BYTE PTR [eax],al
c000b713:	2e 08 43 2e          	or     BYTE PTR cs:[ebx+0x2e],al
c000b717:	0c 46                	or     al,0x46
c000b719:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000b71d:	00 44 c5 0c          	add    BYTE PTR [ebp+eax*8+0xc],al
c000b721:	04 04                	add    al,0x4
c000b723:	c7                   	(bad)  
c000b724:	38 00                	cmp    BYTE PTR [eax],al
c000b726:	00 00                	add    BYTE PTR [eax],al
c000b728:	b8 0a 00 00 28       	mov    eax,0x2800000a
c000b72d:	95                   	xchg   ebp,eax
c000b72e:	00 c0                	add    al,al
c000b730:	47                   	inc    edi
c000b731:	00 00                	add    BYTE PTR [eax],al
c000b733:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b736:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b73c:	45                   	inc    ebp
c000b73d:	83 04 86 03          	add    DWORD PTR [esi+eax*4],0x3
c000b741:	52                   	push   edx
c000b742:	2e 04 04             	cs add al,0x4
c000b745:	05 00 00 00 2e       	add    eax,0x2e000000
c000b74a:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000b74d:	0c 45                	or     al,0x45
c000b74f:	2e 10 4e 2e          	adc    BYTE PTR cs:[esi+0x2e],cl
c000b753:	00 50 c3             	add    BYTE PTR [eax-0x3d],dl
c000b756:	41                   	inc    ecx
c000b757:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000b75b:	04 c5                	add    al,0xc5
c000b75d:	00 00                	add    BYTE PTR [eax],al
c000b75f:	00 3c 00             	add    BYTE PTR [eax+eax*1],bh
c000b762:	00 00                	add    BYTE PTR [eax],al
c000b764:	f4                   	hlt    
c000b765:	0a 00                	or     al,BYTE PTR [eax]
c000b767:	00 6f 95             	add    BYTE PTR [edi-0x6b],ch
c000b76a:	00 c0                	add    al,al
c000b76c:	4a                   	dec    edx
c000b76d:	00 00                	add    BYTE PTR [eax],al
c000b76f:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b772:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b778:	46                   	inc    esi
c000b779:	83 05 86 04 87 03 56 	add    DWORD PTR ds:0x3870486,0x56
c000b780:	2e 04 04             	cs add al,0x4
c000b783:	05 00 00 00 2e       	add    eax,0x2e000000
c000b788:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000b78b:	0c 45                	or     al,0x45
c000b78d:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000b791:	00 53 c3             	add    BYTE PTR [ebx-0x3d],dl
c000b794:	41                   	inc    ecx
c000b795:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000b799:	0c 04                	or     al,0x4
c000b79b:	04 c5                	add    al,0xc5
c000b79d:	00 00                	add    BYTE PTR [eax],al
c000b79f:	00 3c 00             	add    BYTE PTR [eax+eax*1],bh
c000b7a2:	00 00                	add    BYTE PTR [eax],al
c000b7a4:	34 0b                	xor    al,0xb
c000b7a6:	00 00                	add    BYTE PTR [eax],al
c000b7a8:	b9 95 00 c0 42       	mov    ecx,0x42c00095
c000b7ad:	00 00                	add    BYTE PTR [eax],al
c000b7af:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b7b2:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b7b8:	41                   	inc    ecx
c000b7b9:	86 03                	xchg   BYTE PTR [ebx],al
c000b7bb:	44                   	inc    esp
c000b7bc:	83 04 04 10          	add    DWORD PTR [esp+eax*1],0x10
c000b7c0:	00 00                	add    BYTE PTR [eax],al
c000b7c2:	00 2e                	add    BYTE PTR [esi],ch
c000b7c4:	04 04                	add    al,0x4
c000b7c6:	05 00 00 00 2e       	add    eax,0x2e000000
c000b7cb:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000b7ce:	0c 45                	or     al,0x45
c000b7d0:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000b7d4:	00 53 c3             	add    BYTE PTR [ebx-0x3d],dl
c000b7d7:	41                   	inc    ecx
c000b7d8:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000b7dc:	04 c5                	add    al,0xc5
c000b7de:	00 00                	add    BYTE PTR [eax],al
c000b7e0:	20 00                	and    BYTE PTR [eax],al
c000b7e2:	00 00                	add    BYTE PTR [eax],al
c000b7e4:	74 0b                	je     c000b7f1 <_edata+0xb81>
c000b7e6:	00 00                	add    BYTE PTR [eax],al
c000b7e8:	fb                   	sti    
c000b7e9:	95                   	xchg   ebp,eax
c000b7ea:	00 c0                	add    al,al
c000b7ec:	1a 00                	sbb    al,BYTE PTR [eax]
c000b7ee:	00 00                	add    BYTE PTR [eax],al
c000b7f0:	41                   	inc    ecx
c000b7f1:	0e                   	push   cs
c000b7f2:	08 85 02 44 0d 05    	or     BYTE PTR [ebp+0x50d4402],al
c000b7f8:	44                   	inc    esp
c000b7f9:	83 03 4f             	add    DWORD PTR [ebx],0x4f
c000b7fc:	c3                   	ret    
c000b7fd:	41                   	inc    ecx
c000b7fe:	0c 04                	or     al,0x4
c000b800:	04 c5                	add    al,0xc5
c000b802:	00 00                	add    BYTE PTR [eax],al
c000b804:	1c 00                	sbb    al,0x0
c000b806:	00 00                	add    BYTE PTR [eax],al
c000b808:	98                   	cwde   
c000b809:	0b 00                	or     eax,DWORD PTR [eax]
c000b80b:	00 18                	add    BYTE PTR [eax],bl
c000b80d:	96                   	xchg   esi,eax
c000b80e:	00 c0                	add    al,al
c000b810:	0f 00 00             	sldt   WORD PTR [eax]
c000b813:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b816:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b81c:	4a                   	dec    edx
c000b81d:	0c 04                	or     al,0x4
c000b81f:	04 c5                	add    al,0xc5
c000b821:	00 00                	add    BYTE PTR [eax],al
c000b823:	00 3c 00             	add    BYTE PTR [eax+eax*1],bh
c000b826:	00 00                	add    BYTE PTR [eax],al
c000b828:	b8 0b 00 00 27       	mov    eax,0x2700000b
c000b82d:	96                   	xchg   esi,eax
c000b82e:	00 c0                	add    al,al
c000b830:	3b 00                	cmp    eax,DWORD PTR [eax]
c000b832:	00 00                	add    BYTE PTR [eax],al
c000b834:	41                   	inc    ecx
c000b835:	0e                   	push   cs
c000b836:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b83c:	41                   	inc    ecx
c000b83d:	86 03                	xchg   BYTE PTR [ebx],al
c000b83f:	44                   	inc    esp
c000b840:	83 04 04 04          	add    DWORD PTR [esp+eax*1],0x4
c000b844:	00 00                	add    BYTE PTR [eax],al
c000b846:	00 2e                	add    BYTE PTR [esi],ch
c000b848:	04 04                	add    al,0x4
c000b84a:	02 00                	add    al,BYTE PTR [eax]
c000b84c:	00 00                	add    BYTE PTR [eax],al
c000b84e:	2e 08 42 2e          	or     BYTE PTR cs:[edx+0x2e],al
c000b852:	0c 41                	or     al,0x41
c000b854:	2e 10 4a 2e          	adc    BYTE PTR cs:[edx+0x2e],cl
c000b858:	00 5d c3             	add    BYTE PTR [ebp-0x3d],bl
c000b85b:	41                   	inc    ecx
c000b85c:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000b860:	04 c5                	add    al,0xc5
c000b862:	00 00                	add    BYTE PTR [eax],al
c000b864:	1c 00                	sbb    al,0x0
c000b866:	00 00                	add    BYTE PTR [eax],al
c000b868:	f8                   	clc    
c000b869:	0b 00                	or     eax,DWORD PTR [eax]
c000b86b:	00 62 96             	add    BYTE PTR [edx-0x6a],ah
c000b86e:	00 c0                	add    al,al
c000b870:	56                   	push   esi
c000b871:	00 00                	add    BYTE PTR [eax],al
c000b873:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b876:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b87c:	02 52 0c             	add    dl,BYTE PTR [edx+0xc]
c000b87f:	04 04                	add    al,0x4
c000b881:	c5 00                	lds    eax,FWORD PTR [eax]
c000b883:	00 50 00             	add    BYTE PTR [eax+0x0],dl
c000b886:	00 00                	add    BYTE PTR [eax],al
c000b888:	18 0c 00             	sbb    BYTE PTR [eax+eax*1],cl
c000b88b:	00 b8 96 00 c0 43    	add    BYTE PTR [eax+0x43c00096],bh
c000b891:	00 00                	add    BYTE PTR [eax],al
c000b893:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b896:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b89c:	42                   	inc    edx
c000b89d:	83 04 86 03          	add    DWORD PTR [esi+eax*4],0x3
c000b8a1:	46                   	inc    esi
c000b8a2:	2e 0c 42             	cs or  al,0x42
c000b8a5:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000b8a9:	04 04                	add    al,0x4
c000b8ab:	04 00                	add    al,0x0
c000b8ad:	00 00                	add    BYTE PTR [eax],al
c000b8af:	2e 08 43 2e          	or     BYTE PTR cs:[ebx+0x2e],al
c000b8b3:	0c 43                	or     al,0x43
c000b8b5:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000b8b9:	04 04                	add    al,0x4
c000b8bb:	03 00                	add    eax,DWORD PTR [eax]
c000b8bd:	00 00                	add    BYTE PTR [eax],al
c000b8bf:	2e 08 43 2e          	or     BYTE PTR cs:[ebx+0x2e],al
c000b8c3:	0c 41                	or     al,0x41
c000b8c5:	2e 10 52 c3          	adc    BYTE PTR cs:[edx-0x3d],dl
c000b8c9:	41                   	inc    ecx
c000b8ca:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000b8ce:	04 c5                	add    al,0xc5
c000b8d0:	41                   	inc    ecx
c000b8d1:	13 03                	adc    eax,DWORD PTR [ebx]
c000b8d3:	2e 00 00             	add    BYTE PTR cs:[eax],al
c000b8d6:	00 00                	add    BYTE PTR [eax],al
c000b8d8:	1c 00                	sbb    al,0x0
c000b8da:	00 00                	add    BYTE PTR [eax],al
c000b8dc:	6c                   	ins    BYTE PTR es:[edi],dx
c000b8dd:	0c 00                	or     al,0x0
c000b8df:	00 fc                	add    ah,bh
c000b8e1:	96                   	xchg   esi,eax
c000b8e2:	00 c0                	add    al,al
c000b8e4:	18 00                	sbb    BYTE PTR [eax],al
c000b8e6:	00 00                	add    BYTE PTR [eax],al
c000b8e8:	41                   	inc    ecx
c000b8e9:	0e                   	push   cs
c000b8ea:	08 85 02 47 0d 05    	or     BYTE PTR [ebp+0x50d4702],al
c000b8f0:	4f                   	dec    edi
c000b8f1:	0c 04                	or     al,0x4
c000b8f3:	04 c5                	add    al,0xc5
c000b8f5:	00 00                	add    BYTE PTR [eax],al
c000b8f7:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b8fa:	00 00                	add    BYTE PTR [eax],al
c000b8fc:	8c 0c 00             	mov    WORD PTR [eax+eax*1],cs
c000b8ff:	00 14 97             	add    BYTE PTR [edi+edx*4],dl
c000b902:	00 c0                	add    al,al
c000b904:	13 00                	adc    eax,DWORD PTR [eax]
c000b906:	00 00                	add    BYTE PTR [eax],al
c000b908:	41                   	inc    ecx
c000b909:	0e                   	push   cs
c000b90a:	08 85 02 47 0d 05    	or     BYTE PTR [ebp+0x50d4702],al
c000b910:	4a                   	dec    edx
c000b911:	0c 04                	or     al,0x4
c000b913:	04 c5                	add    al,0xc5
c000b915:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .rodata:

c000b918 <_rodata>:
c000b918:	6b 5f 61 00          	imul   ebx,DWORD PTR [edi+0x61],0x0
c000b91c:	62 79 74             	bound  edi,QWORD PTR [ecx+0x74]
c000b91f:	65 5f                	gs pop edi
c000b921:	69 6e 64 65 78 20 3c 	imul   ebp,DWORD PTR [esi+0x64],0x3c207865
c000b928:	20 28                	and    BYTE PTR [eax],ch
c000b92a:	62 74 6d 70          	bound  esi,QWORD PTR [ebp+ebp*2+0x70]
c000b92e:	2d 3e 62 74 6d       	sub    eax,0x6d74623e
c000b933:	70 5f                	jo     c000b994 <__func__.864+0x1c>
c000b935:	62 79 74             	bound  edi,QWORD PTR [ecx+0x74]
c000b938:	65 73 5f             	gs jae c000b99a <__func__.864+0x22>
c000b93b:	6c                   	ins    BYTE PTR es:[edi],dx
c000b93c:	65 6e                	outs   dx,BYTE PTR gs:[esi]
c000b93e:	29 00                	sub    DWORD PTR [eax],eax
c000b940:	6c                   	ins    BYTE PTR es:[edi],dx
c000b941:	69 62 2f 62 69 74 6d 	imul   esp,DWORD PTR [edx+0x2f],0x6d746962
c000b948:	61                   	popa   
c000b949:	70 2e                	jo     c000b979 <__func__.864+0x1>
c000b94b:	63 00                	arpl   WORD PTR [eax],ax
c000b94d:	76 61                	jbe    c000b9b0 <__func__.864+0x38>
c000b94f:	6c                   	ins    BYTE PTR es:[edi],dx
c000b950:	75 65                	jne    c000b9b7 <__func__.864+0x3f>
c000b952:	20 3d 3d 20 30 20    	and    BYTE PTR ds:0x2030203d,bh
c000b958:	7c 7c                	jl     c000b9d6 <__func__.864+0x5e>
c000b95a:	20 76 61             	and    BYTE PTR [esi+0x61],dh
c000b95d:	6c                   	ins    BYTE PTR es:[edi],dx
c000b95e:	75 65                	jne    c000b9c5 <__func__.864+0x4d>
c000b960:	20 3d 3d 20 31 00    	and    BYTE PTR ds:0x31203d,bh
	...

c000b968 <__func__.847>:
c000b968:	62 69 74             	bound  ebp,QWORD PTR [ecx+0x74]
c000b96b:	6d                   	ins    DWORD PTR es:[edi],dx
c000b96c:	61                   	popa   
c000b96d:	70 5f                	jo     c000b9ce <__func__.864+0x56>
c000b96f:	61                   	popa   
c000b970:	6c                   	ins    BYTE PTR es:[edi],dx
c000b971:	6c                   	ins    BYTE PTR es:[edi],dx
c000b972:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b973:	63 00                	arpl   WORD PTR [eax],ax
c000b975:	00 00                	add    BYTE PTR [eax],al
	...

c000b978 <__func__.864>:
c000b978:	62 69 74             	bound  ebp,QWORD PTR [ecx+0x74]
c000b97b:	6d                   	ins    DWORD PTR es:[edi],dx
c000b97c:	61                   	popa   
c000b97d:	70 5f                	jo     c000b9de <__func__.864+0x66>
c000b97f:	73 65                	jae    c000b9e6 <__func__.864+0x6e>
c000b981:	74 00                	je     c000b983 <__func__.864+0xb>
c000b983:	45                   	inc    ebp
c000b984:	72 72                	jb     c000b9f8 <__func__.864+0x80>
c000b986:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b987:	72 0a                	jb     c000b993 <__func__.864+0x1b>
c000b989:	00 46 69             	add    BYTE PTR [esi+0x69],al
c000b98c:	6c                   	ins    BYTE PTR es:[edi],dx
c000b98d:	65 3a 00             	cmp    al,BYTE PTR gs:[eax]
c000b990:	49                   	dec    ecx
c000b991:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b992:	20 66 75             	and    BYTE PTR [esi+0x75],ah
c000b995:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b996:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
c000b99a:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b99b:	3a 20                	cmp    ah,BYTE PTR [eax]
c000b99d:	00 4c 69 6e          	add    BYTE PTR [ecx+ebp*2+0x6e],cl
c000b9a1:	65 3a 00             	cmp    al,BYTE PTR gs:[eax]
c000b9a4:	43                   	inc    ebx
c000b9a5:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b9a6:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b9a7:	64 69 74 69 6f 6e 3a 	imul   esi,DWORD PTR fs:[ecx+ebp*2+0x6f],0x203a6e
c000b9ae:	20 00 
c000b9b0:	69 6e 74 72 3a 00 75 	imul   ebp,DWORD PTR [esi+0x74],0x75003a72
c000b9b7:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b9b8:	6b 6e 6f 77          	imul   ebp,DWORD PTR [esi+0x6f],0x77
c000b9bc:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b9bd:	00 23                	add    BYTE PTR [ebx],ah
c000b9bf:	44                   	inc    esp
c000b9c0:	45                   	inc    ebp
c000b9c1:	20 44 69 76          	and    BYTE PTR [ecx+ebp*2+0x76],al
c000b9c5:	69 64 65 20 45 72 72 	imul   esp,DWORD PTR [ebp+eiz*2+0x20],0x6f727245
c000b9cc:	6f 
c000b9cd:	72 00                	jb     c000b9cf <__func__.864+0x57>
c000b9cf:	23 44 42 20          	and    eax,DWORD PTR [edx+eax*2+0x20]
c000b9d3:	44                   	inc    esp
c000b9d4:	65 62 75 67          	bound  esi,QWORD PTR gs:[ebp+0x67]
c000b9d8:	20 45 78             	and    BYTE PTR [ebp+0x78],al
c000b9db:	63 65 70             	arpl   WORD PTR [ebp+0x70],sp
c000b9de:	74 69                	je     c000ba49 <__func__.864+0xd1>
c000b9e0:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b9e1:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b9e2:	00 4e 4d             	add    BYTE PTR [esi+0x4d],cl
c000b9e5:	49                   	dec    ecx
c000b9e6:	20 49 6e             	and    BYTE PTR [ecx+0x6e],cl
c000b9e9:	74 65                	je     c000ba50 <__func__.864+0xd8>
c000b9eb:	72 72                	jb     c000ba5f <__func__.864+0xe7>
c000b9ed:	75 70                	jne    c000ba5f <__func__.864+0xe7>
c000b9ef:	74 00                	je     c000b9f1 <__func__.864+0x79>
c000b9f1:	23 42 50             	and    eax,DWORD PTR [edx+0x50]
c000b9f4:	20 42 72             	and    BYTE PTR [edx+0x72],al
c000b9f7:	65 61                	gs popa 
c000b9f9:	6b 70 6f 69          	imul   esi,DWORD PTR [eax+0x6f],0x69
c000b9fd:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b9fe:	74 20                	je     c000ba20 <__func__.864+0xa8>
c000ba00:	45                   	inc    ebp
c000ba01:	78 63                	js     c000ba66 <__func__.864+0xee>
c000ba03:	65 70 74             	gs jo  c000ba7a <__func__.864+0x102>
c000ba06:	69 6f 6e 00 23 4f 46 	imul   ebp,DWORD PTR [edi+0x6e],0x464f2300
c000ba0d:	20 4f 76             	and    BYTE PTR [edi+0x76],cl
c000ba10:	65 72 66             	gs jb  c000ba79 <__func__.864+0x101>
c000ba13:	6c                   	ins    BYTE PTR es:[edi],dx
c000ba14:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000ba15:	77 20                	ja     c000ba37 <__func__.864+0xbf>
c000ba17:	45                   	inc    ebp
c000ba18:	78 63                	js     c000ba7d <__func__.864+0x105>
c000ba1a:	65 70 74             	gs jo  c000ba91 <__func__.864+0x119>
c000ba1d:	69 6f 6e 00 23 42 52 	imul   ebp,DWORD PTR [edi+0x6e],0x52422300
c000ba24:	20 42 4f             	and    BYTE PTR [edx+0x4f],al
c000ba27:	55                   	push   ebp
c000ba28:	4e                   	dec    esi
c000ba29:	44                   	inc    esp
c000ba2a:	20 52 61             	and    BYTE PTR [edx+0x61],dl
c000ba2d:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000ba2e:	67 65 20 45 78       	and    BYTE PTR gs:[di+0x78],al
c000ba33:	63 65 65             	arpl   WORD PTR [ebp+0x65],sp
c000ba36:	64 65 64 20 45 78    	fs gs and BYTE PTR fs:[ebp+0x78],al
c000ba3c:	63 65 70             	arpl   WORD PTR [ebp+0x70],sp
c000ba3f:	74 69                	je     c000baaa <__func__.864+0x132>
c000ba41:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000ba42:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000ba43:	00 23                	add    BYTE PTR [ebx],ah
c000ba45:	55                   	push   ebp
c000ba46:	44                   	inc    esp
c000ba47:	20 49 6e             	and    BYTE PTR [ecx+0x6e],cl
c000ba4a:	76 61                	jbe    c000baad <__func__.864+0x135>
c000ba4c:	6c                   	ins    BYTE PTR es:[edi],dx
c000ba4d:	69 64 20 4f 70 63 6f 	imul   esp,DWORD PTR [eax+eiz*1+0x4f],0x646f6370
c000ba54:	64 
c000ba55:	65 20 45 78          	and    BYTE PTR gs:[ebp+0x78],al
c000ba59:	63 65 70             	arpl   WORD PTR [ebp+0x70],sp
c000ba5c:	74 69                	je     c000bac7 <__func__.864+0x14f>
c000ba5e:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000ba5f:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000ba60:	00 23                	add    BYTE PTR [ebx],ah
c000ba62:	4e                   	dec    esi
c000ba63:	4d                   	dec    ebp
c000ba64:	20 44 65 76          	and    BYTE PTR [ebp+eiz*2+0x76],al
c000ba68:	69 63 65 20 4e 6f 74 	imul   esp,DWORD PTR [ebx+0x65],0x746f4e20
c000ba6f:	20 41 76             	and    BYTE PTR [ecx+0x76],al
c000ba72:	61                   	popa   
c000ba73:	69 6c 61 62 6c 65 20 	imul   ebp,DWORD PTR [ecx+eiz*2+0x62],0x4520656c
c000ba7a:	45 
c000ba7b:	78 63                	js     c000bae0 <__func__.864+0x168>
c000ba7d:	65 70 74             	gs jo  c000baf4 <__func__.864+0x17c>
c000ba80:	69 6f 6e 00 23 44 46 	imul   ebp,DWORD PTR [edi+0x6e],0x46442300
c000ba87:	20 44 6f 75          	and    BYTE PTR [edi+ebp*2+0x75],al
c000ba8b:	62 6c 65 20          	bound  ebp,QWORD PTR [ebp+eiz*2+0x20]
c000ba8f:	46                   	inc    esi
c000ba90:	61                   	popa   
c000ba91:	75 6c                	jne    c000baff <__func__.864+0x187>
c000ba93:	74 20                	je     c000bab5 <__func__.864+0x13d>
c000ba95:	45                   	inc    ebp
c000ba96:	78 63                	js     c000bafb <__func__.864+0x183>
c000ba98:	65 70 74             	gs jo  c000bb0f <__func__.864+0x197>
c000ba9b:	69 6f 6e 00 43 6f 70 	imul   ebp,DWORD PTR [edi+0x6e],0x706f4300
c000baa2:	72 6f                	jb     c000bb13 <__func__.864+0x19b>
c000baa4:	63 65 73             	arpl   WORD PTR [ebp+0x73],sp
c000baa7:	73 6f                	jae    c000bb18 <__func__.864+0x1a0>
c000baa9:	72 20                	jb     c000bacb <__func__.864+0x153>
c000baab:	53                   	push   ebx
c000baac:	65 67 6d             	gs ins DWORD PTR es:[di],dx
c000baaf:	65 6e                	outs   dx,BYTE PTR gs:[esi]
c000bab1:	74 20                	je     c000bad3 <__func__.864+0x15b>
c000bab3:	4f                   	dec    edi
c000bab4:	76 65                	jbe    c000bb1b <__func__.864+0x1a3>
c000bab6:	72 72                	jb     c000bb2a <__func__.864+0x1b2>
c000bab8:	75 6e                	jne    c000bb28 <__func__.864+0x1b0>
c000baba:	00 23                	add    BYTE PTR [ebx],ah
c000babc:	54                   	push   esp
c000babd:	53                   	push   ebx
c000babe:	20 49 6e             	and    BYTE PTR [ecx+0x6e],cl
c000bac1:	76 61                	jbe    c000bb24 <__func__.864+0x1ac>
c000bac3:	6c                   	ins    BYTE PTR es:[edi],dx
c000bac4:	69 64 20 54 53 53 20 	imul   esp,DWORD PTR [eax+eiz*1+0x54],0x45205353
c000bacb:	45 
c000bacc:	78 63                	js     c000bb31 <__func__.864+0x1b9>
c000bace:	65 70 74             	gs jo  c000bb45 <__func__.864+0x1cd>
c000bad1:	69 6f 6e 00 23 4e 50 	imul   ebp,DWORD PTR [edi+0x6e],0x504e2300
c000bad8:	20 53 65             	and    BYTE PTR [ebx+0x65],dl
c000badb:	67 6d                	ins    DWORD PTR es:[di],dx
c000badd:	65 6e                	outs   dx,BYTE PTR gs:[esi]
c000badf:	74 20                	je     c000bb01 <__func__.864+0x189>
c000bae1:	4e                   	dec    esi
c000bae2:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000bae3:	74 20                	je     c000bb05 <__func__.864+0x18d>
c000bae5:	50                   	push   eax
c000bae6:	72 65                	jb     c000bb4d <__func__.864+0x1d5>
c000bae8:	73 65                	jae    c000bb4f <__func__.864+0x1d7>
c000baea:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000baeb:	74 00                	je     c000baed <__func__.864+0x175>
c000baed:	23 53 53             	and    edx,DWORD PTR [ebx+0x53]
c000baf0:	20 53 74             	and    BYTE PTR [ebx+0x74],dl
c000baf3:	61                   	popa   
c000baf4:	63 6b 20             	arpl   WORD PTR [ebx+0x20],bp
c000baf7:	46                   	inc    esi
c000baf8:	61                   	popa   
c000baf9:	75 6c                	jne    c000bb67 <__func__.864+0x1ef>
c000bafb:	74 20                	je     c000bb1d <__func__.864+0x1a5>
c000bafd:	45                   	inc    ebp
c000bafe:	78 63                	js     c000bb63 <__func__.864+0x1eb>
c000bb00:	65 70 74             	gs jo  c000bb77 <__func__.864+0x1ff>
c000bb03:	69 6f 6e 00 23 47 50 	imul   ebp,DWORD PTR [edi+0x6e],0x50472300
c000bb0a:	20 47 65             	and    BYTE PTR [edi+0x65],al
c000bb0d:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000bb0e:	65 72 61             	gs jb  c000bb72 <__func__.864+0x1fa>
c000bb11:	6c                   	ins    BYTE PTR es:[edi],dx
c000bb12:	20 50 72             	and    BYTE PTR [eax+0x72],dl
c000bb15:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000bb16:	74 65                	je     c000bb7d <__func__.864+0x205>
c000bb18:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
c000bb1c:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000bb1d:	20 45 78             	and    BYTE PTR [ebp+0x78],al
c000bb20:	63 65 70             	arpl   WORD PTR [ebp+0x70],sp
c000bb23:	74 69                	je     c000bb8e <__func__.864+0x216>
c000bb25:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000bb26:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000bb27:	00 23                	add    BYTE PTR [ebx],ah
c000bb29:	50                   	push   eax
c000bb2a:	46                   	inc    esi
c000bb2b:	20 50 61             	and    BYTE PTR [eax+0x61],dl
c000bb2e:	67 65 2d 46 61 75 6c 	addr16 gs sub eax,0x6c756146
c000bb35:	74 20                	je     c000bb57 <__func__.864+0x1df>
c000bb37:	45                   	inc    ebp
c000bb38:	78 63                	js     c000bb9d <__func__.864+0x225>
c000bb3a:	65 70 74             	gs jo  c000bbb1 <__func__.864+0x239>
c000bb3d:	69 6f 6e 00 52 65 73 	imul   ebp,DWORD PTR [edi+0x6e],0x73655200
c000bb44:	65 72 76             	gs jb  c000bbbd <__func__.864+0x245>
c000bb47:	65 64 00 23          	gs add BYTE PTR fs:[ebx],ah
c000bb4b:	4d                   	dec    ebp
c000bb4c:	46                   	inc    esi
c000bb4d:	20 78 38             	and    BYTE PTR [eax+0x38],bh
c000bb50:	37                   	aaa    
c000bb51:	20 46 50             	and    BYTE PTR [esi+0x50],al
c000bb54:	55                   	push   ebp
c000bb55:	20 46 6c             	and    BYTE PTR [esi+0x6c],al
c000bb58:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000bb59:	61                   	popa   
c000bb5a:	74 69                	je     c000bbc5 <__func__.864+0x24d>
c000bb5c:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000bb5d:	67 2d 50 6f 69 6e    	addr16 sub eax,0x6e696f50
c000bb63:	74 20                	je     c000bb85 <__func__.864+0x20d>
c000bb65:	45                   	inc    ebp
c000bb66:	72 72                	jb     c000bbda <digits.967+0x12>
c000bb68:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000bb69:	72 00                	jb     c000bb6b <__func__.864+0x1f3>
c000bb6b:	23 41 43             	and    eax,DWORD PTR [ecx+0x43]
c000bb6e:	20 41 6c             	and    BYTE PTR [ecx+0x6c],al
c000bb71:	69 67 6e 6d 65 6e 74 	imul   esp,DWORD PTR [edi+0x6e],0x746e656d
c000bb78:	20 43 68             	and    BYTE PTR [ebx+0x68],al
c000bb7b:	65 63 6b 20          	arpl   WORD PTR gs:[ebx+0x20],bp
c000bb7f:	45                   	inc    ebp
c000bb80:	78 63                	js     c000bbe5 <digits.967+0x1d>
c000bb82:	65 70 74             	gs jo  c000bbf9 <digits.967+0x31>
c000bb85:	69 6f 6e 00 23 4d 43 	imul   ebp,DWORD PTR [edi+0x6e],0x434d2300
c000bb8c:	20 4d 61             	and    BYTE PTR [ebp+0x61],cl
c000bb8f:	63 68 69             	arpl   WORD PTR [eax+0x69],bp
c000bb92:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000bb93:	65 2d 43 68 65 63    	gs sub eax,0x63656843
c000bb99:	6b 20 45             	imul   esp,DWORD PTR [eax],0x45
c000bb9c:	78 63                	js     c000bc01 <digits.967+0x39>
c000bb9e:	65 70 74             	gs jo  c000bc15 <digits.967+0x4d>
c000bba1:	69 6f 6e 00 23 58 46 	imul   ebp,DWORD PTR [edi+0x6e],0x46582300
c000bba8:	20 53 49             	and    BYTE PTR [ebx+0x49],dl
c000bbab:	4d                   	dec    ebp
c000bbac:	44                   	inc    esp
c000bbad:	20 46 6c             	and    BYTE PTR [esi+0x6c],al
c000bbb0:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000bbb1:	61                   	popa   
c000bbb2:	74 69                	je     c000bc1d <digits.967+0x55>
c000bbb4:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000bbb5:	67 2d 50 6f 69 6e    	addr16 sub eax,0x6e696f50
c000bbbb:	74 20                	je     c000bbdd <digits.967+0x15>
c000bbbd:	45                   	inc    ebp
c000bbbe:	78 63                	js     c000bc23 <digits.967+0x5b>
c000bbc0:	65 70 74             	gs jo  c000bc37 <digits.967+0x6f>
c000bbc3:	69 6f 6e 00 00 30 31 	imul   ebp,DWORD PTR [edi+0x6e],0x31300000

c000bbc8 <digits.967>:
c000bbc8:	30 31                	xor    BYTE PTR [ecx],dh
c000bbca:	32 33                	xor    dh,BYTE PTR [ebx]
c000bbcc:	34 35                	xor    al,0x35
c000bbce:	36 37                	ss aaa 
c000bbd0:	38 39                	cmp    BYTE PTR [ecx],bh
c000bbd2:	41                   	inc    ecx
c000bbd3:	42                   	inc    edx
c000bbd4:	43                   	inc    ebx
c000bbd5:	44                   	inc    esp
c000bbd6:	45                   	inc    ebp
c000bbd7:	46                   	inc    esi
c000bbd8:	47                   	inc    edi
c000bbd9:	48                   	dec    eax
c000bbda:	49                   	dec    ecx
c000bbdb:	4a                   	dec    edx
c000bbdc:	4b                   	dec    ebx
c000bbdd:	4c                   	dec    esp
c000bbde:	4d                   	dec    ebp
c000bbdf:	4e                   	dec    esi
c000bbe0:	4f                   	dec    edi
c000bbe1:	50                   	push   eax
c000bbe2:	51                   	push   ecx
c000bbe3:	52                   	push   edx
c000bbe4:	53                   	push   ebx
c000bbe5:	54                   	push   esp
c000bbe6:	55                   	push   ebp
c000bbe7:	56                   	push   esi
c000bbe8:	57                   	push   edi
c000bbe9:	58                   	pop    eax
c000bbea:	59                   	pop    ecx
c000bbeb:	5a                   	pop    edx
c000bbec:	00 00                	add    BYTE PTR [eax],al
c000bbee:	00 00                	add    BYTE PTR [eax],al
c000bbf0:	64 73 74             	fs jae c000bc67 <ticks+0x3>
c000bbf3:	5f                   	pop    edi
c000bbf4:	5f                   	pop    edi
c000bbf5:	20 21                	and    BYTE PTR [ecx],ah
c000bbf7:	3d 20 4e 55 4c       	cmp    eax,0x4c554e20
c000bbfc:	4c                   	dec    esp
c000bbfd:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
c000bc01:	2f                   	das    
c000bc02:	73 74                	jae    c000bc78 <Screen+0x10>
c000bc04:	72 69                	jb     c000bc6f <Screen+0x7>
c000bc06:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000bc07:	67 2e 63 00          	arpl   WORD PTR cs:[bx+si],ax
c000bc0b:	64 73 74             	fs jae c000bc82 <Screen+0x1a>
c000bc0e:	5f                   	pop    edi
c000bc0f:	5f                   	pop    edi
c000bc10:	20 21                	and    BYTE PTR [ecx],ah
c000bc12:	3d 20 4e 55 4c       	cmp    eax,0x4c554e20
c000bc17:	4c                   	dec    esp
c000bc18:	20 26                	and    BYTE PTR [esi],ah
c000bc1a:	26 20 73 72          	and    BYTE PTR es:[ebx+0x72],dh
c000bc1e:	63 5f 5f             	arpl   WORD PTR [edi+0x5f],bx
c000bc21:	20 21                	and    BYTE PTR [ecx],ah
c000bc23:	3d 20 4e 55 4c       	cmp    eax,0x4c554e20
c000bc28:	4c                   	dec    esp
c000bc29:	00 70 31             	add    BYTE PTR [eax+0x31],dh
c000bc2c:	5f                   	pop    edi
c000bc2d:	5f                   	pop    edi
c000bc2e:	20 21                	and    BYTE PTR [ecx],ah
c000bc30:	3d 20 4e 55 4c       	cmp    eax,0x4c554e20
c000bc35:	4c                   	dec    esp
c000bc36:	20 26                	and    BYTE PTR [esi],ah
c000bc38:	26 20 70 32          	and    BYTE PTR es:[eax+0x32],dh
c000bc3c:	5f                   	pop    edi
c000bc3d:	5f                   	pop    edi
c000bc3e:	20 21                	and    BYTE PTR [ecx],ah
c000bc40:	3d 20 4e 55 4c       	cmp    eax,0x4c554e20
c000bc45:	4c                   	dec    esp
	...

c000bc48 <__func__.820>:
c000bc48:	6d                   	ins    DWORD PTR es:[edi],dx
c000bc49:	65 6d                	gs ins DWORD PTR es:[edi],dx
c000bc4b:	73 65                	jae    c000bcb2 <Screen+0x4a>
c000bc4d:	74 00                	je     c000bc4f <__func__.820+0x7>
	...

c000bc50 <__func__.831>:
c000bc50:	6d                   	ins    DWORD PTR es:[edi],dx
c000bc51:	65 6d                	gs ins DWORD PTR es:[edi],dx
c000bc53:	63 70 79             	arpl   WORD PTR [eax+0x79],si
	...

c000bc58 <__func__.843>:
c000bc58:	6d                   	ins    DWORD PTR es:[edi],dx
c000bc59:	65 6d                	gs ins DWORD PTR es:[edi],dx
c000bc5b:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
	...

Disassembly of section .bss:

c000bc60 <_bss>:
c000bc60:	00 00                	add    BYTE PTR [eax],al
	...

c000bc64 <ticks>:
c000bc64:	00 00                	add    BYTE PTR [eax],al
	...

c000bc68 <Screen>:
	...

c000bcb4 <intr_name>:
	...

c000bd70 <idt>:
	...

c000bee8 <idt_table>:
	...

c000bfa4 <user_pool>:
	...

c0013cb4 <user_vaddr>:
	...

c001b9c4 <kernel_vaddr>:
	...

c00236d4 <kernel_pool>:
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
