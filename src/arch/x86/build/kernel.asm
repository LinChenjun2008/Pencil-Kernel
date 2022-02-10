
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
c0007f47:	0f 01 15 18 99 00 c0 	lgdtd  ds:0xc0009918
c0007f4e:	e9 0e 16 00 00       	jmp    c0009561 <_etext>
c0007f53:	e9 fb ff ff ff       	jmp    c0007f53 <_start+0x53>

c0007f58 <bitmap_init>:
c0007f58:	55                   	push   ebp
c0007f59:	89 e5                	mov    ebp,esp
c0007f5b:	83 ec 0c             	sub    esp,0xc
c0007f5e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0007f61:	ff 30                	push   DWORD PTR [eax]
c0007f63:	6a 00                	push   0x0
c0007f65:	ff 70 04             	push   DWORD PTR [eax+0x4]
c0007f68:	e8 f3 14 00 00       	call   c0009460 <memset>
c0007f6d:	83 c4 10             	add    esp,0x10
c0007f70:	c9                   	leave  
c0007f71:	c3                   	ret    

c0007f72 <bitmap_scan_test>:
c0007f72:	55                   	push   ebp
c0007f73:	89 e5                	mov    ebp,esp
c0007f75:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
c0007f78:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
c0007f7b:	5d                   	pop    ebp
c0007f7c:	8b 52 04             	mov    edx,DWORD PTR [edx+0x4]
c0007f7f:	89 c8                	mov    eax,ecx
c0007f81:	83 e1 07             	and    ecx,0x7
c0007f84:	c1 e8 03             	shr    eax,0x3
c0007f87:	0f b6 04 02          	movzx  eax,BYTE PTR [edx+eax*1]
c0007f8b:	ba 01 00 00 00       	mov    edx,0x1
c0007f90:	d3 e2                	shl    edx,cl
c0007f92:	21 d0                	and    eax,edx
c0007f94:	c3                   	ret    

c0007f95 <bitmap_alloc>:
c0007f95:	55                   	push   ebp
c0007f96:	89 e5                	mov    ebp,esp
c0007f98:	57                   	push   edi
c0007f99:	56                   	push   esi
c0007f9a:	31 f6                	xor    esi,esi
c0007f9c:	53                   	push   ebx
c0007f9d:	83 ec 1c             	sub    esp,0x1c
c0007fa0:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c0007fa3:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
c0007fa6:	eb 01                	jmp    c0007fa9 <bitmap_alloc+0x14>
c0007fa8:	46                   	inc    esi
c0007fa9:	80 3c 30 ff          	cmp    BYTE PTR [eax+esi*1],0xff
c0007fad:	75 04                	jne    c0007fb3 <bitmap_alloc+0x1e>
c0007faf:	3b 33                	cmp    esi,DWORD PTR [ebx]
c0007fb1:	72 f5                	jb     c0007fa8 <bitmap_alloc+0x13>
c0007fb3:	3b 33                	cmp    esi,DWORD PTR [ebx]
c0007fb5:	72 19                	jb     c0007fd0 <bitmap_alloc+0x3b>
c0007fb7:	68 f8 b3 00 c0       	push   0xc000b3f8
c0007fbc:	68 44 b4 00 c0       	push   0xc000b444
c0007fc1:	6a 2e                	push   0x2e
c0007fc3:	68 1c b4 00 c0       	push   0xc000b41c
c0007fc8:	e8 ef 00 00 00       	call   c00080bc <panic_spin>
c0007fcd:	83 c4 10             	add    esp,0x10
c0007fd0:	8b 13                	mov    edx,DWORD PTR [ebx]
c0007fd2:	83 c8 ff             	or     eax,0xffffffff
c0007fd5:	39 d6                	cmp    esi,edx
c0007fd7:	74 72                	je     c000804b <bitmap_alloc+0xb6>
c0007fd9:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
c0007fdc:	31 c9                	xor    ecx,ecx
c0007fde:	bf 01 00 00 00       	mov    edi,0x1
c0007fe3:	89 75 e4             	mov    DWORD PTR [ebp-0x1c],esi
c0007fe6:	89 55 dc             	mov    DWORD PTR [ebp-0x24],edx
c0007fe9:	8a 04 30             	mov    al,BYTE PTR [eax+esi*1]
c0007fec:	eb 01                	jmp    c0007fef <bitmap_alloc+0x5a>
c0007fee:	41                   	inc    ecx
c0007fef:	89 fe                	mov    esi,edi
c0007ff1:	d3 e6                	shl    esi,cl
c0007ff3:	89 f2                	mov    edx,esi
c0007ff5:	84 d0                	test   al,dl
c0007ff7:	75 f5                	jne    c0007fee <bitmap_alloc+0x59>
c0007ff9:	8b 75 e4             	mov    esi,DWORD PTR [ebp-0x1c]
c0007ffc:	83 7d 0c 01          	cmp    DWORD PTR [ebp+0xc],0x1
c0008000:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
c0008003:	8d 0c f1             	lea    ecx,[ecx+esi*8]
c0008006:	89 c8                	mov    eax,ecx
c0008008:	74 41                	je     c000804b <bitmap_alloc+0xb6>
c000800a:	8d 3c d5 00 00 00 00 	lea    edi,[edx*8+0x0]
c0008011:	be 01 00 00 00       	mov    esi,0x1
c0008016:	29 cf                	sub    edi,ecx
c0008018:	8d 51 01             	lea    edx,[ecx+0x1]
c000801b:	eb 27                	jmp    c0008044 <bitmap_alloc+0xaf>
c000801d:	50                   	push   eax
c000801e:	46                   	inc    esi
c000801f:	50                   	push   eax
c0008020:	52                   	push   edx
c0008021:	53                   	push   ebx
c0008022:	89 55 e0             	mov    DWORD PTR [ebp-0x20],edx
c0008025:	e8 48 ff ff ff       	call   c0007f72 <bitmap_scan_test>
c000802a:	83 c4 10             	add    esp,0x10
c000802d:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
c0008030:	85 c0                	test   eax,eax
c0008032:	74 02                	je     c0008036 <bitmap_alloc+0xa1>
c0008034:	31 f6                	xor    esi,esi
c0008036:	3b 75 0c             	cmp    esi,DWORD PTR [ebp+0xc]
c0008039:	75 07                	jne    c0008042 <bitmap_alloc+0xad>
c000803b:	29 f2                	sub    edx,esi
c000803d:	8d 42 01             	lea    eax,[edx+0x1]
c0008040:	eb 09                	jmp    c000804b <bitmap_alloc+0xb6>
c0008042:	4f                   	dec    edi
c0008043:	42                   	inc    edx
c0008044:	85 ff                	test   edi,edi
c0008046:	75 d5                	jne    c000801d <bitmap_alloc+0x88>
c0008048:	83 c8 ff             	or     eax,0xffffffff
c000804b:	8d 65 f4             	lea    esp,[ebp-0xc]
c000804e:	5b                   	pop    ebx
c000804f:	5e                   	pop    esi
c0008050:	5f                   	pop    edi
c0008051:	5d                   	pop    ebp
c0008052:	c3                   	ret    

c0008053 <bitmap_set>:
c0008053:	55                   	push   ebp
c0008054:	89 e5                	mov    ebp,esp
c0008056:	57                   	push   edi
c0008057:	56                   	push   esi
c0008058:	53                   	push   ebx
c0008059:	83 ec 0c             	sub    esp,0xc
c000805c:	8a 5d 10             	mov    bl,BYTE PTR [ebp+0x10]
c000805f:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
c0008062:	8b 7d 0c             	mov    edi,DWORD PTR [ebp+0xc]
c0008065:	80 fb 01             	cmp    bl,0x1
c0008068:	76 19                	jbe    c0008083 <bitmap_set+0x30>
c000806a:	68 29 b4 00 c0       	push   0xc000b429
c000806f:	68 54 b4 00 c0       	push   0xc000b454
c0008074:	6a 65                	push   0x65
c0008076:	68 1c b4 00 c0       	push   0xc000b41c
c000807b:	e8 3c 00 00 00       	call   c00080bc <panic_spin>
c0008080:	83 c4 10             	add    esp,0x10
c0008083:	89 fa                	mov    edx,edi
c0008085:	89 f9                	mov    ecx,edi
c0008087:	c1 ea 03             	shr    edx,0x3
c000808a:	83 e1 07             	and    ecx,0x7
c000808d:	84 db                	test   bl,bl
c000808f:	74 06                	je     c0008097 <bitmap_set+0x44>
c0008091:	fe cb                	dec    bl
c0008093:	75 1e                	jne    c00080b3 <bitmap_set+0x60>
c0008095:	eb 10                	jmp    c00080a7 <bitmap_set+0x54>
c0008097:	03 56 04             	add    edx,DWORD PTR [esi+0x4]
c000809a:	b8 01 00 00 00       	mov    eax,0x1
c000809f:	d3 e0                	shl    eax,cl
c00080a1:	f7 d0                	not    eax
c00080a3:	20 02                	and    BYTE PTR [edx],al
c00080a5:	eb 0c                	jmp    c00080b3 <bitmap_set+0x60>
c00080a7:	03 56 04             	add    edx,DWORD PTR [esi+0x4]
c00080aa:	b8 01 00 00 00       	mov    eax,0x1
c00080af:	d3 e0                	shl    eax,cl
c00080b1:	08 02                	or     BYTE PTR [edx],al
c00080b3:	8d 65 f4             	lea    esp,[ebp-0xc]
c00080b6:	5b                   	pop    ebx
c00080b7:	5e                   	pop    esi
c00080b8:	5f                   	pop    edi
c00080b9:	5d                   	pop    ebp
c00080ba:	c3                   	ret    
	...

c00080bc <panic_spin>:
c00080bc:	55                   	push   ebp
c00080bd:	89 e5                	mov    ebp,esp
c00080bf:	83 ec 08             	sub    esp,0x8
c00080c2:	e8 09 0d 00 00       	call   c0008dd0 <intr_disable>
c00080c7:	83 ec 0c             	sub    esp,0xc
c00080ca:	68 5f b4 00 c0       	push   0xc000b45f
c00080cf:	e8 36 13 00 00       	call   c000940a <put_str>
c00080d4:	c7 04 24 66 b4 00 c0 	mov    DWORD PTR [esp],0xc000b466
c00080db:	e8 2a 13 00 00       	call   c000940a <put_str>
c00080e0:	5a                   	pop    edx
c00080e1:	ff 75 08             	push   DWORD PTR [ebp+0x8]
c00080e4:	e8 21 13 00 00       	call   c000940a <put_str>
c00080e9:	c7 04 24 0a 00 00 00 	mov    DWORD PTR [esp],0xa
c00080f0:	e8 7b 12 00 00       	call   c0009370 <put_char>
c00080f5:	c7 04 24 6c b4 00 c0 	mov    DWORD PTR [esp],0xc000b46c
c00080fc:	e8 09 13 00 00       	call   c000940a <put_str>
c0008101:	59                   	pop    ecx
c0008102:	ff 75 10             	push   DWORD PTR [ebp+0x10]
c0008105:	e8 00 13 00 00       	call   c000940a <put_str>
c000810a:	c7 04 24 0a 00 00 00 	mov    DWORD PTR [esp],0xa
c0008111:	e8 5a 12 00 00       	call   c0009370 <put_char>
c0008116:	c7 04 24 7a b4 00 c0 	mov    DWORD PTR [esp],0xc000b47a
c000811d:	e8 e8 12 00 00       	call   c000940a <put_str>
c0008122:	58                   	pop    eax
c0008123:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
c0008126:	e8 04 13 00 00       	call   c000942f <put_int>
c000812b:	c7 04 24 0a 00 00 00 	mov    DWORD PTR [esp],0xa
c0008132:	e8 39 12 00 00       	call   c0009370 <put_char>
c0008137:	c7 04 24 80 b4 00 c0 	mov    DWORD PTR [esp],0xc000b480
c000813e:	e8 c7 12 00 00       	call   c000940a <put_str>
c0008143:	58                   	pop    eax
c0008144:	ff 75 14             	push   DWORD PTR [ebp+0x14]
c0008147:	e8 be 12 00 00       	call   c000940a <put_str>
c000814c:	c7 04 24 0a 00 00 00 	mov    DWORD PTR [esp],0xa
c0008153:	e8 18 12 00 00       	call   c0009370 <put_char>
c0008158:	83 c4 10             	add    esp,0x10
c000815b:	eb fe                	jmp    c000815b <panic_spin+0x9f>
c000815d:	00 00                	add    BYTE PTR [eax],al
	...

c0008160 <RectangleFill>:
c0008160:	55                   	push   ebp
c0008161:	89 e5                	mov    ebp,esp
c0008163:	57                   	push   edi
c0008164:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
c0008167:	56                   	push   esi
c0008168:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
c000816b:	53                   	push   ebx
c000816c:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c000816f:	83 3d 0c 7c 00 00 01 	cmp    DWORD PTR ds:0x7c0c,0x1
c0008176:	75 30                	jne    c00081a8 <RectangleFill+0x48>
c0008178:	89 ca                	mov    edx,ecx
c000817a:	81 e2 00 00 00 ff    	and    edx,0xff000000
c0008180:	81 fa 00 00 00 ff    	cmp    edx,0xff000000
c0008186:	75 16                	jne    c000819e <RectangleFill+0x3e>
c0008188:	eb 1e                	jmp    c00081a8 <RectangleFill+0x48>
c000818a:	8b 7b 04             	mov    edi,DWORD PTR [ebx+0x4]
c000818d:	8b 33                	mov    esi,DWORD PTR [ebx]
c000818f:	0f af f8             	imul   edi,eax
c0008192:	01 d7                	add    edi,edx
c0008194:	42                   	inc    edx
c0008195:	89 0c be             	mov    DWORD PTR [esi+edi*4],ecx
c0008198:	3b 55 18             	cmp    edx,DWORD PTR [ebp+0x18]
c000819b:	7c ed                	jl     c000818a <RectangleFill+0x2a>
c000819d:	40                   	inc    eax
c000819e:	3b 45 1c             	cmp    eax,DWORD PTR [ebp+0x1c]
c00081a1:	7d 05                	jge    c00081a8 <RectangleFill+0x48>
c00081a3:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
c00081a6:	eb f0                	jmp    c0008198 <RectangleFill+0x38>
c00081a8:	5b                   	pop    ebx
c00081a9:	5e                   	pop    esi
c00081aa:	5f                   	pop    edi
c00081ab:	5d                   	pop    ebp
c00081ac:	c3                   	ret    

c00081ad <init_Rectangle>:
c00081ad:	55                   	push   ebp
c00081ae:	89 e5                	mov    ebp,esp
c00081b0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c00081b3:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
c00081b6:	89 10                	mov    DWORD PTR [eax],edx
c00081b8:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
c00081bb:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
c00081be:	8b 55 14             	mov    edx,DWORD PTR [ebp+0x14]
c00081c1:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
c00081c4:	8b 55 18             	mov    edx,DWORD PTR [ebp+0x18]
c00081c7:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
c00081ca:	8b 55 1c             	mov    edx,DWORD PTR [ebp+0x1c]
c00081cd:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
c00081d0:	5d                   	pop    ebp
c00081d1:	c3                   	ret    

c00081d2 <init_screen>:
c00081d2:	55                   	push   ebp
c00081d3:	89 e5                	mov    ebp,esp
c00081d5:	53                   	push   ebx
c00081d6:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c00081d9:	a1 1c 7c 00 00       	mov    eax,ds:0x7c1c
c00081de:	8b 15 18 7c 00 00    	mov    edx,DWORD PTR ds:0x7c18
c00081e4:	c7 43 0c 00 00 00 00 	mov    DWORD PTR [ebx+0xc],0x0
c00081eb:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
c00081ee:	89 53 04             	mov    DWORD PTR [ebx+0x4],edx
c00081f1:	c7 43 10 00 00 00 00 	mov    DWORD PTR [ebx+0x10],0x0
c00081f8:	a1 1c 7c 00 00       	mov    eax,ds:0x7c1c
c00081fd:	c7 03 00 00 00 fe    	mov    DWORD PTR [ebx],0xfe000000
c0008203:	83 e8 32             	sub    eax,0x32
c0008206:	50                   	push   eax
c0008207:	ff 35 18 7c 00 00    	push   DWORD PTR ds:0x7c18
c000820d:	6a 00                	push   0x0
c000820f:	6a 00                	push   0x0
c0008211:	68 84 84 00 00       	push   0x8484
c0008216:	53                   	push   ebx
c0008217:	e8 44 ff ff ff       	call   c0008160 <RectangleFill>
c000821c:	a1 1c 7c 00 00       	mov    eax,ds:0x7c1c
c0008221:	50                   	push   eax
c0008222:	83 e8 32             	sub    eax,0x32
c0008225:	ff 35 18 7c 00 00    	push   DWORD PTR ds:0x7c18
c000822b:	50                   	push   eax
c000822c:	6a 00                	push   0x0
c000822e:	68 c6 c6 c6 00       	push   0xc6c6c6
c0008233:	53                   	push   ebx
c0008234:	e8 27 ff ff ff       	call   c0008160 <RectangleFill>
c0008239:	a1 1c 7c 00 00       	mov    eax,ds:0x7c1c
c000823e:	83 c4 30             	add    esp,0x30
c0008241:	8d 50 f9             	lea    edx,[eax-0x7]
c0008244:	83 e8 25             	sub    eax,0x25
c0008247:	52                   	push   edx
c0008248:	6a 2b                	push   0x2b
c000824a:	50                   	push   eax
c000824b:	6a 0d                	push   0xd
c000824d:	68 84 84 84 00       	push   0x848484
c0008252:	53                   	push   ebx
c0008253:	e8 08 ff ff ff       	call   c0008160 <RectangleFill>
c0008258:	a1 1c 7c 00 00       	mov    eax,ds:0x7c1c
c000825d:	8d 50 f6             	lea    edx,[eax-0xa]
c0008260:	83 e8 28             	sub    eax,0x28
c0008263:	52                   	push   edx
c0008264:	6a 28                	push   0x28
c0008266:	50                   	push   eax
c0008267:	6a 0a                	push   0xa
c0008269:	68 ff ff ff 00       	push   0xffffff
c000826e:	53                   	push   ebx
c000826f:	e8 ec fe ff ff       	call   c0008160 <RectangleFill>
c0008274:	a1 1c 7c 00 00       	mov    eax,ds:0x7c1c
c0008279:	83 c4 30             	add    esp,0x30
c000827c:	8d 50 f9             	lea    edx,[eax-0x7]
c000827f:	83 e8 25             	sub    eax,0x25
c0008282:	52                   	push   edx
c0008283:	6a 3a                	push   0x3a
c0008285:	50                   	push   eax
c0008286:	6a 35                	push   0x35
c0008288:	68 84 84 84 00       	push   0x848484
c000828d:	53                   	push   ebx
c000828e:	e8 cd fe ff ff       	call   c0008160 <RectangleFill>
c0008293:	a1 1c 7c 00 00       	mov    eax,ds:0x7c1c
c0008298:	8d 50 f6             	lea    edx,[eax-0xa]
c000829b:	83 e8 28             	sub    eax,0x28
c000829e:	52                   	push   edx
c000829f:	6a 37                	push   0x37
c00082a1:	50                   	push   eax
c00082a2:	6a 32                	push   0x32
c00082a4:	68 ff ff ff 00       	push   0xffffff
c00082a9:	53                   	push   ebx
c00082aa:	e8 b1 fe ff ff       	call   c0008160 <RectangleFill>
c00082af:	83 c4 30             	add    esp,0x30
c00082b2:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
c00082b5:	c9                   	leave  
c00082b6:	c3                   	ret    

c00082b7 <logo>:
c00082b7:	55                   	push   ebp
c00082b8:	89 e5                	mov    ebp,esp
c00082ba:	83 ec 20             	sub    esp,0x20
c00082bd:	a1 1c 7c 00 00       	mov    eax,ds:0x7c1c
c00082c2:	8b 15 18 7c 00 00    	mov    edx,DWORD PTR ds:0x7c18
c00082c8:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
c00082cf:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
c00082d6:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
c00082d9:	89 55 e8             	mov    DWORD PTR [ebp-0x18],edx
c00082dc:	8b 15 1c 7c 00 00    	mov    edx,DWORD PTR ds:0x7c1c
c00082e2:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c00082e7:	c7 45 e4 00 00 00 fe 	mov    DWORD PTR [ebp-0x1c],0xfe000000
c00082ee:	d1 ea                	shr    edx,1
c00082f0:	8d 8a 82 00 00 00    	lea    ecx,[edx+0x82]
c00082f6:	81 ea 82 00 00 00    	sub    edx,0x82
c00082fc:	d1 e8                	shr    eax,1
c00082fe:	51                   	push   ecx
c00082ff:	8d 88 82 00 00 00    	lea    ecx,[eax+0x82]
c0008305:	2d 82 00 00 00       	sub    eax,0x82
c000830a:	51                   	push   ecx
c000830b:	52                   	push   edx
c000830c:	50                   	push   eax
c000830d:	68 ff ff ff 00       	push   0xffffff
c0008312:	8d 45 e4             	lea    eax,[ebp-0x1c]
c0008315:	50                   	push   eax
c0008316:	e8 45 fe ff ff       	call   c0008160 <RectangleFill>
c000831b:	83 c4 18             	add    esp,0x18
c000831e:	c9                   	leave  
c000831f:	c3                   	ret    

c0008320 <init_all>:
c0008320:	55                   	push   ebp
c0008321:	89 e5                	mov    ebp,esp
c0008323:	83 ec 08             	sub    esp,0x8
c0008326:	e8 49 0a 00 00       	call   c0008d74 <init_idt>
c000832b:	e8 04 12 00 00       	call   c0009534 <init_pit>
c0008330:	c9                   	leave  
c0008331:	e9 9c fe ff ff       	jmp    c00081d2 <init_screen>
	...

c0008340 <load_idt>:
c0008340:	55                   	push   ebp
c0008341:	89 e5                	mov    ebp,esp
c0008343:	0f 01 5d 0e          	lidtd  [ebp+0xe]
c0008347:	5d                   	pop    ebp
c0008348:	c3                   	ret    

c0008349 <intr0x00_entry>:
c0008349:	68 00 00 00 00       	push   0x0
c000834e:	1e                   	push   ds
c000834f:	06                   	push   es
c0008350:	0f a0                	push   fs
c0008352:	0f a8                	push   gs
c0008354:	60                   	pusha  
c0008355:	68 00 00 00 00       	push   0x0
c000835a:	ff 15 8c b9 00 c0    	call   DWORD PTR ds:0xc000b98c
c0008360:	81 c4 04 00 00 00    	add    esp,0x4
c0008366:	61                   	popa   
c0008367:	0f a9                	pop    gs
c0008369:	0f a1                	pop    fs
c000836b:	07                   	pop    es
c000836c:	1f                   	pop    ds
c000836d:	81 c4 04 00 00 00    	add    esp,0x4
c0008373:	cf                   	iret   

c0008374 <intr0x01_entry>:
c0008374:	68 00 00 00 00       	push   0x0
c0008379:	1e                   	push   ds
c000837a:	06                   	push   es
c000837b:	0f a0                	push   fs
c000837d:	0f a8                	push   gs
c000837f:	60                   	pusha  
c0008380:	68 01 00 00 00       	push   0x1
c0008385:	ff 15 90 b9 00 c0    	call   DWORD PTR ds:0xc000b990
c000838b:	81 c4 04 00 00 00    	add    esp,0x4
c0008391:	61                   	popa   
c0008392:	0f a9                	pop    gs
c0008394:	0f a1                	pop    fs
c0008396:	07                   	pop    es
c0008397:	1f                   	pop    ds
c0008398:	81 c4 04 00 00 00    	add    esp,0x4
c000839e:	cf                   	iret   

c000839f <intr0x02_entry>:
c000839f:	68 00 00 00 00       	push   0x0
c00083a4:	1e                   	push   ds
c00083a5:	06                   	push   es
c00083a6:	0f a0                	push   fs
c00083a8:	0f a8                	push   gs
c00083aa:	60                   	pusha  
c00083ab:	68 02 00 00 00       	push   0x2
c00083b0:	ff 15 94 b9 00 c0    	call   DWORD PTR ds:0xc000b994
c00083b6:	81 c4 04 00 00 00    	add    esp,0x4
c00083bc:	61                   	popa   
c00083bd:	0f a9                	pop    gs
c00083bf:	0f a1                	pop    fs
c00083c1:	07                   	pop    es
c00083c2:	1f                   	pop    ds
c00083c3:	81 c4 04 00 00 00    	add    esp,0x4
c00083c9:	cf                   	iret   

c00083ca <intr0x03_entry>:
c00083ca:	68 00 00 00 00       	push   0x0
c00083cf:	1e                   	push   ds
c00083d0:	06                   	push   es
c00083d1:	0f a0                	push   fs
c00083d3:	0f a8                	push   gs
c00083d5:	60                   	pusha  
c00083d6:	68 03 00 00 00       	push   0x3
c00083db:	ff 15 98 b9 00 c0    	call   DWORD PTR ds:0xc000b998
c00083e1:	81 c4 04 00 00 00    	add    esp,0x4
c00083e7:	61                   	popa   
c00083e8:	0f a9                	pop    gs
c00083ea:	0f a1                	pop    fs
c00083ec:	07                   	pop    es
c00083ed:	1f                   	pop    ds
c00083ee:	81 c4 04 00 00 00    	add    esp,0x4
c00083f4:	cf                   	iret   

c00083f5 <intr0x04_entry>:
c00083f5:	68 00 00 00 00       	push   0x0
c00083fa:	1e                   	push   ds
c00083fb:	06                   	push   es
c00083fc:	0f a0                	push   fs
c00083fe:	0f a8                	push   gs
c0008400:	60                   	pusha  
c0008401:	68 04 00 00 00       	push   0x4
c0008406:	ff 15 9c b9 00 c0    	call   DWORD PTR ds:0xc000b99c
c000840c:	81 c4 04 00 00 00    	add    esp,0x4
c0008412:	61                   	popa   
c0008413:	0f a9                	pop    gs
c0008415:	0f a1                	pop    fs
c0008417:	07                   	pop    es
c0008418:	1f                   	pop    ds
c0008419:	81 c4 04 00 00 00    	add    esp,0x4
c000841f:	cf                   	iret   

c0008420 <intr0x05_entry>:
c0008420:	68 00 00 00 00       	push   0x0
c0008425:	1e                   	push   ds
c0008426:	06                   	push   es
c0008427:	0f a0                	push   fs
c0008429:	0f a8                	push   gs
c000842b:	60                   	pusha  
c000842c:	68 05 00 00 00       	push   0x5
c0008431:	ff 15 a0 b9 00 c0    	call   DWORD PTR ds:0xc000b9a0
c0008437:	81 c4 04 00 00 00    	add    esp,0x4
c000843d:	61                   	popa   
c000843e:	0f a9                	pop    gs
c0008440:	0f a1                	pop    fs
c0008442:	07                   	pop    es
c0008443:	1f                   	pop    ds
c0008444:	81 c4 04 00 00 00    	add    esp,0x4
c000844a:	cf                   	iret   

c000844b <intr0x06_entry>:
c000844b:	68 00 00 00 00       	push   0x0
c0008450:	1e                   	push   ds
c0008451:	06                   	push   es
c0008452:	0f a0                	push   fs
c0008454:	0f a8                	push   gs
c0008456:	60                   	pusha  
c0008457:	68 06 00 00 00       	push   0x6
c000845c:	ff 15 a4 b9 00 c0    	call   DWORD PTR ds:0xc000b9a4
c0008462:	81 c4 04 00 00 00    	add    esp,0x4
c0008468:	61                   	popa   
c0008469:	0f a9                	pop    gs
c000846b:	0f a1                	pop    fs
c000846d:	07                   	pop    es
c000846e:	1f                   	pop    ds
c000846f:	81 c4 04 00 00 00    	add    esp,0x4
c0008475:	cf                   	iret   

c0008476 <intr0x07_entry>:
c0008476:	68 00 00 00 00       	push   0x0
c000847b:	1e                   	push   ds
c000847c:	06                   	push   es
c000847d:	0f a0                	push   fs
c000847f:	0f a8                	push   gs
c0008481:	60                   	pusha  
c0008482:	68 07 00 00 00       	push   0x7
c0008487:	ff 15 a8 b9 00 c0    	call   DWORD PTR ds:0xc000b9a8
c000848d:	81 c4 04 00 00 00    	add    esp,0x4
c0008493:	61                   	popa   
c0008494:	0f a9                	pop    gs
c0008496:	0f a1                	pop    fs
c0008498:	07                   	pop    es
c0008499:	1f                   	pop    ds
c000849a:	81 c4 04 00 00 00    	add    esp,0x4
c00084a0:	cf                   	iret   

c00084a1 <intr0x08_entry>:
c00084a1:	90                   	nop
c00084a2:	1e                   	push   ds
c00084a3:	06                   	push   es
c00084a4:	0f a0                	push   fs
c00084a6:	0f a8                	push   gs
c00084a8:	60                   	pusha  
c00084a9:	68 08 00 00 00       	push   0x8
c00084ae:	ff 15 ac b9 00 c0    	call   DWORD PTR ds:0xc000b9ac
c00084b4:	81 c4 04 00 00 00    	add    esp,0x4
c00084ba:	61                   	popa   
c00084bb:	0f a9                	pop    gs
c00084bd:	0f a1                	pop    fs
c00084bf:	07                   	pop    es
c00084c0:	1f                   	pop    ds
c00084c1:	81 c4 04 00 00 00    	add    esp,0x4
c00084c7:	cf                   	iret   

c00084c8 <intr0x09_entry>:
c00084c8:	68 00 00 00 00       	push   0x0
c00084cd:	1e                   	push   ds
c00084ce:	06                   	push   es
c00084cf:	0f a0                	push   fs
c00084d1:	0f a8                	push   gs
c00084d3:	60                   	pusha  
c00084d4:	68 09 00 00 00       	push   0x9
c00084d9:	ff 15 b0 b9 00 c0    	call   DWORD PTR ds:0xc000b9b0
c00084df:	81 c4 04 00 00 00    	add    esp,0x4
c00084e5:	61                   	popa   
c00084e6:	0f a9                	pop    gs
c00084e8:	0f a1                	pop    fs
c00084ea:	07                   	pop    es
c00084eb:	1f                   	pop    ds
c00084ec:	81 c4 04 00 00 00    	add    esp,0x4
c00084f2:	cf                   	iret   

c00084f3 <intr0x0a_entry>:
c00084f3:	90                   	nop
c00084f4:	1e                   	push   ds
c00084f5:	06                   	push   es
c00084f6:	0f a0                	push   fs
c00084f8:	0f a8                	push   gs
c00084fa:	60                   	pusha  
c00084fb:	68 0a 00 00 00       	push   0xa
c0008500:	ff 15 b4 b9 00 c0    	call   DWORD PTR ds:0xc000b9b4
c0008506:	81 c4 04 00 00 00    	add    esp,0x4
c000850c:	61                   	popa   
c000850d:	0f a9                	pop    gs
c000850f:	0f a1                	pop    fs
c0008511:	07                   	pop    es
c0008512:	1f                   	pop    ds
c0008513:	81 c4 04 00 00 00    	add    esp,0x4
c0008519:	cf                   	iret   

c000851a <intr0x0b_entry>:
c000851a:	90                   	nop
c000851b:	1e                   	push   ds
c000851c:	06                   	push   es
c000851d:	0f a0                	push   fs
c000851f:	0f a8                	push   gs
c0008521:	60                   	pusha  
c0008522:	68 0b 00 00 00       	push   0xb
c0008527:	ff 15 b8 b9 00 c0    	call   DWORD PTR ds:0xc000b9b8
c000852d:	81 c4 04 00 00 00    	add    esp,0x4
c0008533:	61                   	popa   
c0008534:	0f a9                	pop    gs
c0008536:	0f a1                	pop    fs
c0008538:	07                   	pop    es
c0008539:	1f                   	pop    ds
c000853a:	81 c4 04 00 00 00    	add    esp,0x4
c0008540:	cf                   	iret   

c0008541 <intr0x0c_entry>:
c0008541:	68 00 00 00 00       	push   0x0
c0008546:	1e                   	push   ds
c0008547:	06                   	push   es
c0008548:	0f a0                	push   fs
c000854a:	0f a8                	push   gs
c000854c:	60                   	pusha  
c000854d:	68 0c 00 00 00       	push   0xc
c0008552:	ff 15 bc b9 00 c0    	call   DWORD PTR ds:0xc000b9bc
c0008558:	81 c4 04 00 00 00    	add    esp,0x4
c000855e:	61                   	popa   
c000855f:	0f a9                	pop    gs
c0008561:	0f a1                	pop    fs
c0008563:	07                   	pop    es
c0008564:	1f                   	pop    ds
c0008565:	81 c4 04 00 00 00    	add    esp,0x4
c000856b:	cf                   	iret   

c000856c <intr0x0d_entry>:
c000856c:	90                   	nop
c000856d:	1e                   	push   ds
c000856e:	06                   	push   es
c000856f:	0f a0                	push   fs
c0008571:	0f a8                	push   gs
c0008573:	60                   	pusha  
c0008574:	68 0d 00 00 00       	push   0xd
c0008579:	ff 15 c0 b9 00 c0    	call   DWORD PTR ds:0xc000b9c0
c000857f:	81 c4 04 00 00 00    	add    esp,0x4
c0008585:	61                   	popa   
c0008586:	0f a9                	pop    gs
c0008588:	0f a1                	pop    fs
c000858a:	07                   	pop    es
c000858b:	1f                   	pop    ds
c000858c:	81 c4 04 00 00 00    	add    esp,0x4
c0008592:	cf                   	iret   

c0008593 <intr0x0e_entry>:
c0008593:	90                   	nop
c0008594:	1e                   	push   ds
c0008595:	06                   	push   es
c0008596:	0f a0                	push   fs
c0008598:	0f a8                	push   gs
c000859a:	60                   	pusha  
c000859b:	68 0e 00 00 00       	push   0xe
c00085a0:	ff 15 c4 b9 00 c0    	call   DWORD PTR ds:0xc000b9c4
c00085a6:	81 c4 04 00 00 00    	add    esp,0x4
c00085ac:	61                   	popa   
c00085ad:	0f a9                	pop    gs
c00085af:	0f a1                	pop    fs
c00085b1:	07                   	pop    es
c00085b2:	1f                   	pop    ds
c00085b3:	81 c4 04 00 00 00    	add    esp,0x4
c00085b9:	cf                   	iret   

c00085ba <intr0x0f_entry>:
c00085ba:	68 00 00 00 00       	push   0x0
c00085bf:	1e                   	push   ds
c00085c0:	06                   	push   es
c00085c1:	0f a0                	push   fs
c00085c3:	0f a8                	push   gs
c00085c5:	60                   	pusha  
c00085c6:	68 0f 00 00 00       	push   0xf
c00085cb:	ff 15 c8 b9 00 c0    	call   DWORD PTR ds:0xc000b9c8
c00085d1:	81 c4 04 00 00 00    	add    esp,0x4
c00085d7:	61                   	popa   
c00085d8:	0f a9                	pop    gs
c00085da:	0f a1                	pop    fs
c00085dc:	07                   	pop    es
c00085dd:	1f                   	pop    ds
c00085de:	81 c4 04 00 00 00    	add    esp,0x4
c00085e4:	cf                   	iret   

c00085e5 <intr0x10_entry>:
c00085e5:	68 00 00 00 00       	push   0x0
c00085ea:	1e                   	push   ds
c00085eb:	06                   	push   es
c00085ec:	0f a0                	push   fs
c00085ee:	0f a8                	push   gs
c00085f0:	60                   	pusha  
c00085f1:	68 10 00 00 00       	push   0x10
c00085f6:	ff 15 cc b9 00 c0    	call   DWORD PTR ds:0xc000b9cc
c00085fc:	81 c4 04 00 00 00    	add    esp,0x4
c0008602:	61                   	popa   
c0008603:	0f a9                	pop    gs
c0008605:	0f a1                	pop    fs
c0008607:	07                   	pop    es
c0008608:	1f                   	pop    ds
c0008609:	81 c4 04 00 00 00    	add    esp,0x4
c000860f:	cf                   	iret   

c0008610 <intr0x11_entry>:
c0008610:	90                   	nop
c0008611:	1e                   	push   ds
c0008612:	06                   	push   es
c0008613:	0f a0                	push   fs
c0008615:	0f a8                	push   gs
c0008617:	60                   	pusha  
c0008618:	68 11 00 00 00       	push   0x11
c000861d:	ff 15 d0 b9 00 c0    	call   DWORD PTR ds:0xc000b9d0
c0008623:	81 c4 04 00 00 00    	add    esp,0x4
c0008629:	61                   	popa   
c000862a:	0f a9                	pop    gs
c000862c:	0f a1                	pop    fs
c000862e:	07                   	pop    es
c000862f:	1f                   	pop    ds
c0008630:	81 c4 04 00 00 00    	add    esp,0x4
c0008636:	cf                   	iret   

c0008637 <intr0x12_entry>:
c0008637:	68 00 00 00 00       	push   0x0
c000863c:	1e                   	push   ds
c000863d:	06                   	push   es
c000863e:	0f a0                	push   fs
c0008640:	0f a8                	push   gs
c0008642:	60                   	pusha  
c0008643:	68 12 00 00 00       	push   0x12
c0008648:	ff 15 d4 b9 00 c0    	call   DWORD PTR ds:0xc000b9d4
c000864e:	81 c4 04 00 00 00    	add    esp,0x4
c0008654:	61                   	popa   
c0008655:	0f a9                	pop    gs
c0008657:	0f a1                	pop    fs
c0008659:	07                   	pop    es
c000865a:	1f                   	pop    ds
c000865b:	81 c4 04 00 00 00    	add    esp,0x4
c0008661:	cf                   	iret   

c0008662 <intr0x13_entry>:
c0008662:	68 00 00 00 00       	push   0x0
c0008667:	1e                   	push   ds
c0008668:	06                   	push   es
c0008669:	0f a0                	push   fs
c000866b:	0f a8                	push   gs
c000866d:	60                   	pusha  
c000866e:	68 13 00 00 00       	push   0x13
c0008673:	ff 15 d8 b9 00 c0    	call   DWORD PTR ds:0xc000b9d8
c0008679:	81 c4 04 00 00 00    	add    esp,0x4
c000867f:	61                   	popa   
c0008680:	0f a9                	pop    gs
c0008682:	0f a1                	pop    fs
c0008684:	07                   	pop    es
c0008685:	1f                   	pop    ds
c0008686:	81 c4 04 00 00 00    	add    esp,0x4
c000868c:	cf                   	iret   

c000868d <intr0x14_entry>:
c000868d:	68 00 00 00 00       	push   0x0
c0008692:	1e                   	push   ds
c0008693:	06                   	push   es
c0008694:	0f a0                	push   fs
c0008696:	0f a8                	push   gs
c0008698:	60                   	pusha  
c0008699:	68 14 00 00 00       	push   0x14
c000869e:	ff 15 dc b9 00 c0    	call   DWORD PTR ds:0xc000b9dc
c00086a4:	81 c4 04 00 00 00    	add    esp,0x4
c00086aa:	61                   	popa   
c00086ab:	0f a9                	pop    gs
c00086ad:	0f a1                	pop    fs
c00086af:	07                   	pop    es
c00086b0:	1f                   	pop    ds
c00086b1:	81 c4 04 00 00 00    	add    esp,0x4
c00086b7:	cf                   	iret   

c00086b8 <intr0x15_entry>:
c00086b8:	68 00 00 00 00       	push   0x0
c00086bd:	1e                   	push   ds
c00086be:	06                   	push   es
c00086bf:	0f a0                	push   fs
c00086c1:	0f a8                	push   gs
c00086c3:	60                   	pusha  
c00086c4:	68 15 00 00 00       	push   0x15
c00086c9:	ff 15 e0 b9 00 c0    	call   DWORD PTR ds:0xc000b9e0
c00086cf:	81 c4 04 00 00 00    	add    esp,0x4
c00086d5:	61                   	popa   
c00086d6:	0f a9                	pop    gs
c00086d8:	0f a1                	pop    fs
c00086da:	07                   	pop    es
c00086db:	1f                   	pop    ds
c00086dc:	81 c4 04 00 00 00    	add    esp,0x4
c00086e2:	cf                   	iret   

c00086e3 <intr0x16_entry>:
c00086e3:	68 00 00 00 00       	push   0x0
c00086e8:	1e                   	push   ds
c00086e9:	06                   	push   es
c00086ea:	0f a0                	push   fs
c00086ec:	0f a8                	push   gs
c00086ee:	60                   	pusha  
c00086ef:	68 16 00 00 00       	push   0x16
c00086f4:	ff 15 e4 b9 00 c0    	call   DWORD PTR ds:0xc000b9e4
c00086fa:	81 c4 04 00 00 00    	add    esp,0x4
c0008700:	61                   	popa   
c0008701:	0f a9                	pop    gs
c0008703:	0f a1                	pop    fs
c0008705:	07                   	pop    es
c0008706:	1f                   	pop    ds
c0008707:	81 c4 04 00 00 00    	add    esp,0x4
c000870d:	cf                   	iret   

c000870e <intr0x17_entry>:
c000870e:	68 00 00 00 00       	push   0x0
c0008713:	1e                   	push   ds
c0008714:	06                   	push   es
c0008715:	0f a0                	push   fs
c0008717:	0f a8                	push   gs
c0008719:	60                   	pusha  
c000871a:	68 17 00 00 00       	push   0x17
c000871f:	ff 15 e8 b9 00 c0    	call   DWORD PTR ds:0xc000b9e8
c0008725:	81 c4 04 00 00 00    	add    esp,0x4
c000872b:	61                   	popa   
c000872c:	0f a9                	pop    gs
c000872e:	0f a1                	pop    fs
c0008730:	07                   	pop    es
c0008731:	1f                   	pop    ds
c0008732:	81 c4 04 00 00 00    	add    esp,0x4
c0008738:	cf                   	iret   

c0008739 <intr0x18_entry>:
c0008739:	90                   	nop
c000873a:	1e                   	push   ds
c000873b:	06                   	push   es
c000873c:	0f a0                	push   fs
c000873e:	0f a8                	push   gs
c0008740:	60                   	pusha  
c0008741:	68 18 00 00 00       	push   0x18
c0008746:	ff 15 ec b9 00 c0    	call   DWORD PTR ds:0xc000b9ec
c000874c:	81 c4 04 00 00 00    	add    esp,0x4
c0008752:	61                   	popa   
c0008753:	0f a9                	pop    gs
c0008755:	0f a1                	pop    fs
c0008757:	07                   	pop    es
c0008758:	1f                   	pop    ds
c0008759:	81 c4 04 00 00 00    	add    esp,0x4
c000875f:	cf                   	iret   

c0008760 <intr0x19_entry>:
c0008760:	68 00 00 00 00       	push   0x0
c0008765:	1e                   	push   ds
c0008766:	06                   	push   es
c0008767:	0f a0                	push   fs
c0008769:	0f a8                	push   gs
c000876b:	60                   	pusha  
c000876c:	68 19 00 00 00       	push   0x19
c0008771:	ff 15 f0 b9 00 c0    	call   DWORD PTR ds:0xc000b9f0
c0008777:	81 c4 04 00 00 00    	add    esp,0x4
c000877d:	61                   	popa   
c000877e:	0f a9                	pop    gs
c0008780:	0f a1                	pop    fs
c0008782:	07                   	pop    es
c0008783:	1f                   	pop    ds
c0008784:	81 c4 04 00 00 00    	add    esp,0x4
c000878a:	cf                   	iret   

c000878b <intr0x1a_entry>:
c000878b:	90                   	nop
c000878c:	1e                   	push   ds
c000878d:	06                   	push   es
c000878e:	0f a0                	push   fs
c0008790:	0f a8                	push   gs
c0008792:	60                   	pusha  
c0008793:	68 1a 00 00 00       	push   0x1a
c0008798:	ff 15 f4 b9 00 c0    	call   DWORD PTR ds:0xc000b9f4
c000879e:	81 c4 04 00 00 00    	add    esp,0x4
c00087a4:	61                   	popa   
c00087a5:	0f a9                	pop    gs
c00087a7:	0f a1                	pop    fs
c00087a9:	07                   	pop    es
c00087aa:	1f                   	pop    ds
c00087ab:	81 c4 04 00 00 00    	add    esp,0x4
c00087b1:	cf                   	iret   

c00087b2 <intr0x1b_entry>:
c00087b2:	90                   	nop
c00087b3:	1e                   	push   ds
c00087b4:	06                   	push   es
c00087b5:	0f a0                	push   fs
c00087b7:	0f a8                	push   gs
c00087b9:	60                   	pusha  
c00087ba:	68 1b 00 00 00       	push   0x1b
c00087bf:	ff 15 f8 b9 00 c0    	call   DWORD PTR ds:0xc000b9f8
c00087c5:	81 c4 04 00 00 00    	add    esp,0x4
c00087cb:	61                   	popa   
c00087cc:	0f a9                	pop    gs
c00087ce:	0f a1                	pop    fs
c00087d0:	07                   	pop    es
c00087d1:	1f                   	pop    ds
c00087d2:	81 c4 04 00 00 00    	add    esp,0x4
c00087d8:	cf                   	iret   

c00087d9 <intr0x1c_entry>:
c00087d9:	68 00 00 00 00       	push   0x0
c00087de:	1e                   	push   ds
c00087df:	06                   	push   es
c00087e0:	0f a0                	push   fs
c00087e2:	0f a8                	push   gs
c00087e4:	60                   	pusha  
c00087e5:	68 1c 00 00 00       	push   0x1c
c00087ea:	ff 15 fc b9 00 c0    	call   DWORD PTR ds:0xc000b9fc
c00087f0:	81 c4 04 00 00 00    	add    esp,0x4
c00087f6:	61                   	popa   
c00087f7:	0f a9                	pop    gs
c00087f9:	0f a1                	pop    fs
c00087fb:	07                   	pop    es
c00087fc:	1f                   	pop    ds
c00087fd:	81 c4 04 00 00 00    	add    esp,0x4
c0008803:	cf                   	iret   

c0008804 <intr0x1d_entry>:
c0008804:	90                   	nop
c0008805:	1e                   	push   ds
c0008806:	06                   	push   es
c0008807:	0f a0                	push   fs
c0008809:	0f a8                	push   gs
c000880b:	60                   	pusha  
c000880c:	68 1d 00 00 00       	push   0x1d
c0008811:	ff 15 00 ba 00 c0    	call   DWORD PTR ds:0xc000ba00
c0008817:	81 c4 04 00 00 00    	add    esp,0x4
c000881d:	61                   	popa   
c000881e:	0f a9                	pop    gs
c0008820:	0f a1                	pop    fs
c0008822:	07                   	pop    es
c0008823:	1f                   	pop    ds
c0008824:	81 c4 04 00 00 00    	add    esp,0x4
c000882a:	cf                   	iret   

c000882b <intr0x1e_entry>:
c000882b:	90                   	nop
c000882c:	1e                   	push   ds
c000882d:	06                   	push   es
c000882e:	0f a0                	push   fs
c0008830:	0f a8                	push   gs
c0008832:	60                   	pusha  
c0008833:	68 1e 00 00 00       	push   0x1e
c0008838:	ff 15 04 ba 00 c0    	call   DWORD PTR ds:0xc000ba04
c000883e:	81 c4 04 00 00 00    	add    esp,0x4
c0008844:	61                   	popa   
c0008845:	0f a9                	pop    gs
c0008847:	0f a1                	pop    fs
c0008849:	07                   	pop    es
c000884a:	1f                   	pop    ds
c000884b:	81 c4 04 00 00 00    	add    esp,0x4
c0008851:	cf                   	iret   

c0008852 <intr0x1f_entry>:
c0008852:	68 00 00 00 00       	push   0x0
c0008857:	1e                   	push   ds
c0008858:	06                   	push   es
c0008859:	0f a0                	push   fs
c000885b:	0f a8                	push   gs
c000885d:	60                   	pusha  
c000885e:	68 1f 00 00 00       	push   0x1f
c0008863:	ff 15 08 ba 00 c0    	call   DWORD PTR ds:0xc000ba08
c0008869:	81 c4 04 00 00 00    	add    esp,0x4
c000886f:	61                   	popa   
c0008870:	0f a9                	pop    gs
c0008872:	0f a1                	pop    fs
c0008874:	07                   	pop    es
c0008875:	1f                   	pop    ds
c0008876:	81 c4 04 00 00 00    	add    esp,0x4
c000887c:	cf                   	iret   

c000887d <intr0x20_entry>:
c000887d:	68 00 00 00 00       	push   0x0
c0008882:	1e                   	push   ds
c0008883:	06                   	push   es
c0008884:	0f a0                	push   fs
c0008886:	0f a8                	push   gs
c0008888:	60                   	pusha  
c0008889:	68 20 00 00 00       	push   0x20
c000888e:	ff 15 0c ba 00 c0    	call   DWORD PTR ds:0xc000ba0c
c0008894:	81 c4 04 00 00 00    	add    esp,0x4
c000889a:	61                   	popa   
c000889b:	0f a9                	pop    gs
c000889d:	0f a1                	pop    fs
c000889f:	07                   	pop    es
c00088a0:	1f                   	pop    ds
c00088a1:	81 c4 04 00 00 00    	add    esp,0x4
c00088a7:	cf                   	iret   

c00088a8 <intr0x21_entry>:
c00088a8:	68 00 00 00 00       	push   0x0
c00088ad:	1e                   	push   ds
c00088ae:	06                   	push   es
c00088af:	0f a0                	push   fs
c00088b1:	0f a8                	push   gs
c00088b3:	60                   	pusha  
c00088b4:	68 21 00 00 00       	push   0x21
c00088b9:	ff 15 10 ba 00 c0    	call   DWORD PTR ds:0xc000ba10
c00088bf:	81 c4 04 00 00 00    	add    esp,0x4
c00088c5:	61                   	popa   
c00088c6:	0f a9                	pop    gs
c00088c8:	0f a1                	pop    fs
c00088ca:	07                   	pop    es
c00088cb:	1f                   	pop    ds
c00088cc:	81 c4 04 00 00 00    	add    esp,0x4
c00088d2:	cf                   	iret   

c00088d3 <intr0x22_entry>:
c00088d3:	68 00 00 00 00       	push   0x0
c00088d8:	1e                   	push   ds
c00088d9:	06                   	push   es
c00088da:	0f a0                	push   fs
c00088dc:	0f a8                	push   gs
c00088de:	60                   	pusha  
c00088df:	68 22 00 00 00       	push   0x22
c00088e4:	ff 15 14 ba 00 c0    	call   DWORD PTR ds:0xc000ba14
c00088ea:	81 c4 04 00 00 00    	add    esp,0x4
c00088f0:	61                   	popa   
c00088f1:	0f a9                	pop    gs
c00088f3:	0f a1                	pop    fs
c00088f5:	07                   	pop    es
c00088f6:	1f                   	pop    ds
c00088f7:	81 c4 04 00 00 00    	add    esp,0x4
c00088fd:	cf                   	iret   

c00088fe <intr0x23_entry>:
c00088fe:	68 00 00 00 00       	push   0x0
c0008903:	1e                   	push   ds
c0008904:	06                   	push   es
c0008905:	0f a0                	push   fs
c0008907:	0f a8                	push   gs
c0008909:	60                   	pusha  
c000890a:	68 23 00 00 00       	push   0x23
c000890f:	ff 15 18 ba 00 c0    	call   DWORD PTR ds:0xc000ba18
c0008915:	81 c4 04 00 00 00    	add    esp,0x4
c000891b:	61                   	popa   
c000891c:	0f a9                	pop    gs
c000891e:	0f a1                	pop    fs
c0008920:	07                   	pop    es
c0008921:	1f                   	pop    ds
c0008922:	81 c4 04 00 00 00    	add    esp,0x4
c0008928:	cf                   	iret   

c0008929 <intr0x24_entry>:
c0008929:	68 00 00 00 00       	push   0x0
c000892e:	1e                   	push   ds
c000892f:	06                   	push   es
c0008930:	0f a0                	push   fs
c0008932:	0f a8                	push   gs
c0008934:	60                   	pusha  
c0008935:	68 24 00 00 00       	push   0x24
c000893a:	ff 15 1c ba 00 c0    	call   DWORD PTR ds:0xc000ba1c
c0008940:	81 c4 04 00 00 00    	add    esp,0x4
c0008946:	61                   	popa   
c0008947:	0f a9                	pop    gs
c0008949:	0f a1                	pop    fs
c000894b:	07                   	pop    es
c000894c:	1f                   	pop    ds
c000894d:	81 c4 04 00 00 00    	add    esp,0x4
c0008953:	cf                   	iret   

c0008954 <intr0x25_entry>:
c0008954:	68 00 00 00 00       	push   0x0
c0008959:	1e                   	push   ds
c000895a:	06                   	push   es
c000895b:	0f a0                	push   fs
c000895d:	0f a8                	push   gs
c000895f:	60                   	pusha  
c0008960:	68 25 00 00 00       	push   0x25
c0008965:	ff 15 20 ba 00 c0    	call   DWORD PTR ds:0xc000ba20
c000896b:	81 c4 04 00 00 00    	add    esp,0x4
c0008971:	61                   	popa   
c0008972:	0f a9                	pop    gs
c0008974:	0f a1                	pop    fs
c0008976:	07                   	pop    es
c0008977:	1f                   	pop    ds
c0008978:	81 c4 04 00 00 00    	add    esp,0x4
c000897e:	cf                   	iret   

c000897f <intr0x26_entry>:
c000897f:	68 00 00 00 00       	push   0x0
c0008984:	1e                   	push   ds
c0008985:	06                   	push   es
c0008986:	0f a0                	push   fs
c0008988:	0f a8                	push   gs
c000898a:	60                   	pusha  
c000898b:	68 26 00 00 00       	push   0x26
c0008990:	ff 15 24 ba 00 c0    	call   DWORD PTR ds:0xc000ba24
c0008996:	81 c4 04 00 00 00    	add    esp,0x4
c000899c:	61                   	popa   
c000899d:	0f a9                	pop    gs
c000899f:	0f a1                	pop    fs
c00089a1:	07                   	pop    es
c00089a2:	1f                   	pop    ds
c00089a3:	81 c4 04 00 00 00    	add    esp,0x4
c00089a9:	cf                   	iret   

c00089aa <intr0x27_entry>:
c00089aa:	68 00 00 00 00       	push   0x0
c00089af:	1e                   	push   ds
c00089b0:	06                   	push   es
c00089b1:	0f a0                	push   fs
c00089b3:	0f a8                	push   gs
c00089b5:	60                   	pusha  
c00089b6:	68 27 00 00 00       	push   0x27
c00089bb:	ff 15 28 ba 00 c0    	call   DWORD PTR ds:0xc000ba28
c00089c1:	81 c4 04 00 00 00    	add    esp,0x4
c00089c7:	61                   	popa   
c00089c8:	0f a9                	pop    gs
c00089ca:	0f a1                	pop    fs
c00089cc:	07                   	pop    es
c00089cd:	1f                   	pop    ds
c00089ce:	81 c4 04 00 00 00    	add    esp,0x4
c00089d4:	cf                   	iret   

c00089d5 <intr0x28_entry>:
c00089d5:	68 00 00 00 00       	push   0x0
c00089da:	1e                   	push   ds
c00089db:	06                   	push   es
c00089dc:	0f a0                	push   fs
c00089de:	0f a8                	push   gs
c00089e0:	60                   	pusha  
c00089e1:	68 28 00 00 00       	push   0x28
c00089e6:	ff 15 2c ba 00 c0    	call   DWORD PTR ds:0xc000ba2c
c00089ec:	81 c4 04 00 00 00    	add    esp,0x4
c00089f2:	61                   	popa   
c00089f3:	0f a9                	pop    gs
c00089f5:	0f a1                	pop    fs
c00089f7:	07                   	pop    es
c00089f8:	1f                   	pop    ds
c00089f9:	81 c4 04 00 00 00    	add    esp,0x4
c00089ff:	cf                   	iret   

c0008a00 <intr0x29_entry>:
c0008a00:	68 00 00 00 00       	push   0x0
c0008a05:	1e                   	push   ds
c0008a06:	06                   	push   es
c0008a07:	0f a0                	push   fs
c0008a09:	0f a8                	push   gs
c0008a0b:	60                   	pusha  
c0008a0c:	68 29 00 00 00       	push   0x29
c0008a11:	ff 15 30 ba 00 c0    	call   DWORD PTR ds:0xc000ba30
c0008a17:	81 c4 04 00 00 00    	add    esp,0x4
c0008a1d:	61                   	popa   
c0008a1e:	0f a9                	pop    gs
c0008a20:	0f a1                	pop    fs
c0008a22:	07                   	pop    es
c0008a23:	1f                   	pop    ds
c0008a24:	81 c4 04 00 00 00    	add    esp,0x4
c0008a2a:	cf                   	iret   

c0008a2b <intr0x2a_entry>:
c0008a2b:	68 00 00 00 00       	push   0x0
c0008a30:	1e                   	push   ds
c0008a31:	06                   	push   es
c0008a32:	0f a0                	push   fs
c0008a34:	0f a8                	push   gs
c0008a36:	60                   	pusha  
c0008a37:	68 2a 00 00 00       	push   0x2a
c0008a3c:	ff 15 34 ba 00 c0    	call   DWORD PTR ds:0xc000ba34
c0008a42:	81 c4 04 00 00 00    	add    esp,0x4
c0008a48:	61                   	popa   
c0008a49:	0f a9                	pop    gs
c0008a4b:	0f a1                	pop    fs
c0008a4d:	07                   	pop    es
c0008a4e:	1f                   	pop    ds
c0008a4f:	81 c4 04 00 00 00    	add    esp,0x4
c0008a55:	cf                   	iret   

c0008a56 <intr0x2b_entry>:
c0008a56:	68 00 00 00 00       	push   0x0
c0008a5b:	1e                   	push   ds
c0008a5c:	06                   	push   es
c0008a5d:	0f a0                	push   fs
c0008a5f:	0f a8                	push   gs
c0008a61:	60                   	pusha  
c0008a62:	68 2b 00 00 00       	push   0x2b
c0008a67:	ff 15 38 ba 00 c0    	call   DWORD PTR ds:0xc000ba38
c0008a6d:	81 c4 04 00 00 00    	add    esp,0x4
c0008a73:	61                   	popa   
c0008a74:	0f a9                	pop    gs
c0008a76:	0f a1                	pop    fs
c0008a78:	07                   	pop    es
c0008a79:	1f                   	pop    ds
c0008a7a:	81 c4 04 00 00 00    	add    esp,0x4
c0008a80:	cf                   	iret   

c0008a81 <intr0x2c_entry>:
c0008a81:	68 00 00 00 00       	push   0x0
c0008a86:	1e                   	push   ds
c0008a87:	06                   	push   es
c0008a88:	0f a0                	push   fs
c0008a8a:	0f a8                	push   gs
c0008a8c:	60                   	pusha  
c0008a8d:	68 2c 00 00 00       	push   0x2c
c0008a92:	ff 15 3c ba 00 c0    	call   DWORD PTR ds:0xc000ba3c
c0008a98:	81 c4 04 00 00 00    	add    esp,0x4
c0008a9e:	61                   	popa   
c0008a9f:	0f a9                	pop    gs
c0008aa1:	0f a1                	pop    fs
c0008aa3:	07                   	pop    es
c0008aa4:	1f                   	pop    ds
c0008aa5:	81 c4 04 00 00 00    	add    esp,0x4
c0008aab:	cf                   	iret   

c0008aac <intr0x2d_entry>:
c0008aac:	68 00 00 00 00       	push   0x0
c0008ab1:	1e                   	push   ds
c0008ab2:	06                   	push   es
c0008ab3:	0f a0                	push   fs
c0008ab5:	0f a8                	push   gs
c0008ab7:	60                   	pusha  
c0008ab8:	68 2d 00 00 00       	push   0x2d
c0008abd:	ff 15 40 ba 00 c0    	call   DWORD PTR ds:0xc000ba40
c0008ac3:	81 c4 04 00 00 00    	add    esp,0x4
c0008ac9:	61                   	popa   
c0008aca:	0f a9                	pop    gs
c0008acc:	0f a1                	pop    fs
c0008ace:	07                   	pop    es
c0008acf:	1f                   	pop    ds
c0008ad0:	81 c4 04 00 00 00    	add    esp,0x4
c0008ad6:	cf                   	iret   

c0008ad7 <intr0x2e_entry>:
c0008ad7:	68 00 00 00 00       	push   0x0
c0008adc:	1e                   	push   ds
c0008add:	06                   	push   es
c0008ade:	0f a0                	push   fs
c0008ae0:	0f a8                	push   gs
c0008ae2:	60                   	pusha  
c0008ae3:	68 2e 00 00 00       	push   0x2e
c0008ae8:	ff 15 44 ba 00 c0    	call   DWORD PTR ds:0xc000ba44
c0008aee:	81 c4 04 00 00 00    	add    esp,0x4
c0008af4:	61                   	popa   
c0008af5:	0f a9                	pop    gs
c0008af7:	0f a1                	pop    fs
c0008af9:	07                   	pop    es
c0008afa:	1f                   	pop    ds
c0008afb:	81 c4 04 00 00 00    	add    esp,0x4
c0008b01:	cf                   	iret   

c0008b02 <intr0x2f_entry>:
c0008b02:	68 00 00 00 00       	push   0x0
c0008b07:	1e                   	push   ds
c0008b08:	06                   	push   es
c0008b09:	0f a0                	push   fs
c0008b0b:	0f a8                	push   gs
c0008b0d:	60                   	pusha  
c0008b0e:	68 2f 00 00 00       	push   0x2f
c0008b13:	ff 15 48 ba 00 c0    	call   DWORD PTR ds:0xc000ba48
c0008b19:	81 c4 04 00 00 00    	add    esp,0x4
c0008b1f:	61                   	popa   
c0008b20:	0f a9                	pop    gs
c0008b22:	0f a1                	pop    fs
c0008b24:	07                   	pop    es
c0008b25:	1f                   	pop    ds
c0008b26:	81 c4 04 00 00 00    	add    esp,0x4
c0008b2c:	cf                   	iret   
c0008b2d:	00 00                	add    BYTE PTR [eax],al
	...

c0008b30 <general_intr_handler>:
c0008b30:	55                   	push   ebp
c0008b31:	89 e5                	mov    ebp,esp
c0008b33:	53                   	push   ebx
c0008b34:	83 ec 1c             	sub    esp,0x1c
c0008b37:	8a 45 08             	mov    al,BYTE PTR [ebp+0x8]
c0008b3a:	6a 20                	push   0x20
c0008b3c:	68 a0 00 00 00       	push   0xa0
c0008b41:	88 45 f7             	mov    BYTE PTR [ebp-0x9],al
c0008b44:	e8 13 03 00 00       	call   c0008e5c <io_out8>
c0008b49:	58                   	pop    eax
c0008b4a:	5a                   	pop    edx
c0008b4b:	6a 20                	push   0x20
c0008b4d:	6a 20                	push   0x20
c0008b4f:	e8 08 03 00 00       	call   c0008e5c <io_out8>
c0008b54:	c7 04 24 8c b4 00 c0 	mov    DWORD PTR [esp],0xc000b48c
c0008b5b:	e8 aa 08 00 00       	call   c000940a <put_str>
c0008b60:	0f b6 5d f7          	movzx  ebx,BYTE PTR [ebp-0x9]
c0008b64:	89 1c 24             	mov    DWORD PTR [esp],ebx
c0008b67:	e8 c3 08 00 00       	call   c000942f <put_int>
c0008b6c:	c7 04 24 20 00 00 00 	mov    DWORD PTR [esp],0x20
c0008b73:	e8 f8 07 00 00       	call   c0009370 <put_char>
c0008b78:	83 c4 10             	add    esp,0x10
c0008b7b:	80 7d f7 14          	cmp    BYTE PTR [ebp-0x9],0x14
c0008b7f:	77 13                	ja     c0008b94 <general_intr_handler+0x64>
c0008b81:	8b 04 9d 58 b7 00 c0 	mov    eax,DWORD PTR [ebx*4-0x3fff48a8]
c0008b88:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
c0008b8b:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
c0008b8e:	c9                   	leave  
c0008b8f:	e9 76 08 00 00       	jmp    c000940a <put_str>
c0008b94:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
c0008b97:	c9                   	leave  
c0008b98:	c3                   	ret    

c0008b99 <init_pic>:
c0008b99:	55                   	push   ebp
c0008b9a:	89 e5                	mov    ebp,esp
c0008b9c:	83 ec 10             	sub    esp,0x10
c0008b9f:	6a 11                	push   0x11
c0008ba1:	6a 20                	push   0x20
c0008ba3:	e8 b4 02 00 00       	call   c0008e5c <io_out8>
c0008ba8:	59                   	pop    ecx
c0008ba9:	58                   	pop    eax
c0008baa:	6a 20                	push   0x20
c0008bac:	6a 21                	push   0x21
c0008bae:	e8 a9 02 00 00       	call   c0008e5c <io_out8>
c0008bb3:	58                   	pop    eax
c0008bb4:	5a                   	pop    edx
c0008bb5:	6a 04                	push   0x4
c0008bb7:	6a 21                	push   0x21
c0008bb9:	e8 9e 02 00 00       	call   c0008e5c <io_out8>
c0008bbe:	59                   	pop    ecx
c0008bbf:	58                   	pop    eax
c0008bc0:	6a 01                	push   0x1
c0008bc2:	6a 21                	push   0x21
c0008bc4:	e8 93 02 00 00       	call   c0008e5c <io_out8>
c0008bc9:	58                   	pop    eax
c0008bca:	5a                   	pop    edx
c0008bcb:	6a 11                	push   0x11
c0008bcd:	68 a0 00 00 00       	push   0xa0
c0008bd2:	e8 85 02 00 00       	call   c0008e5c <io_out8>
c0008bd7:	59                   	pop    ecx
c0008bd8:	58                   	pop    eax
c0008bd9:	6a 28                	push   0x28
c0008bdb:	68 a1 00 00 00       	push   0xa1
c0008be0:	e8 77 02 00 00       	call   c0008e5c <io_out8>
c0008be5:	58                   	pop    eax
c0008be6:	5a                   	pop    edx
c0008be7:	6a 02                	push   0x2
c0008be9:	68 a1 00 00 00       	push   0xa1
c0008bee:	e8 69 02 00 00       	call   c0008e5c <io_out8>
c0008bf3:	59                   	pop    ecx
c0008bf4:	58                   	pop    eax
c0008bf5:	6a 01                	push   0x1
c0008bf7:	68 a1 00 00 00       	push   0xa1
c0008bfc:	e8 5b 02 00 00       	call   c0008e5c <io_out8>
c0008c01:	58                   	pop    eax
c0008c02:	5a                   	pop    edx
c0008c03:	68 fe 00 00 00       	push   0xfe
c0008c08:	6a 21                	push   0x21
c0008c0a:	e8 4d 02 00 00       	call   c0008e5c <io_out8>
c0008c0f:	59                   	pop    ecx
c0008c10:	58                   	pop    eax
c0008c11:	68 ff 00 00 00       	push   0xff
c0008c16:	68 a1 00 00 00       	push   0xa1
c0008c1b:	e8 3c 02 00 00       	call   c0008e5c <io_out8>
c0008c20:	83 c4 10             	add    esp,0x10
c0008c23:	c9                   	leave  
c0008c24:	c3                   	ret    

c0008c25 <idt_desc_init>:
c0008c25:	55                   	push   ebp
c0008c26:	31 c0                	xor    eax,eax
c0008c28:	89 e5                	mov    ebp,esp
c0008c2a:	8b 0c 85 20 a9 00 c0 	mov    ecx,DWORD PTR [eax*4-0x3fff56e0]
c0008c31:	8d 14 c5 14 b8 00 c0 	lea    edx,[eax*8-0x3fff47ec]
c0008c38:	66 c7 42 02 08 00    	mov    WORD PTR [edx+0x2],0x8
c0008c3e:	c6 42 04 00          	mov    BYTE PTR [edx+0x4],0x0
c0008c42:	c6 42 05 8e          	mov    BYTE PTR [edx+0x5],0x8e
c0008c46:	66 89 0c c5 14 b8 00 	mov    WORD PTR [eax*8-0x3fff47ec],cx
c0008c4d:	c0 
c0008c4e:	40                   	inc    eax
c0008c4f:	c1 e9 10             	shr    ecx,0x10
c0008c52:	83 f8 2f             	cmp    eax,0x2f
c0008c55:	66 89 4a 06          	mov    WORD PTR [edx+0x6],cx
c0008c59:	75 cf                	jne    c0008c2a <idt_desc_init+0x5>
c0008c5b:	5d                   	pop    ebp
c0008c5c:	c3                   	ret    

c0008c5d <set_gatedesc>:
c0008c5d:	55                   	push   ebp
c0008c5e:	89 e5                	mov    ebp,esp
c0008c60:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0008c63:	53                   	push   ebx
c0008c64:	8b 4d 14             	mov    ecx,DWORD PTR [ebp+0x14]
c0008c67:	8b 5d 10             	mov    ebx,DWORD PTR [ebp+0x10]
c0008c6a:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
c0008c6d:	88 48 05             	mov    BYTE PTR [eax+0x5],cl
c0008c70:	66 89 58 02          	mov    WORD PTR [eax+0x2],bx
c0008c74:	89 cb                	mov    ebx,ecx
c0008c76:	66 89 10             	mov    WORD PTR [eax],dx
c0008c79:	c1 fb 08             	sar    ebx,0x8
c0008c7c:	c1 ea 10             	shr    edx,0x10
c0008c7f:	88 58 04             	mov    BYTE PTR [eax+0x4],bl
c0008c82:	66 89 50 06          	mov    WORD PTR [eax+0x6],dx
c0008c86:	5b                   	pop    ebx
c0008c87:	5d                   	pop    ebp
c0008c88:	c3                   	ret    

c0008c89 <exception_init>:
c0008c89:	55                   	push   ebp
c0008c8a:	31 c0                	xor    eax,eax
c0008c8c:	89 e5                	mov    ebp,esp
c0008c8e:	c7 04 85 8c b9 00 c0 	mov    DWORD PTR [eax*4-0x3fff4674],0xc0008b30
c0008c95:	30 8b 00 c0 
c0008c99:	c7 04 85 58 b7 00 c0 	mov    DWORD PTR [eax*4-0x3fff48a8],0xc000b492
c0008ca0:	92 b4 00 c0 
c0008ca4:	40                   	inc    eax
c0008ca5:	83 f8 2f             	cmp    eax,0x2f
c0008ca8:	75 e4                	jne    c0008c8e <exception_init+0x5>
c0008caa:	c7 05 58 b7 00 c0 9a 	mov    DWORD PTR ds:0xc000b758,0xc000b49a
c0008cb1:	b4 00 c0 
c0008cb4:	c7 05 5c b7 00 c0 ab 	mov    DWORD PTR ds:0xc000b75c,0xc000b4ab
c0008cbb:	b4 00 c0 
c0008cbe:	c7 05 60 b7 00 c0 bf 	mov    DWORD PTR ds:0xc000b760,0xc000b4bf
c0008cc5:	b4 00 c0 
c0008cc8:	c7 05 64 b7 00 c0 cd 	mov    DWORD PTR ds:0xc000b764,0xc000b4cd
c0008ccf:	b4 00 c0 
c0008cd2:	c7 05 68 b7 00 c0 e6 	mov    DWORD PTR ds:0xc000b768,0xc000b4e6
c0008cd9:	b4 00 c0 
c0008cdc:	c7 05 6c b7 00 c0 fd 	mov    DWORD PTR ds:0xc000b76c,0xc000b4fd
c0008ce3:	b4 00 c0 
c0008ce6:	c7 05 70 b7 00 c0 20 	mov    DWORD PTR ds:0xc000b770,0xc000b520
c0008ced:	b5 00 c0 
c0008cf0:	c7 05 74 b7 00 c0 3d 	mov    DWORD PTR ds:0xc000b774,0xc000b53d
c0008cf7:	b5 00 c0 
c0008cfa:	c7 05 78 b7 00 c0 60 	mov    DWORD PTR ds:0xc000b778,0xc000b560
c0008d01:	b5 00 c0 
c0008d04:	c7 05 7c b7 00 c0 7b 	mov    DWORD PTR ds:0xc000b77c,0xc000b57b
c0008d0b:	b5 00 c0 
c0008d0e:	c7 05 80 b7 00 c0 97 	mov    DWORD PTR ds:0xc000b780,0xc000b597
c0008d15:	b5 00 c0 
c0008d18:	c7 05 84 b7 00 c0 b1 	mov    DWORD PTR ds:0xc000b784,0xc000b5b1
c0008d1f:	b5 00 c0 
c0008d22:	c7 05 88 b7 00 c0 c9 	mov    DWORD PTR ds:0xc000b788,0xc000b5c9
c0008d29:	b5 00 c0 
c0008d2c:	c7 05 8c b7 00 c0 e3 	mov    DWORD PTR ds:0xc000b78c,0xc000b5e3
c0008d33:	b5 00 c0 
c0008d36:	c7 05 90 b7 00 c0 04 	mov    DWORD PTR ds:0xc000b790,0xc000b604
c0008d3d:	b6 00 c0 
c0008d40:	c7 05 94 b7 00 c0 1d 	mov    DWORD PTR ds:0xc000b794,0xc000b61d
c0008d47:	b6 00 c0 
c0008d4a:	c7 05 98 b7 00 c0 26 	mov    DWORD PTR ds:0xc000b798,0xc000b626
c0008d51:	b6 00 c0 
c0008d54:	c7 05 9c b7 00 c0 47 	mov    DWORD PTR ds:0xc000b79c,0xc000b647
c0008d5b:	b6 00 c0 
c0008d5e:	c7 05 a0 b7 00 c0 65 	mov    DWORD PTR ds:0xc000b7a0,0xc000b665
c0008d65:	b6 00 c0 
c0008d68:	c7 05 a4 b7 00 c0 81 	mov    DWORD PTR ds:0xc000b7a4,0xc000b681
c0008d6f:	b6 00 c0 
c0008d72:	5d                   	pop    ebp
c0008d73:	c3                   	ret    

c0008d74 <init_idt>:
c0008d74:	55                   	push   ebp
c0008d75:	89 e5                	mov    ebp,esp
c0008d77:	83 ec 18             	sub    esp,0x18
c0008d7a:	e8 a6 fe ff ff       	call   c0008c25 <idt_desc_init>
c0008d7f:	e8 15 fe ff ff       	call   c0008b99 <init_pic>
c0008d84:	b8 14 b8 00 c0       	mov    eax,0xc000b814
c0008d89:	c1 e0 10             	shl    eax,0x10
c0008d8c:	0d 77 01 00 00       	or     eax,0x177
c0008d91:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
c0008d94:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
c0008d9b:	e8 e9 fe ff ff       	call   c0008c89 <exception_init>
c0008da0:	50                   	push   eax
c0008da1:	50                   	push   eax
c0008da2:	68 14 b8 00 c0       	push   0xc000b814
c0008da7:	68 77 01 00 00       	push   0x177
c0008dac:	e8 8f f5 ff ff       	call   c0008340 <load_idt>
c0008db1:	0f 01 5d f0          	lidtd  [ebp-0x10]
c0008db5:	83 c4 10             	add    esp,0x10
c0008db8:	c9                   	leave  
c0008db9:	c3                   	ret    

c0008dba <intr_get_status>:
c0008dba:	55                   	push   ebp
c0008dbb:	89 e5                	mov    ebp,esp
c0008dbd:	83 ec 08             	sub    esp,0x8
c0008dc0:	e8 c4 00 00 00       	call   c0008e89 <get_flages>
c0008dc5:	c9                   	leave  
c0008dc6:	f6 c4 02             	test   ah,0x2
c0008dc9:	0f 95 c0             	setne  al
c0008dcc:	0f b6 c0             	movzx  eax,al
c0008dcf:	c3                   	ret    

c0008dd0 <intr_disable>:
c0008dd0:	55                   	push   ebp
c0008dd1:	89 e5                	mov    ebp,esp
c0008dd3:	83 ec 08             	sub    esp,0x8
c0008dd6:	e8 df ff ff ff       	call   c0008dba <intr_get_status>
c0008ddb:	31 d2                	xor    edx,edx
c0008ddd:	48                   	dec    eax
c0008dde:	75 0a                	jne    c0008dea <intr_disable+0x1a>
c0008de0:	e8 a2 00 00 00       	call   c0008e87 <io_cli>
c0008de5:	ba 01 00 00 00       	mov    edx,0x1
c0008dea:	89 d0                	mov    eax,edx
c0008dec:	c9                   	leave  
c0008ded:	c3                   	ret    

c0008dee <intr_enable>:
c0008dee:	55                   	push   ebp
c0008def:	89 e5                	mov    ebp,esp
c0008df1:	83 ec 08             	sub    esp,0x8
c0008df4:	e8 c1 ff ff ff       	call   c0008dba <intr_get_status>
c0008df9:	ba 01 00 00 00       	mov    edx,0x1
c0008dfe:	48                   	dec    eax
c0008dff:	74 07                	je     c0008e08 <intr_enable+0x1a>
c0008e01:	e8 7f 00 00 00       	call   c0008e85 <io_sti>
c0008e06:	31 d2                	xor    edx,edx
c0008e08:	89 d0                	mov    eax,edx
c0008e0a:	c9                   	leave  
c0008e0b:	c3                   	ret    

c0008e0c <intr_set_status>:
c0008e0c:	55                   	push   ebp
c0008e0d:	89 e5                	mov    ebp,esp
c0008e0f:	83 7d 08 01          	cmp    DWORD PTR [ebp+0x8],0x1
c0008e13:	75 06                	jne    c0008e1b <intr_set_status+0xf>
c0008e15:	5d                   	pop    ebp
c0008e16:	e9 d3 ff ff ff       	jmp    c0008dee <intr_enable>
c0008e1b:	5d                   	pop    ebp
c0008e1c:	e9 af ff ff ff       	jmp    c0008dd0 <intr_disable>
	...

c0008e30 <io_in8>:
c0008e30:	55                   	push   ebp
c0008e31:	89 e5                	mov    ebp,esp
c0008e33:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
c0008e36:	b8 00 00 00 00       	mov    eax,0x0
c0008e3b:	ec                   	in     al,dx
c0008e3c:	5d                   	pop    ebp
c0008e3d:	c3                   	ret    

c0008e3e <io_in16>:
c0008e3e:	55                   	push   ebp
c0008e3f:	89 e5                	mov    ebp,esp
c0008e41:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
c0008e44:	b8 00 00 00 00       	mov    eax,0x0
c0008e49:	66 ed                	in     ax,dx
c0008e4b:	5d                   	pop    ebp
c0008e4c:	c3                   	ret    

c0008e4d <io_in32>:
c0008e4d:	55                   	push   ebp
c0008e4e:	89 e5                	mov    ebp,esp
c0008e50:	8b 54 24 08          	mov    edx,DWORD PTR [esp+0x8]
c0008e54:	b8 00 00 00 00       	mov    eax,0x0
c0008e59:	ed                   	in     eax,dx
c0008e5a:	5d                   	pop    ebp
c0008e5b:	c3                   	ret    

c0008e5c <io_out8>:
c0008e5c:	55                   	push   ebp
c0008e5d:	89 e5                	mov    ebp,esp
c0008e5f:	8b 54 24 08          	mov    edx,DWORD PTR [esp+0x8]
c0008e63:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
c0008e67:	ee                   	out    dx,al
c0008e68:	5d                   	pop    ebp
c0008e69:	c3                   	ret    

c0008e6a <io_out16>:
c0008e6a:	55                   	push   ebp
c0008e6b:	89 e5                	mov    ebp,esp
c0008e6d:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
c0008e70:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
c0008e73:	66 ef                	out    dx,ax
c0008e75:	5d                   	pop    ebp
c0008e76:	c3                   	ret    

c0008e77 <io_out32>:
c0008e77:	55                   	push   ebp
c0008e78:	89 e5                	mov    ebp,esp
c0008e7a:	8b 54 24 08          	mov    edx,DWORD PTR [esp+0x8]
c0008e7e:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
c0008e82:	ef                   	out    dx,eax
c0008e83:	5d                   	pop    ebp
c0008e84:	c3                   	ret    

c0008e85 <io_sti>:
c0008e85:	fb                   	sti    
c0008e86:	c3                   	ret    

c0008e87 <io_cli>:
c0008e87:	fa                   	cli    
c0008e88:	c3                   	ret    

c0008e89 <get_flages>:
c0008e89:	55                   	push   ebp
c0008e8a:	89 e5                	mov    ebp,esp
c0008e8c:	9c                   	pushf  
c0008e8d:	58                   	pop    eax
c0008e8e:	5d                   	pop    ebp
c0008e8f:	c3                   	ret    

c0008e90 <list_init>:
c0008e90:	55                   	push   ebp
c0008e91:	89 e5                	mov    ebp,esp
c0008e93:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0008e96:	8d 50 08             	lea    edx,[eax+0x8]
c0008e99:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
c0008e9f:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
c0008ea2:	89 40 08             	mov    DWORD PTR [eax+0x8],eax
c0008ea5:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [eax+0xc],0x0
c0008eac:	5d                   	pop    ebp
c0008ead:	c3                   	ret    

c0008eae <list_in>:
c0008eae:	55                   	push   ebp
c0008eaf:	89 e5                	mov    ebp,esp
c0008eb1:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
c0008eb4:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
c0008eb7:	8b 08                	mov    ecx,DWORD PTR [eax]
c0008eb9:	89 42 04             	mov    DWORD PTR [edx+0x4],eax
c0008ebc:	89 0a                	mov    DWORD PTR [edx],ecx
c0008ebe:	8b 08                	mov    ecx,DWORD PTR [eax]
c0008ec0:	89 10                	mov    DWORD PTR [eax],edx
c0008ec2:	89 51 04             	mov    DWORD PTR [ecx+0x4],edx
c0008ec5:	5d                   	pop    ebp
c0008ec6:	c3                   	ret    

c0008ec7 <list_push>:
c0008ec7:	55                   	push   ebp
c0008ec8:	89 e5                	mov    ebp,esp
c0008eca:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0008ecd:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
c0008ed0:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
c0008ed3:	8b 08                	mov    ecx,DWORD PTR [eax]
c0008ed5:	89 42 04             	mov    DWORD PTR [edx+0x4],eax
c0008ed8:	89 0a                	mov    DWORD PTR [edx],ecx
c0008eda:	8b 08                	mov    ecx,DWORD PTR [eax]
c0008edc:	89 10                	mov    DWORD PTR [eax],edx
c0008ede:	89 51 04             	mov    DWORD PTR [ecx+0x4],edx
c0008ee1:	5d                   	pop    ebp
c0008ee2:	c3                   	ret    

c0008ee3 <list_append>:
c0008ee3:	55                   	push   ebp
c0008ee4:	89 e5                	mov    ebp,esp
c0008ee6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0008ee9:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
c0008eec:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
c0008eef:	8b 08                	mov    ecx,DWORD PTR [eax]
c0008ef1:	89 42 04             	mov    DWORD PTR [edx+0x4],eax
c0008ef4:	89 0a                	mov    DWORD PTR [edx],ecx
c0008ef6:	8b 08                	mov    ecx,DWORD PTR [eax]
c0008ef8:	89 10                	mov    DWORD PTR [eax],edx
c0008efa:	89 51 04             	mov    DWORD PTR [ecx+0x4],edx
c0008efd:	5d                   	pop    ebp
c0008efe:	c3                   	ret    

c0008eff <list_remove>:
c0008eff:	55                   	push   ebp
c0008f00:	89 e5                	mov    ebp,esp
c0008f02:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0008f05:	8b 10                	mov    edx,DWORD PTR [eax]
c0008f07:	85 d2                	test   edx,edx
c0008f09:	74 1c                	je     c0008f27 <list_remove+0x28>
c0008f0b:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
c0008f0e:	85 c9                	test   ecx,ecx
c0008f10:	74 15                	je     c0008f27 <list_remove+0x28>
c0008f12:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
c0008f15:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
c0008f18:	c7 40 04 00 00 00 00 	mov    DWORD PTR [eax+0x4],0x0
c0008f1f:	89 11                	mov    DWORD PTR [ecx],edx
c0008f21:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
c0008f27:	5d                   	pop    ebp
c0008f28:	c3                   	ret    

c0008f29 <list_pop>:
c0008f29:	55                   	push   ebp
c0008f2a:	89 e5                	mov    ebp,esp
c0008f2c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0008f2f:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
c0008f32:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
c0008f35:	5d                   	pop    ebp
c0008f36:	e9 c4 ff ff ff       	jmp    c0008eff <list_remove>

c0008f3b <list_find>:
c0008f3b:	55                   	push   ebp
c0008f3c:	89 e5                	mov    ebp,esp
c0008f3e:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
c0008f41:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
c0008f44:	8b 42 04             	mov    eax,DWORD PTR [edx+0x4]
c0008f47:	83 c2 08             	add    edx,0x8
c0008f4a:	eb 07                	jmp    c0008f53 <list_find+0x18>
c0008f4c:	39 c8                	cmp    eax,ecx
c0008f4e:	74 0b                	je     c0008f5b <list_find+0x20>
c0008f50:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
c0008f53:	39 d0                	cmp    eax,edx
c0008f55:	75 f5                	jne    c0008f4c <list_find+0x11>
c0008f57:	31 c0                	xor    eax,eax
c0008f59:	eb 05                	jmp    c0008f60 <list_find+0x25>
c0008f5b:	b8 01 00 00 00       	mov    eax,0x1
c0008f60:	5d                   	pop    ebp
c0008f61:	c3                   	ret    
	...

c0008f64 <init_memmam>:
c0008f64:	55                   	push   ebp
c0008f65:	89 e5                	mov    ebp,esp
c0008f67:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0008f6a:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
c0008f70:	c7 40 04 00 00 00 00 	mov    DWORD PTR [eax+0x4],0x0
c0008f77:	c7 40 08 00 00 00 00 	mov    DWORD PTR [eax+0x8],0x0
c0008f7e:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [eax+0xc],0x0
c0008f85:	5d                   	pop    ebp
c0008f86:	c3                   	ret    

c0008f87 <TotalFreeSize>:
c0008f87:	55                   	push   ebp
c0008f88:	31 d2                	xor    edx,edx
c0008f8a:	89 e5                	mov    ebp,esp
c0008f8c:	31 c0                	xor    eax,eax
c0008f8e:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
c0008f91:	53                   	push   ebx
c0008f92:	8b 19                	mov    ebx,DWORD PTR [ecx]
c0008f94:	eb 05                	jmp    c0008f9b <TotalFreeSize+0x14>
c0008f96:	03 44 d1 14          	add    eax,DWORD PTR [ecx+edx*8+0x14]
c0008f9a:	42                   	inc    edx
c0008f9b:	39 da                	cmp    edx,ebx
c0008f9d:	75 f7                	jne    c0008f96 <TotalFreeSize+0xf>
c0008f9f:	5b                   	pop    ebx
c0008fa0:	5d                   	pop    ebp
c0008fa1:	c3                   	ret    

c0008fa2 <mem_alloc>:
c0008fa2:	55                   	push   ebp
c0008fa3:	89 e5                	mov    ebp,esp
c0008fa5:	57                   	push   edi
c0008fa6:	56                   	push   esi
c0008fa7:	53                   	push   ebx
c0008fa8:	51                   	push   ecx
c0008fa9:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
c0008fac:	31 c9                	xor    ecx,ecx
c0008fae:	8b 02                	mov    eax,DWORD PTR [edx]
c0008fb0:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
c0008fb3:	eb 42                	jmp    c0008ff7 <mem_alloc+0x55>
c0008fb5:	8b 74 ca 14          	mov    esi,DWORD PTR [edx+ecx*8+0x14]
c0008fb9:	3b 75 0c             	cmp    esi,DWORD PTR [ebp+0xc]
c0008fbc:	72 38                	jb     c0008ff6 <mem_alloc+0x54>
c0008fbe:	8d 59 02             	lea    ebx,[ecx+0x2]
c0008fc1:	8b 7d 0c             	mov    edi,DWORD PTR [ebp+0xc]
c0008fc4:	8b 04 da             	mov    eax,DWORD PTR [edx+ebx*8]
c0008fc7:	2b 75 0c             	sub    esi,DWORD PTR [ebp+0xc]
c0008fca:	01 c7                	add    edi,eax
c0008fcc:	85 f6                	test   esi,esi
c0008fce:	89 3c da             	mov    DWORD PTR [edx+ebx*8],edi
c0008fd1:	89 74 da 04          	mov    DWORD PTR [edx+ebx*8+0x4],esi
c0008fd5:	75 27                	jne    c0008ffe <mem_alloc+0x5c>
c0008fd7:	8b 5d f0             	mov    ebx,DWORD PTR [ebp-0x10]
c0008fda:	4b                   	dec    ebx
c0008fdb:	89 1a                	mov    DWORD PTR [edx],ebx
c0008fdd:	eb 11                	jmp    c0008ff0 <mem_alloc+0x4e>
c0008fdf:	41                   	inc    ecx
c0008fe0:	8b 74 ca 10          	mov    esi,DWORD PTR [edx+ecx*8+0x10]
c0008fe4:	8b 7c ca 14          	mov    edi,DWORD PTR [edx+ecx*8+0x14]
c0008fe8:	89 74 ca 08          	mov    DWORD PTR [edx+ecx*8+0x8],esi
c0008fec:	89 7c ca 0c          	mov    DWORD PTR [edx+ecx*8+0xc],edi
c0008ff0:	39 d9                	cmp    ecx,ebx
c0008ff2:	72 eb                	jb     c0008fdf <mem_alloc+0x3d>
c0008ff4:	eb 08                	jmp    c0008ffe <mem_alloc+0x5c>
c0008ff6:	41                   	inc    ecx
c0008ff7:	3b 4d f0             	cmp    ecx,DWORD PTR [ebp-0x10]
c0008ffa:	75 b9                	jne    c0008fb5 <mem_alloc+0x13>
c0008ffc:	31 c0                	xor    eax,eax
c0008ffe:	5a                   	pop    edx
c0008fff:	5b                   	pop    ebx
c0009000:	5e                   	pop    esi
c0009001:	5f                   	pop    edi
c0009002:	5d                   	pop    ebp
c0009003:	c3                   	ret    

c0009004 <mem_alloc_page>:
c0009004:	55                   	push   ebp
c0009005:	89 e5                	mov    ebp,esp
c0009007:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
c000900a:	05 ff 0f 00 00       	add    eax,0xfff
c000900f:	25 00 f0 ff ff       	and    eax,0xfffff000
c0009014:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
c0009017:	5d                   	pop    ebp
c0009018:	e9 85 ff ff ff       	jmp    c0008fa2 <mem_alloc>

c000901d <mem_free>:
c000901d:	55                   	push   ebp
c000901e:	31 c9                	xor    ecx,ecx
c0009020:	89 e5                	mov    ebp,esp
c0009022:	57                   	push   edi
c0009023:	56                   	push   esi
c0009024:	53                   	push   ebx
c0009025:	83 ec 10             	sub    esp,0x10
c0009028:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
c000902b:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
c000902e:	8b 75 10             	mov    esi,DWORD PTR [ebp+0x10]
c0009031:	8b 02                	mov    eax,DWORD PTR [edx]
c0009033:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
c0009036:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
c0009039:	eb 07                	jmp    c0009042 <mem_free+0x25>
c000903b:	39 5c ca 10          	cmp    DWORD PTR [edx+ecx*8+0x10],ebx
c000903f:	77 06                	ja     c0009047 <mem_free+0x2a>
c0009041:	41                   	inc    ecx
c0009042:	3b 4d ec             	cmp    ecx,DWORD PTR [ebp-0x14]
c0009045:	75 f4                	jne    c000903b <mem_free+0x1e>
c0009047:	85 c9                	test   ecx,ecx
c0009049:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
c000904c:	74 60                	je     c00090ae <mem_free+0x91>
c000904e:	8d 79 01             	lea    edi,[ecx+0x1]
c0009051:	8b 44 fa 04          	mov    eax,DWORD PTR [edx+edi*8+0x4]
c0009055:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
c0009058:	03 04 fa             	add    eax,DWORD PTR [edx+edi*8]
c000905b:	39 d8                	cmp    eax,ebx
c000905d:	75 4f                	jne    c00090ae <mem_free+0x91>
c000905f:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
c0009062:	01 f0                	add    eax,esi
c0009064:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
c0009067:	89 44 fa 04          	mov    DWORD PTR [edx+edi*8+0x4],eax
c000906b:	31 c0                	xor    eax,eax
c000906d:	3b 4d ec             	cmp    ecx,DWORD PTR [ebp-0x14]
c0009070:	0f 83 a9 00 00 00    	jae    c000911f <mem_free+0x102>
c0009076:	01 de                	add    esi,ebx
c0009078:	8d 59 02             	lea    ebx,[ecx+0x2]
c000907b:	39 34 da             	cmp    DWORD PTR [edx+ebx*8],esi
c000907e:	0f 85 9b 00 00 00    	jne    c000911f <mem_free+0x102>
c0009084:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
c0009087:	03 44 da 04          	add    eax,DWORD PTR [edx+ebx*8+0x4]
c000908b:	89 44 fa 04          	mov    DWORD PTR [edx+edi*8+0x4],eax
c000908f:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
c0009092:	48                   	dec    eax
c0009093:	89 02                	mov    DWORD PTR [edx],eax
c0009095:	eb 11                	jmp    c00090a8 <mem_free+0x8b>
c0009097:	41                   	inc    ecx
c0009098:	8b 74 ca 10          	mov    esi,DWORD PTR [edx+ecx*8+0x10]
c000909c:	8b 7c ca 14          	mov    edi,DWORD PTR [edx+ecx*8+0x14]
c00090a0:	89 74 ca 08          	mov    DWORD PTR [edx+ecx*8+0x8],esi
c00090a4:	89 7c ca 0c          	mov    DWORD PTR [edx+ecx*8+0xc],edi
c00090a8:	39 c1                	cmp    ecx,eax
c00090aa:	72 eb                	jb     c0009097 <mem_free+0x7a>
c00090ac:	eb 1d                	jmp    c00090cb <mem_free+0xae>
c00090ae:	3b 4d ec             	cmp    ecx,DWORD PTR [ebp-0x14]
c00090b1:	73 1c                	jae    c00090cf <mem_free+0xb2>
c00090b3:	8d 3c 33             	lea    edi,[ebx+esi*1]
c00090b6:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
c00090b9:	8d 79 02             	lea    edi,[ecx+0x2]
c00090bc:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
c00090bf:	39 04 fa             	cmp    DWORD PTR [edx+edi*8],eax
c00090c2:	75 0b                	jne    c00090cf <mem_free+0xb2>
c00090c4:	01 74 fa 04          	add    DWORD PTR [edx+edi*8+0x4],esi
c00090c8:	89 1c fa             	mov    DWORD PTR [edx+edi*8],ebx
c00090cb:	31 c0                	xor    eax,eax
c00090cd:	eb 50                	jmp    c000911f <mem_free+0x102>
c00090cf:	81 7d ec 9f 0f 00 00 	cmp    DWORD PTR [ebp-0x14],0xf9f
c00090d6:	76 15                	jbe    c00090ed <mem_free+0xd0>
c00090d8:	eb 3a                	jmp    c0009114 <mem_free+0xf7>
c00090da:	8b 74 c2 08          	mov    esi,DWORD PTR [edx+eax*8+0x8]
c00090de:	8b 7c c2 0c          	mov    edi,DWORD PTR [edx+eax*8+0xc]
c00090e2:	89 74 c2 10          	mov    DWORD PTR [edx+eax*8+0x10],esi
c00090e6:	89 7c c2 14          	mov    DWORD PTR [edx+eax*8+0x14],edi
c00090ea:	40                   	inc    eax
c00090eb:	eb 06                	jmp    c00090f3 <mem_free+0xd6>
c00090ed:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
c00090f0:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
c00090f3:	39 c8                	cmp    eax,ecx
c00090f5:	7f e3                	jg     c00090da <mem_free+0xbd>
c00090f7:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
c00090fa:	8b 75 f0             	mov    esi,DWORD PTR [ebp-0x10]
c00090fd:	40                   	inc    eax
c00090fe:	39 42 04             	cmp    DWORD PTR [edx+0x4],eax
c0009101:	89 02                	mov    DWORD PTR [edx],eax
c0009103:	73 03                	jae    c0009108 <mem_free+0xeb>
c0009105:	89 42 04             	mov    DWORD PTR [edx+0x4],eax
c0009108:	83 c1 02             	add    ecx,0x2
c000910b:	89 1c ca             	mov    DWORD PTR [edx+ecx*8],ebx
c000910e:	89 74 ca 04          	mov    DWORD PTR [edx+ecx*8+0x4],esi
c0009112:	eb b7                	jmp    c00090cb <mem_free+0xae>
c0009114:	ff 42 0c             	inc    DWORD PTR [edx+0xc]
c0009117:	b8 01 00 00 00       	mov    eax,0x1
c000911c:	01 72 08             	add    DWORD PTR [edx+0x8],esi
c000911f:	83 c4 10             	add    esp,0x10
c0009122:	5b                   	pop    ebx
c0009123:	5e                   	pop    esi
c0009124:	5f                   	pop    edi
c0009125:	5d                   	pop    ebp
c0009126:	c3                   	ret    

c0009127 <mem_free_page>:
c0009127:	55                   	push   ebp
c0009128:	89 e5                	mov    ebp,esp
c000912a:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
c000912d:	05 ff 0f 00 00       	add    eax,0xfff
c0009132:	25 00 f0 ff ff       	and    eax,0xfffff000
c0009137:	89 45 10             	mov    DWORD PTR [ebp+0x10],eax
c000913a:	5d                   	pop    ebp
c000913b:	e9 dd fe ff ff       	jmp    c000901d <mem_free>

c0009140 <init_memory>:
c0009140:	55                   	push   ebp
c0009141:	89 e5                	mov    ebp,esp
c0009143:	56                   	push   esi
c0009144:	53                   	push   ebx
c0009145:	8b 35 00 7c 00 00    	mov    esi,DWORD PTR ds:0x7c00
c000914b:	8d 9e 00 e0 ef ff    	lea    ebx,[esi-0x102000]
c0009151:	d1 eb                	shr    ebx,1
c0009153:	53                   	push   ebx
c0009154:	29 de                	sub    esi,ebx
c0009156:	68 00 20 10 00       	push   0x102000
c000915b:	81 c3 00 20 10 00    	add    ebx,0x102000
c0009161:	68 78 31 02 c0       	push   0xc0023178
c0009166:	e8 bc ff ff ff       	call   c0009127 <mem_free_page>
c000916b:	56                   	push   esi
c000916c:	53                   	push   ebx
c000916d:	68 48 ba 00 c0       	push   0xc000ba48
c0009172:	e8 b0 ff ff ff       	call   c0009127 <mem_free_page>
c0009177:	68 00 00 10 00       	push   0x100000
c000917c:	6a 00                	push   0x0
c000917e:	68 68 b4 01 c0       	push   0xc001b468
c0009183:	e8 9f ff ff ff       	call   c0009127 <mem_free_page>
c0009188:	83 c4 24             	add    esp,0x24
c000918b:	68 ff ff ff 3f       	push   0x3fffffff
c0009190:	68 00 00 00 c0       	push   0xc0000000
c0009195:	68 68 b4 01 c0       	push   0xc001b468
c000919a:	e8 88 ff ff ff       	call   c0009127 <mem_free_page>
c000919f:	83 c4 0c             	add    esp,0xc
c00091a2:	8d 65 f8             	lea    esp,[ebp-0x8]
c00091a5:	5b                   	pop    ebx
c00091a6:	5e                   	pop    esi
c00091a7:	5d                   	pop    ebp
c00091a8:	c3                   	ret    
c00091a9:	00 00                	add    BYTE PTR [eax],al
	...

c00091ac <put_char_graphic>:
c00091ac:	55                   	push   ebp
c00091ad:	89 e5                	mov    ebp,esp
c00091af:	57                   	push   edi
c00091b0:	56                   	push   esi
c00091b1:	53                   	push   ebx
c00091b2:	83 ec 08             	sub    esp,0x8
c00091b5:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c00091b8:	83 3d 0c 7c 00 00 01 	cmp    DWORD PTR ds:0x7c0c,0x1
c00091bf:	8a 45 18             	mov    al,BYTE PTR [ebp+0x18]
c00091c2:	75 47                	jne    c000920b <put_char_graphic+0x5f>
c00091c4:	0f be c0             	movsx  eax,al
c00091c7:	8b 33                	mov    esi,DWORD PTR [ebx]
c00091c9:	c1 e0 04             	shl    eax,0x4
c00091cc:	05 20 99 00 c0       	add    eax,0xc0009920
c00091d1:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
c00091d4:	31 c0                	xor    eax,eax
c00091d6:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
c00091d9:	b1 ff                	mov    cl,0xff
c00091db:	89 5d ec             	mov    DWORD PTR [ebp-0x14],ebx
c00091de:	01 c2                	add    edx,eax
c00091e0:	0f af 53 04          	imul   edx,DWORD PTR [ebx+0x4]
c00091e4:	03 55 0c             	add    edx,DWORD PTR [ebp+0xc]
c00091e7:	8d 3c 96             	lea    edi,[esi+edx*4]
c00091ea:	31 d2                	xor    edx,edx
c00091ec:	8b 5d f0             	mov    ebx,DWORD PTR [ebp-0x10]
c00091ef:	84 0c 03             	test   BYTE PTR [ebx+eax*1],cl
c00091f2:	74 06                	je     c00091fa <put_char_graphic+0x4e>
c00091f4:	8b 5d 14             	mov    ebx,DWORD PTR [ebp+0x14]
c00091f7:	89 1c 97             	mov    DWORD PTR [edi+edx*4],ebx
c00091fa:	42                   	inc    edx
c00091fb:	d0 e9                	shr    cl,1
c00091fd:	83 fa 08             	cmp    edx,0x8
c0009200:	75 ea                	jne    c00091ec <put_char_graphic+0x40>
c0009202:	40                   	inc    eax
c0009203:	8b 5d ec             	mov    ebx,DWORD PTR [ebp-0x14]
c0009206:	83 f8 10             	cmp    eax,0x10
c0009209:	75 cb                	jne    c00091d6 <put_char_graphic+0x2a>
c000920b:	58                   	pop    eax
c000920c:	5a                   	pop    edx
c000920d:	5b                   	pop    ebx
c000920e:	5e                   	pop    esi
c000920f:	5f                   	pop    edi
c0009210:	5d                   	pop    ebp
c0009211:	c3                   	ret    

c0009212 <put_str_graphic>:
c0009212:	55                   	push   ebp
c0009213:	89 e5                	mov    ebp,esp
c0009215:	57                   	push   edi
c0009216:	8b 7d 14             	mov    edi,DWORD PTR [ebp+0x14]
c0009219:	56                   	push   esi
c000921a:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
c000921d:	53                   	push   ebx
c000921e:	8b 5d 18             	mov    ebx,DWORD PTR [ebp+0x18]
c0009221:	eb 17                	jmp    c000923a <put_str_graphic+0x28>
c0009223:	0f be c0             	movsx  eax,al
c0009226:	50                   	push   eax
c0009227:	57                   	push   edi
c0009228:	ff 75 10             	push   DWORD PTR [ebp+0x10]
c000922b:	56                   	push   esi
c000922c:	83 c6 0a             	add    esi,0xa
c000922f:	ff 75 08             	push   DWORD PTR [ebp+0x8]
c0009232:	e8 75 ff ff ff       	call   c00091ac <put_char_graphic>
c0009237:	83 c4 14             	add    esp,0x14
c000923a:	43                   	inc    ebx
c000923b:	8a 43 ff             	mov    al,BYTE PTR [ebx-0x1]
c000923e:	84 c0                	test   al,al
c0009240:	75 e1                	jne    c0009223 <put_str_graphic+0x11>
c0009242:	8d 65 f4             	lea    esp,[ebp-0xc]
c0009245:	5b                   	pop    ebx
c0009246:	5e                   	pop    esi
c0009247:	5f                   	pop    edi
c0009248:	5d                   	pop    ebp
c0009249:	c3                   	ret    

c000924a <itoa>:
c000924a:	55                   	push   ebp
c000924b:	89 e5                	mov    ebp,esp
c000924d:	57                   	push   edi
c000924e:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
c0009251:	56                   	push   esi
c0009252:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
c0009255:	53                   	push   ebx
c0009256:	8b 7d 10             	mov    edi,DWORD PTR [ebp+0x10]
c0009259:	31 db                	xor    ebx,ebx
c000925b:	89 f0                	mov    eax,esi
c000925d:	99                   	cdq    
c000925e:	89 d0                	mov    eax,edx
c0009260:	31 f0                	xor    eax,esi
c0009262:	29 d0                	sub    eax,edx
c0009264:	eb 02                	jmp    c0009268 <itoa+0x1e>
c0009266:	89 d3                	mov    ebx,edx
c0009268:	99                   	cdq    
c0009269:	f7 ff                	idiv   edi
c000926b:	8a 92 a4 b6 00 c0    	mov    dl,BYTE PTR [edx-0x3fff495c]
c0009271:	85 c0                	test   eax,eax
c0009273:	88 14 19             	mov    BYTE PTR [ecx+ebx*1],dl
c0009276:	8d 53 01             	lea    edx,[ebx+0x1]
c0009279:	7f eb                	jg     c0009266 <itoa+0x1c>
c000927b:	85 f6                	test   esi,esi
c000927d:	79 07                	jns    c0009286 <itoa+0x3c>
c000927f:	c6 04 11 2d          	mov    BYTE PTR [ecx+edx*1],0x2d
c0009283:	8d 53 02             	lea    edx,[ebx+0x2]
c0009286:	c6 04 11 00          	mov    BYTE PTR [ecx+edx*1],0x0
c000928a:	89 c8                	mov    eax,ecx
c000928c:	eb 01                	jmp    c000928f <itoa+0x45>
c000928e:	40                   	inc    eax
c000928f:	80 38 00             	cmp    BYTE PTR [eax],0x0
c0009292:	75 fa                	jne    c000928e <itoa+0x44>
c0009294:	eb 09                	jmp    c000929f <itoa+0x55>
c0009296:	8a 11                	mov    dl,BYTE PTR [ecx]
c0009298:	8a 18                	mov    bl,BYTE PTR [eax]
c000929a:	88 19                	mov    BYTE PTR [ecx],bl
c000929c:	41                   	inc    ecx
c000929d:	88 10                	mov    BYTE PTR [eax],dl
c000929f:	48                   	dec    eax
c00092a0:	39 c8                	cmp    eax,ecx
c00092a2:	77 f2                	ja     c0009296 <itoa+0x4c>
c00092a4:	5b                   	pop    ebx
c00092a5:	5e                   	pop    esi
c00092a6:	5f                   	pop    edi
c00092a7:	5d                   	pop    ebp
c00092a8:	c3                   	ret    

c00092a9 <roll_screen>:
c00092a9:	55                   	push   ebp
c00092aa:	31 c0                	xor    eax,eax
c00092ac:	89 e5                	mov    ebp,esp
c00092ae:	56                   	push   esi
c00092af:	53                   	push   ebx
c00092b0:	8b 15 18 7c 00 00    	mov    edx,DWORD PTR ds:0x7c18
c00092b6:	8b 0d 10 7c 00 00    	mov    ecx,DWORD PTR ds:0x7c10
c00092bc:	8d 1c 51             	lea    ebx,[ecx+edx*2]
c00092bf:	4a                   	dec    edx
c00092c0:	0f af 15 1c 7c 00 00 	imul   edx,DWORD PTR ds:0x7c1c
c00092c7:	eb 09                	jmp    c00092d2 <roll_screen+0x29>
c00092c9:	66 8b 34 43          	mov    si,WORD PTR [ebx+eax*2]
c00092cd:	66 89 34 41          	mov    WORD PTR [ecx+eax*2],si
c00092d1:	40                   	inc    eax
c00092d2:	39 d0                	cmp    eax,edx
c00092d4:	75 f3                	jne    c00092c9 <roll_screen+0x20>
c00092d6:	5b                   	pop    ebx
c00092d7:	5e                   	pop    esi
c00092d8:	5d                   	pop    ebp
c00092d9:	c3                   	ret    

c00092da <get_cursor>:
c00092da:	55                   	push   ebp
c00092db:	89 e5                	mov    ebp,esp
c00092dd:	53                   	push   ebx
c00092de:	83 ec 0c             	sub    esp,0xc
c00092e1:	6a 0e                	push   0xe
c00092e3:	68 d4 03 00 00       	push   0x3d4
c00092e8:	e8 6f fb ff ff       	call   c0008e5c <io_out8>
c00092ed:	c7 04 24 d5 03 00 00 	mov    DWORD PTR [esp],0x3d5
c00092f4:	e8 37 fb ff ff       	call   c0008e30 <io_in8>
c00092f9:	89 c3                	mov    ebx,eax
c00092fb:	58                   	pop    eax
c00092fc:	5a                   	pop    edx
c00092fd:	c1 e3 08             	shl    ebx,0x8
c0009300:	6a 0f                	push   0xf
c0009302:	68 d4 03 00 00       	push   0x3d4
c0009307:	e8 50 fb ff ff       	call   c0008e5c <io_out8>
c000930c:	c7 04 24 d5 03 00 00 	mov    DWORD PTR [esp],0x3d5
c0009313:	e8 18 fb ff ff       	call   c0008e30 <io_in8>
c0009318:	09 c3                	or     ebx,eax
c000931a:	89 d8                	mov    eax,ebx
c000931c:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
c000931f:	c9                   	leave  
c0009320:	c3                   	ret    

c0009321 <set_cursor>:
c0009321:	55                   	push   ebp
c0009322:	89 e5                	mov    ebp,esp
c0009324:	53                   	push   ebx
c0009325:	83 ec 0c             	sub    esp,0xc
c0009328:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c000932b:	6a 0e                	push   0xe
c000932d:	68 d4 03 00 00       	push   0x3d4
c0009332:	e8 25 fb ff ff       	call   c0008e5c <io_out8>
c0009337:	59                   	pop    ecx
c0009338:	58                   	pop    eax
c0009339:	0f b6 c7             	movzx  eax,bh
c000933c:	81 e3 ff 00 00 00    	and    ebx,0xff
c0009342:	50                   	push   eax
c0009343:	68 d5 03 00 00       	push   0x3d5
c0009348:	e8 0f fb ff ff       	call   c0008e5c <io_out8>
c000934d:	58                   	pop    eax
c000934e:	5a                   	pop    edx
c000934f:	6a 0f                	push   0xf
c0009351:	68 d4 03 00 00       	push   0x3d4
c0009356:	e8 01 fb ff ff       	call   c0008e5c <io_out8>
c000935b:	59                   	pop    ecx
c000935c:	58                   	pop    eax
c000935d:	53                   	push   ebx
c000935e:	68 d5 03 00 00       	push   0x3d5
c0009363:	e8 f4 fa ff ff       	call   c0008e5c <io_out8>
c0009368:	83 c4 10             	add    esp,0x10
c000936b:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
c000936e:	c9                   	leave  
c000936f:	c3                   	ret    

c0009370 <put_char>:
c0009370:	55                   	push   ebp
c0009371:	89 e5                	mov    ebp,esp
c0009373:	53                   	push   ebx
c0009374:	50                   	push   eax
c0009375:	8a 5d 08             	mov    bl,BYTE PTR [ebp+0x8]
c0009378:	83 3d 0c 7c 00 00 00 	cmp    DWORD PTR ds:0x7c0c,0x0
c000937f:	0f 85 81 00 00 00    	jne    c0009406 <put_char+0x96>
c0009385:	e8 50 ff ff ff       	call   c00092da <get_cursor>
c000938a:	80 fb 08             	cmp    bl,0x8
c000938d:	74 14                	je     c00093a3 <put_char+0x33>
c000938f:	77 06                	ja     c0009397 <put_char+0x27>
c0009391:	84 db                	test   bl,bl
c0009393:	74 43                	je     c00093d8 <put_char+0x68>
c0009395:	eb 2c                	jmp    c00093c3 <put_char+0x53>
c0009397:	80 fb 0a             	cmp    bl,0xa
c000939a:	74 14                	je     c00093b0 <put_char+0x40>
c000939c:	80 fb 0d             	cmp    bl,0xd
c000939f:	75 22                	jne    c00093c3 <put_char+0x53>
c00093a1:	eb 0d                	jmp    c00093b0 <put_char+0x40>
c00093a3:	8b 15 10 7c 00 00    	mov    edx,DWORD PTR ds:0x7c10
c00093a9:	48                   	dec    eax
c00093aa:	c6 04 42 20          	mov    BYTE PTR [edx+eax*2],0x20
c00093ae:	eb 28                	jmp    c00093d8 <put_char+0x68>
c00093b0:	8b 1d 18 7c 00 00    	mov    ebx,DWORD PTR ds:0x7c18
c00093b6:	31 d2                	xor    edx,edx
c00093b8:	8d 0c 18             	lea    ecx,[eax+ebx*1]
c00093bb:	f7 f3                	div    ebx
c00093bd:	89 c8                	mov    eax,ecx
c00093bf:	29 d0                	sub    eax,edx
c00093c1:	eb 15                	jmp    c00093d8 <put_char+0x68>
c00093c3:	8b 15 10 7c 00 00    	mov    edx,DWORD PTR ds:0x7c10
c00093c9:	88 1c 42             	mov    BYTE PTR [edx+eax*2],bl
c00093cc:	8b 15 10 7c 00 00    	mov    edx,DWORD PTR ds:0x7c10
c00093d2:	c6 44 42 01 07       	mov    BYTE PTR [edx+eax*2+0x1],0x7
c00093d7:	40                   	inc    eax
c00093d8:	8b 15 1c 7c 00 00    	mov    edx,DWORD PTR ds:0x7c1c
c00093de:	0f af 15 18 7c 00 00 	imul   edx,DWORD PTR ds:0x7c18
c00093e5:	39 d0                	cmp    eax,edx
c00093e7:	72 12                	jb     c00093fb <put_char+0x8b>
c00093e9:	e8 bb fe ff ff       	call   c00092a9 <roll_screen>
c00093ee:	a1 1c 7c 00 00       	mov    eax,ds:0x7c1c
c00093f3:	48                   	dec    eax
c00093f4:	0f af 05 18 7c 00 00 	imul   eax,DWORD PTR ds:0x7c18
c00093fb:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
c00093fe:	58                   	pop    eax
c00093ff:	5b                   	pop    ebx
c0009400:	5d                   	pop    ebp
c0009401:	e9 1b ff ff ff       	jmp    c0009321 <set_cursor>
c0009406:	58                   	pop    eax
c0009407:	5b                   	pop    ebx
c0009408:	5d                   	pop    ebp
c0009409:	c3                   	ret    

c000940a <put_str>:
c000940a:	55                   	push   ebp
c000940b:	89 e5                	mov    ebp,esp
c000940d:	53                   	push   ebx
c000940e:	50                   	push   eax
c000940f:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c0009412:	eb 10                	jmp    c0009424 <put_str+0x1a>
c0009414:	83 ec 0c             	sub    esp,0xc
c0009417:	0f b6 c0             	movzx  eax,al
c000941a:	50                   	push   eax
c000941b:	43                   	inc    ebx
c000941c:	e8 4f ff ff ff       	call   c0009370 <put_char>
c0009421:	83 c4 10             	add    esp,0x10
c0009424:	8a 03                	mov    al,BYTE PTR [ebx]
c0009426:	84 c0                	test   al,al
c0009428:	75 ea                	jne    c0009414 <put_str+0xa>
c000942a:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
c000942d:	c9                   	leave  
c000942e:	c3                   	ret    

c000942f <put_int>:
c000942f:	55                   	push   ebp
c0009430:	31 c0                	xor    eax,eax
c0009432:	89 e5                	mov    ebp,esp
c0009434:	b9 42 00 00 00       	mov    ecx,0x42
c0009439:	57                   	push   edi
c000943a:	8d 7d b6             	lea    edi,[ebp-0x4a]
c000943d:	83 ec 54             	sub    esp,0x54
c0009440:	f3 aa                	rep stos BYTE PTR es:[edi],al
c0009442:	8d 7d b6             	lea    edi,[ebp-0x4a]
c0009445:	6a 10                	push   0x10
c0009447:	57                   	push   edi
c0009448:	ff 75 08             	push   DWORD PTR [ebp+0x8]
c000944b:	e8 fa fd ff ff       	call   c000924a <itoa>
c0009450:	57                   	push   edi
c0009451:	e8 b4 ff ff ff       	call   c000940a <put_str>
c0009456:	83 c4 10             	add    esp,0x10
c0009459:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
c000945c:	c9                   	leave  
c000945d:	c3                   	ret    
	...

c0009460 <memset>:
c0009460:	55                   	push   ebp
c0009461:	89 e5                	mov    ebp,esp
c0009463:	56                   	push   esi
c0009464:	53                   	push   ebx
c0009465:	83 ec 10             	sub    esp,0x10
c0009468:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c000946b:	8b 75 10             	mov    esi,DWORD PTR [ebp+0x10]
c000946e:	8a 55 0c             	mov    dl,BYTE PTR [ebp+0xc]
c0009471:	85 db                	test   ebx,ebx
c0009473:	75 1f                	jne    c0009494 <memset+0x34>
c0009475:	68 cc b6 00 c0       	push   0xc000b6cc
c000947a:	68 24 b7 00 c0       	push   0xc000b724
c000947f:	6a 0f                	push   0xf
c0009481:	68 da b6 00 c0       	push   0xc000b6da
c0009486:	88 55 f4             	mov    BYTE PTR [ebp-0xc],dl
c0009489:	e8 2e ec ff ff       	call   c00080bc <panic_spin>
c000948e:	8a 55 f4             	mov    dl,BYTE PTR [ebp-0xc]
c0009491:	83 c4 10             	add    esp,0x10
c0009494:	31 c0                	xor    eax,eax
c0009496:	eb 04                	jmp    c000949c <memset+0x3c>
c0009498:	88 14 03             	mov    BYTE PTR [ebx+eax*1],dl
c000949b:	40                   	inc    eax
c000949c:	39 f0                	cmp    eax,esi
c000949e:	75 f8                	jne    c0009498 <memset+0x38>
c00094a0:	8d 65 f8             	lea    esp,[ebp-0x8]
c00094a3:	5b                   	pop    ebx
c00094a4:	5e                   	pop    esi
c00094a5:	5d                   	pop    ebp
c00094a6:	c3                   	ret    

c00094a7 <memcpy>:
c00094a7:	55                   	push   ebp
c00094a8:	89 e5                	mov    ebp,esp
c00094aa:	57                   	push   edi
c00094ab:	56                   	push   esi
c00094ac:	53                   	push   ebx
c00094ad:	83 ec 0c             	sub    esp,0xc
c00094b0:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
c00094b3:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c00094b6:	8b 7d 10             	mov    edi,DWORD PTR [ebp+0x10]
c00094b9:	85 f6                	test   esi,esi
c00094bb:	74 04                	je     c00094c1 <memcpy+0x1a>
c00094bd:	85 db                	test   ebx,ebx
c00094bf:	75 19                	jne    c00094da <memcpy+0x33>
c00094c1:	68 e7 b6 00 c0       	push   0xc000b6e7
c00094c6:	68 2c b7 00 c0       	push   0xc000b72c
c00094cb:	6a 22                	push   0x22
c00094cd:	68 da b6 00 c0       	push   0xc000b6da
c00094d2:	e8 e5 eb ff ff       	call   c00080bc <panic_spin>
c00094d7:	83 c4 10             	add    esp,0x10
c00094da:	31 c0                	xor    eax,eax
c00094dc:	eb 07                	jmp    c00094e5 <memcpy+0x3e>
c00094de:	8a 14 06             	mov    dl,BYTE PTR [esi+eax*1]
c00094e1:	88 14 03             	mov    BYTE PTR [ebx+eax*1],dl
c00094e4:	40                   	inc    eax
c00094e5:	39 f8                	cmp    eax,edi
c00094e7:	75 f5                	jne    c00094de <memcpy+0x37>
c00094e9:	8d 65 f4             	lea    esp,[ebp-0xc]
c00094ec:	5b                   	pop    ebx
c00094ed:	5e                   	pop    esi
c00094ee:	5f                   	pop    edi
c00094ef:	5d                   	pop    ebp
c00094f0:	c3                   	ret    

c00094f1 <memcmp>:
c00094f1:	55                   	push   ebp
c00094f2:	89 e5                	mov    ebp,esp
c00094f4:	56                   	push   esi
c00094f5:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
c00094f8:	53                   	push   ebx
c00094f9:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
c00094fc:	85 db                	test   ebx,ebx
c00094fe:	74 04                	je     c0009504 <memcmp+0x13>
c0009500:	85 f6                	test   esi,esi
c0009502:	75 19                	jne    c000951d <memcmp+0x2c>
c0009504:	68 06 b7 00 c0       	push   0xc000b706
c0009509:	68 34 b7 00 c0       	push   0xc000b734
c000950e:	6a 3b                	push   0x3b
c0009510:	68 da b6 00 c0       	push   0xc000b6da
c0009515:	e8 a2 eb ff ff       	call   c00080bc <panic_spin>
c000951a:	83 c4 10             	add    esp,0x10
c000951d:	8a 13                	mov    dl,BYTE PTR [ebx]
c000951f:	83 c8 ff             	or     eax,0xffffffff
c0009522:	38 16                	cmp    BYTE PTR [esi],dl
c0009524:	72 06                	jb     c000952c <memcmp+0x3b>
c0009526:	0f 97 c0             	seta   al
c0009529:	0f b6 c0             	movzx  eax,al
c000952c:	8d 65 f8             	lea    esp,[ebp-0x8]
c000952f:	5b                   	pop    ebx
c0009530:	5e                   	pop    esi
c0009531:	5d                   	pop    ebp
c0009532:	c3                   	ret    
	...

c0009534 <init_pit>:
c0009534:	55                   	push   ebp
c0009535:	89 e5                	mov    ebp,esp
c0009537:	83 ec 10             	sub    esp,0x10
c000953a:	6a 34                	push   0x34
c000953c:	6a 43                	push   0x43
c000953e:	e8 19 f9 ff ff       	call   c0008e5c <io_out8>
c0009543:	58                   	pop    eax
c0009544:	5a                   	pop    edx
c0009545:	68 9c 00 00 00       	push   0x9c
c000954a:	6a 40                	push   0x40
c000954c:	e8 0b f9 ff ff       	call   c0008e5c <io_out8>
c0009551:	59                   	pop    ecx
c0009552:	58                   	pop    eax
c0009553:	6a 2e                	push   0x2e
c0009555:	6a 40                	push   0x40
c0009557:	e8 00 f9 ff ff       	call   c0008e5c <io_out8>
c000955c:	83 c4 10             	add    esp,0x10
c000955f:	c9                   	leave  
c0009560:	c3                   	ret    

Disassembly of section .text.startup:

c0009561 <main>:
c0009561:	8d 4c 24 04          	lea    ecx,[esp+0x4]
c0009565:	83 e4 f0             	and    esp,0xfffffff0
c0009568:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
c000956b:	b8 05 00 00 00       	mov    eax,0x5
c0009570:	55                   	push   ebp
c0009571:	89 e5                	mov    ebp,esp
c0009573:	57                   	push   edi
c0009574:	56                   	push   esi
c0009575:	be 94 b3 00 c0       	mov    esi,0xc000b394
c000957a:	51                   	push   ecx
c000957b:	89 c1                	mov    ecx,eax
c000957d:	81 ec 88 00 00 00    	sub    esp,0x88
c0009583:	8d 7d 84             	lea    edi,[ebp-0x7c]
c0009586:	f3 a5                	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
c0009588:	8d 7d 98             	lea    edi,[ebp-0x68]
c000958b:	31 f6                	xor    esi,esi
c000958d:	89 c8                	mov    eax,ecx
c000958f:	b1 14                	mov    cl,0x14
c0009591:	f3 ab                	rep stos DWORD PTR es:[edi],eax
c0009593:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c0009598:	c1 e0 03             	shl    eax,0x3
c000959b:	50                   	push   eax
c000959c:	e8 80 fd ff ff       	call   c0009321 <set_cursor>
c00095a1:	83 c4 10             	add    esp,0x10
c00095a4:	0f b6 44 35 84       	movzx  eax,BYTE PTR [ebp+esi*1-0x7c]
c00095a9:	83 ec 0c             	sub    esp,0xc
c00095ac:	46                   	inc    esi
c00095ad:	50                   	push   eax
c00095ae:	e8 bd fd ff ff       	call   c0009370 <put_char>
c00095b3:	83 c4 10             	add    esp,0x10
c00095b6:	83 fe 64             	cmp    esi,0x64
c00095b9:	75 e9                	jne    c00095a4 <main+0x43>
c00095bb:	83 ec 0c             	sub    esp,0xc
c00095be:	6a 50                	push   0x50
c00095c0:	e8 ab fd ff ff       	call   c0009370 <put_char>
c00095c5:	c7 04 24 65 00 00 00 	mov    DWORD PTR [esp],0x65
c00095cc:	e8 9f fd ff ff       	call   c0009370 <put_char>
c00095d1:	c7 04 24 6e 00 00 00 	mov    DWORD PTR [esp],0x6e
c00095d8:	e8 93 fd ff ff       	call   c0009370 <put_char>
c00095dd:	c7 04 24 63 00 00 00 	mov    DWORD PTR [esp],0x63
c00095e4:	e8 87 fd ff ff       	call   c0009370 <put_char>
c00095e9:	c7 04 24 69 00 00 00 	mov    DWORD PTR [esp],0x69
c00095f0:	e8 7b fd ff ff       	call   c0009370 <put_char>
c00095f5:	c7 04 24 6c 00 00 00 	mov    DWORD PTR [esp],0x6c
c00095fc:	e8 6f fd ff ff       	call   c0009370 <put_char>
c0009601:	c7 04 24 2d 00 00 00 	mov    DWORD PTR [esp],0x2d
c0009608:	e8 63 fd ff ff       	call   c0009370 <put_char>
c000960d:	c7 04 24 4b 00 00 00 	mov    DWORD PTR [esp],0x4b
c0009614:	e8 57 fd ff ff       	call   c0009370 <put_char>
c0009619:	c7 04 24 65 00 00 00 	mov    DWORD PTR [esp],0x65
c0009620:	e8 4b fd ff ff       	call   c0009370 <put_char>
c0009625:	c7 04 24 72 00 00 00 	mov    DWORD PTR [esp],0x72
c000962c:	e8 3f fd ff ff       	call   c0009370 <put_char>
c0009631:	c7 04 24 6e 00 00 00 	mov    DWORD PTR [esp],0x6e
c0009638:	e8 33 fd ff ff       	call   c0009370 <put_char>
c000963d:	c7 04 24 65 00 00 00 	mov    DWORD PTR [esp],0x65
c0009644:	e8 27 fd ff ff       	call   c0009370 <put_char>
c0009649:	c7 04 24 6c 00 00 00 	mov    DWORD PTR [esp],0x6c
c0009650:	e8 1b fd ff ff       	call   c0009370 <put_char>
c0009655:	c7 04 24 20 00 00 00 	mov    DWORD PTR [esp],0x20
c000965c:	e8 0f fd ff ff       	call   c0009370 <put_char>
c0009661:	c7 04 24 62 00 00 00 	mov    DWORD PTR [esp],0x62
c0009668:	e8 03 fd ff ff       	call   c0009370 <put_char>
c000966d:	c7 04 24 75 00 00 00 	mov    DWORD PTR [esp],0x75
c0009674:	e8 f7 fc ff ff       	call   c0009370 <put_char>
c0009679:	c7 04 24 69 00 00 00 	mov    DWORD PTR [esp],0x69
c0009680:	e8 eb fc ff ff       	call   c0009370 <put_char>
c0009685:	c7 04 24 6c 00 00 00 	mov    DWORD PTR [esp],0x6c
c000968c:	e8 df fc ff ff       	call   c0009370 <put_char>
c0009691:	c7 04 24 64 00 00 00 	mov    DWORD PTR [esp],0x64
c0009698:	e8 d3 fc ff ff       	call   c0009370 <put_char>
c000969d:	c7 04 24 20 00 00 00 	mov    DWORD PTR [esp],0x20
c00096a4:	e8 c7 fc ff ff       	call   c0009370 <put_char>
c00096a9:	c7 04 24 30 00 00 00 	mov    DWORD PTR [esp],0x30
c00096b0:	e8 bb fc ff ff       	call   c0009370 <put_char>
c00096b5:	c7 04 24 2e 00 00 00 	mov    DWORD PTR [esp],0x2e
c00096bc:	e8 af fc ff ff       	call   c0009370 <put_char>
c00096c1:	c7 04 24 30 00 00 00 	mov    DWORD PTR [esp],0x30
c00096c8:	e8 a3 fc ff ff       	call   c0009370 <put_char>
c00096cd:	c7 04 24 2e 00 00 00 	mov    DWORD PTR [esp],0x2e
c00096d4:	e8 97 fc ff ff       	call   c0009370 <put_char>
c00096d9:	c7 04 24 30 00 00 00 	mov    DWORD PTR [esp],0x30
c00096e0:	e8 8b fc ff ff       	call   c0009370 <put_char>
c00096e5:	c7 04 24 20 00 00 00 	mov    DWORD PTR [esp],0x20
c00096ec:	e8 7f fc ff ff       	call   c0009370 <put_char>
c00096f1:	c7 04 24 74 00 00 00 	mov    DWORD PTR [esp],0x74
c00096f8:	e8 73 fc ff ff       	call   c0009370 <put_char>
c00096fd:	c7 04 24 0a 00 00 00 	mov    DWORD PTR [esp],0xa
c0009704:	e8 67 fc ff ff       	call   c0009370 <put_char>
c0009709:	e8 12 ec ff ff       	call   c0008320 <init_all>
c000970e:	83 c4 10             	add    esp,0x10
c0009711:	eb fe                	jmp    c0009711 <main+0x1b0>

Disassembly of section .data:

c0009718 <_data>:
	...

c0009720 <SectionCode32>:
c0009720:	ff                   	(bad)  
c0009721:	ff 00                	inc    DWORD PTR [eax]
c0009723:	00 00                	add    BYTE PTR [eax],al
c0009725:	98                   	cwde   
c0009726:	cf                   	iret   
	...

c0009728 <SectionData32>:
c0009728:	ff                   	(bad)  
c0009729:	ff 00                	inc    DWORD PTR [eax]
c000972b:	00 00                	add    BYTE PTR [eax],al
c000972d:	92                   	xchg   edx,eax
c000972e:	cf                   	iret   
	...

c0009730 <SectionVideo>:
c0009730:	07                   	pop    es
c0009731:	00 00                	add    BYTE PTR [eax],al
c0009733:	80 0b 92             	or     BYTE PTR [ebx],0x92
c0009736:	c0 00 00             	rol    BYTE PTR [eax],0x0
	...

c0009918 <gdt_ptr>:
c0009918:	1f                   	pop    ds
c0009919:	00 18                	add    BYTE PTR [eax],bl
c000991b:	97                   	xchg   edi,eax
c000991c:	00 c0                	add    al,al
	...

c0009920 <PKnFont>:
	...
c0009b30:	00 10                	add    BYTE PTR [eax],dl
c0009b32:	10 10                	adc    BYTE PTR [eax],dl
c0009b34:	10 10                	adc    BYTE PTR [eax],dl
c0009b36:	10 10                	adc    BYTE PTR [eax],dl
c0009b38:	10 10                	adc    BYTE PTR [eax],dl
c0009b3a:	00 00                	add    BYTE PTR [eax],al
c0009b3c:	10 10                	adc    BYTE PTR [eax],dl
c0009b3e:	00 00                	add    BYTE PTR [eax],al
c0009b40:	28 28                	sub    BYTE PTR [eax],ch
c0009b42:	28 00                	sub    BYTE PTR [eax],al
	...
c0009b50:	00 44 44 44          	add    BYTE PTR [esp+eax*2+0x44],al
c0009b54:	fe 44 44 44          	inc    BYTE PTR [esp+eax*2+0x44]
c0009b58:	44                   	inc    esp
c0009b59:	44                   	inc    esp
c0009b5a:	fe 44 44 44          	inc    BYTE PTR [esp+eax*2+0x44]
c0009b5e:	00 00                	add    BYTE PTR [eax],al
c0009b60:	10 3a                	adc    BYTE PTR [edx],bh
c0009b62:	56                   	push   esi
c0009b63:	92                   	xchg   edx,eax
c0009b64:	92                   	xchg   edx,eax
c0009b65:	90                   	nop
c0009b66:	50                   	push   eax
c0009b67:	38 14 12             	cmp    BYTE PTR [edx+edx*1],dl
c0009b6a:	92                   	xchg   edx,eax
c0009b6b:	92                   	xchg   edx,eax
c0009b6c:	d4 b8                	aam    0xb8
c0009b6e:	10 10                	adc    BYTE PTR [eax],dl
c0009b70:	62 92 94 94 68 08    	bound  edx,QWORD PTR [edx+0x8689494]
c0009b76:	10 10                	adc    BYTE PTR [eax],dl
c0009b78:	20 2c 52             	and    BYTE PTR [edx+edx*2],ch
c0009b7b:	52                   	push   edx
c0009b7c:	92                   	xchg   edx,eax
c0009b7d:	8c 00                	mov    WORD PTR [eax],es
c0009b7f:	00 00                	add    BYTE PTR [eax],al
c0009b81:	70 88                	jo     c0009b0b <PKnFont+0x1eb>
c0009b83:	88 88 90 60 47 a2    	mov    BYTE PTR [eax-0x5db89f70],cl
c0009b89:	92                   	xchg   edx,eax
c0009b8a:	8a 84 46 39 00 00 04 	mov    al,BYTE PTR [esi+eax*2+0x4000039]
c0009b91:	08 10                	or     BYTE PTR [eax],dl
	...
c0009b9f:	00 02                	add    BYTE PTR [edx],al
c0009ba1:	04 08                	add    al,0x8
c0009ba3:	08 10                	or     BYTE PTR [eax],dl
c0009ba5:	10 10                	adc    BYTE PTR [eax],dl
c0009ba7:	10 10                	adc    BYTE PTR [eax],dl
c0009ba9:	10 10                	adc    BYTE PTR [eax],dl
c0009bab:	08 08                	or     BYTE PTR [eax],cl
c0009bad:	04 02                	add    al,0x2
c0009baf:	00 80 40 20 20 10    	add    BYTE PTR [eax+0x10202040],al
c0009bb5:	10 10                	adc    BYTE PTR [eax],dl
c0009bb7:	10 10                	adc    BYTE PTR [eax],dl
c0009bb9:	10 10                	adc    BYTE PTR [eax],dl
c0009bbb:	20 20                	and    BYTE PTR [eax],ah
c0009bbd:	40                   	inc    eax
c0009bbe:	80 00 00             	add    BYTE PTR [eax],0x0
c0009bc1:	00 00                	add    BYTE PTR [eax],al
c0009bc3:	00 00                	add    BYTE PTR [eax],al
c0009bc5:	10 92 54 38 54 92    	adc    BYTE PTR [edx-0x6dabc7ac],dl
c0009bcb:	10 00                	adc    BYTE PTR [eax],al
	...
c0009bd5:	10 10                	adc    BYTE PTR [eax],dl
c0009bd7:	10 fe                	adc    dh,bh
c0009bd9:	10 10                	adc    BYTE PTR [eax],dl
c0009bdb:	10 00                	adc    BYTE PTR [eax],al
	...
c0009be9:	00 00                	add    BYTE PTR [eax],al
c0009beb:	18 18                	sbb    BYTE PTR [eax],bl
c0009bed:	08 08                	or     BYTE PTR [eax],cl
c0009bef:	10 00                	adc    BYTE PTR [eax],al
c0009bf1:	00 00                	add    BYTE PTR [eax],al
c0009bf3:	00 00                	add    BYTE PTR [eax],al
c0009bf5:	00 00                	add    BYTE PTR [eax],al
c0009bf7:	00 fe                	add    dh,bh
	...
c0009c09:	00 00                	add    BYTE PTR [eax],al
c0009c0b:	00 18                	add    BYTE PTR [eax],bl
c0009c0d:	18 00                	sbb    BYTE PTR [eax],al
c0009c0f:	00 02                	add    BYTE PTR [edx],al
c0009c11:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
c0009c14:	08 08                	or     BYTE PTR [eax],cl
c0009c16:	08 10                	or     BYTE PTR [eax],dl
c0009c18:	10 20                	adc    BYTE PTR [eax],ah
c0009c1a:	20 40 40             	and    BYTE PTR [eax+0x40],al
c0009c1d:	40                   	inc    eax
c0009c1e:	80 80 00 18 24 24 42 	add    BYTE PTR [eax+0x24241800],0x42
c0009c25:	42                   	inc    edx
c0009c26:	42                   	inc    edx
c0009c27:	42                   	inc    edx
c0009c28:	42                   	inc    edx
c0009c29:	42                   	inc    edx
c0009c2a:	42                   	inc    edx
c0009c2b:	24 24                	and    al,0x24
c0009c2d:	18 00                	sbb    BYTE PTR [eax],al
c0009c2f:	00 00                	add    BYTE PTR [eax],al
c0009c31:	08 18                	or     BYTE PTR [eax],bl
c0009c33:	28 08                	sub    BYTE PTR [eax],cl
c0009c35:	08 08                	or     BYTE PTR [eax],cl
c0009c37:	08 08                	or     BYTE PTR [eax],cl
c0009c39:	08 08                	or     BYTE PTR [eax],cl
c0009c3b:	08 08                	or     BYTE PTR [eax],cl
c0009c3d:	3e 00 00             	add    BYTE PTR ds:[eax],al
c0009c40:	00 18                	add    BYTE PTR [eax],bl
c0009c42:	24 42                	and    al,0x42
c0009c44:	42                   	inc    edx
c0009c45:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
c0009c48:	10 20                	adc    BYTE PTR [eax],ah
c0009c4a:	20 40 40             	and    BYTE PTR [eax+0x40],al
c0009c4d:	7e 00                	jle    c0009c4f <PKnFont+0x32f>
c0009c4f:	00 00                	add    BYTE PTR [eax],al
c0009c51:	18 24 42             	sbb    BYTE PTR [edx+eax*2],ah
c0009c54:	02 02                	add    al,BYTE PTR [edx]
c0009c56:	04 18                	add    al,0x18
c0009c58:	04 02                	add    al,0x2
c0009c5a:	02 42 24             	add    al,BYTE PTR [edx+0x24]
c0009c5d:	18 00                	sbb    BYTE PTR [eax],al
c0009c5f:	00 00                	add    BYTE PTR [eax],al
c0009c61:	0c 0c                	or     al,0xc
c0009c63:	0c 14                	or     al,0x14
c0009c65:	14 14                	adc    al,0x14
c0009c67:	24 24                	and    al,0x24
c0009c69:	44                   	inc    esp
c0009c6a:	7e 04                	jle    c0009c70 <PKnFont+0x350>
c0009c6c:	04 1e                	add    al,0x1e
c0009c6e:	00 00                	add    BYTE PTR [eax],al
c0009c70:	00 7c 40 40          	add    BYTE PTR [eax+eax*2+0x40],bh
c0009c74:	40                   	inc    eax
c0009c75:	58                   	pop    eax
c0009c76:	64 02 02             	add    al,BYTE PTR fs:[edx]
c0009c79:	02 02                	add    al,BYTE PTR [edx]
c0009c7b:	42                   	inc    edx
c0009c7c:	24 18                	and    al,0x18
c0009c7e:	00 00                	add    BYTE PTR [eax],al
c0009c80:	00 18                	add    BYTE PTR [eax],bl
c0009c82:	24 42                	and    al,0x42
c0009c84:	40                   	inc    eax
c0009c85:	58                   	pop    eax
c0009c86:	64 42                	fs inc edx
c0009c88:	42                   	inc    edx
c0009c89:	42                   	inc    edx
c0009c8a:	42                   	inc    edx
c0009c8b:	42                   	inc    edx
c0009c8c:	24 18                	and    al,0x18
c0009c8e:	00 00                	add    BYTE PTR [eax],al
c0009c90:	00 7e 42             	add    BYTE PTR [esi+0x42],bh
c0009c93:	42                   	inc    edx
c0009c94:	04 04                	add    al,0x4
c0009c96:	08 08                	or     BYTE PTR [eax],cl
c0009c98:	08 10                	or     BYTE PTR [eax],dl
c0009c9a:	10 10                	adc    BYTE PTR [eax],dl
c0009c9c:	10 38                	adc    BYTE PTR [eax],bh
c0009c9e:	00 00                	add    BYTE PTR [eax],al
c0009ca0:	00 18                	add    BYTE PTR [eax],bl
c0009ca2:	24 42                	and    al,0x42
c0009ca4:	42                   	inc    edx
c0009ca5:	42                   	inc    edx
c0009ca6:	24 18                	and    al,0x18
c0009ca8:	24 42                	and    al,0x42
c0009caa:	42                   	inc    edx
c0009cab:	42                   	inc    edx
c0009cac:	24 18                	and    al,0x18
c0009cae:	00 00                	add    BYTE PTR [eax],al
c0009cb0:	00 18                	add    BYTE PTR [eax],bl
c0009cb2:	24 42                	and    al,0x42
c0009cb4:	42                   	inc    edx
c0009cb5:	42                   	inc    edx
c0009cb6:	42                   	inc    edx
c0009cb7:	42                   	inc    edx
c0009cb8:	26 1a 02             	sbb    al,BYTE PTR es:[edx]
c0009cbb:	42                   	inc    edx
c0009cbc:	24 18                	and    al,0x18
c0009cbe:	00 00                	add    BYTE PTR [eax],al
c0009cc0:	00 00                	add    BYTE PTR [eax],al
c0009cc2:	00 00                	add    BYTE PTR [eax],al
c0009cc4:	00 18                	add    BYTE PTR [eax],bl
c0009cc6:	18 00                	sbb    BYTE PTR [eax],al
c0009cc8:	00 00                	add    BYTE PTR [eax],al
c0009cca:	00 00                	add    BYTE PTR [eax],al
c0009ccc:	18 18                	sbb    BYTE PTR [eax],bl
c0009cce:	00 00                	add    BYTE PTR [eax],al
c0009cd0:	00 00                	add    BYTE PTR [eax],al
c0009cd2:	00 00                	add    BYTE PTR [eax],al
c0009cd4:	00 18                	add    BYTE PTR [eax],bl
c0009cd6:	18 00                	sbb    BYTE PTR [eax],al
c0009cd8:	00 00                	add    BYTE PTR [eax],al
c0009cda:	00 18                	add    BYTE PTR [eax],bl
c0009cdc:	18 08                	sbb    BYTE PTR [eax],cl
c0009cde:	08 10                	or     BYTE PTR [eax],dl
c0009ce0:	00 02                	add    BYTE PTR [edx],al
c0009ce2:	04 08                	add    al,0x8
c0009ce4:	10 20                	adc    BYTE PTR [eax],ah
c0009ce6:	40                   	inc    eax
c0009ce7:	80 80 40 20 10 08 04 	add    BYTE PTR [eax+0x8102040],0x4
c0009cee:	02 00                	add    al,BYTE PTR [eax]
c0009cf0:	00 00                	add    BYTE PTR [eax],al
c0009cf2:	00 00                	add    BYTE PTR [eax],al
c0009cf4:	00 00                	add    BYTE PTR [eax],al
c0009cf6:	fe 00                	inc    BYTE PTR [eax]
c0009cf8:	00 fe                	add    dh,bh
c0009cfa:	00 00                	add    BYTE PTR [eax],al
c0009cfc:	00 00                	add    BYTE PTR [eax],al
c0009cfe:	00 00                	add    BYTE PTR [eax],al
c0009d00:	00 80 40 20 10 08    	add    BYTE PTR [eax+0x8102040],al
c0009d06:	04 02                	add    al,0x2
c0009d08:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
c0009d0b:	10 20                	adc    BYTE PTR [eax],ah
c0009d0d:	40                   	inc    eax
c0009d0e:	80 00 00             	add    BYTE PTR [eax],0x0
c0009d11:	38 44 82 82          	cmp    BYTE PTR [edx+eax*4-0x7e],al
c0009d15:	82                   	(bad)  
c0009d16:	04 08                	add    al,0x8
c0009d18:	10 10                	adc    BYTE PTR [eax],dl
c0009d1a:	00 00                	add    BYTE PTR [eax],al
c0009d1c:	18 18                	sbb    BYTE PTR [eax],bl
c0009d1e:	00 00                	add    BYTE PTR [eax],al
c0009d20:	00 38                	add    BYTE PTR [eax],bh
c0009d22:	44                   	inc    esp
c0009d23:	82                   	(bad)  
c0009d24:	9a aa aa aa aa aa 9c 	call   0x9caa:0xaaaaaaaa
c0009d2b:	80 46 38 00          	add    BYTE PTR [esi+0x38],0x0
c0009d2f:	00 00                	add    BYTE PTR [eax],al
c0009d31:	18 18                	sbb    BYTE PTR [eax],bl
c0009d33:	18 18                	sbb    BYTE PTR [eax],bl
c0009d35:	24 24                	and    al,0x24
c0009d37:	24 24                	and    al,0x24
c0009d39:	7e 42                	jle    c0009d7d <PKnFont+0x45d>
c0009d3b:	42                   	inc    edx
c0009d3c:	42                   	inc    edx
c0009d3d:	e7 00                	out    0x0,eax
c0009d3f:	00 00                	add    BYTE PTR [eax],al
c0009d41:	f0 48                	lock dec eax
c0009d43:	44                   	inc    esp
c0009d44:	44                   	inc    esp
c0009d45:	44                   	inc    esp
c0009d46:	48                   	dec    eax
c0009d47:	78 44                	js     c0009d8d <PKnFont+0x46d>
c0009d49:	42                   	inc    edx
c0009d4a:	42                   	inc    edx
c0009d4b:	42                   	inc    edx
c0009d4c:	44                   	inc    esp
c0009d4d:	f8                   	clc    
c0009d4e:	00 00                	add    BYTE PTR [eax],al
c0009d50:	00 3a                	add    BYTE PTR [edx],bh
c0009d52:	46                   	inc    esi
c0009d53:	42                   	inc    edx
c0009d54:	82                   	(bad)  
c0009d55:	80 80 80 80 80 82 42 	add    BYTE PTR [eax-0x7d7f7f80],0x42
c0009d5c:	44                   	inc    esp
c0009d5d:	38 00                	cmp    BYTE PTR [eax],al
c0009d5f:	00 00                	add    BYTE PTR [eax],al
c0009d61:	f8                   	clc    
c0009d62:	44                   	inc    esp
c0009d63:	44                   	inc    esp
c0009d64:	42                   	inc    edx
c0009d65:	42                   	inc    edx
c0009d66:	42                   	inc    edx
c0009d67:	42                   	inc    edx
c0009d68:	42                   	inc    edx
c0009d69:	42                   	inc    edx
c0009d6a:	42                   	inc    edx
c0009d6b:	44                   	inc    esp
c0009d6c:	44                   	inc    esp
c0009d6d:	f8                   	clc    
c0009d6e:	00 00                	add    BYTE PTR [eax],al
c0009d70:	00 fe                	add    dh,bh
c0009d72:	42                   	inc    edx
c0009d73:	42                   	inc    edx
c0009d74:	40                   	inc    eax
c0009d75:	40                   	inc    eax
c0009d76:	44                   	inc    esp
c0009d77:	7c 44                	jl     c0009dbd <PKnFont+0x49d>
c0009d79:	40                   	inc    eax
c0009d7a:	40                   	inc    eax
c0009d7b:	42                   	inc    edx
c0009d7c:	42                   	inc    edx
c0009d7d:	fe 00                	inc    BYTE PTR [eax]
c0009d7f:	00 00                	add    BYTE PTR [eax],al
c0009d81:	fe 42 42             	inc    BYTE PTR [edx+0x42]
c0009d84:	40                   	inc    eax
c0009d85:	40                   	inc    eax
c0009d86:	44                   	inc    esp
c0009d87:	7c 44                	jl     c0009dcd <PKnFont+0x4ad>
c0009d89:	44                   	inc    esp
c0009d8a:	40                   	inc    eax
c0009d8b:	40                   	inc    eax
c0009d8c:	40                   	inc    eax
c0009d8d:	f0 00 00             	lock add BYTE PTR [eax],al
c0009d90:	00 3a                	add    BYTE PTR [edx],bh
c0009d92:	46                   	inc    esi
c0009d93:	42                   	inc    edx
c0009d94:	82                   	(bad)  
c0009d95:	80 80 9e 82 82 82 42 	add    BYTE PTR [eax-0x7d7d7d62],0x42
c0009d9c:	46                   	inc    esi
c0009d9d:	38 00                	cmp    BYTE PTR [eax],al
c0009d9f:	00 00                	add    BYTE PTR [eax],al
c0009da1:	e7 42                	out    0x42,eax
c0009da3:	42                   	inc    edx
c0009da4:	42                   	inc    edx
c0009da5:	42                   	inc    edx
c0009da6:	42                   	inc    edx
c0009da7:	7e 42                	jle    c0009deb <PKnFont+0x4cb>
c0009da9:	42                   	inc    edx
c0009daa:	42                   	inc    edx
c0009dab:	42                   	inc    edx
c0009dac:	42                   	inc    edx
c0009dad:	e7 00                	out    0x0,eax
c0009daf:	00 00                	add    BYTE PTR [eax],al
c0009db1:	7c 10                	jl     c0009dc3 <PKnFont+0x4a3>
c0009db3:	10 10                	adc    BYTE PTR [eax],dl
c0009db5:	10 10                	adc    BYTE PTR [eax],dl
c0009db7:	10 10                	adc    BYTE PTR [eax],dl
c0009db9:	10 10                	adc    BYTE PTR [eax],dl
c0009dbb:	10 10                	adc    BYTE PTR [eax],dl
c0009dbd:	7c 00                	jl     c0009dbf <PKnFont+0x49f>
c0009dbf:	00 00                	add    BYTE PTR [eax],al
c0009dc1:	1f                   	pop    ds
c0009dc2:	04 04                	add    al,0x4
c0009dc4:	04 04                	add    al,0x4
c0009dc6:	04 04                	add    al,0x4
c0009dc8:	04 04                	add    al,0x4
c0009dca:	04 04                	add    al,0x4
c0009dcc:	84 48 30             	test   BYTE PTR [eax+0x30],cl
c0009dcf:	00 00                	add    BYTE PTR [eax],al
c0009dd1:	e7 42                	out    0x42,eax
c0009dd3:	44                   	inc    esp
c0009dd4:	48                   	dec    eax
c0009dd5:	50                   	push   eax
c0009dd6:	50                   	push   eax
c0009dd7:	60                   	pusha  
c0009dd8:	50                   	push   eax
c0009dd9:	50                   	push   eax
c0009dda:	48                   	dec    eax
c0009ddb:	44                   	inc    esp
c0009ddc:	42                   	inc    edx
c0009ddd:	e7 00                	out    0x0,eax
c0009ddf:	00 00                	add    BYTE PTR [eax],al
c0009de1:	f0 40                	lock inc eax
c0009de3:	40                   	inc    eax
c0009de4:	40                   	inc    eax
c0009de5:	40                   	inc    eax
c0009de6:	40                   	inc    eax
c0009de7:	40                   	inc    eax
c0009de8:	40                   	inc    eax
c0009de9:	40                   	inc    eax
c0009dea:	40                   	inc    eax
c0009deb:	42                   	inc    edx
c0009dec:	42                   	inc    edx
c0009ded:	fe 00                	inc    BYTE PTR [eax]
c0009def:	00 00                	add    BYTE PTR [eax],al
c0009df1:	c3                   	ret    
c0009df2:	42                   	inc    edx
c0009df3:	66 66 66 5a          	data16 data16 pop dx
c0009df7:	5a                   	pop    edx
c0009df8:	5a                   	pop    edx
c0009df9:	42                   	inc    edx
c0009dfa:	42                   	inc    edx
c0009dfb:	42                   	inc    edx
c0009dfc:	42                   	inc    edx
c0009dfd:	e7 00                	out    0x0,eax
c0009dff:	00 00                	add    BYTE PTR [eax],al
c0009e01:	c7 42 62 62 52 52 52 	mov    DWORD PTR [edx+0x62],0x52525262
c0009e08:	4a                   	dec    edx
c0009e09:	4a                   	dec    edx
c0009e0a:	4a                   	dec    edx
c0009e0b:	46                   	inc    esi
c0009e0c:	46                   	inc    esi
c0009e0d:	e2 00                	loop   c0009e0f <PKnFont+0x4ef>
c0009e0f:	00 00                	add    BYTE PTR [eax],al
c0009e11:	38 44 82 82          	cmp    BYTE PTR [edx+eax*4-0x7e],al
c0009e15:	82                   	(bad)  
c0009e16:	82                   	(bad)  
c0009e17:	82                   	(bad)  
c0009e18:	82                   	(bad)  
c0009e19:	82                   	(bad)  
c0009e1a:	82                   	(bad)  
c0009e1b:	82                   	(bad)  
c0009e1c:	44                   	inc    esp
c0009e1d:	38 00                	cmp    BYTE PTR [eax],al
c0009e1f:	00 00                	add    BYTE PTR [eax],al
c0009e21:	f8                   	clc    
c0009e22:	44                   	inc    esp
c0009e23:	42                   	inc    edx
c0009e24:	42                   	inc    edx
c0009e25:	42                   	inc    edx
c0009e26:	44                   	inc    esp
c0009e27:	78 40                	js     c0009e69 <PKnFont+0x549>
c0009e29:	40                   	inc    eax
c0009e2a:	40                   	inc    eax
c0009e2b:	40                   	inc    eax
c0009e2c:	40                   	inc    eax
c0009e2d:	f0 00 00             	lock add BYTE PTR [eax],al
c0009e30:	00 38                	add    BYTE PTR [eax],bh
c0009e32:	44                   	inc    esp
c0009e33:	82                   	(bad)  
c0009e34:	82                   	(bad)  
c0009e35:	82                   	(bad)  
c0009e36:	82                   	(bad)  
c0009e37:	82                   	(bad)  
c0009e38:	82                   	(bad)  
c0009e39:	82                   	(bad)  
c0009e3a:	92                   	xchg   edx,eax
c0009e3b:	8a 44 3a 00          	mov    al,BYTE PTR [edx+edi*1+0x0]
c0009e3f:	00 00                	add    BYTE PTR [eax],al
c0009e41:	fc                   	cld    
c0009e42:	42                   	inc    edx
c0009e43:	42                   	inc    edx
c0009e44:	42                   	inc    edx
c0009e45:	42                   	inc    edx
c0009e46:	7c 44                	jl     c0009e8c <PKnFont+0x56c>
c0009e48:	42                   	inc    edx
c0009e49:	42                   	inc    edx
c0009e4a:	42                   	inc    edx
c0009e4b:	42                   	inc    edx
c0009e4c:	42                   	inc    edx
c0009e4d:	e7 00                	out    0x0,eax
c0009e4f:	00 00                	add    BYTE PTR [eax],al
c0009e51:	3a 46 82             	cmp    al,BYTE PTR [esi-0x7e]
c0009e54:	82                   	(bad)  
c0009e55:	80 40 38 04          	add    BYTE PTR [eax+0x38],0x4
c0009e59:	02 82 82 c4 b8 00    	add    al,BYTE PTR [edx+0xb8c482]
c0009e5f:	00 00                	add    BYTE PTR [eax],al
c0009e61:	fe                   	(bad)  
c0009e62:	92                   	xchg   edx,eax
c0009e63:	92                   	xchg   edx,eax
c0009e64:	10 10                	adc    BYTE PTR [eax],dl
c0009e66:	10 10                	adc    BYTE PTR [eax],dl
c0009e68:	10 10                	adc    BYTE PTR [eax],dl
c0009e6a:	10 10                	adc    BYTE PTR [eax],dl
c0009e6c:	10 7c 00 00          	adc    BYTE PTR [eax+eax*1+0x0],bh
c0009e70:	00 e7                	add    bh,ah
c0009e72:	42                   	inc    edx
c0009e73:	42                   	inc    edx
c0009e74:	42                   	inc    edx
c0009e75:	42                   	inc    edx
c0009e76:	42                   	inc    edx
c0009e77:	42                   	inc    edx
c0009e78:	42                   	inc    edx
c0009e79:	42                   	inc    edx
c0009e7a:	42                   	inc    edx
c0009e7b:	42                   	inc    edx
c0009e7c:	24 3c                	and    al,0x3c
c0009e7e:	00 00                	add    BYTE PTR [eax],al
c0009e80:	00 e7                	add    bh,ah
c0009e82:	42                   	inc    edx
c0009e83:	42                   	inc    edx
c0009e84:	42                   	inc    edx
c0009e85:	42                   	inc    edx
c0009e86:	24 24                	and    al,0x24
c0009e88:	24 24                	and    al,0x24
c0009e8a:	18 18                	sbb    BYTE PTR [eax],bl
c0009e8c:	18 18                	sbb    BYTE PTR [eax],bl
c0009e8e:	00 00                	add    BYTE PTR [eax],al
c0009e90:	00 e7                	add    bh,ah
c0009e92:	42                   	inc    edx
c0009e93:	42                   	inc    edx
c0009e94:	42                   	inc    edx
c0009e95:	5a                   	pop    edx
c0009e96:	5a                   	pop    edx
c0009e97:	5a                   	pop    edx
c0009e98:	5a                   	pop    edx
c0009e99:	24 24                	and    al,0x24
c0009e9b:	24 24                	and    al,0x24
c0009e9d:	24 00                	and    al,0x0
c0009e9f:	00 00                	add    BYTE PTR [eax],al
c0009ea1:	e7 42                	out    0x42,eax
c0009ea3:	42                   	inc    edx
c0009ea4:	24 24                	and    al,0x24
c0009ea6:	24 18                	and    al,0x18
c0009ea8:	24 24                	and    al,0x24
c0009eaa:	24 42                	and    al,0x42
c0009eac:	42                   	inc    edx
c0009ead:	e7 00                	out    0x0,eax
c0009eaf:	00 00                	add    BYTE PTR [eax],al
c0009eb1:	ee                   	out    dx,al
c0009eb2:	44                   	inc    esp
c0009eb3:	44                   	inc    esp
c0009eb4:	44                   	inc    esp
c0009eb5:	28 28                	sub    BYTE PTR [eax],ch
c0009eb7:	28 10                	sub    BYTE PTR [eax],dl
c0009eb9:	10 10                	adc    BYTE PTR [eax],dl
c0009ebb:	10 10                	adc    BYTE PTR [eax],dl
c0009ebd:	7c 00                	jl     c0009ebf <PKnFont+0x59f>
c0009ebf:	00 00                	add    BYTE PTR [eax],al
c0009ec1:	fe 84 84 08 08 10 10 	inc    BYTE PTR [esp+eax*4+0x10100808]
c0009ec8:	20 20                	and    BYTE PTR [eax],ah
c0009eca:	40                   	inc    eax
c0009ecb:	42                   	inc    edx
c0009ecc:	82                   	(bad)  
c0009ecd:	fe 00                	inc    BYTE PTR [eax]
c0009ecf:	00 00                	add    BYTE PTR [eax],al
c0009ed1:	3e 20 20             	and    BYTE PTR ds:[eax],ah
c0009ed4:	20 20                	and    BYTE PTR [eax],ah
c0009ed6:	20 20                	and    BYTE PTR [eax],ah
c0009ed8:	20 20                	and    BYTE PTR [eax],ah
c0009eda:	20 20                	and    BYTE PTR [eax],ah
c0009edc:	20 20                	and    BYTE PTR [eax],ah
c0009ede:	3e 00 80 80 40 40 20 	add    BYTE PTR ds:[eax+0x20404080],al
c0009ee5:	20 20                	and    BYTE PTR [eax],ah
c0009ee7:	10 10                	adc    BYTE PTR [eax],dl
c0009ee9:	08 08                	or     BYTE PTR [eax],cl
c0009eeb:	04 04                	add    al,0x4
c0009eed:	04 02                	add    al,0x2
c0009eef:	02 00                	add    al,BYTE PTR [eax]
c0009ef1:	7c 04                	jl     c0009ef7 <PKnFont+0x5d7>
c0009ef3:	04 04                	add    al,0x4
c0009ef5:	04 04                	add    al,0x4
c0009ef7:	04 04                	add    al,0x4
c0009ef9:	04 04                	add    al,0x4
c0009efb:	04 04                	add    al,0x4
c0009efd:	04 7c                	add    al,0x7c
c0009eff:	00 00                	add    BYTE PTR [eax],al
c0009f01:	10 28                	adc    BYTE PTR [eax],ch
c0009f03:	44                   	inc    esp
c0009f04:	82                   	(bad)  
	...
c0009f1d:	00 fe                	add    dh,bh
c0009f1f:	00 10                	add    BYTE PTR [eax],dl
c0009f21:	08 04 00             	or     BYTE PTR [eax+eax*1],al
	...
c0009f34:	00 70 08             	add    BYTE PTR [eax+0x8],dh
c0009f37:	04 3c                	add    al,0x3c
c0009f39:	44                   	inc    esp
c0009f3a:	84 84 8c 76 00 00 c0 	test   BYTE PTR [esp+ecx*4-0x3fffff8a],al
c0009f41:	40                   	inc    eax
c0009f42:	40                   	inc    eax
c0009f43:	40                   	inc    eax
c0009f44:	40                   	inc    eax
c0009f45:	58                   	pop    eax
c0009f46:	64 42                	fs inc edx
c0009f48:	42                   	inc    edx
c0009f49:	42                   	inc    edx
c0009f4a:	42                   	inc    edx
c0009f4b:	42                   	inc    edx
c0009f4c:	64 58                	fs pop eax
c0009f4e:	00 00                	add    BYTE PTR [eax],al
c0009f50:	00 00                	add    BYTE PTR [eax],al
c0009f52:	00 00                	add    BYTE PTR [eax],al
c0009f54:	00 30                	add    BYTE PTR [eax],dh
c0009f56:	4c                   	dec    esp
c0009f57:	84 84 80 80 82 44 38 	test   BYTE PTR [eax+eax*4+0x38448280],al
c0009f5e:	00 00                	add    BYTE PTR [eax],al
c0009f60:	0c 04                	or     al,0x4
c0009f62:	04 04                	add    al,0x4
c0009f64:	04 34                	add    al,0x34
c0009f66:	4c                   	dec    esp
c0009f67:	84 84 84 84 84 4c 36 	test   BYTE PTR [esp+eax*4+0x364c8484],al
c0009f6e:	00 00                	add    BYTE PTR [eax],al
c0009f70:	00 00                	add    BYTE PTR [eax],al
c0009f72:	00 00                	add    BYTE PTR [eax],al
c0009f74:	00 38                	add    BYTE PTR [eax],bh
c0009f76:	44                   	inc    esp
c0009f77:	82                   	(bad)  
c0009f78:	82                   	(bad)  
c0009f79:	fc                   	cld    
c0009f7a:	80 82 42 3c 00 00 0e 	add    BYTE PTR [edx+0x3c42],0xe
c0009f81:	10 10                	adc    BYTE PTR [eax],dl
c0009f83:	10 10                	adc    BYTE PTR [eax],dl
c0009f85:	7c 10                	jl     c0009f97 <PKnFont+0x677>
c0009f87:	10 10                	adc    BYTE PTR [eax],dl
c0009f89:	10 10                	adc    BYTE PTR [eax],dl
c0009f8b:	10 10                	adc    BYTE PTR [eax],dl
c0009f8d:	7c 00                	jl     c0009f8f <PKnFont+0x66f>
c0009f8f:	00 00                	add    BYTE PTR [eax],al
c0009f91:	00 00                	add    BYTE PTR [eax],al
c0009f93:	00 00                	add    BYTE PTR [eax],al
c0009f95:	36 4c                	ss dec esp
c0009f97:	84 84 84 84 4c 34 04 	test   BYTE PTR [esp+eax*4+0x4344c84],al
c0009f9e:	04 38                	add    al,0x38
c0009fa0:	c0 40 40 40          	rol    BYTE PTR [eax+0x40],0x40
c0009fa4:	40                   	inc    eax
c0009fa5:	58                   	pop    eax
c0009fa6:	64 42                	fs inc edx
c0009fa8:	42                   	inc    edx
c0009fa9:	42                   	inc    edx
c0009faa:	42                   	inc    edx
c0009fab:	42                   	inc    edx
c0009fac:	42                   	inc    edx
c0009fad:	e3 00                	jecxz  c0009faf <PKnFont+0x68f>
c0009faf:	00 00                	add    BYTE PTR [eax],al
c0009fb1:	10 10                	adc    BYTE PTR [eax],dl
c0009fb3:	00 00                	add    BYTE PTR [eax],al
c0009fb5:	30 10                	xor    BYTE PTR [eax],dl
c0009fb7:	10 10                	adc    BYTE PTR [eax],dl
c0009fb9:	10 10                	adc    BYTE PTR [eax],dl
c0009fbb:	10 10                	adc    BYTE PTR [eax],dl
c0009fbd:	38 00                	cmp    BYTE PTR [eax],al
c0009fbf:	00 00                	add    BYTE PTR [eax],al
c0009fc1:	04 04                	add    al,0x4
c0009fc3:	00 00                	add    BYTE PTR [eax],al
c0009fc5:	0c 04                	or     al,0x4
c0009fc7:	04 04                	add    al,0x4
c0009fc9:	04 04                	add    al,0x4
c0009fcb:	04 04                	add    al,0x4
c0009fcd:	08 08                	or     BYTE PTR [eax],cl
c0009fcf:	30 c0                	xor    al,al
c0009fd1:	40                   	inc    eax
c0009fd2:	40                   	inc    eax
c0009fd3:	40                   	inc    eax
c0009fd4:	40                   	inc    eax
c0009fd5:	4e                   	dec    esi
c0009fd6:	44                   	inc    esp
c0009fd7:	48                   	dec    eax
c0009fd8:	50                   	push   eax
c0009fd9:	60                   	pusha  
c0009fda:	50                   	push   eax
c0009fdb:	48                   	dec    eax
c0009fdc:	44                   	inc    esp
c0009fdd:	e6 00                	out    0x0,al
c0009fdf:	00 30                	add    BYTE PTR [eax],dh
c0009fe1:	10 10                	adc    BYTE PTR [eax],dl
c0009fe3:	10 10                	adc    BYTE PTR [eax],dl
c0009fe5:	10 10                	adc    BYTE PTR [eax],dl
c0009fe7:	10 10                	adc    BYTE PTR [eax],dl
c0009fe9:	10 10                	adc    BYTE PTR [eax],dl
c0009feb:	10 10                	adc    BYTE PTR [eax],dl
c0009fed:	38 00                	cmp    BYTE PTR [eax],al
c0009fef:	00 00                	add    BYTE PTR [eax],al
c0009ff1:	00 00                	add    BYTE PTR [eax],al
c0009ff3:	00 00                	add    BYTE PTR [eax],al
c0009ff5:	f6                   	(bad)  
c0009ff6:	49                   	dec    ecx
c0009ff7:	49                   	dec    ecx
c0009ff8:	49                   	dec    ecx
c0009ff9:	49                   	dec    ecx
c0009ffa:	49                   	dec    ecx
c0009ffb:	49                   	dec    ecx
c0009ffc:	49                   	dec    ecx
c0009ffd:	db 00                	fild   DWORD PTR [eax]
c0009fff:	00 00                	add    BYTE PTR [eax],al
c000a001:	00 00                	add    BYTE PTR [eax],al
c000a003:	00 00                	add    BYTE PTR [eax],al
c000a005:	d8 64 42 42          	fsub   DWORD PTR [edx+eax*2+0x42]
c000a009:	42                   	inc    edx
c000a00a:	42                   	inc    edx
c000a00b:	42                   	inc    edx
c000a00c:	42                   	inc    edx
c000a00d:	e3 00                	jecxz  c000a00f <PKnFont+0x6ef>
c000a00f:	00 00                	add    BYTE PTR [eax],al
c000a011:	00 00                	add    BYTE PTR [eax],al
c000a013:	00 00                	add    BYTE PTR [eax],al
c000a015:	38 44 82 82          	cmp    BYTE PTR [edx+eax*4-0x7e],al
c000a019:	82                   	(bad)  
c000a01a:	82                   	(bad)  
c000a01b:	82                   	(bad)  
c000a01c:	44                   	inc    esp
c000a01d:	38 00                	cmp    BYTE PTR [eax],al
c000a01f:	00 00                	add    BYTE PTR [eax],al
c000a021:	00 00                	add    BYTE PTR [eax],al
c000a023:	00 d8                	add    al,bl
c000a025:	64 42                	fs inc edx
c000a027:	42                   	inc    edx
c000a028:	42                   	inc    edx
c000a029:	42                   	inc    edx
c000a02a:	42                   	inc    edx
c000a02b:	64 58                	fs pop eax
c000a02d:	40                   	inc    eax
c000a02e:	40                   	inc    eax
c000a02f:	e0 00                	loopne c000a031 <PKnFont+0x711>
c000a031:	00 00                	add    BYTE PTR [eax],al
c000a033:	00 34 4c             	add    BYTE PTR [esp+ecx*2],dh
c000a036:	84 84 84 84 84 4c 34 	test   BYTE PTR [esp+eax*4+0x344c8484],al
c000a03d:	04 04                	add    al,0x4
c000a03f:	0e                   	push   cs
c000a040:	00 00                	add    BYTE PTR [eax],al
c000a042:	00 00                	add    BYTE PTR [eax],al
c000a044:	00 dc                	add    ah,bl
c000a046:	62 42 40             	bound  eax,QWORD PTR [edx+0x40]
c000a049:	40                   	inc    eax
c000a04a:	40                   	inc    eax
c000a04b:	40                   	inc    eax
c000a04c:	40                   	inc    eax
c000a04d:	e0 00                	loopne c000a04f <PKnFont+0x72f>
c000a04f:	00 00                	add    BYTE PTR [eax],al
c000a051:	00 00                	add    BYTE PTR [eax],al
c000a053:	00 00                	add    BYTE PTR [eax],al
c000a055:	7a 86                	jp     c0009fdd <PKnFont+0x6bd>
c000a057:	82                   	(bad)  
c000a058:	c0 38 06             	sar    BYTE PTR [eax],0x6
c000a05b:	82                   	(bad)  
c000a05c:	c2 bc 00             	ret    0xbc
c000a05f:	00 00                	add    BYTE PTR [eax],al
c000a061:	00 10                	add    BYTE PTR [eax],dl
c000a063:	10 10                	adc    BYTE PTR [eax],dl
c000a065:	7c 10                	jl     c000a077 <PKnFont+0x757>
c000a067:	10 10                	adc    BYTE PTR [eax],dl
c000a069:	10 10                	adc    BYTE PTR [eax],dl
c000a06b:	10 10                	adc    BYTE PTR [eax],dl
c000a06d:	0e                   	push   cs
c000a06e:	00 00                	add    BYTE PTR [eax],al
c000a070:	00 00                	add    BYTE PTR [eax],al
c000a072:	00 00                	add    BYTE PTR [eax],al
c000a074:	00 c6                	add    dh,al
c000a076:	42                   	inc    edx
c000a077:	42                   	inc    edx
c000a078:	42                   	inc    edx
c000a079:	42                   	inc    edx
c000a07a:	42                   	inc    edx
c000a07b:	42                   	inc    edx
c000a07c:	46                   	inc    esi
c000a07d:	3b 00                	cmp    eax,DWORD PTR [eax]
c000a07f:	00 00                	add    BYTE PTR [eax],al
c000a081:	00 00                	add    BYTE PTR [eax],al
c000a083:	00 00                	add    BYTE PTR [eax],al
c000a085:	e7 42                	out    0x42,eax
c000a087:	42                   	inc    edx
c000a088:	42                   	inc    edx
c000a089:	24 24                	and    al,0x24
c000a08b:	24 18                	and    al,0x18
c000a08d:	18 00                	sbb    BYTE PTR [eax],al
c000a08f:	00 00                	add    BYTE PTR [eax],al
c000a091:	00 00                	add    BYTE PTR [eax],al
c000a093:	00 00                	add    BYTE PTR [eax],al
c000a095:	e7 42                	out    0x42,eax
c000a097:	42                   	inc    edx
c000a098:	5a                   	pop    edx
c000a099:	5a                   	pop    edx
c000a09a:	5a                   	pop    edx
c000a09b:	24 24                	and    al,0x24
c000a09d:	24 00                	and    al,0x0
c000a09f:	00 00                	add    BYTE PTR [eax],al
c000a0a1:	00 00                	add    BYTE PTR [eax],al
c000a0a3:	00 00                	add    BYTE PTR [eax],al
c000a0a5:	c6 44 28 28 10       	mov    BYTE PTR [eax+ebp*1+0x28],0x10
c000a0aa:	28 28                	sub    BYTE PTR [eax],ch
c000a0ac:	44                   	inc    esp
c000a0ad:	c6 00 00             	mov    BYTE PTR [eax],0x0
c000a0b0:	00 00                	add    BYTE PTR [eax],al
c000a0b2:	00 00                	add    BYTE PTR [eax],al
c000a0b4:	00 e7                	add    bh,ah
c000a0b6:	42                   	inc    edx
c000a0b7:	42                   	inc    edx
c000a0b8:	24 24                	and    al,0x24
c000a0ba:	24 18                	and    al,0x18
c000a0bc:	18 10                	sbb    BYTE PTR [eax],dl
c000a0be:	10 60 00             	adc    BYTE PTR [eax+0x0],ah
c000a0c1:	00 00                	add    BYTE PTR [eax],al
c000a0c3:	00 00                	add    BYTE PTR [eax],al
c000a0c5:	fe 82 84 08 10 20    	inc    BYTE PTR [edx+0x20100884]
c000a0cb:	42                   	inc    edx
c000a0cc:	82                   	(bad)  
c000a0cd:	fe 00                	inc    BYTE PTR [eax]
c000a0cf:	00 00                	add    BYTE PTR [eax],al
c000a0d1:	06                   	push   es
c000a0d2:	08 10                	or     BYTE PTR [eax],dl
c000a0d4:	10 10                	adc    BYTE PTR [eax],dl
c000a0d6:	10 60 10             	adc    BYTE PTR [eax+0x10],ah
c000a0d9:	10 10                	adc    BYTE PTR [eax],dl
c000a0db:	10 08                	adc    BYTE PTR [eax],cl
c000a0dd:	06                   	push   es
c000a0de:	00 00                	add    BYTE PTR [eax],al
c000a0e0:	10 10                	adc    BYTE PTR [eax],dl
c000a0e2:	10 10                	adc    BYTE PTR [eax],dl
c000a0e4:	10 10                	adc    BYTE PTR [eax],dl
c000a0e6:	10 10                	adc    BYTE PTR [eax],dl
c000a0e8:	10 10                	adc    BYTE PTR [eax],dl
c000a0ea:	10 10                	adc    BYTE PTR [eax],dl
c000a0ec:	10 10                	adc    BYTE PTR [eax],dl
c000a0ee:	10 10                	adc    BYTE PTR [eax],dl
c000a0f0:	00 60 10             	add    BYTE PTR [eax+0x10],ah
c000a0f3:	08 08                	or     BYTE PTR [eax],cl
c000a0f5:	08 08                	or     BYTE PTR [eax],cl
c000a0f7:	06                   	push   es
c000a0f8:	08 08                	or     BYTE PTR [eax],cl
c000a0fa:	08 08                	or     BYTE PTR [eax],cl
c000a0fc:	10 60 00             	adc    BYTE PTR [eax+0x0],ah
c000a0ff:	00 00                	add    BYTE PTR [eax],al
c000a101:	72 8c                	jb     c000a08f <PKnFont+0x76f>
	...

c000a920 <intr_entry_table>:
c000a920:	49                   	dec    ecx
c000a921:	83 00 c0             	add    DWORD PTR [eax],0xffffffc0
c000a924:	74 83                	je     c000a8a9 <PKnFont+0xf89>
c000a926:	00 c0                	add    al,al
c000a928:	9f                   	lahf   
c000a929:	83 00 c0             	add    DWORD PTR [eax],0xffffffc0
c000a92c:	ca 83 00             	retf   0x83
c000a92f:	c0                   	(bad)  
c000a930:	f5                   	cmc    
c000a931:	83 00 c0             	add    DWORD PTR [eax],0xffffffc0
c000a934:	20 84 00 c0 4b 84 00 	and    BYTE PTR [eax+eax*1+0x844bc0],al
c000a93b:	c0                   	(bad)  
c000a93c:	76 84                	jbe    c000a8c2 <PKnFont+0xfa2>
c000a93e:	00 c0                	add    al,al
c000a940:	a1 84 00 c0 c8       	mov    eax,ds:0xc8c00084
c000a945:	84 00                	test   BYTE PTR [eax],al
c000a947:	c0                   	(bad)  
c000a948:	f3 84 00             	repz test BYTE PTR [eax],al
c000a94b:	c0 1a 85             	rcr    BYTE PTR [edx],0x85
c000a94e:	00 c0                	add    al,al
c000a950:	41                   	inc    ecx
c000a951:	85 00                	test   DWORD PTR [eax],eax
c000a953:	c0 6c 85 00 c0       	shr    BYTE PTR [ebp+eax*4+0x0],0xc0
c000a958:	93                   	xchg   ebx,eax
c000a959:	85 00                	test   DWORD PTR [eax],eax
c000a95b:	c0 ba 85 00 c0 e5 85 	sar    BYTE PTR [edx-0x1a3fff7b],0x85
c000a962:	00 c0                	add    al,al
c000a964:	10 86 00 c0 37 86    	adc    BYTE PTR [esi-0x79c84000],al
c000a96a:	00 c0                	add    al,al
c000a96c:	62 86 00 c0 8d 86    	bound  eax,QWORD PTR [esi-0x79724000]
c000a972:	00 c0                	add    al,al
c000a974:	b8 86 00 c0 e3       	mov    eax,0xe3c00086
c000a979:	86 00                	xchg   BYTE PTR [eax],al
c000a97b:	c0 0e 87             	ror    BYTE PTR [esi],0x87
c000a97e:	00 c0                	add    al,al
c000a980:	39 87 00 c0 60 87    	cmp    DWORD PTR [edi-0x789f4000],eax
c000a986:	00 c0                	add    al,al
c000a988:	8b 87 00 c0 b2 87    	mov    eax,DWORD PTR [edi-0x784d4000]
c000a98e:	00 c0                	add    al,al
c000a990:	d9 87 00 c0 04 88    	fld    DWORD PTR [edi-0x77fb4000]
c000a996:	00 c0                	add    al,al
c000a998:	2b 88 00 c0 52 88    	sub    ecx,DWORD PTR [eax-0x77ad4000]
c000a99e:	00 c0                	add    al,al
c000a9a0:	7d 88                	jge    c000a92a <intr_entry_table+0xa>
c000a9a2:	00 c0                	add    al,al
c000a9a4:	a8 88                	test   al,0x88
c000a9a6:	00 c0                	add    al,al
c000a9a8:	d3 88 00 c0 fe 88    	ror    DWORD PTR [eax-0x77014000],cl
c000a9ae:	00 c0                	add    al,al
c000a9b0:	29 89 00 c0 54 89    	sub    DWORD PTR [ecx-0x76ab4000],ecx
c000a9b6:	00 c0                	add    al,al
c000a9b8:	7f 89                	jg     c000a943 <intr_entry_table+0x23>
c000a9ba:	00 c0                	add    al,al
c000a9bc:	aa                   	stos   BYTE PTR es:[edi],al
c000a9bd:	89 00                	mov    DWORD PTR [eax],eax
c000a9bf:	c0 d5 89             	rcl    ch,0x89
c000a9c2:	00 c0                	add    al,al
c000a9c4:	00 8a 00 c0 2b 8a    	add    BYTE PTR [edx-0x75d44000],cl
c000a9ca:	00 c0                	add    al,al
c000a9cc:	56                   	push   esi
c000a9cd:	8a 00                	mov    al,BYTE PTR [eax]
c000a9cf:	c0 81 8a 00 c0 ac 8a 	rol    BYTE PTR [ecx-0x533fff76],0x8a
c000a9d6:	00 c0                	add    al,al
c000a9d8:	d7                   	xlat   BYTE PTR ds:[ebx]
c000a9d9:	8a 00                	mov    al,BYTE PTR [eax]
c000a9db:	c0 02 8b             	rol    BYTE PTR [edx],0x8b
c000a9de:	00 c0                	add    al,al

Disassembly of section .eh_frame:

c000a9e0 <.eh_frame>:
c000a9e0:	10 00                	adc    BYTE PTR [eax],al
c000a9e2:	00 00                	add    BYTE PTR [eax],al
c000a9e4:	00 00                	add    BYTE PTR [eax],al
c000a9e6:	00 00                	add    BYTE PTR [eax],al
c000a9e8:	01 00                	add    DWORD PTR [eax],eax
c000a9ea:	01 7c 08 0c          	add    DWORD PTR [eax+ecx*1+0xc],edi
c000a9ee:	04 04                	add    al,0x4
c000a9f0:	88 01                	mov    BYTE PTR [ecx],al
c000a9f2:	00 00                	add    BYTE PTR [eax],al
c000a9f4:	44                   	inc    esp
c000a9f5:	00 00                	add    BYTE PTR [eax],al
c000a9f7:	00 18                	add    BYTE PTR [eax],bl
c000a9f9:	00 00                	add    BYTE PTR [eax],al
c000a9fb:	00 61 95             	add    BYTE PTR [ecx-0x6b],ah
c000a9fe:	00 c0                	add    al,al
c000aa00:	b2 01                	mov    dl,0x1
c000aa02:	00 00                	add    BYTE PTR [eax],al
c000aa04:	44                   	inc    esp
c000aa05:	0c 01                	or     al,0x1
c000aa07:	00 4c 10 05          	add    BYTE PTR [eax+edx*1+0x5],cl
c000aa0b:	02 75 00             	add    dh,BYTE PTR [ebp+0x0]
c000aa0e:	44                   	inc    esp
c000aa0f:	10 06                	adc    BYTE PTR [esi],al
c000aa11:	02 75 78             	add    dh,BYTE PTR [ebp+0x78]
c000aa14:	10 07                	adc    BYTE PTR [edi],al
c000aa16:	02 75 7c             	add    dh,BYTE PTR [ebp+0x7c]
c000aa19:	46                   	inc    esi
c000aa1a:	0f 03 75 74          	lsl    esi,WORD PTR [ebp+0x74]
c000aa1e:	06                   	push   es
c000aa1f:	48                   	dec    eax
c000aa20:	2e 0c 59             	cs or  al,0x59
c000aa23:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000aa27:	00 48 2e             	add    BYTE PTR [eax+0x2e],cl
c000aa2a:	0c 42                	or     al,0x42
c000aa2c:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000aa30:	00 48 2e             	add    BYTE PTR [eax+0x2e],cl
c000aa33:	0c 42                	or     al,0x42
c000aa35:	2e 10 03             	adc    BYTE PTR cs:[ebx],al
c000aa38:	51                   	push   ecx
c000aa39:	01 2e                	add    DWORD PTR [esi],ebp
c000aa3b:	00 2c 00             	add    BYTE PTR [eax+eax*1],ch
c000aa3e:	00 00                	add    BYTE PTR [eax],al
c000aa40:	60                   	pusha  
c000aa41:	00 00                	add    BYTE PTR [eax],al
c000aa43:	00 58 7f             	add    BYTE PTR [eax+0x7f],bl
c000aa46:	00 c0                	add    al,al
c000aa48:	1a 00                	sbb    al,BYTE PTR [eax]
c000aa4a:	00 00                	add    BYTE PTR [eax],al
c000aa4c:	41                   	inc    ecx
c000aa4d:	0e                   	push   cs
c000aa4e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000aa54:	43                   	inc    ebx
c000aa55:	2e 04 04             	cs add al,0x4
c000aa58:	05 00 00 00 2e       	add    eax,0x2e000000
c000aa5d:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000aa60:	0c 43                	or     al,0x43
c000aa62:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000aa66:	00 41 c5             	add    BYTE PTR [ecx-0x3b],al
c000aa69:	0c 04                	or     al,0x4
c000aa6b:	04 1c                	add    al,0x1c
c000aa6d:	00 00                	add    BYTE PTR [eax],al
c000aa6f:	00 90 00 00 00 72    	add    BYTE PTR [eax+0x72000000],dl
c000aa75:	7f 00                	jg     c000aa77 <_edata+0x97>
c000aa77:	c0 23 00             	shl    BYTE PTR [ebx],0x0
c000aa7a:	00 00                	add    BYTE PTR [eax],al
c000aa7c:	41                   	inc    ecx
c000aa7d:	0e                   	push   cs
c000aa7e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000aa84:	47                   	inc    edi
c000aa85:	0c 04                	or     al,0x4
c000aa87:	04 c5                	add    al,0xc5
c000aa89:	00 00                	add    BYTE PTR [eax],al
c000aa8b:	00 50 00             	add    BYTE PTR [eax+0x0],dl
c000aa8e:	00 00                	add    BYTE PTR [eax],al
c000aa90:	b0 00                	mov    al,0x0
c000aa92:	00 00                	add    BYTE PTR [eax],al
c000aa94:	95                   	xchg   ebp,eax
c000aa95:	7f 00                	jg     c000aa97 <_edata+0xb7>
c000aa97:	c0 be 00 00 00 41 0e 	sar    BYTE PTR [esi+0x41000000],0xe
c000aa9e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000aaa4:	42                   	inc    edx
c000aaa5:	86 04 87             	xchg   BYTE PTR [edi+eax*4],al
c000aaa8:	03 46 83             	add    eax,DWORD PTR [esi-0x7d]
c000aaab:	05 5c 2e 04 04       	add    eax,0x4042e5c
c000aab0:	05 00 00 00 2e       	add    eax,0x2e000000
c000aab5:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000aab8:	0c 45                	or     al,0x45
c000aaba:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000aabe:	00 02                	add    BYTE PTR [edx],al
c000aac0:	4e                   	dec    esi
c000aac1:	2e 04 04             	cs add al,0x4
c000aac4:	02 00                	add    al,BYTE PTR [eax]
c000aac6:	00 00                	add    BYTE PTR [eax],al
c000aac8:	2e 08 41 2e          	or     BYTE PTR cs:[ecx+0x2e],al
c000aacc:	0c 41                	or     al,0x41
c000aace:	2e 10 4b 2e          	adc    BYTE PTR cs:[ebx+0x2e],cl
c000aad2:	00 62 c3             	add    BYTE PTR [edx-0x3d],ah
c000aad5:	41                   	inc    ecx
c000aad6:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000aada:	0c 04                	or     al,0x4
c000aadc:	04 c5                	add    al,0xc5
c000aade:	00 00                	add    BYTE PTR [eax],al
c000aae0:	3c 00                	cmp    al,0x0
c000aae2:	00 00                	add    BYTE PTR [eax],al
c000aae4:	04 01                	add    al,0x1
c000aae6:	00 00                	add    BYTE PTR [eax],al
c000aae8:	53                   	push   ebx
c000aae9:	80 00 c0             	add    BYTE PTR [eax],0xc0
c000aaec:	68 00 00 00 41       	push   0x41000000
c000aaf1:	0e                   	push   cs
c000aaf2:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000aaf8:	46                   	inc    esi
c000aaf9:	83 05 86 04 87 03 53 	add    DWORD PTR ds:0x3870486,0x53
c000ab00:	2e 04 04             	cs add al,0x4
c000ab03:	05 00 00 00 2e       	add    eax,0x2e000000
c000ab08:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000ab0b:	0c 45                	or     al,0x45
c000ab0d:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000ab11:	00 74 c3 41          	add    BYTE PTR [ebx+eax*8+0x41],dh
c000ab15:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000ab19:	0c 04                	or     al,0x4
c000ab1b:	04 c5                	add    al,0xc5
c000ab1d:	00 00                	add    BYTE PTR [eax],al
c000ab1f:	00 38                	add    BYTE PTR [eax],bh
c000ab21:	00 00                	add    BYTE PTR [eax],al
c000ab23:	00 44 01 00          	add    BYTE PTR [ecx+eax*1+0x0],al
c000ab27:	00 bc 80 00 c0 a1 00 	add    BYTE PTR [eax+eax*4+0xa1c000],bh
c000ab2e:	00 00                	add    BYTE PTR [eax],al
c000ab30:	41                   	inc    ecx
c000ab31:	0e                   	push   cs
c000ab32:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ab38:	4b                   	dec    ebx
c000ab39:	2e 0c 45             	cs or  al,0x45
c000ab3c:	2e 10 52 2e          	adc    BYTE PTR cs:[edx+0x2e],dl
c000ab40:	0c 43                	or     al,0x43
c000ab42:	2e 10 5e 2e          	adc    BYTE PTR cs:[esi+0x2e],bl
c000ab46:	0c 43                	or     al,0x43
c000ab48:	2e 10 5e 2e          	adc    BYTE PTR cs:[esi+0x2e],bl
c000ab4c:	0c 43                	or     al,0x43
c000ab4e:	2e 10 5e 2e          	adc    BYTE PTR cs:[esi+0x2e],bl
c000ab52:	0c 43                	or     al,0x43
c000ab54:	2e 10 54 2e 00       	adc    BYTE PTR cs:[esi+ebp*1+0x0],dl
c000ab59:	00 00                	add    BYTE PTR [eax],al
c000ab5b:	00 28                	add    BYTE PTR [eax],ch
c000ab5d:	00 00                	add    BYTE PTR [eax],al
c000ab5f:	00 80 01 00 00 60    	add    BYTE PTR [eax+0x60000001],al
c000ab65:	81 00 c0 4d 00 00    	add    DWORD PTR [eax],0x4dc0
c000ab6b:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000ab6e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ab74:	49                   	dec    ecx
c000ab75:	83 05 86 04 87 03 7d 	add    DWORD PTR ds:0x3870486,0x7d
c000ab7c:	c3                   	ret    
c000ab7d:	41                   	inc    ecx
c000ab7e:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000ab82:	0c 04                	or     al,0x4
c000ab84:	04 c5                	add    al,0xc5
c000ab86:	00 00                	add    BYTE PTR [eax],al
c000ab88:	1c 00                	sbb    al,0x0
c000ab8a:	00 00                	add    BYTE PTR [eax],al
c000ab8c:	ac                   	lods   al,BYTE PTR ds:[esi]
c000ab8d:	01 00                	add    DWORD PTR [eax],eax
c000ab8f:	00 ad 81 00 c0 25    	add    BYTE PTR [ebp+0x25c00081],ch
c000ab95:	00 00                	add    BYTE PTR [eax],al
c000ab97:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000ab9a:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000aba0:	61                   	popa   
c000aba1:	0c 04                	or     al,0x4
c000aba3:	04 c5                	add    al,0xc5
c000aba5:	00 00                	add    BYTE PTR [eax],al
c000aba7:	00 a0 00 00 00 cc    	add    BYTE PTR [eax-0x34000000],ah
c000abad:	01 00                	add    DWORD PTR [eax],eax
c000abaf:	00 d2                	add    dl,dl
c000abb1:	81 00 c0 e5 00 00    	add    DWORD PTR [eax],0xe5c0
c000abb7:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000abba:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000abc0:	41                   	inc    ecx
c000abc1:	83 03 71             	add    DWORD PTR [ebx],0x71
c000abc4:	2e 04 04             	cs add al,0x4
c000abc7:	06                   	push   es
c000abc8:	00 00                	add    BYTE PTR [eax],al
c000abca:	00 2e                	add    BYTE PTR [esi],ch
c000abcc:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000abcf:	0c 42                	or     al,0x42
c000abd1:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000abd5:	14 41                	adc    al,0x41
c000abd7:	2e 18 4b 2e          	sbb    BYTE PTR cs:[ebx+0x2e],cl
c000abdb:	1c 49                	sbb    al,0x49
c000abdd:	2e 20 41 2e          	and    BYTE PTR cs:[ecx+0x2e],al
c000abe1:	24 42                	and    al,0x42
c000abe3:	2e 28 45 2e          	sub    BYTE PTR cs:[ebp+0x2e],al
c000abe7:	2c 41                	sub    al,0x41
c000abe9:	2e 30 4d 2e          	xor    BYTE PTR cs:[ebp+0x2e],cl
c000abed:	00 47 2e             	add    BYTE PTR [edi+0x2e],al
c000abf0:	04 04                	add    al,0x4
c000abf2:	02 00                	add    al,BYTE PTR [eax]
c000abf4:	00 00                	add    BYTE PTR [eax],al
c000abf6:	2e 08 41 2e          	or     BYTE PTR cs:[ecx+0x2e],al
c000abfa:	0c 42                	or     al,0x42
c000abfc:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000ac00:	14 41                	adc    al,0x41
c000ac02:	2e 18 51 2e          	sbb    BYTE PTR cs:[ecx+0x2e],dl
c000ac06:	1c 42                	sbb    al,0x42
c000ac08:	2e 20 41 2e          	and    BYTE PTR cs:[ecx+0x2e],al
c000ac0c:	24 42                	and    al,0x42
c000ac0e:	2e 28 45 2e          	sub    BYTE PTR cs:[ebp+0x2e],al
c000ac12:	2c 41                	sub    al,0x41
c000ac14:	2e 30 4d 2e          	xor    BYTE PTR cs:[ebp+0x2e],cl
c000ac18:	00 47 2e             	add    BYTE PTR [edi+0x2e],al
c000ac1b:	04 04                	add    al,0x4
c000ac1d:	02 00                	add    al,BYTE PTR [eax]
c000ac1f:	00 00                	add    BYTE PTR [eax],al
c000ac21:	2e 08 41 2e          	or     BYTE PTR cs:[ecx+0x2e],al
c000ac25:	0c 42                	or     al,0x42
c000ac27:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000ac2b:	14 41                	adc    al,0x41
c000ac2d:	2e 18 51 2e          	sbb    BYTE PTR cs:[ecx+0x2e],dl
c000ac31:	1c 42                	sbb    al,0x42
c000ac33:	2e 20 41 2e          	and    BYTE PTR cs:[ecx+0x2e],al
c000ac37:	24 42                	and    al,0x42
c000ac39:	2e 28 45 2e          	sub    BYTE PTR cs:[ebp+0x2e],al
c000ac3d:	2c 41                	sub    al,0x41
c000ac3f:	2e 30 48 2e          	xor    BYTE PTR cs:[eax+0x2e],cl
c000ac43:	00 44 c5 0c          	add    BYTE PTR [ebp+eax*8+0xc],al
c000ac47:	04 04                	add    al,0x4
c000ac49:	c3                   	ret    
c000ac4a:	00 00                	add    BYTE PTR [eax],al
c000ac4c:	34 00                	xor    al,0x0
c000ac4e:	00 00                	add    BYTE PTR [eax],al
c000ac50:	70 02                	jo     c000ac54 <_edata+0x274>
c000ac52:	00 00                	add    BYTE PTR [eax],al
c000ac54:	b7 82                	mov    bh,0x82
c000ac56:	00 c0                	add    al,al
c000ac58:	69 00 00 00 41 0e    	imul   eax,DWORD PTR [eax],0xe410000
c000ac5e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ac64:	02 45 2e             	add    al,BYTE PTR [ebp+0x2e]
c000ac67:	04 04                	add    al,0x4
c000ac69:	0c 00                	or     al,0x0
c000ac6b:	00 00                	add    BYTE PTR [eax],al
c000ac6d:	2e 08 41 2e          	or     BYTE PTR cs:[ecx+0x2e],al
c000ac71:	0c 41                	or     al,0x41
c000ac73:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000ac77:	14 44                	adc    al,0x44
c000ac79:	2e 18 48 2e          	sbb    BYTE PTR cs:[eax+0x2e],cl
c000ac7d:	00 41 c5             	add    BYTE PTR [ecx-0x3b],al
c000ac80:	0c 04                	or     al,0x4
c000ac82:	04 00                	add    al,0x0
c000ac84:	1c 00                	sbb    al,0x0
c000ac86:	00 00                	add    BYTE PTR [eax],al
c000ac88:	a8 02                	test   al,0x2
c000ac8a:	00 00                	add    BYTE PTR [eax],al
c000ac8c:	20 83 00 c0 16 00    	and    BYTE PTR [ebx+0x16c000],al
c000ac92:	00 00                	add    BYTE PTR [eax],al
c000ac94:	41                   	inc    ecx
c000ac95:	0e                   	push   cs
c000ac96:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ac9c:	4e                   	dec    esi
c000ac9d:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
c000aca0:	04 00                	add    al,0x0
c000aca2:	00 00                	add    BYTE PTR [eax],al
c000aca4:	40                   	inc    eax
c000aca5:	00 00                	add    BYTE PTR [eax],al
c000aca7:	00 c8                	add    al,cl
c000aca9:	02 00                	add    al,BYTE PTR [eax]
c000acab:	00 30                	add    BYTE PTR [eax],dh
c000acad:	8b 00                	mov    eax,DWORD PTR [eax]
c000acaf:	c0 69 00 00          	shr    BYTE PTR [ecx+0x0],0x0
c000acb3:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000acb6:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000acbc:	44                   	inc    esp
c000acbd:	2e 08 83 03 45 2e 0c 	or     BYTE PTR cs:[ebx+0xc2e4503],al
c000acc4:	45                   	inc    ebp
c000acc5:	2e 10 49 2e          	adc    BYTE PTR cs:[ecx+0x2e],cl
c000acc9:	0c 41                	or     al,0x41
c000accb:	2e 08 42 2e          	or     BYTE PTR cs:[edx+0x2e],al
c000accf:	0c 42                	or     al,0x42
c000acd1:	2e 10 6c 2e 00       	adc    BYTE PTR cs:[esi+ebp*1+0x0],ch
c000acd6:	54                   	push   esp
c000acd7:	0a c5                	or     al,ch
c000acd9:	0c 04                	or     al,0x4
c000acdb:	04 c3                	add    al,0xc3
c000acdd:	45                   	inc    ebp
c000acde:	0b 44 c5 0c          	or     eax,DWORD PTR [ebp+eax*8+0xc]
c000ace2:	04 04                	add    al,0x4
c000ace4:	c3                   	ret    
c000ace5:	00 00                	add    BYTE PTR [eax],al
c000ace7:	00 94 00 00 00 0c 03 	add    BYTE PTR [eax+eax*1+0x30c0000],dl
c000acee:	00 00                	add    BYTE PTR [eax],al
c000acf0:	99                   	cdq    
c000acf1:	8b 00                	mov    eax,DWORD PTR [eax]
c000acf3:	c0 8c 00 00 00 41 0e 	ror    BYTE PTR [eax+eax*1+0xe410000],0x8
c000acfa:	08 
c000acfb:	85 02                	test   DWORD PTR [edx],eax
c000acfd:	42                   	inc    edx
c000acfe:	0d 05 43 2e 08       	or     eax,0x82e4305
c000ad03:	42                   	inc    edx
c000ad04:	2e 0c 42             	cs or  al,0x42
c000ad07:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000ad0b:	0c 41                	or     al,0x41
c000ad0d:	2e 08 42 2e          	or     BYTE PTR cs:[edx+0x2e],al
c000ad11:	0c 42                	or     al,0x42
c000ad13:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000ad17:	0c 41                	or     al,0x41
c000ad19:	2e 08 42 2e          	or     BYTE PTR cs:[edx+0x2e],al
c000ad1d:	0c 42                	or     al,0x42
c000ad1f:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000ad23:	0c 41                	or     al,0x41
c000ad25:	2e 08 42 2e          	or     BYTE PTR cs:[edx+0x2e],al
c000ad29:	0c 42                	or     al,0x42
c000ad2b:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000ad2f:	0c 41                	or     al,0x41
c000ad31:	2e 08 42 2e          	or     BYTE PTR cs:[edx+0x2e],al
c000ad35:	0c 45                	or     al,0x45
c000ad37:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000ad3b:	0c 41                	or     al,0x41
c000ad3d:	2e 08 42 2e          	or     BYTE PTR cs:[edx+0x2e],al
c000ad41:	0c 45                	or     al,0x45
c000ad43:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000ad47:	0c 41                	or     al,0x41
c000ad49:	2e 08 42 2e          	or     BYTE PTR cs:[edx+0x2e],al
c000ad4d:	0c 45                	or     al,0x45
c000ad4f:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000ad53:	0c 41                	or     al,0x41
c000ad55:	2e 08 42 2e          	or     BYTE PTR cs:[edx+0x2e],al
c000ad59:	0c 45                	or     al,0x45
c000ad5b:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000ad5f:	0c 41                	or     al,0x41
c000ad61:	2e 08 45 2e          	or     BYTE PTR cs:[ebp+0x2e],al
c000ad65:	0c 42                	or     al,0x42
c000ad67:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000ad6b:	0c 41                	or     al,0x41
c000ad6d:	2e 08 45 2e          	or     BYTE PTR cs:[ebp+0x2e],al
c000ad71:	0c 45                	or     al,0x45
c000ad73:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000ad77:	00 41 c5             	add    BYTE PTR [ecx-0x3b],al
c000ad7a:	0c 04                	or     al,0x4
c000ad7c:	04 00                	add    al,0x0
c000ad7e:	00 00                	add    BYTE PTR [eax],al
c000ad80:	1c 00                	sbb    al,0x0
c000ad82:	00 00                	add    BYTE PTR [eax],al
c000ad84:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
c000ad85:	03 00                	add    eax,DWORD PTR [eax]
c000ad87:	00 25 8c 00 c0 38    	add    BYTE PTR ds:0x38c0008c,ah
c000ad8d:	00 00                	add    BYTE PTR [eax],al
c000ad8f:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000ad92:	08 85 02 44 0d 05    	or     BYTE PTR [ebp+0x50d4402],al
c000ad98:	72 0c                	jb     c000ada6 <_edata+0x3c6>
c000ad9a:	04 04                	add    al,0x4
c000ad9c:	c5 00                	lds    eax,FWORD PTR [eax]
c000ad9e:	00 00                	add    BYTE PTR [eax],al
c000ada0:	20 00                	and    BYTE PTR [eax],al
c000ada2:	00 00                	add    BYTE PTR [eax],al
c000ada4:	c4 03                	les    eax,FWORD PTR [ebx]
c000ada6:	00 00                	add    BYTE PTR [eax],al
c000ada8:	5d                   	pop    ebp
c000ada9:	8c 00                	mov    WORD PTR [eax],es
c000adab:	c0 2c 00 00          	shr    BYTE PTR [eax+eax*1],0x0
c000adaf:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000adb2:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000adb8:	44                   	inc    esp
c000adb9:	83 03 63             	add    DWORD PTR [ebx],0x63
c000adbc:	c3                   	ret    
c000adbd:	41                   	inc    ecx
c000adbe:	0c 04                	or     al,0x4
c000adc0:	04 c5                	add    al,0xc5
c000adc2:	00 00                	add    BYTE PTR [eax],al
c000adc4:	1c 00                	sbb    al,0x0
c000adc6:	00 00                	add    BYTE PTR [eax],al
c000adc8:	e8 03 00 00 89       	call   4900add0 <AR_CODE32+0x48ffed38>
c000adcd:	8c 00                	mov    WORD PTR [eax],es
c000adcf:	c0 eb 00             	shr    bl,0x0
c000add2:	00 00                	add    BYTE PTR [eax],al
c000add4:	41                   	inc    ecx
c000add5:	0e                   	push   cs
c000add6:	08 85 02 44 0d 05    	or     BYTE PTR [ebp+0x50d4402],al
c000addc:	02 e5                	add    ah,ch
c000adde:	0c 04                	or     al,0x4
c000ade0:	04 c5                	add    al,0xc5
c000ade2:	00 00                	add    BYTE PTR [eax],al
c000ade4:	2c 00                	sub    al,0x0
c000ade6:	00 00                	add    BYTE PTR [eax],al
c000ade8:	08 04 00             	or     BYTE PTR [eax+eax*1],al
c000adeb:	00 74 8d 00          	add    BYTE PTR [ebp+ecx*4+0x0],dh
c000adef:	c0 46 00 00          	rol    BYTE PTR [esi+0x0],0x0
c000adf3:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000adf6:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000adfc:	6a 2e                	push   0x2e
c000adfe:	04 04                	add    al,0x4
c000ae00:	01 00                	add    DWORD PTR [eax],eax
c000ae02:	00 00                	add    BYTE PTR [eax],al
c000ae04:	2e 08 45 2e          	or     BYTE PTR cs:[ebp+0x2e],al
c000ae08:	0c 45                	or     al,0x45
c000ae0a:	2e 10 4c 2e 00       	adc    BYTE PTR cs:[esi+ebp*1+0x0],cl
c000ae0f:	41                   	inc    ecx
c000ae10:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
c000ae13:	04 1c                	add    al,0x1c
c000ae15:	00 00                	add    BYTE PTR [eax],al
c000ae17:	00 38                	add    BYTE PTR [eax],bh
c000ae19:	04 00                	add    al,0x0
c000ae1b:	00 ba 8d 00 c0 16    	add    BYTE PTR [edx+0x16c0008d],bh
c000ae21:	00 00                	add    BYTE PTR [eax],al
c000ae23:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000ae26:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ae2c:	49                   	dec    ecx
c000ae2d:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
c000ae30:	04 00                	add    al,0x0
c000ae32:	00 00                	add    BYTE PTR [eax],al
c000ae34:	1c 00                	sbb    al,0x0
c000ae36:	00 00                	add    BYTE PTR [eax],al
c000ae38:	58                   	pop    eax
c000ae39:	04 00                	add    al,0x0
c000ae3b:	00 d0                	add    al,dl
c000ae3d:	8d 00                	lea    eax,[eax]
c000ae3f:	c0 1e 00             	rcr    BYTE PTR [esi],0x0
c000ae42:	00 00                	add    BYTE PTR [eax],al
c000ae44:	41                   	inc    ecx
c000ae45:	0e                   	push   cs
c000ae46:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ae4c:	5a                   	pop    edx
c000ae4d:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
c000ae50:	04 00                	add    al,0x0
c000ae52:	00 00                	add    BYTE PTR [eax],al
c000ae54:	1c 00                	sbb    al,0x0
c000ae56:	00 00                	add    BYTE PTR [eax],al
c000ae58:	78 04                	js     c000ae5e <_edata+0x47e>
c000ae5a:	00 00                	add    BYTE PTR [eax],al
c000ae5c:	ee                   	out    dx,al
c000ae5d:	8d 00                	lea    eax,[eax]
c000ae5f:	c0 1e 00             	rcr    BYTE PTR [esi],0x0
c000ae62:	00 00                	add    BYTE PTR [eax],al
c000ae64:	41                   	inc    ecx
c000ae65:	0e                   	push   cs
c000ae66:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ae6c:	5a                   	pop    edx
c000ae6d:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
c000ae70:	04 00                	add    al,0x0
c000ae72:	00 00                	add    BYTE PTR [eax],al
c000ae74:	24 00                	and    al,0x0
c000ae76:	00 00                	add    BYTE PTR [eax],al
c000ae78:	98                   	cwde   
c000ae79:	04 00                	add    al,0x0
c000ae7b:	00 0c 8e             	add    BYTE PTR [esi+ecx*4],cl
c000ae7e:	00 c0                	add    al,al
c000ae80:	15 00 00 00 41       	adc    eax,0x41000000
c000ae85:	0e                   	push   cs
c000ae86:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ae8c:	47                   	inc    edi
c000ae8d:	0a 0c 04             	or     cl,BYTE PTR [esp+eax*1]
c000ae90:	04 c5                	add    al,0xc5
c000ae92:	45                   	inc    ebp
c000ae93:	0b 41 0c             	or     eax,DWORD PTR [ecx+0xc]
c000ae96:	04 04                	add    al,0x4
c000ae98:	c5 00                	lds    eax,FWORD PTR [eax]
c000ae9a:	00 00                	add    BYTE PTR [eax],al
c000ae9c:	1c 00                	sbb    al,0x0
c000ae9e:	00 00                	add    BYTE PTR [eax],al
c000aea0:	c0 04 00 00          	rol    BYTE PTR [eax+eax*1],0x0
c000aea4:	90                   	nop
c000aea5:	8e 00                	mov    es,WORD PTR [eax]
c000aea7:	c0 1e 00             	rcr    BYTE PTR [esi],0x0
c000aeaa:	00 00                	add    BYTE PTR [eax],al
c000aeac:	41                   	inc    ecx
c000aead:	0e                   	push   cs
c000aeae:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000aeb4:	5a                   	pop    edx
c000aeb5:	0c 04                	or     al,0x4
c000aeb7:	04 c5                	add    al,0xc5
c000aeb9:	00 00                	add    BYTE PTR [eax],al
c000aebb:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000aebe:	00 00                	add    BYTE PTR [eax],al
c000aec0:	e0 04                	loopne c000aec6 <_edata+0x4e6>
c000aec2:	00 00                	add    BYTE PTR [eax],al
c000aec4:	ae                   	scas   al,BYTE PTR es:[edi]
c000aec5:	8e 00                	mov    es,WORD PTR [eax]
c000aec7:	c0 19 00             	rcr    BYTE PTR [ecx],0x0
c000aeca:	00 00                	add    BYTE PTR [eax],al
c000aecc:	41                   	inc    ecx
c000aecd:	0e                   	push   cs
c000aece:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000aed4:	55                   	push   ebp
c000aed5:	0c 04                	or     al,0x4
c000aed7:	04 c5                	add    al,0xc5
c000aed9:	00 00                	add    BYTE PTR [eax],al
c000aedb:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000aede:	00 00                	add    BYTE PTR [eax],al
c000aee0:	00 05 00 00 c7 8e    	add    BYTE PTR ds:0x8ec70000,al
c000aee6:	00 c0                	add    al,al
c000aee8:	1c 00                	sbb    al,0x0
c000aeea:	00 00                	add    BYTE PTR [eax],al
c000aeec:	41                   	inc    ecx
c000aeed:	0e                   	push   cs
c000aeee:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000aef4:	58                   	pop    eax
c000aef5:	0c 04                	or     al,0x4
c000aef7:	04 c5                	add    al,0xc5
c000aef9:	00 00                	add    BYTE PTR [eax],al
c000aefb:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000aefe:	00 00                	add    BYTE PTR [eax],al
c000af00:	20 05 00 00 e3 8e    	and    BYTE PTR ds:0x8ee30000,al
c000af06:	00 c0                	add    al,al
c000af08:	1c 00                	sbb    al,0x0
c000af0a:	00 00                	add    BYTE PTR [eax],al
c000af0c:	41                   	inc    ecx
c000af0d:	0e                   	push   cs
c000af0e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000af14:	58                   	pop    eax
c000af15:	0c 04                	or     al,0x4
c000af17:	04 c5                	add    al,0xc5
c000af19:	00 00                	add    BYTE PTR [eax],al
c000af1b:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000af1e:	00 00                	add    BYTE PTR [eax],al
c000af20:	40                   	inc    eax
c000af21:	05 00 00 ff 8e       	add    eax,0x8eff0000
c000af26:	00 c0                	add    al,al
c000af28:	2a 00                	sub    al,BYTE PTR [eax]
c000af2a:	00 00                	add    BYTE PTR [eax],al
c000af2c:	41                   	inc    ecx
c000af2d:	0e                   	push   cs
c000af2e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000af34:	66 0c 04             	data16 or al,0x4
c000af37:	04 c5                	add    al,0xc5
c000af39:	00 00                	add    BYTE PTR [eax],al
c000af3b:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000af3e:	00 00                	add    BYTE PTR [eax],al
c000af40:	60                   	pusha  
c000af41:	05 00 00 29 8f       	add    eax,0x8f290000
c000af46:	00 c0                	add    al,al
c000af48:	12 00                	adc    al,BYTE PTR [eax]
c000af4a:	00 00                	add    BYTE PTR [eax],al
c000af4c:	41                   	inc    ecx
c000af4d:	0e                   	push   cs
c000af4e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000af54:	4a                   	dec    edx
c000af55:	0c 04                	or     al,0x4
c000af57:	04 c5                	add    al,0xc5
c000af59:	00 00                	add    BYTE PTR [eax],al
c000af5b:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000af5e:	00 00                	add    BYTE PTR [eax],al
c000af60:	80 05 00 00 3b 8f 00 	add    BYTE PTR ds:0x8f3b0000,0x0
c000af67:	c0 27 00             	shl    BYTE PTR [edi],0x0
c000af6a:	00 00                	add    BYTE PTR [eax],al
c000af6c:	41                   	inc    ecx
c000af6d:	0e                   	push   cs
c000af6e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000af74:	63 0c 04             	arpl   WORD PTR [esp+eax*1],cx
c000af77:	04 c5                	add    al,0xc5
c000af79:	00 00                	add    BYTE PTR [eax],al
c000af7b:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000af7e:	00 00                	add    BYTE PTR [eax],al
c000af80:	a0 05 00 00 64       	mov    al,ds:0x64000005
c000af85:	8f 00                	pop    DWORD PTR [eax]
c000af87:	c0 23 00             	shl    BYTE PTR [ebx],0x0
c000af8a:	00 00                	add    BYTE PTR [eax],al
c000af8c:	41                   	inc    ecx
c000af8d:	0e                   	push   cs
c000af8e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000af94:	5f                   	pop    edi
c000af95:	0c 04                	or     al,0x4
c000af97:	04 c5                	add    al,0xc5
c000af99:	00 00                	add    BYTE PTR [eax],al
c000af9b:	00 20                	add    BYTE PTR [eax],ah
c000af9d:	00 00                	add    BYTE PTR [eax],al
c000af9f:	00 c0                	add    al,al
c000afa1:	05 00 00 87 8f       	add    eax,0x8f870000
c000afa6:	00 c0                	add    al,al
c000afa8:	1b 00                	sbb    eax,DWORD PTR [eax]
c000afaa:	00 00                	add    BYTE PTR [eax],al
c000afac:	41                   	inc    ecx
c000afad:	0e                   	push   cs
c000afae:	08 85 02 44 0d 05    	or     BYTE PTR [ebp+0x50d4402],al
c000afb4:	46                   	inc    esi
c000afb5:	83 03 4e             	add    DWORD PTR [ebx],0x4e
c000afb8:	c3                   	ret    
c000afb9:	41                   	inc    ecx
c000afba:	0c 04                	or     al,0x4
c000afbc:	04 c5                	add    al,0xc5
c000afbe:	00 00                	add    BYTE PTR [eax],al
c000afc0:	28 00                	sub    BYTE PTR [eax],al
c000afc2:	00 00                	add    BYTE PTR [eax],al
c000afc4:	e4 05                	in     al,0x5
c000afc6:	00 00                	add    BYTE PTR [eax],al
c000afc8:	a2 8f 00 c0 62       	mov    ds:0x62c0008f,al
c000afcd:	00 00                	add    BYTE PTR [eax],al
c000afcf:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000afd2:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000afd8:	44                   	inc    esp
c000afd9:	83 05 86 04 87 03 02 	add    DWORD PTR ds:0x3870486,0x2
c000afe0:	57                   	push   edi
c000afe1:	c3                   	ret    
c000afe2:	41                   	inc    ecx
c000afe3:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000afe7:	0c 04                	or     al,0x4
c000afe9:	04 c5                	add    al,0xc5
c000afeb:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000afee:	00 00                	add    BYTE PTR [eax],al
c000aff0:	10 06                	adc    BYTE PTR [esi],al
c000aff2:	00 00                	add    BYTE PTR [eax],al
c000aff4:	04 90                	add    al,0x90
c000aff6:	00 c0                	add    al,al
c000aff8:	19 00                	sbb    DWORD PTR [eax],eax
c000affa:	00 00                	add    BYTE PTR [eax],al
c000affc:	41                   	inc    ecx
c000affd:	0e                   	push   cs
c000affe:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b004:	51                   	push   ecx
c000b005:	0c 04                	or     al,0x4
c000b007:	04 c5                	add    al,0xc5
c000b009:	00 00                	add    BYTE PTR [eax],al
c000b00b:	00 28                	add    BYTE PTR [eax],ch
c000b00d:	00 00                	add    BYTE PTR [eax],al
c000b00f:	00 30                	add    BYTE PTR [eax],dh
c000b011:	06                   	push   es
c000b012:	00 00                	add    BYTE PTR [eax],al
c000b014:	1d 90 00 c0 0a       	sbb    eax,0xac00090
c000b019:	01 00                	add    DWORD PTR [eax],eax
c000b01b:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b01e:	08 85 02 44 0d 05    	or     BYTE PTR [ebp+0x50d4402],al
c000b024:	46                   	inc    esi
c000b025:	83 05 86 04 87 03 02 	add    DWORD PTR ds:0x3870486,0x2
c000b02c:	fb                   	sti    
c000b02d:	c3                   	ret    
c000b02e:	41                   	inc    ecx
c000b02f:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000b033:	0c 04                	or     al,0x4
c000b035:	04 c5                	add    al,0xc5
c000b037:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000b03a:	00 00                	add    BYTE PTR [eax],al
c000b03c:	5c                   	pop    esp
c000b03d:	06                   	push   es
c000b03e:	00 00                	add    BYTE PTR [eax],al
c000b040:	27                   	daa    
c000b041:	91                   	xchg   ecx,eax
c000b042:	00 c0                	add    al,al
c000b044:	19 00                	sbb    DWORD PTR [eax],eax
c000b046:	00 00                	add    BYTE PTR [eax],al
c000b048:	41                   	inc    ecx
c000b049:	0e                   	push   cs
c000b04a:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b050:	51                   	push   ecx
c000b051:	0c 04                	or     al,0x4
c000b053:	04 c5                	add    al,0xc5
c000b055:	00 00                	add    BYTE PTR [eax],al
c000b057:	00 54 00 00          	add    BYTE PTR [eax+eax*1+0x0],dl
c000b05b:	00 7c 06 00          	add    BYTE PTR [esi+eax*1+0x0],bh
c000b05f:	00 40 91             	add    BYTE PTR [eax-0x6f],al
c000b062:	00 c0                	add    al,al
c000b064:	69 00 00 00 41 0e    	imul   eax,DWORD PTR [eax],0xe410000
c000b06a:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b070:	42                   	inc    edx
c000b071:	83 04 86 03          	add    DWORD PTR [esi+eax*4],0x3
c000b075:	4f                   	dec    edi
c000b076:	2e 04 04             	cs add al,0x4
c000b079:	07                   	pop    es
c000b07a:	00 00                	add    BYTE PTR [eax],al
c000b07c:	00 2e                	add    BYTE PTR [esi],ch
c000b07e:	08 4b 2e             	or     BYTE PTR [ebx+0x2e],cl
c000b081:	0c 46                	or     al,0x46
c000b083:	2e 10 41 2e          	adc    BYTE PTR cs:[ecx+0x2e],al
c000b087:	14 45                	adc    al,0x45
c000b089:	2e 18 4a 2e          	sbb    BYTE PTR cs:[edx+0x2e],cl
c000b08d:	1c 42                	sbb    al,0x42
c000b08f:	2e 20 45 2e          	and    BYTE PTR cs:[ebp+0x2e],al
c000b093:	24 48                	and    al,0x48
c000b095:	2e 00 45 2e          	add    BYTE PTR cs:[ebp+0x2e],al
c000b099:	04 04                	add    al,0x4
c000b09b:	05 00 00 00 2e       	add    eax,0x2e000000
c000b0a0:	08 45 2e             	or     BYTE PTR [ebp+0x2e],al
c000b0a3:	0c 48                	or     al,0x48
c000b0a5:	2e 00 44 c3 41       	add    BYTE PTR cs:[ebx+eax*8+0x41],al
c000b0aa:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000b0ae:	04 c5                	add    al,0xc5
c000b0b0:	28 00                	sub    BYTE PTR [eax],al
c000b0b2:	00 00                	add    BYTE PTR [eax],al
c000b0b4:	d4 06                	aam    0x6
c000b0b6:	00 00                	add    BYTE PTR [eax],al
c000b0b8:	ac                   	lods   al,BYTE PTR ds:[esi]
c000b0b9:	91                   	xchg   ecx,eax
c000b0ba:	00 c0                	add    al,al
c000b0bc:	66 00 00             	data16 add BYTE PTR [eax],al
c000b0bf:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b0c2:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b0c8:	46                   	inc    esi
c000b0c9:	83 05 86 04 87 03 02 	add    DWORD PTR ds:0x3870486,0x2
c000b0d0:	59                   	pop    ecx
c000b0d1:	c3                   	ret    
c000b0d2:	41                   	inc    ecx
c000b0d3:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000b0d7:	0c 04                	or     al,0x4
c000b0d9:	04 c5                	add    al,0xc5
c000b0db:	00 44 00 00          	add    BYTE PTR [eax+eax*1+0x0],al
c000b0df:	00 00                	add    BYTE PTR [eax],al
c000b0e1:	07                   	pop    es
c000b0e2:	00 00                	add    BYTE PTR [eax],al
c000b0e4:	12 92 00 c0 38 00    	adc    dl,BYTE PTR [edx+0x38c000]
c000b0ea:	00 00                	add    BYTE PTR [eax],al
c000b0ec:	41                   	inc    ecx
c000b0ed:	0e                   	push   cs
c000b0ee:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b0f4:	41                   	inc    ecx
c000b0f5:	87 03                	xchg   DWORD PTR [ebx],eax
c000b0f7:	44                   	inc    esp
c000b0f8:	86 04 04             	xchg   BYTE PTR [esp+eax*1],al
c000b0fb:	04 00                	add    al,0x0
c000b0fd:	00 00                	add    BYTE PTR [eax],al
c000b0ff:	83 05 49 2e 04 04 01 	add    DWORD PTR ds:0x4042e49,0x1
c000b106:	00 00                	add    BYTE PTR [eax],al
c000b108:	00 2e                	add    BYTE PTR [esi],ch
c000b10a:	08 43 2e             	or     BYTE PTR [ebx+0x2e],al
c000b10d:	0c 41                	or     al,0x41
c000b10f:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000b113:	14 48                	adc    al,0x48
c000b115:	2e 00 4c c3 41       	add    BYTE PTR cs:[ebx+eax*8+0x41],cl
c000b11a:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000b11e:	0c 04                	or     al,0x4
c000b120:	04 c5                	add    al,0xc5
c000b122:	00 00                	add    BYTE PTR [eax],al
c000b124:	28 00                	sub    BYTE PTR [eax],al
c000b126:	00 00                	add    BYTE PTR [eax],al
c000b128:	48                   	dec    eax
c000b129:	07                   	pop    es
c000b12a:	00 00                	add    BYTE PTR [eax],al
c000b12c:	4a                   	dec    edx
c000b12d:	92                   	xchg   edx,eax
c000b12e:	00 c0                	add    al,al
c000b130:	5f                   	pop    edi
c000b131:	00 00                	add    BYTE PTR [eax],al
c000b133:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b136:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b13c:	45                   	inc    ebp
c000b13d:	86 04 87             	xchg   BYTE PTR [edi+eax*4],al
c000b140:	03 44 83 05          	add    eax,DWORD PTR [ebx+eax*4+0x5]
c000b144:	02 4f c3             	add    cl,BYTE PTR [edi-0x3d]
c000b147:	41                   	inc    ecx
c000b148:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000b14c:	0c 04                	or     al,0x4
c000b14e:	04 c5                	add    al,0xc5
c000b150:	24 00                	and    al,0x0
c000b152:	00 00                	add    BYTE PTR [eax],al
c000b154:	74 07                	je     c000b15d <_edata+0x77d>
c000b156:	00 00                	add    BYTE PTR [eax],al
c000b158:	a9 92 00 c0 31       	test   eax,0x31c00092
c000b15d:	00 00                	add    BYTE PTR [eax],al
c000b15f:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b162:	08 85 02 44 0d 05    	or     BYTE PTR [ebp+0x50d4402],al
c000b168:	42                   	inc    edx
c000b169:	83 04 86 03          	add    DWORD PTR [esi+eax*4],0x3
c000b16d:	67 c3                	addr16 ret 
c000b16f:	41                   	inc    ecx
c000b170:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000b174:	04 c5                	add    al,0xc5
c000b176:	00 00                	add    BYTE PTR [eax],al
c000b178:	38 00                	cmp    BYTE PTR [eax],al
c000b17a:	00 00                	add    BYTE PTR [eax],al
c000b17c:	9c                   	pushf  
c000b17d:	07                   	pop    es
c000b17e:	00 00                	add    BYTE PTR [eax],al
c000b180:	da 92 00 c0 47 00    	ficom  DWORD PTR [edx+0x47c000]
c000b186:	00 00                	add    BYTE PTR [eax],al
c000b188:	41                   	inc    ecx
c000b189:	0e                   	push   cs
c000b18a:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b190:	44                   	inc    esp
c000b191:	2e 08 83 03 42 2e 0c 	or     BYTE PTR cs:[ebx+0xc2e4203],al
c000b198:	45                   	inc    ebp
c000b199:	2e 10 54 2e 0c       	adc    BYTE PTR cs:[esi+ebp*1+0xc],dl
c000b19e:	41                   	inc    ecx
c000b19f:	2e 08 45 2e          	or     BYTE PTR cs:[ebp+0x2e],al
c000b1a3:	0c 45                	or     al,0x45
c000b1a5:	2e 10 59 c5          	adc    BYTE PTR cs:[ecx-0x3b],bl
c000b1a9:	0c 04                	or     al,0x4
c000b1ab:	04 c3                	add    al,0xc3
c000b1ad:	41                   	inc    ecx
c000b1ae:	13 03                	adc    eax,DWORD PTR [ebx]
c000b1b0:	2e 00 00             	add    BYTE PTR cs:[eax],al
c000b1b3:	00 4c 00 00          	add    BYTE PTR [eax+eax*1+0x0],cl
c000b1b7:	00 d8                	add    al,bl
c000b1b9:	07                   	pop    es
c000b1ba:	00 00                	add    BYTE PTR [eax],al
c000b1bc:	21 93 00 c0 4f 00    	and    DWORD PTR [ebx+0x4fc000],edx
c000b1c2:	00 00                	add    BYTE PTR [eax],al
c000b1c4:	41                   	inc    ecx
c000b1c5:	0e                   	push   cs
c000b1c6:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b1cc:	44                   	inc    esp
c000b1cd:	2e 08 83 03 45 2e 0c 	or     BYTE PTR cs:[ebx+0xc2e4503],al
c000b1d4:	45                   	inc    ebp
c000b1d5:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000b1d9:	0c 41                	or     al,0x41
c000b1db:	2e 08 4a 2e          	or     BYTE PTR cs:[edx+0x2e],cl
c000b1df:	0c 45                	or     al,0x45
c000b1e1:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000b1e5:	0c 41                	or     al,0x41
c000b1e7:	2e 08 42 2e          	or     BYTE PTR cs:[edx+0x2e],al
c000b1eb:	0c 45                	or     al,0x45
c000b1ed:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000b1f1:	0c 41                	or     al,0x41
c000b1f3:	2e 08 41 2e          	or     BYTE PTR cs:[ecx+0x2e],al
c000b1f7:	0c 45                	or     al,0x45
c000b1f9:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000b1fd:	00 44 c5 0c          	add    BYTE PTR [ebp+eax*8+0xc],al
c000b201:	04 04                	add    al,0x4
c000b203:	c3                   	ret    
c000b204:	2c 00                	sub    al,0x0
c000b206:	00 00                	add    BYTE PTR [eax],al
c000b208:	28 08                	sub    BYTE PTR [eax],cl
c000b20a:	00 00                	add    BYTE PTR [eax],al
c000b20c:	70 93                	jo     c000b1a1 <_edata+0x7c1>
c000b20e:	00 c0                	add    al,al
c000b210:	9a 00 00 00 41 0e 08 	call   0x80e:0x41000000
c000b217:	85 02                	test   DWORD PTR [edx],eax
c000b219:	42                   	inc    edx
c000b21a:	0d 05 42 83 03       	or     eax,0x3834205
c000b21f:	02 8b 0a c3 41 0c    	add    cl,BYTE PTR [ebx+0xc41c30a]
c000b225:	04 04                	add    al,0x4
c000b227:	c5 45 0b             	lds    eax,FWORD PTR [ebp+0xb]
c000b22a:	42                   	inc    edx
c000b22b:	c3                   	ret    
c000b22c:	41                   	inc    ecx
c000b22d:	0c 04                	or     al,0x4
c000b22f:	04 c5                	add    al,0xc5
c000b231:	00 00                	add    BYTE PTR [eax],al
c000b233:	00 28                	add    BYTE PTR [eax],ch
c000b235:	00 00                	add    BYTE PTR [eax],al
c000b237:	00 58 08             	add    BYTE PTR [eax+0x8],bl
c000b23a:	00 00                	add    BYTE PTR [eax],al
c000b23c:	0a 94 00 c0 25 00 00 	or     dl,BYTE PTR [eax+eax*1+0x25c0]
c000b243:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b246:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b24c:	42                   	inc    edx
c000b24d:	83 03 48             	add    DWORD PTR [ebx],0x48
c000b250:	2e 0c 44             	cs or  al,0x44
c000b253:	2e 10 49 2e          	adc    BYTE PTR cs:[ecx+0x2e],cl
c000b257:	00 4a c5             	add    BYTE PTR [edx-0x3b],cl
c000b25a:	0c 04                	or     al,0x4
c000b25c:	04 c3                	add    al,0xc3
c000b25e:	00 00                	add    BYTE PTR [eax],al
c000b260:	30 00                	xor    BYTE PTR [eax],al
c000b262:	00 00                	add    BYTE PTR [eax],al
c000b264:	84 08                	test   BYTE PTR [eax],cl
c000b266:	00 00                	add    BYTE PTR [eax],al
c000b268:	2f                   	das    
c000b269:	94                   	xchg   esp,eax
c000b26a:	00 c0                	add    al,al
c000b26c:	2f                   	das    
c000b26d:	00 00                	add    BYTE PTR [eax],al
c000b26f:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b272:	08 85 02 44 0d 05    	or     BYTE PTR [ebp+0x50d4402],al
c000b278:	46                   	inc    esi
c000b279:	87 03                	xchg   DWORD PTR [ebx],eax
c000b27b:	4d                   	dec    ebp
c000b27c:	2e 04 04             	cs add al,0x4
c000b27f:	01 00                	add    DWORD PTR [eax],eax
c000b281:	00 00                	add    BYTE PTR [eax],al
c000b283:	2e 08 43 2e          	or     BYTE PTR cs:[ebx+0x2e],al
c000b287:	0c 46                	or     al,0x46
c000b289:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000b28d:	00 44 c5 0c          	add    BYTE PTR [ebp+eax*8+0xc],al
c000b291:	04 04                	add    al,0x4
c000b293:	c7                   	(bad)  
c000b294:	38 00                	cmp    BYTE PTR [eax],al
c000b296:	00 00                	add    BYTE PTR [eax],al
c000b298:	b8 08 00 00 60       	mov    eax,0x60000008
c000b29d:	94                   	xchg   esp,eax
c000b29e:	00 c0                	add    al,al
c000b2a0:	47                   	inc    edi
c000b2a1:	00 00                	add    BYTE PTR [eax],al
c000b2a3:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b2a6:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b2ac:	45                   	inc    ebp
c000b2ad:	83 04 86 03          	add    DWORD PTR [esi+eax*4],0x3
c000b2b1:	52                   	push   edx
c000b2b2:	2e 04 04             	cs add al,0x4
c000b2b5:	05 00 00 00 2e       	add    eax,0x2e000000
c000b2ba:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000b2bd:	0c 45                	or     al,0x45
c000b2bf:	2e 10 4e 2e          	adc    BYTE PTR cs:[esi+0x2e],cl
c000b2c3:	00 50 c3             	add    BYTE PTR [eax-0x3d],dl
c000b2c6:	41                   	inc    ecx
c000b2c7:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000b2cb:	04 c5                	add    al,0xc5
c000b2cd:	00 00                	add    BYTE PTR [eax],al
c000b2cf:	00 3c 00             	add    BYTE PTR [eax+eax*1],bh
c000b2d2:	00 00                	add    BYTE PTR [eax],al
c000b2d4:	f4                   	hlt    
c000b2d5:	08 00                	or     BYTE PTR [eax],al
c000b2d7:	00 a7 94 00 c0 4a    	add    BYTE PTR [edi+0x4ac00094],ah
c000b2dd:	00 00                	add    BYTE PTR [eax],al
c000b2df:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b2e2:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b2e8:	46                   	inc    esi
c000b2e9:	83 05 86 04 87 03 56 	add    DWORD PTR ds:0x3870486,0x56
c000b2f0:	2e 04 04             	cs add al,0x4
c000b2f3:	05 00 00 00 2e       	add    eax,0x2e000000
c000b2f8:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000b2fb:	0c 45                	or     al,0x45
c000b2fd:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000b301:	00 53 c3             	add    BYTE PTR [ebx-0x3d],dl
c000b304:	41                   	inc    ecx
c000b305:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000b309:	0c 04                	or     al,0x4
c000b30b:	04 c5                	add    al,0xc5
c000b30d:	00 00                	add    BYTE PTR [eax],al
c000b30f:	00 3c 00             	add    BYTE PTR [eax+eax*1],bh
c000b312:	00 00                	add    BYTE PTR [eax],al
c000b314:	34 09                	xor    al,0x9
c000b316:	00 00                	add    BYTE PTR [eax],al
c000b318:	f1                   	icebp  
c000b319:	94                   	xchg   esp,eax
c000b31a:	00 c0                	add    al,al
c000b31c:	42                   	inc    edx
c000b31d:	00 00                	add    BYTE PTR [eax],al
c000b31f:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000b322:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b328:	41                   	inc    ecx
c000b329:	86 03                	xchg   BYTE PTR [ebx],al
c000b32b:	44                   	inc    esp
c000b32c:	83 04 04 10          	add    DWORD PTR [esp+eax*1],0x10
c000b330:	00 00                	add    BYTE PTR [eax],al
c000b332:	00 2e                	add    BYTE PTR [esi],ch
c000b334:	04 04                	add    al,0x4
c000b336:	05 00 00 00 2e       	add    eax,0x2e000000
c000b33b:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000b33e:	0c 45                	or     al,0x45
c000b340:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000b344:	00 53 c3             	add    BYTE PTR [ebx-0x3d],dl
c000b347:	41                   	inc    ecx
c000b348:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000b34c:	04 c5                	add    al,0xc5
c000b34e:	00 00                	add    BYTE PTR [eax],al
c000b350:	40                   	inc    eax
c000b351:	00 00                	add    BYTE PTR [eax],al
c000b353:	00 74 09 00          	add    BYTE PTR [ecx+ecx*1+0x0],dh
c000b357:	00 34 95 00 c0 2d 00 	add    BYTE PTR [edx*4+0x2dc000],dh
c000b35e:	00 00                	add    BYTE PTR [eax],al
c000b360:	41                   	inc    ecx
c000b361:	0e                   	push   cs
c000b362:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000b368:	43                   	inc    ebx
c000b369:	2e 08 42 2e          	or     BYTE PTR cs:[edx+0x2e],al
c000b36d:	0c 42                	or     al,0x42
c000b36f:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000b373:	0c 41                	or     al,0x41
c000b375:	2e 08 45 2e          	or     BYTE PTR cs:[ebp+0x2e],al
c000b379:	0c 42                	or     al,0x42
c000b37b:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000b37f:	0c 41                	or     al,0x41
c000b381:	2e 08 42 2e          	or     BYTE PTR cs:[edx+0x2e],al
c000b385:	0c 42                	or     al,0x42
c000b387:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000b38b:	00 41 c5             	add    BYTE PTR [ecx-0x3b],al
c000b38e:	0c 04                	or     al,0x4
c000b390:	04 00                	add    al,0x0
	...

Disassembly of section .rodata:

c000b394 <_rodata>:
c000b394:	50                   	push   eax
c000b395:	65 6e                	outs   dx,BYTE PTR gs:[esi]
c000b397:	63 69 6c             	arpl   WORD PTR [ecx+0x6c],bp
c000b39a:	2d 4b 65 72 6e       	sub    eax,0x6e72654b
c000b39f:	65 6c                	gs ins BYTE PTR es:[edi],dx
c000b3a1:	20 28                	and    BYTE PTR [eax],ch
c000b3a3:	50                   	push   eax
c000b3a4:	4b                   	dec    ebx
c000b3a5:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b3a6:	29 00                	sub    DWORD PTR [eax],eax
	...
c000b3f8:	62 79 74             	bound  edi,QWORD PTR [ecx+0x74]
c000b3fb:	65 5f                	gs pop edi
c000b3fd:	69 6e 64 65 78 20 3c 	imul   ebp,DWORD PTR [esi+0x64],0x3c207865
c000b404:	20 28                	and    BYTE PTR [eax],ch
c000b406:	62 74 6d 70          	bound  esi,QWORD PTR [ebp+ebp*2+0x70]
c000b40a:	2d 3e 62 74 6d       	sub    eax,0x6d74623e
c000b40f:	70 5f                	jo     c000b470 <__func__.864+0x1c>
c000b411:	62 79 74             	bound  edi,QWORD PTR [ecx+0x74]
c000b414:	65 73 5f             	gs jae c000b476 <__func__.864+0x22>
c000b417:	6c                   	ins    BYTE PTR es:[edi],dx
c000b418:	65 6e                	outs   dx,BYTE PTR gs:[esi]
c000b41a:	29 00                	sub    DWORD PTR [eax],eax
c000b41c:	6c                   	ins    BYTE PTR es:[edi],dx
c000b41d:	69 62 2f 62 69 74 6d 	imul   esp,DWORD PTR [edx+0x2f],0x6d746962
c000b424:	61                   	popa   
c000b425:	70 2e                	jo     c000b455 <__func__.864+0x1>
c000b427:	63 00                	arpl   WORD PTR [eax],ax
c000b429:	76 61                	jbe    c000b48c <__func__.864+0x38>
c000b42b:	6c                   	ins    BYTE PTR es:[edi],dx
c000b42c:	75 65                	jne    c000b493 <__func__.864+0x3f>
c000b42e:	20 3d 3d 20 30 20    	and    BYTE PTR ds:0x2030203d,bh
c000b434:	7c 7c                	jl     c000b4b2 <__func__.864+0x5e>
c000b436:	20 76 61             	and    BYTE PTR [esi+0x61],dh
c000b439:	6c                   	ins    BYTE PTR es:[edi],dx
c000b43a:	75 65                	jne    c000b4a1 <__func__.864+0x4d>
c000b43c:	20 3d 3d 20 31 00    	and    BYTE PTR ds:0x31203d,bh
	...

c000b444 <__func__.847>:
c000b444:	62 69 74             	bound  ebp,QWORD PTR [ecx+0x74]
c000b447:	6d                   	ins    DWORD PTR es:[edi],dx
c000b448:	61                   	popa   
c000b449:	70 5f                	jo     c000b4aa <__func__.864+0x56>
c000b44b:	61                   	popa   
c000b44c:	6c                   	ins    BYTE PTR es:[edi],dx
c000b44d:	6c                   	ins    BYTE PTR es:[edi],dx
c000b44e:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b44f:	63 00                	arpl   WORD PTR [eax],ax
c000b451:	00 00                	add    BYTE PTR [eax],al
	...

c000b454 <__func__.864>:
c000b454:	62 69 74             	bound  ebp,QWORD PTR [ecx+0x74]
c000b457:	6d                   	ins    DWORD PTR es:[edi],dx
c000b458:	61                   	popa   
c000b459:	70 5f                	jo     c000b4ba <__func__.864+0x66>
c000b45b:	73 65                	jae    c000b4c2 <__func__.864+0x6e>
c000b45d:	74 00                	je     c000b45f <__func__.864+0xb>
c000b45f:	45                   	inc    ebp
c000b460:	72 72                	jb     c000b4d4 <__func__.864+0x80>
c000b462:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b463:	72 0a                	jb     c000b46f <__func__.864+0x1b>
c000b465:	00 46 69             	add    BYTE PTR [esi+0x69],al
c000b468:	6c                   	ins    BYTE PTR es:[edi],dx
c000b469:	65 3a 00             	cmp    al,BYTE PTR gs:[eax]
c000b46c:	49                   	dec    ecx
c000b46d:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b46e:	20 66 75             	and    BYTE PTR [esi+0x75],ah
c000b471:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b472:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
c000b476:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b477:	3a 20                	cmp    ah,BYTE PTR [eax]
c000b479:	00 4c 69 6e          	add    BYTE PTR [ecx+ebp*2+0x6e],cl
c000b47d:	65 3a 00             	cmp    al,BYTE PTR gs:[eax]
c000b480:	43                   	inc    ebx
c000b481:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b482:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b483:	64 69 74 69 6f 6e 3a 	imul   esi,DWORD PTR fs:[ecx+ebp*2+0x6f],0x203a6e
c000b48a:	20 00 
c000b48c:	69 6e 74 72 3a 00 75 	imul   ebp,DWORD PTR [esi+0x74],0x75003a72
c000b493:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b494:	6b 6e 6f 77          	imul   ebp,DWORD PTR [esi+0x6f],0x77
c000b498:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b499:	00 23                	add    BYTE PTR [ebx],ah
c000b49b:	44                   	inc    esp
c000b49c:	45                   	inc    ebp
c000b49d:	20 44 69 76          	and    BYTE PTR [ecx+ebp*2+0x76],al
c000b4a1:	69 64 65 20 45 72 72 	imul   esp,DWORD PTR [ebp+eiz*2+0x20],0x6f727245
c000b4a8:	6f 
c000b4a9:	72 00                	jb     c000b4ab <__func__.864+0x57>
c000b4ab:	23 44 42 20          	and    eax,DWORD PTR [edx+eax*2+0x20]
c000b4af:	44                   	inc    esp
c000b4b0:	65 62 75 67          	bound  esi,QWORD PTR gs:[ebp+0x67]
c000b4b4:	20 45 78             	and    BYTE PTR [ebp+0x78],al
c000b4b7:	63 65 70             	arpl   WORD PTR [ebp+0x70],sp
c000b4ba:	74 69                	je     c000b525 <__func__.864+0xd1>
c000b4bc:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b4bd:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b4be:	00 4e 4d             	add    BYTE PTR [esi+0x4d],cl
c000b4c1:	49                   	dec    ecx
c000b4c2:	20 49 6e             	and    BYTE PTR [ecx+0x6e],cl
c000b4c5:	74 65                	je     c000b52c <__func__.864+0xd8>
c000b4c7:	72 72                	jb     c000b53b <__func__.864+0xe7>
c000b4c9:	75 70                	jne    c000b53b <__func__.864+0xe7>
c000b4cb:	74 00                	je     c000b4cd <__func__.864+0x79>
c000b4cd:	23 42 50             	and    eax,DWORD PTR [edx+0x50]
c000b4d0:	20 42 72             	and    BYTE PTR [edx+0x72],al
c000b4d3:	65 61                	gs popa 
c000b4d5:	6b 70 6f 69          	imul   esi,DWORD PTR [eax+0x6f],0x69
c000b4d9:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b4da:	74 20                	je     c000b4fc <__func__.864+0xa8>
c000b4dc:	45                   	inc    ebp
c000b4dd:	78 63                	js     c000b542 <__func__.864+0xee>
c000b4df:	65 70 74             	gs jo  c000b556 <__func__.864+0x102>
c000b4e2:	69 6f 6e 00 23 4f 46 	imul   ebp,DWORD PTR [edi+0x6e],0x464f2300
c000b4e9:	20 4f 76             	and    BYTE PTR [edi+0x76],cl
c000b4ec:	65 72 66             	gs jb  c000b555 <__func__.864+0x101>
c000b4ef:	6c                   	ins    BYTE PTR es:[edi],dx
c000b4f0:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b4f1:	77 20                	ja     c000b513 <__func__.864+0xbf>
c000b4f3:	45                   	inc    ebp
c000b4f4:	78 63                	js     c000b559 <__func__.864+0x105>
c000b4f6:	65 70 74             	gs jo  c000b56d <__func__.864+0x119>
c000b4f9:	69 6f 6e 00 23 42 52 	imul   ebp,DWORD PTR [edi+0x6e],0x52422300
c000b500:	20 42 4f             	and    BYTE PTR [edx+0x4f],al
c000b503:	55                   	push   ebp
c000b504:	4e                   	dec    esi
c000b505:	44                   	inc    esp
c000b506:	20 52 61             	and    BYTE PTR [edx+0x61],dl
c000b509:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b50a:	67 65 20 45 78       	and    BYTE PTR gs:[di+0x78],al
c000b50f:	63 65 65             	arpl   WORD PTR [ebp+0x65],sp
c000b512:	64 65 64 20 45 78    	fs gs and BYTE PTR fs:[ebp+0x78],al
c000b518:	63 65 70             	arpl   WORD PTR [ebp+0x70],sp
c000b51b:	74 69                	je     c000b586 <__func__.864+0x132>
c000b51d:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b51e:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b51f:	00 23                	add    BYTE PTR [ebx],ah
c000b521:	55                   	push   ebp
c000b522:	44                   	inc    esp
c000b523:	20 49 6e             	and    BYTE PTR [ecx+0x6e],cl
c000b526:	76 61                	jbe    c000b589 <__func__.864+0x135>
c000b528:	6c                   	ins    BYTE PTR es:[edi],dx
c000b529:	69 64 20 4f 70 63 6f 	imul   esp,DWORD PTR [eax+eiz*1+0x4f],0x646f6370
c000b530:	64 
c000b531:	65 20 45 78          	and    BYTE PTR gs:[ebp+0x78],al
c000b535:	63 65 70             	arpl   WORD PTR [ebp+0x70],sp
c000b538:	74 69                	je     c000b5a3 <__func__.864+0x14f>
c000b53a:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b53b:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b53c:	00 23                	add    BYTE PTR [ebx],ah
c000b53e:	4e                   	dec    esi
c000b53f:	4d                   	dec    ebp
c000b540:	20 44 65 76          	and    BYTE PTR [ebp+eiz*2+0x76],al
c000b544:	69 63 65 20 4e 6f 74 	imul   esp,DWORD PTR [ebx+0x65],0x746f4e20
c000b54b:	20 41 76             	and    BYTE PTR [ecx+0x76],al
c000b54e:	61                   	popa   
c000b54f:	69 6c 61 62 6c 65 20 	imul   ebp,DWORD PTR [ecx+eiz*2+0x62],0x4520656c
c000b556:	45 
c000b557:	78 63                	js     c000b5bc <__func__.864+0x168>
c000b559:	65 70 74             	gs jo  c000b5d0 <__func__.864+0x17c>
c000b55c:	69 6f 6e 00 23 44 46 	imul   ebp,DWORD PTR [edi+0x6e],0x46442300
c000b563:	20 44 6f 75          	and    BYTE PTR [edi+ebp*2+0x75],al
c000b567:	62 6c 65 20          	bound  ebp,QWORD PTR [ebp+eiz*2+0x20]
c000b56b:	46                   	inc    esi
c000b56c:	61                   	popa   
c000b56d:	75 6c                	jne    c000b5db <__func__.864+0x187>
c000b56f:	74 20                	je     c000b591 <__func__.864+0x13d>
c000b571:	45                   	inc    ebp
c000b572:	78 63                	js     c000b5d7 <__func__.864+0x183>
c000b574:	65 70 74             	gs jo  c000b5eb <__func__.864+0x197>
c000b577:	69 6f 6e 00 43 6f 70 	imul   ebp,DWORD PTR [edi+0x6e],0x706f4300
c000b57e:	72 6f                	jb     c000b5ef <__func__.864+0x19b>
c000b580:	63 65 73             	arpl   WORD PTR [ebp+0x73],sp
c000b583:	73 6f                	jae    c000b5f4 <__func__.864+0x1a0>
c000b585:	72 20                	jb     c000b5a7 <__func__.864+0x153>
c000b587:	53                   	push   ebx
c000b588:	65 67 6d             	gs ins DWORD PTR es:[di],dx
c000b58b:	65 6e                	outs   dx,BYTE PTR gs:[esi]
c000b58d:	74 20                	je     c000b5af <__func__.864+0x15b>
c000b58f:	4f                   	dec    edi
c000b590:	76 65                	jbe    c000b5f7 <__func__.864+0x1a3>
c000b592:	72 72                	jb     c000b606 <__func__.864+0x1b2>
c000b594:	75 6e                	jne    c000b604 <__func__.864+0x1b0>
c000b596:	00 23                	add    BYTE PTR [ebx],ah
c000b598:	54                   	push   esp
c000b599:	53                   	push   ebx
c000b59a:	20 49 6e             	and    BYTE PTR [ecx+0x6e],cl
c000b59d:	76 61                	jbe    c000b600 <__func__.864+0x1ac>
c000b59f:	6c                   	ins    BYTE PTR es:[edi],dx
c000b5a0:	69 64 20 54 53 53 20 	imul   esp,DWORD PTR [eax+eiz*1+0x54],0x45205353
c000b5a7:	45 
c000b5a8:	78 63                	js     c000b60d <__func__.864+0x1b9>
c000b5aa:	65 70 74             	gs jo  c000b621 <__func__.864+0x1cd>
c000b5ad:	69 6f 6e 00 23 4e 50 	imul   ebp,DWORD PTR [edi+0x6e],0x504e2300
c000b5b4:	20 53 65             	and    BYTE PTR [ebx+0x65],dl
c000b5b7:	67 6d                	ins    DWORD PTR es:[di],dx
c000b5b9:	65 6e                	outs   dx,BYTE PTR gs:[esi]
c000b5bb:	74 20                	je     c000b5dd <__func__.864+0x189>
c000b5bd:	4e                   	dec    esi
c000b5be:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b5bf:	74 20                	je     c000b5e1 <__func__.864+0x18d>
c000b5c1:	50                   	push   eax
c000b5c2:	72 65                	jb     c000b629 <__func__.864+0x1d5>
c000b5c4:	73 65                	jae    c000b62b <__func__.864+0x1d7>
c000b5c6:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b5c7:	74 00                	je     c000b5c9 <__func__.864+0x175>
c000b5c9:	23 53 53             	and    edx,DWORD PTR [ebx+0x53]
c000b5cc:	20 53 74             	and    BYTE PTR [ebx+0x74],dl
c000b5cf:	61                   	popa   
c000b5d0:	63 6b 20             	arpl   WORD PTR [ebx+0x20],bp
c000b5d3:	46                   	inc    esi
c000b5d4:	61                   	popa   
c000b5d5:	75 6c                	jne    c000b643 <__func__.864+0x1ef>
c000b5d7:	74 20                	je     c000b5f9 <__func__.864+0x1a5>
c000b5d9:	45                   	inc    ebp
c000b5da:	78 63                	js     c000b63f <__func__.864+0x1eb>
c000b5dc:	65 70 74             	gs jo  c000b653 <__func__.864+0x1ff>
c000b5df:	69 6f 6e 00 23 47 50 	imul   ebp,DWORD PTR [edi+0x6e],0x50472300
c000b5e6:	20 47 65             	and    BYTE PTR [edi+0x65],al
c000b5e9:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b5ea:	65 72 61             	gs jb  c000b64e <__func__.864+0x1fa>
c000b5ed:	6c                   	ins    BYTE PTR es:[edi],dx
c000b5ee:	20 50 72             	and    BYTE PTR [eax+0x72],dl
c000b5f1:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b5f2:	74 65                	je     c000b659 <__func__.864+0x205>
c000b5f4:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
c000b5f8:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b5f9:	20 45 78             	and    BYTE PTR [ebp+0x78],al
c000b5fc:	63 65 70             	arpl   WORD PTR [ebp+0x70],sp
c000b5ff:	74 69                	je     c000b66a <__func__.864+0x216>
c000b601:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b602:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b603:	00 23                	add    BYTE PTR [ebx],ah
c000b605:	50                   	push   eax
c000b606:	46                   	inc    esi
c000b607:	20 50 61             	and    BYTE PTR [eax+0x61],dl
c000b60a:	67 65 2d 46 61 75 6c 	addr16 gs sub eax,0x6c756146
c000b611:	74 20                	je     c000b633 <__func__.864+0x1df>
c000b613:	45                   	inc    ebp
c000b614:	78 63                	js     c000b679 <__func__.864+0x225>
c000b616:	65 70 74             	gs jo  c000b68d <__func__.864+0x239>
c000b619:	69 6f 6e 00 52 65 73 	imul   ebp,DWORD PTR [edi+0x6e],0x73655200
c000b620:	65 72 76             	gs jb  c000b699 <__func__.864+0x245>
c000b623:	65 64 00 23          	gs add BYTE PTR fs:[ebx],ah
c000b627:	4d                   	dec    ebp
c000b628:	46                   	inc    esi
c000b629:	20 78 38             	and    BYTE PTR [eax+0x38],bh
c000b62c:	37                   	aaa    
c000b62d:	20 46 50             	and    BYTE PTR [esi+0x50],al
c000b630:	55                   	push   ebp
c000b631:	20 46 6c             	and    BYTE PTR [esi+0x6c],al
c000b634:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b635:	61                   	popa   
c000b636:	74 69                	je     c000b6a1 <__func__.864+0x24d>
c000b638:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b639:	67 2d 50 6f 69 6e    	addr16 sub eax,0x6e696f50
c000b63f:	74 20                	je     c000b661 <__func__.864+0x20d>
c000b641:	45                   	inc    ebp
c000b642:	72 72                	jb     c000b6b6 <digits.933+0x12>
c000b644:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b645:	72 00                	jb     c000b647 <__func__.864+0x1f3>
c000b647:	23 41 43             	and    eax,DWORD PTR [ecx+0x43]
c000b64a:	20 41 6c             	and    BYTE PTR [ecx+0x6c],al
c000b64d:	69 67 6e 6d 65 6e 74 	imul   esp,DWORD PTR [edi+0x6e],0x746e656d
c000b654:	20 43 68             	and    BYTE PTR [ebx+0x68],al
c000b657:	65 63 6b 20          	arpl   WORD PTR gs:[ebx+0x20],bp
c000b65b:	45                   	inc    ebp
c000b65c:	78 63                	js     c000b6c1 <digits.933+0x1d>
c000b65e:	65 70 74             	gs jo  c000b6d5 <digits.933+0x31>
c000b661:	69 6f 6e 00 23 4d 43 	imul   ebp,DWORD PTR [edi+0x6e],0x434d2300
c000b668:	20 4d 61             	and    BYTE PTR [ebp+0x61],cl
c000b66b:	63 68 69             	arpl   WORD PTR [eax+0x69],bp
c000b66e:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b66f:	65 2d 43 68 65 63    	gs sub eax,0x63656843
c000b675:	6b 20 45             	imul   esp,DWORD PTR [eax],0x45
c000b678:	78 63                	js     c000b6dd <digits.933+0x39>
c000b67a:	65 70 74             	gs jo  c000b6f1 <digits.933+0x4d>
c000b67d:	69 6f 6e 00 23 58 46 	imul   ebp,DWORD PTR [edi+0x6e],0x46582300
c000b684:	20 53 49             	and    BYTE PTR [ebx+0x49],dl
c000b687:	4d                   	dec    ebp
c000b688:	44                   	inc    esp
c000b689:	20 46 6c             	and    BYTE PTR [esi+0x6c],al
c000b68c:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b68d:	61                   	popa   
c000b68e:	74 69                	je     c000b6f9 <digits.933+0x55>
c000b690:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b691:	67 2d 50 6f 69 6e    	addr16 sub eax,0x6e696f50
c000b697:	74 20                	je     c000b6b9 <digits.933+0x15>
c000b699:	45                   	inc    ebp
c000b69a:	78 63                	js     c000b6ff <digits.933+0x5b>
c000b69c:	65 70 74             	gs jo  c000b713 <digits.933+0x6f>
c000b69f:	69 6f 6e 00 00 30 31 	imul   ebp,DWORD PTR [edi+0x6e],0x31300000

c000b6a4 <digits.933>:
c000b6a4:	30 31                	xor    BYTE PTR [ecx],dh
c000b6a6:	32 33                	xor    dh,BYTE PTR [ebx]
c000b6a8:	34 35                	xor    al,0x35
c000b6aa:	36 37                	ss aaa 
c000b6ac:	38 39                	cmp    BYTE PTR [ecx],bh
c000b6ae:	41                   	inc    ecx
c000b6af:	42                   	inc    edx
c000b6b0:	43                   	inc    ebx
c000b6b1:	44                   	inc    esp
c000b6b2:	45                   	inc    ebp
c000b6b3:	46                   	inc    esi
c000b6b4:	47                   	inc    edi
c000b6b5:	48                   	dec    eax
c000b6b6:	49                   	dec    ecx
c000b6b7:	4a                   	dec    edx
c000b6b8:	4b                   	dec    ebx
c000b6b9:	4c                   	dec    esp
c000b6ba:	4d                   	dec    ebp
c000b6bb:	4e                   	dec    esi
c000b6bc:	4f                   	dec    edi
c000b6bd:	50                   	push   eax
c000b6be:	51                   	push   ecx
c000b6bf:	52                   	push   edx
c000b6c0:	53                   	push   ebx
c000b6c1:	54                   	push   esp
c000b6c2:	55                   	push   ebp
c000b6c3:	56                   	push   esi
c000b6c4:	57                   	push   edi
c000b6c5:	58                   	pop    eax
c000b6c6:	59                   	pop    ecx
c000b6c7:	5a                   	pop    edx
c000b6c8:	00 00                	add    BYTE PTR [eax],al
c000b6ca:	00 00                	add    BYTE PTR [eax],al
c000b6cc:	64 73 74             	fs jae c000b743 <Screen+0x7>
c000b6cf:	5f                   	pop    edi
c000b6d0:	5f                   	pop    edi
c000b6d1:	20 21                	and    BYTE PTR [ecx],ah
c000b6d3:	3d 20 4e 55 4c       	cmp    eax,0x4c554e20
c000b6d8:	4c                   	dec    esp
c000b6d9:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
c000b6dd:	2f                   	das    
c000b6de:	73 74                	jae    c000b754 <Screen+0x18>
c000b6e0:	72 69                	jb     c000b74b <Screen+0xf>
c000b6e2:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b6e3:	67 2e 63 00          	arpl   WORD PTR cs:[bx+si],ax
c000b6e7:	64 73 74             	fs jae c000b75e <intr_name+0x6>
c000b6ea:	5f                   	pop    edi
c000b6eb:	5f                   	pop    edi
c000b6ec:	20 21                	and    BYTE PTR [ecx],ah
c000b6ee:	3d 20 4e 55 4c       	cmp    eax,0x4c554e20
c000b6f3:	4c                   	dec    esp
c000b6f4:	20 26                	and    BYTE PTR [esi],ah
c000b6f6:	26 20 73 72          	and    BYTE PTR es:[ebx+0x72],dh
c000b6fa:	63 5f 5f             	arpl   WORD PTR [edi+0x5f],bx
c000b6fd:	20 21                	and    BYTE PTR [ecx],ah
c000b6ff:	3d 20 4e 55 4c       	cmp    eax,0x4c554e20
c000b704:	4c                   	dec    esp
c000b705:	00 70 31             	add    BYTE PTR [eax+0x31],dh
c000b708:	5f                   	pop    edi
c000b709:	5f                   	pop    edi
c000b70a:	20 21                	and    BYTE PTR [ecx],ah
c000b70c:	3d 20 4e 55 4c       	cmp    eax,0x4c554e20
c000b711:	4c                   	dec    esp
c000b712:	20 26                	and    BYTE PTR [esi],ah
c000b714:	26 20 70 32          	and    BYTE PTR es:[eax+0x32],dh
c000b718:	5f                   	pop    edi
c000b719:	5f                   	pop    edi
c000b71a:	20 21                	and    BYTE PTR [ecx],ah
c000b71c:	3d 20 4e 55 4c       	cmp    eax,0x4c554e20
c000b721:	4c                   	dec    esp
	...

c000b724 <__func__.820>:
c000b724:	6d                   	ins    DWORD PTR es:[edi],dx
c000b725:	65 6d                	gs ins DWORD PTR es:[edi],dx
c000b727:	73 65                	jae    c000b78e <intr_name+0x36>
c000b729:	74 00                	je     c000b72b <__func__.820+0x7>
	...

c000b72c <__func__.831>:
c000b72c:	6d                   	ins    DWORD PTR es:[edi],dx
c000b72d:	65 6d                	gs ins DWORD PTR es:[edi],dx
c000b72f:	63 70 79             	arpl   WORD PTR [eax+0x79],si
	...

c000b734 <__func__.843>:
c000b734:	6d                   	ins    DWORD PTR es:[edi],dx
c000b735:	65 6d                	gs ins DWORD PTR es:[edi],dx
c000b737:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
	...

Disassembly of section .bss:

c000b73c <Screen>:
	...

c000b758 <intr_name>:
	...

c000b814 <idt>:
	...

c000b98c <idt_table>:
	...

c000ba48 <user_pool>:
	...

c0013758 <user_vaddr>:
	...

c001b468 <kernel_vaddr>:
	...

c0023178 <kernel_pool>:
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
