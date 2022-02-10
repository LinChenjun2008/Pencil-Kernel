
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
c0007f47:	0f 01 15 98 96 00 c0 	lgdtd  ds:0xc0009698
c0007f4e:	e9 c6 13 00 00       	jmp    c0009319 <_etext>
c0007f53:	e9 fb ff ff ff       	jmp    c0007f53 <_start+0x53>

c0007f58 <bitmap_init>:
c0007f58:	55                   	push   ebp
c0007f59:	89 e5                	mov    ebp,esp
c0007f5b:	83 ec 0c             	sub    esp,0xc
c0007f5e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
c0007f61:	ff 30                	push   DWORD PTR [eax]
c0007f63:	6a 00                	push   0x0
c0007f65:	ff 70 04             	push   DWORD PTR [eax+0x4]
c0007f68:	e8 ab 12 00 00       	call   c0009218 <memset>
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
c0007fb7:	68 c4 af 00 c0       	push   0xc000afc4
c0007fbc:	68 10 b0 00 c0       	push   0xc000b010
c0007fc1:	6a 2e                	push   0x2e
c0007fc3:	68 e8 af 00 c0       	push   0xc000afe8
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
c000806a:	68 f5 af 00 c0       	push   0xc000aff5
c000806f:	68 20 b0 00 c0       	push   0xc000b020
c0008074:	6a 65                	push   0x65
c0008076:	68 e8 af 00 c0       	push   0xc000afe8
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
c00080ca:	68 2b b0 00 c0       	push   0xc000b02b
c00080cf:	e8 ee 10 00 00       	call   c00091c2 <put_str>
c00080d4:	c7 04 24 32 b0 00 c0 	mov    DWORD PTR [esp],0xc000b032
c00080db:	e8 e2 10 00 00       	call   c00091c2 <put_str>
c00080e0:	5a                   	pop    edx
c00080e1:	ff 75 08             	push   DWORD PTR [ebp+0x8]
c00080e4:	e8 d9 10 00 00       	call   c00091c2 <put_str>
c00080e9:	c7 04 24 0a 00 00 00 	mov    DWORD PTR [esp],0xa
c00080f0:	e8 33 10 00 00       	call   c0009128 <put_char>
c00080f5:	c7 04 24 38 b0 00 c0 	mov    DWORD PTR [esp],0xc000b038
c00080fc:	e8 c1 10 00 00       	call   c00091c2 <put_str>
c0008101:	59                   	pop    ecx
c0008102:	ff 75 10             	push   DWORD PTR [ebp+0x10]
c0008105:	e8 b8 10 00 00       	call   c00091c2 <put_str>
c000810a:	c7 04 24 0a 00 00 00 	mov    DWORD PTR [esp],0xa
c0008111:	e8 12 10 00 00       	call   c0009128 <put_char>
c0008116:	c7 04 24 46 b0 00 c0 	mov    DWORD PTR [esp],0xc000b046
c000811d:	e8 a0 10 00 00       	call   c00091c2 <put_str>
c0008122:	58                   	pop    eax
c0008123:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
c0008126:	e8 bc 10 00 00       	call   c00091e7 <put_int>
c000812b:	c7 04 24 0a 00 00 00 	mov    DWORD PTR [esp],0xa
c0008132:	e8 f1 0f 00 00       	call   c0009128 <put_char>
c0008137:	c7 04 24 4c b0 00 c0 	mov    DWORD PTR [esp],0xc000b04c
c000813e:	e8 7f 10 00 00       	call   c00091c2 <put_str>
c0008143:	58                   	pop    eax
c0008144:	ff 75 14             	push   DWORD PTR [ebp+0x14]
c0008147:	e8 76 10 00 00       	call   c00091c2 <put_str>
c000814c:	c7 04 24 0a 00 00 00 	mov    DWORD PTR [esp],0xa
c0008153:	e8 d0 0f 00 00       	call   c0009128 <put_char>
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
c000832b:	e8 bc 0f 00 00       	call   c00092ec <init_pit>
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
c000835a:	ff 15 58 b5 00 c0    	call   DWORD PTR ds:0xc000b558
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
c0008385:	ff 15 5c b5 00 c0    	call   DWORD PTR ds:0xc000b55c
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
c00083b0:	ff 15 60 b5 00 c0    	call   DWORD PTR ds:0xc000b560
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
c00083db:	ff 15 64 b5 00 c0    	call   DWORD PTR ds:0xc000b564
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
c0008406:	ff 15 68 b5 00 c0    	call   DWORD PTR ds:0xc000b568
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
c0008431:	ff 15 6c b5 00 c0    	call   DWORD PTR ds:0xc000b56c
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
c000845c:	ff 15 70 b5 00 c0    	call   DWORD PTR ds:0xc000b570
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
c0008487:	ff 15 74 b5 00 c0    	call   DWORD PTR ds:0xc000b574
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
c00084ae:	ff 15 78 b5 00 c0    	call   DWORD PTR ds:0xc000b578
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
c00084d9:	ff 15 7c b5 00 c0    	call   DWORD PTR ds:0xc000b57c
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
c0008500:	ff 15 80 b5 00 c0    	call   DWORD PTR ds:0xc000b580
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
c0008527:	ff 15 84 b5 00 c0    	call   DWORD PTR ds:0xc000b584
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
c0008552:	ff 15 88 b5 00 c0    	call   DWORD PTR ds:0xc000b588
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
c0008579:	ff 15 8c b5 00 c0    	call   DWORD PTR ds:0xc000b58c
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
c00085a0:	ff 15 90 b5 00 c0    	call   DWORD PTR ds:0xc000b590
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
c00085cb:	ff 15 94 b5 00 c0    	call   DWORD PTR ds:0xc000b594
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
c00085f6:	ff 15 98 b5 00 c0    	call   DWORD PTR ds:0xc000b598
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
c000861d:	ff 15 9c b5 00 c0    	call   DWORD PTR ds:0xc000b59c
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
c0008648:	ff 15 a0 b5 00 c0    	call   DWORD PTR ds:0xc000b5a0
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
c0008673:	ff 15 a4 b5 00 c0    	call   DWORD PTR ds:0xc000b5a4
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
c000869e:	ff 15 a8 b5 00 c0    	call   DWORD PTR ds:0xc000b5a8
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
c00086c9:	ff 15 ac b5 00 c0    	call   DWORD PTR ds:0xc000b5ac
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
c00086f4:	ff 15 b0 b5 00 c0    	call   DWORD PTR ds:0xc000b5b0
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
c000871f:	ff 15 b4 b5 00 c0    	call   DWORD PTR ds:0xc000b5b4
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
c0008746:	ff 15 b8 b5 00 c0    	call   DWORD PTR ds:0xc000b5b8
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
c0008771:	ff 15 bc b5 00 c0    	call   DWORD PTR ds:0xc000b5bc
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
c0008798:	ff 15 c0 b5 00 c0    	call   DWORD PTR ds:0xc000b5c0
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
c00087bf:	ff 15 c4 b5 00 c0    	call   DWORD PTR ds:0xc000b5c4
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
c00087ea:	ff 15 c8 b5 00 c0    	call   DWORD PTR ds:0xc000b5c8
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
c0008811:	ff 15 cc b5 00 c0    	call   DWORD PTR ds:0xc000b5cc
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
c0008838:	ff 15 d0 b5 00 c0    	call   DWORD PTR ds:0xc000b5d0
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
c0008863:	ff 15 d4 b5 00 c0    	call   DWORD PTR ds:0xc000b5d4
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
c000888e:	ff 15 d8 b5 00 c0    	call   DWORD PTR ds:0xc000b5d8
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
c00088b9:	ff 15 dc b5 00 c0    	call   DWORD PTR ds:0xc000b5dc
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
c00088e4:	ff 15 e0 b5 00 c0    	call   DWORD PTR ds:0xc000b5e0
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
c000890f:	ff 15 e4 b5 00 c0    	call   DWORD PTR ds:0xc000b5e4
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
c000893a:	ff 15 e8 b5 00 c0    	call   DWORD PTR ds:0xc000b5e8
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
c0008965:	ff 15 ec b5 00 c0    	call   DWORD PTR ds:0xc000b5ec
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
c0008990:	ff 15 f0 b5 00 c0    	call   DWORD PTR ds:0xc000b5f0
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
c00089bb:	ff 15 f4 b5 00 c0    	call   DWORD PTR ds:0xc000b5f4
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
c00089e6:	ff 15 f8 b5 00 c0    	call   DWORD PTR ds:0xc000b5f8
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
c0008a11:	ff 15 fc b5 00 c0    	call   DWORD PTR ds:0xc000b5fc
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
c0008a3c:	ff 15 00 b6 00 c0    	call   DWORD PTR ds:0xc000b600
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
c0008a67:	ff 15 04 b6 00 c0    	call   DWORD PTR ds:0xc000b604
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
c0008a92:	ff 15 08 b6 00 c0    	call   DWORD PTR ds:0xc000b608
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
c0008abd:	ff 15 0c b6 00 c0    	call   DWORD PTR ds:0xc000b60c
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
c0008ae8:	ff 15 10 b6 00 c0    	call   DWORD PTR ds:0xc000b610
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
c0008b13:	ff 15 14 b6 00 c0    	call   DWORD PTR ds:0xc000b614
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
c0008b54:	c7 04 24 58 b0 00 c0 	mov    DWORD PTR [esp],0xc000b058
c0008b5b:	e8 62 06 00 00       	call   c00091c2 <put_str>
c0008b60:	0f b6 5d f7          	movzx  ebx,BYTE PTR [ebp-0x9]
c0008b64:	89 1c 24             	mov    DWORD PTR [esp],ebx
c0008b67:	e8 7b 06 00 00       	call   c00091e7 <put_int>
c0008b6c:	c7 04 24 20 00 00 00 	mov    DWORD PTR [esp],0x20
c0008b73:	e8 b0 05 00 00       	call   c0009128 <put_char>
c0008b78:	83 c4 10             	add    esp,0x10
c0008b7b:	80 7d f7 14          	cmp    BYTE PTR [ebp-0x9],0x14
c0008b7f:	77 13                	ja     c0008b94 <general_intr_handler+0x64>
c0008b81:	8b 04 9d 24 b3 00 c0 	mov    eax,DWORD PTR [ebx*4-0x3fff4cdc]
c0008b88:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
c0008b8b:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
c0008b8e:	c9                   	leave  
c0008b8f:	e9 2e 06 00 00       	jmp    c00091c2 <put_str>
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
c0008c2a:	8b 0c 85 a0 a6 00 c0 	mov    ecx,DWORD PTR [eax*4-0x3fff5960]
c0008c31:	8d 14 c5 e0 b3 00 c0 	lea    edx,[eax*8-0x3fff4c20]
c0008c38:	66 c7 42 02 08 00    	mov    WORD PTR [edx+0x2],0x8
c0008c3e:	c6 42 04 00          	mov    BYTE PTR [edx+0x4],0x0
c0008c42:	c6 42 05 8e          	mov    BYTE PTR [edx+0x5],0x8e
c0008c46:	66 89 0c c5 e0 b3 00 	mov    WORD PTR [eax*8-0x3fff4c20],cx
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
c0008c8e:	c7 04 85 58 b5 00 c0 	mov    DWORD PTR [eax*4-0x3fff4aa8],0xc0008b30
c0008c95:	30 8b 00 c0 
c0008c99:	c7 04 85 24 b3 00 c0 	mov    DWORD PTR [eax*4-0x3fff4cdc],0xc000b05e
c0008ca0:	5e b0 00 c0 
c0008ca4:	40                   	inc    eax
c0008ca5:	83 f8 2f             	cmp    eax,0x2f
c0008ca8:	75 e4                	jne    c0008c8e <exception_init+0x5>
c0008caa:	c7 05 24 b3 00 c0 66 	mov    DWORD PTR ds:0xc000b324,0xc000b066
c0008cb1:	b0 00 c0 
c0008cb4:	c7 05 28 b3 00 c0 77 	mov    DWORD PTR ds:0xc000b328,0xc000b077
c0008cbb:	b0 00 c0 
c0008cbe:	c7 05 2c b3 00 c0 8b 	mov    DWORD PTR ds:0xc000b32c,0xc000b08b
c0008cc5:	b0 00 c0 
c0008cc8:	c7 05 30 b3 00 c0 99 	mov    DWORD PTR ds:0xc000b330,0xc000b099
c0008ccf:	b0 00 c0 
c0008cd2:	c7 05 34 b3 00 c0 b2 	mov    DWORD PTR ds:0xc000b334,0xc000b0b2
c0008cd9:	b0 00 c0 
c0008cdc:	c7 05 38 b3 00 c0 c9 	mov    DWORD PTR ds:0xc000b338,0xc000b0c9
c0008ce3:	b0 00 c0 
c0008ce6:	c7 05 3c b3 00 c0 ec 	mov    DWORD PTR ds:0xc000b33c,0xc000b0ec
c0008ced:	b0 00 c0 
c0008cf0:	c7 05 40 b3 00 c0 09 	mov    DWORD PTR ds:0xc000b340,0xc000b109
c0008cf7:	b1 00 c0 
c0008cfa:	c7 05 44 b3 00 c0 2c 	mov    DWORD PTR ds:0xc000b344,0xc000b12c
c0008d01:	b1 00 c0 
c0008d04:	c7 05 48 b3 00 c0 47 	mov    DWORD PTR ds:0xc000b348,0xc000b147
c0008d0b:	b1 00 c0 
c0008d0e:	c7 05 4c b3 00 c0 63 	mov    DWORD PTR ds:0xc000b34c,0xc000b163
c0008d15:	b1 00 c0 
c0008d18:	c7 05 50 b3 00 c0 7d 	mov    DWORD PTR ds:0xc000b350,0xc000b17d
c0008d1f:	b1 00 c0 
c0008d22:	c7 05 54 b3 00 c0 95 	mov    DWORD PTR ds:0xc000b354,0xc000b195
c0008d29:	b1 00 c0 
c0008d2c:	c7 05 58 b3 00 c0 af 	mov    DWORD PTR ds:0xc000b358,0xc000b1af
c0008d33:	b1 00 c0 
c0008d36:	c7 05 5c b3 00 c0 d0 	mov    DWORD PTR ds:0xc000b35c,0xc000b1d0
c0008d3d:	b1 00 c0 
c0008d40:	c7 05 60 b3 00 c0 e9 	mov    DWORD PTR ds:0xc000b360,0xc000b1e9
c0008d47:	b1 00 c0 
c0008d4a:	c7 05 64 b3 00 c0 f2 	mov    DWORD PTR ds:0xc000b364,0xc000b1f2
c0008d51:	b1 00 c0 
c0008d54:	c7 05 68 b3 00 c0 13 	mov    DWORD PTR ds:0xc000b368,0xc000b213
c0008d5b:	b2 00 c0 
c0008d5e:	c7 05 6c b3 00 c0 31 	mov    DWORD PTR ds:0xc000b36c,0xc000b231
c0008d65:	b2 00 c0 
c0008d68:	c7 05 70 b3 00 c0 4d 	mov    DWORD PTR ds:0xc000b370,0xc000b24d
c0008d6f:	b2 00 c0 
c0008d72:	5d                   	pop    ebp
c0008d73:	c3                   	ret    

c0008d74 <init_idt>:
c0008d74:	55                   	push   ebp
c0008d75:	89 e5                	mov    ebp,esp
c0008d77:	83 ec 18             	sub    esp,0x18
c0008d7a:	e8 a6 fe ff ff       	call   c0008c25 <idt_desc_init>
c0008d7f:	e8 15 fe ff ff       	call   c0008b99 <init_pic>
c0008d84:	b8 e0 b3 00 c0       	mov    eax,0xc000b3e0
c0008d89:	c1 e0 10             	shl    eax,0x10
c0008d8c:	0d 77 01 00 00       	or     eax,0x177
c0008d91:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
c0008d94:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
c0008d9b:	e8 e9 fe ff ff       	call   c0008c89 <exception_init>
c0008da0:	50                   	push   eax
c0008da1:	50                   	push   eax
c0008da2:	68 e0 b3 00 c0       	push   0xc000b3e0
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

c0008f64 <put_char_graphic>:
c0008f64:	55                   	push   ebp
c0008f65:	89 e5                	mov    ebp,esp
c0008f67:	57                   	push   edi
c0008f68:	56                   	push   esi
c0008f69:	53                   	push   ebx
c0008f6a:	83 ec 08             	sub    esp,0x8
c0008f6d:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c0008f70:	83 3d 0c 7c 00 00 01 	cmp    DWORD PTR ds:0x7c0c,0x1
c0008f77:	8a 45 18             	mov    al,BYTE PTR [ebp+0x18]
c0008f7a:	75 47                	jne    c0008fc3 <put_char_graphic+0x5f>
c0008f7c:	0f be c0             	movsx  eax,al
c0008f7f:	8b 33                	mov    esi,DWORD PTR [ebx]
c0008f81:	c1 e0 04             	shl    eax,0x4
c0008f84:	05 a0 96 00 c0       	add    eax,0xc00096a0
c0008f89:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
c0008f8c:	31 c0                	xor    eax,eax
c0008f8e:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
c0008f91:	b1 ff                	mov    cl,0xff
c0008f93:	89 5d ec             	mov    DWORD PTR [ebp-0x14],ebx
c0008f96:	01 c2                	add    edx,eax
c0008f98:	0f af 53 04          	imul   edx,DWORD PTR [ebx+0x4]
c0008f9c:	03 55 0c             	add    edx,DWORD PTR [ebp+0xc]
c0008f9f:	8d 3c 96             	lea    edi,[esi+edx*4]
c0008fa2:	31 d2                	xor    edx,edx
c0008fa4:	8b 5d f0             	mov    ebx,DWORD PTR [ebp-0x10]
c0008fa7:	84 0c 03             	test   BYTE PTR [ebx+eax*1],cl
c0008faa:	74 06                	je     c0008fb2 <put_char_graphic+0x4e>
c0008fac:	8b 5d 14             	mov    ebx,DWORD PTR [ebp+0x14]
c0008faf:	89 1c 97             	mov    DWORD PTR [edi+edx*4],ebx
c0008fb2:	42                   	inc    edx
c0008fb3:	d0 e9                	shr    cl,1
c0008fb5:	83 fa 08             	cmp    edx,0x8
c0008fb8:	75 ea                	jne    c0008fa4 <put_char_graphic+0x40>
c0008fba:	40                   	inc    eax
c0008fbb:	8b 5d ec             	mov    ebx,DWORD PTR [ebp-0x14]
c0008fbe:	83 f8 10             	cmp    eax,0x10
c0008fc1:	75 cb                	jne    c0008f8e <put_char_graphic+0x2a>
c0008fc3:	58                   	pop    eax
c0008fc4:	5a                   	pop    edx
c0008fc5:	5b                   	pop    ebx
c0008fc6:	5e                   	pop    esi
c0008fc7:	5f                   	pop    edi
c0008fc8:	5d                   	pop    ebp
c0008fc9:	c3                   	ret    

c0008fca <put_str_graphic>:
c0008fca:	55                   	push   ebp
c0008fcb:	89 e5                	mov    ebp,esp
c0008fcd:	57                   	push   edi
c0008fce:	8b 7d 14             	mov    edi,DWORD PTR [ebp+0x14]
c0008fd1:	56                   	push   esi
c0008fd2:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
c0008fd5:	53                   	push   ebx
c0008fd6:	8b 5d 18             	mov    ebx,DWORD PTR [ebp+0x18]
c0008fd9:	eb 17                	jmp    c0008ff2 <put_str_graphic+0x28>
c0008fdb:	0f be c0             	movsx  eax,al
c0008fde:	50                   	push   eax
c0008fdf:	57                   	push   edi
c0008fe0:	ff 75 10             	push   DWORD PTR [ebp+0x10]
c0008fe3:	56                   	push   esi
c0008fe4:	83 c6 0a             	add    esi,0xa
c0008fe7:	ff 75 08             	push   DWORD PTR [ebp+0x8]
c0008fea:	e8 75 ff ff ff       	call   c0008f64 <put_char_graphic>
c0008fef:	83 c4 14             	add    esp,0x14
c0008ff2:	43                   	inc    ebx
c0008ff3:	8a 43 ff             	mov    al,BYTE PTR [ebx-0x1]
c0008ff6:	84 c0                	test   al,al
c0008ff8:	75 e1                	jne    c0008fdb <put_str_graphic+0x11>
c0008ffa:	8d 65 f4             	lea    esp,[ebp-0xc]
c0008ffd:	5b                   	pop    ebx
c0008ffe:	5e                   	pop    esi
c0008fff:	5f                   	pop    edi
c0009000:	5d                   	pop    ebp
c0009001:	c3                   	ret    

c0009002 <itoa>:
c0009002:	55                   	push   ebp
c0009003:	89 e5                	mov    ebp,esp
c0009005:	57                   	push   edi
c0009006:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
c0009009:	56                   	push   esi
c000900a:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
c000900d:	53                   	push   ebx
c000900e:	8b 7d 10             	mov    edi,DWORD PTR [ebp+0x10]
c0009011:	31 db                	xor    ebx,ebx
c0009013:	89 f0                	mov    eax,esi
c0009015:	99                   	cdq    
c0009016:	89 d0                	mov    eax,edx
c0009018:	31 f0                	xor    eax,esi
c000901a:	29 d0                	sub    eax,edx
c000901c:	eb 02                	jmp    c0009020 <itoa+0x1e>
c000901e:	89 d3                	mov    ebx,edx
c0009020:	99                   	cdq    
c0009021:	f7 ff                	idiv   edi
c0009023:	8a 92 70 b2 00 c0    	mov    dl,BYTE PTR [edx-0x3fff4d90]
c0009029:	85 c0                	test   eax,eax
c000902b:	88 14 19             	mov    BYTE PTR [ecx+ebx*1],dl
c000902e:	8d 53 01             	lea    edx,[ebx+0x1]
c0009031:	7f eb                	jg     c000901e <itoa+0x1c>
c0009033:	85 f6                	test   esi,esi
c0009035:	79 07                	jns    c000903e <itoa+0x3c>
c0009037:	c6 04 11 2d          	mov    BYTE PTR [ecx+edx*1],0x2d
c000903b:	8d 53 02             	lea    edx,[ebx+0x2]
c000903e:	c6 04 11 00          	mov    BYTE PTR [ecx+edx*1],0x0
c0009042:	89 c8                	mov    eax,ecx
c0009044:	eb 01                	jmp    c0009047 <itoa+0x45>
c0009046:	40                   	inc    eax
c0009047:	80 38 00             	cmp    BYTE PTR [eax],0x0
c000904a:	75 fa                	jne    c0009046 <itoa+0x44>
c000904c:	eb 09                	jmp    c0009057 <itoa+0x55>
c000904e:	8a 11                	mov    dl,BYTE PTR [ecx]
c0009050:	8a 18                	mov    bl,BYTE PTR [eax]
c0009052:	88 19                	mov    BYTE PTR [ecx],bl
c0009054:	41                   	inc    ecx
c0009055:	88 10                	mov    BYTE PTR [eax],dl
c0009057:	48                   	dec    eax
c0009058:	39 c8                	cmp    eax,ecx
c000905a:	77 f2                	ja     c000904e <itoa+0x4c>
c000905c:	5b                   	pop    ebx
c000905d:	5e                   	pop    esi
c000905e:	5f                   	pop    edi
c000905f:	5d                   	pop    ebp
c0009060:	c3                   	ret    

c0009061 <roll_screen>:
c0009061:	55                   	push   ebp
c0009062:	31 c0                	xor    eax,eax
c0009064:	89 e5                	mov    ebp,esp
c0009066:	56                   	push   esi
c0009067:	53                   	push   ebx
c0009068:	8b 15 18 7c 00 00    	mov    edx,DWORD PTR ds:0x7c18
c000906e:	8b 0d 10 7c 00 00    	mov    ecx,DWORD PTR ds:0x7c10
c0009074:	8d 1c 51             	lea    ebx,[ecx+edx*2]
c0009077:	4a                   	dec    edx
c0009078:	0f af 15 1c 7c 00 00 	imul   edx,DWORD PTR ds:0x7c1c
c000907f:	eb 09                	jmp    c000908a <roll_screen+0x29>
c0009081:	66 8b 34 43          	mov    si,WORD PTR [ebx+eax*2]
c0009085:	66 89 34 41          	mov    WORD PTR [ecx+eax*2],si
c0009089:	40                   	inc    eax
c000908a:	39 d0                	cmp    eax,edx
c000908c:	75 f3                	jne    c0009081 <roll_screen+0x20>
c000908e:	5b                   	pop    ebx
c000908f:	5e                   	pop    esi
c0009090:	5d                   	pop    ebp
c0009091:	c3                   	ret    

c0009092 <get_cursor>:
c0009092:	55                   	push   ebp
c0009093:	89 e5                	mov    ebp,esp
c0009095:	53                   	push   ebx
c0009096:	83 ec 0c             	sub    esp,0xc
c0009099:	6a 0e                	push   0xe
c000909b:	68 d4 03 00 00       	push   0x3d4
c00090a0:	e8 b7 fd ff ff       	call   c0008e5c <io_out8>
c00090a5:	c7 04 24 d5 03 00 00 	mov    DWORD PTR [esp],0x3d5
c00090ac:	e8 7f fd ff ff       	call   c0008e30 <io_in8>
c00090b1:	89 c3                	mov    ebx,eax
c00090b3:	58                   	pop    eax
c00090b4:	5a                   	pop    edx
c00090b5:	c1 e3 08             	shl    ebx,0x8
c00090b8:	6a 0f                	push   0xf
c00090ba:	68 d4 03 00 00       	push   0x3d4
c00090bf:	e8 98 fd ff ff       	call   c0008e5c <io_out8>
c00090c4:	c7 04 24 d5 03 00 00 	mov    DWORD PTR [esp],0x3d5
c00090cb:	e8 60 fd ff ff       	call   c0008e30 <io_in8>
c00090d0:	09 c3                	or     ebx,eax
c00090d2:	89 d8                	mov    eax,ebx
c00090d4:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
c00090d7:	c9                   	leave  
c00090d8:	c3                   	ret    

c00090d9 <set_cursor>:
c00090d9:	55                   	push   ebp
c00090da:	89 e5                	mov    ebp,esp
c00090dc:	53                   	push   ebx
c00090dd:	83 ec 0c             	sub    esp,0xc
c00090e0:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c00090e3:	6a 0e                	push   0xe
c00090e5:	68 d4 03 00 00       	push   0x3d4
c00090ea:	e8 6d fd ff ff       	call   c0008e5c <io_out8>
c00090ef:	59                   	pop    ecx
c00090f0:	58                   	pop    eax
c00090f1:	0f b6 c7             	movzx  eax,bh
c00090f4:	81 e3 ff 00 00 00    	and    ebx,0xff
c00090fa:	50                   	push   eax
c00090fb:	68 d5 03 00 00       	push   0x3d5
c0009100:	e8 57 fd ff ff       	call   c0008e5c <io_out8>
c0009105:	58                   	pop    eax
c0009106:	5a                   	pop    edx
c0009107:	6a 0f                	push   0xf
c0009109:	68 d4 03 00 00       	push   0x3d4
c000910e:	e8 49 fd ff ff       	call   c0008e5c <io_out8>
c0009113:	59                   	pop    ecx
c0009114:	58                   	pop    eax
c0009115:	53                   	push   ebx
c0009116:	68 d5 03 00 00       	push   0x3d5
c000911b:	e8 3c fd ff ff       	call   c0008e5c <io_out8>
c0009120:	83 c4 10             	add    esp,0x10
c0009123:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
c0009126:	c9                   	leave  
c0009127:	c3                   	ret    

c0009128 <put_char>:
c0009128:	55                   	push   ebp
c0009129:	89 e5                	mov    ebp,esp
c000912b:	53                   	push   ebx
c000912c:	50                   	push   eax
c000912d:	8a 5d 08             	mov    bl,BYTE PTR [ebp+0x8]
c0009130:	83 3d 0c 7c 00 00 00 	cmp    DWORD PTR ds:0x7c0c,0x0
c0009137:	0f 85 81 00 00 00    	jne    c00091be <put_char+0x96>
c000913d:	e8 50 ff ff ff       	call   c0009092 <get_cursor>
c0009142:	80 fb 08             	cmp    bl,0x8
c0009145:	74 14                	je     c000915b <put_char+0x33>
c0009147:	77 06                	ja     c000914f <put_char+0x27>
c0009149:	84 db                	test   bl,bl
c000914b:	74 43                	je     c0009190 <put_char+0x68>
c000914d:	eb 2c                	jmp    c000917b <put_char+0x53>
c000914f:	80 fb 0a             	cmp    bl,0xa
c0009152:	74 14                	je     c0009168 <put_char+0x40>
c0009154:	80 fb 0d             	cmp    bl,0xd
c0009157:	75 22                	jne    c000917b <put_char+0x53>
c0009159:	eb 0d                	jmp    c0009168 <put_char+0x40>
c000915b:	8b 15 10 7c 00 00    	mov    edx,DWORD PTR ds:0x7c10
c0009161:	48                   	dec    eax
c0009162:	c6 04 42 20          	mov    BYTE PTR [edx+eax*2],0x20
c0009166:	eb 28                	jmp    c0009190 <put_char+0x68>
c0009168:	8b 1d 18 7c 00 00    	mov    ebx,DWORD PTR ds:0x7c18
c000916e:	31 d2                	xor    edx,edx
c0009170:	8d 0c 18             	lea    ecx,[eax+ebx*1]
c0009173:	f7 f3                	div    ebx
c0009175:	89 c8                	mov    eax,ecx
c0009177:	29 d0                	sub    eax,edx
c0009179:	eb 15                	jmp    c0009190 <put_char+0x68>
c000917b:	8b 15 10 7c 00 00    	mov    edx,DWORD PTR ds:0x7c10
c0009181:	88 1c 42             	mov    BYTE PTR [edx+eax*2],bl
c0009184:	8b 15 10 7c 00 00    	mov    edx,DWORD PTR ds:0x7c10
c000918a:	c6 44 42 01 07       	mov    BYTE PTR [edx+eax*2+0x1],0x7
c000918f:	40                   	inc    eax
c0009190:	8b 15 1c 7c 00 00    	mov    edx,DWORD PTR ds:0x7c1c
c0009196:	0f af 15 18 7c 00 00 	imul   edx,DWORD PTR ds:0x7c18
c000919d:	39 d0                	cmp    eax,edx
c000919f:	72 12                	jb     c00091b3 <put_char+0x8b>
c00091a1:	e8 bb fe ff ff       	call   c0009061 <roll_screen>
c00091a6:	a1 1c 7c 00 00       	mov    eax,ds:0x7c1c
c00091ab:	48                   	dec    eax
c00091ac:	0f af 05 18 7c 00 00 	imul   eax,DWORD PTR ds:0x7c18
c00091b3:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
c00091b6:	58                   	pop    eax
c00091b7:	5b                   	pop    ebx
c00091b8:	5d                   	pop    ebp
c00091b9:	e9 1b ff ff ff       	jmp    c00090d9 <set_cursor>
c00091be:	58                   	pop    eax
c00091bf:	5b                   	pop    ebx
c00091c0:	5d                   	pop    ebp
c00091c1:	c3                   	ret    

c00091c2 <put_str>:
c00091c2:	55                   	push   ebp
c00091c3:	89 e5                	mov    ebp,esp
c00091c5:	53                   	push   ebx
c00091c6:	50                   	push   eax
c00091c7:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c00091ca:	eb 10                	jmp    c00091dc <put_str+0x1a>
c00091cc:	83 ec 0c             	sub    esp,0xc
c00091cf:	0f b6 c0             	movzx  eax,al
c00091d2:	50                   	push   eax
c00091d3:	43                   	inc    ebx
c00091d4:	e8 4f ff ff ff       	call   c0009128 <put_char>
c00091d9:	83 c4 10             	add    esp,0x10
c00091dc:	8a 03                	mov    al,BYTE PTR [ebx]
c00091de:	84 c0                	test   al,al
c00091e0:	75 ea                	jne    c00091cc <put_str+0xa>
c00091e2:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
c00091e5:	c9                   	leave  
c00091e6:	c3                   	ret    

c00091e7 <put_int>:
c00091e7:	55                   	push   ebp
c00091e8:	31 c0                	xor    eax,eax
c00091ea:	89 e5                	mov    ebp,esp
c00091ec:	b9 42 00 00 00       	mov    ecx,0x42
c00091f1:	57                   	push   edi
c00091f2:	8d 7d b6             	lea    edi,[ebp-0x4a]
c00091f5:	83 ec 54             	sub    esp,0x54
c00091f8:	f3 aa                	rep stos BYTE PTR es:[edi],al
c00091fa:	8d 7d b6             	lea    edi,[ebp-0x4a]
c00091fd:	6a 10                	push   0x10
c00091ff:	57                   	push   edi
c0009200:	ff 75 08             	push   DWORD PTR [ebp+0x8]
c0009203:	e8 fa fd ff ff       	call   c0009002 <itoa>
c0009208:	57                   	push   edi
c0009209:	e8 b4 ff ff ff       	call   c00091c2 <put_str>
c000920e:	83 c4 10             	add    esp,0x10
c0009211:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
c0009214:	c9                   	leave  
c0009215:	c3                   	ret    
	...

c0009218 <memset>:
c0009218:	55                   	push   ebp
c0009219:	89 e5                	mov    ebp,esp
c000921b:	56                   	push   esi
c000921c:	53                   	push   ebx
c000921d:	83 ec 10             	sub    esp,0x10
c0009220:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c0009223:	8b 75 10             	mov    esi,DWORD PTR [ebp+0x10]
c0009226:	8a 55 0c             	mov    dl,BYTE PTR [ebp+0xc]
c0009229:	85 db                	test   ebx,ebx
c000922b:	75 1f                	jne    c000924c <memset+0x34>
c000922d:	68 98 b2 00 c0       	push   0xc000b298
c0009232:	68 f0 b2 00 c0       	push   0xc000b2f0
c0009237:	6a 0f                	push   0xf
c0009239:	68 a6 b2 00 c0       	push   0xc000b2a6
c000923e:	88 55 f4             	mov    BYTE PTR [ebp-0xc],dl
c0009241:	e8 76 ee ff ff       	call   c00080bc <panic_spin>
c0009246:	8a 55 f4             	mov    dl,BYTE PTR [ebp-0xc]
c0009249:	83 c4 10             	add    esp,0x10
c000924c:	31 c0                	xor    eax,eax
c000924e:	eb 04                	jmp    c0009254 <memset+0x3c>
c0009250:	88 14 03             	mov    BYTE PTR [ebx+eax*1],dl
c0009253:	40                   	inc    eax
c0009254:	39 f0                	cmp    eax,esi
c0009256:	75 f8                	jne    c0009250 <memset+0x38>
c0009258:	8d 65 f8             	lea    esp,[ebp-0x8]
c000925b:	5b                   	pop    ebx
c000925c:	5e                   	pop    esi
c000925d:	5d                   	pop    ebp
c000925e:	c3                   	ret    

c000925f <memcpy>:
c000925f:	55                   	push   ebp
c0009260:	89 e5                	mov    ebp,esp
c0009262:	57                   	push   edi
c0009263:	56                   	push   esi
c0009264:	53                   	push   ebx
c0009265:	83 ec 0c             	sub    esp,0xc
c0009268:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
c000926b:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
c000926e:	8b 7d 10             	mov    edi,DWORD PTR [ebp+0x10]
c0009271:	85 f6                	test   esi,esi
c0009273:	74 04                	je     c0009279 <memcpy+0x1a>
c0009275:	85 db                	test   ebx,ebx
c0009277:	75 19                	jne    c0009292 <memcpy+0x33>
c0009279:	68 b3 b2 00 c0       	push   0xc000b2b3
c000927e:	68 f8 b2 00 c0       	push   0xc000b2f8
c0009283:	6a 22                	push   0x22
c0009285:	68 a6 b2 00 c0       	push   0xc000b2a6
c000928a:	e8 2d ee ff ff       	call   c00080bc <panic_spin>
c000928f:	83 c4 10             	add    esp,0x10
c0009292:	31 c0                	xor    eax,eax
c0009294:	eb 07                	jmp    c000929d <memcpy+0x3e>
c0009296:	8a 14 06             	mov    dl,BYTE PTR [esi+eax*1]
c0009299:	88 14 03             	mov    BYTE PTR [ebx+eax*1],dl
c000929c:	40                   	inc    eax
c000929d:	39 f8                	cmp    eax,edi
c000929f:	75 f5                	jne    c0009296 <memcpy+0x37>
c00092a1:	8d 65 f4             	lea    esp,[ebp-0xc]
c00092a4:	5b                   	pop    ebx
c00092a5:	5e                   	pop    esi
c00092a6:	5f                   	pop    edi
c00092a7:	5d                   	pop    ebp
c00092a8:	c3                   	ret    

c00092a9 <memcmp>:
c00092a9:	55                   	push   ebp
c00092aa:	89 e5                	mov    ebp,esp
c00092ac:	56                   	push   esi
c00092ad:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
c00092b0:	53                   	push   ebx
c00092b1:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
c00092b4:	85 db                	test   ebx,ebx
c00092b6:	74 04                	je     c00092bc <memcmp+0x13>
c00092b8:	85 f6                	test   esi,esi
c00092ba:	75 19                	jne    c00092d5 <memcmp+0x2c>
c00092bc:	68 d2 b2 00 c0       	push   0xc000b2d2
c00092c1:	68 00 b3 00 c0       	push   0xc000b300
c00092c6:	6a 3b                	push   0x3b
c00092c8:	68 a6 b2 00 c0       	push   0xc000b2a6
c00092cd:	e8 ea ed ff ff       	call   c00080bc <panic_spin>
c00092d2:	83 c4 10             	add    esp,0x10
c00092d5:	8a 13                	mov    dl,BYTE PTR [ebx]
c00092d7:	83 c8 ff             	or     eax,0xffffffff
c00092da:	38 16                	cmp    BYTE PTR [esi],dl
c00092dc:	72 06                	jb     c00092e4 <memcmp+0x3b>
c00092de:	0f 97 c0             	seta   al
c00092e1:	0f b6 c0             	movzx  eax,al
c00092e4:	8d 65 f8             	lea    esp,[ebp-0x8]
c00092e7:	5b                   	pop    ebx
c00092e8:	5e                   	pop    esi
c00092e9:	5d                   	pop    ebp
c00092ea:	c3                   	ret    
	...

c00092ec <init_pit>:
c00092ec:	55                   	push   ebp
c00092ed:	89 e5                	mov    ebp,esp
c00092ef:	83 ec 10             	sub    esp,0x10
c00092f2:	6a 34                	push   0x34
c00092f4:	6a 43                	push   0x43
c00092f6:	e8 61 fb ff ff       	call   c0008e5c <io_out8>
c00092fb:	58                   	pop    eax
c00092fc:	5a                   	pop    edx
c00092fd:	68 9c 00 00 00       	push   0x9c
c0009302:	6a 40                	push   0x40
c0009304:	e8 53 fb ff ff       	call   c0008e5c <io_out8>
c0009309:	59                   	pop    ecx
c000930a:	58                   	pop    eax
c000930b:	6a 2e                	push   0x2e
c000930d:	6a 40                	push   0x40
c000930f:	e8 48 fb ff ff       	call   c0008e5c <io_out8>
c0009314:	83 c4 10             	add    esp,0x10
c0009317:	c9                   	leave  
c0009318:	c3                   	ret    

Disassembly of section .text.startup:

c0009319 <main>:
c0009319:	8d 4c 24 04          	lea    ecx,[esp+0x4]
c000931d:	83 e4 f0             	and    esp,0xfffffff0
c0009320:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
c0009323:	55                   	push   ebp
c0009324:	89 e5                	mov    ebp,esp
c0009326:	51                   	push   ecx
c0009327:	83 ec 10             	sub    esp,0x10
c000932a:	a1 18 7c 00 00       	mov    eax,ds:0x7c18
c000932f:	c1 e0 03             	shl    eax,0x3
c0009332:	50                   	push   eax
c0009333:	e8 a1 fd ff ff       	call   c00090d9 <set_cursor>
c0009338:	c7 04 24 50 00 00 00 	mov    DWORD PTR [esp],0x50
c000933f:	e8 e4 fd ff ff       	call   c0009128 <put_char>
c0009344:	c7 04 24 65 00 00 00 	mov    DWORD PTR [esp],0x65
c000934b:	e8 d8 fd ff ff       	call   c0009128 <put_char>
c0009350:	c7 04 24 6e 00 00 00 	mov    DWORD PTR [esp],0x6e
c0009357:	e8 cc fd ff ff       	call   c0009128 <put_char>
c000935c:	c7 04 24 63 00 00 00 	mov    DWORD PTR [esp],0x63
c0009363:	e8 c0 fd ff ff       	call   c0009128 <put_char>
c0009368:	c7 04 24 69 00 00 00 	mov    DWORD PTR [esp],0x69
c000936f:	e8 b4 fd ff ff       	call   c0009128 <put_char>
c0009374:	c7 04 24 6c 00 00 00 	mov    DWORD PTR [esp],0x6c
c000937b:	e8 a8 fd ff ff       	call   c0009128 <put_char>
c0009380:	c7 04 24 2d 00 00 00 	mov    DWORD PTR [esp],0x2d
c0009387:	e8 9c fd ff ff       	call   c0009128 <put_char>
c000938c:	c7 04 24 4b 00 00 00 	mov    DWORD PTR [esp],0x4b
c0009393:	e8 90 fd ff ff       	call   c0009128 <put_char>
c0009398:	c7 04 24 65 00 00 00 	mov    DWORD PTR [esp],0x65
c000939f:	e8 84 fd ff ff       	call   c0009128 <put_char>
c00093a4:	c7 04 24 72 00 00 00 	mov    DWORD PTR [esp],0x72
c00093ab:	e8 78 fd ff ff       	call   c0009128 <put_char>
c00093b0:	c7 04 24 6e 00 00 00 	mov    DWORD PTR [esp],0x6e
c00093b7:	e8 6c fd ff ff       	call   c0009128 <put_char>
c00093bc:	c7 04 24 65 00 00 00 	mov    DWORD PTR [esp],0x65
c00093c3:	e8 60 fd ff ff       	call   c0009128 <put_char>
c00093c8:	c7 04 24 6c 00 00 00 	mov    DWORD PTR [esp],0x6c
c00093cf:	e8 54 fd ff ff       	call   c0009128 <put_char>
c00093d4:	c7 04 24 20 00 00 00 	mov    DWORD PTR [esp],0x20
c00093db:	e8 48 fd ff ff       	call   c0009128 <put_char>
c00093e0:	c7 04 24 62 00 00 00 	mov    DWORD PTR [esp],0x62
c00093e7:	e8 3c fd ff ff       	call   c0009128 <put_char>
c00093ec:	c7 04 24 75 00 00 00 	mov    DWORD PTR [esp],0x75
c00093f3:	e8 30 fd ff ff       	call   c0009128 <put_char>
c00093f8:	c7 04 24 69 00 00 00 	mov    DWORD PTR [esp],0x69
c00093ff:	e8 24 fd ff ff       	call   c0009128 <put_char>
c0009404:	c7 04 24 6c 00 00 00 	mov    DWORD PTR [esp],0x6c
c000940b:	e8 18 fd ff ff       	call   c0009128 <put_char>
c0009410:	c7 04 24 64 00 00 00 	mov    DWORD PTR [esp],0x64
c0009417:	e8 0c fd ff ff       	call   c0009128 <put_char>
c000941c:	c7 04 24 20 00 00 00 	mov    DWORD PTR [esp],0x20
c0009423:	e8 00 fd ff ff       	call   c0009128 <put_char>
c0009428:	c7 04 24 30 00 00 00 	mov    DWORD PTR [esp],0x30
c000942f:	e8 f4 fc ff ff       	call   c0009128 <put_char>
c0009434:	c7 04 24 2e 00 00 00 	mov    DWORD PTR [esp],0x2e
c000943b:	e8 e8 fc ff ff       	call   c0009128 <put_char>
c0009440:	c7 04 24 30 00 00 00 	mov    DWORD PTR [esp],0x30
c0009447:	e8 dc fc ff ff       	call   c0009128 <put_char>
c000944c:	c7 04 24 2e 00 00 00 	mov    DWORD PTR [esp],0x2e
c0009453:	e8 d0 fc ff ff       	call   c0009128 <put_char>
c0009458:	c7 04 24 30 00 00 00 	mov    DWORD PTR [esp],0x30
c000945f:	e8 c4 fc ff ff       	call   c0009128 <put_char>
c0009464:	c7 04 24 20 00 00 00 	mov    DWORD PTR [esp],0x20
c000946b:	e8 b8 fc ff ff       	call   c0009128 <put_char>
c0009470:	c7 04 24 74 00 00 00 	mov    DWORD PTR [esp],0x74
c0009477:	e8 ac fc ff ff       	call   c0009128 <put_char>
c000947c:	c7 04 24 0a 00 00 00 	mov    DWORD PTR [esp],0xa
c0009483:	e8 a0 fc ff ff       	call   c0009128 <put_char>
c0009488:	e8 93 ee ff ff       	call   c0008320 <init_all>
c000948d:	83 c4 10             	add    esp,0x10
c0009490:	eb fe                	jmp    c0009490 <main+0x177>

Disassembly of section .data:

c0009498 <_data>:
	...

c00094a0 <SectionCode32>:
c00094a0:	ff                   	(bad)  
c00094a1:	ff 00                	inc    DWORD PTR [eax]
c00094a3:	00 00                	add    BYTE PTR [eax],al
c00094a5:	98                   	cwde   
c00094a6:	cf                   	iret   
	...

c00094a8 <SectionData32>:
c00094a8:	ff                   	(bad)  
c00094a9:	ff 00                	inc    DWORD PTR [eax]
c00094ab:	00 00                	add    BYTE PTR [eax],al
c00094ad:	92                   	xchg   edx,eax
c00094ae:	cf                   	iret   
	...

c00094b0 <SectionVideo>:
c00094b0:	07                   	pop    es
c00094b1:	00 00                	add    BYTE PTR [eax],al
c00094b3:	80 0b 92             	or     BYTE PTR [ebx],0x92
c00094b6:	c0 00 00             	rol    BYTE PTR [eax],0x0
	...

c0009698 <gdt_ptr>:
c0009698:	1f                   	pop    ds
c0009699:	00 98 94 00 c0 00    	add    BYTE PTR [eax+0xc00094],bl
	...

c00096a0 <PKnFont>:
	...
c00098b0:	00 10                	add    BYTE PTR [eax],dl
c00098b2:	10 10                	adc    BYTE PTR [eax],dl
c00098b4:	10 10                	adc    BYTE PTR [eax],dl
c00098b6:	10 10                	adc    BYTE PTR [eax],dl
c00098b8:	10 10                	adc    BYTE PTR [eax],dl
c00098ba:	00 00                	add    BYTE PTR [eax],al
c00098bc:	10 10                	adc    BYTE PTR [eax],dl
c00098be:	00 00                	add    BYTE PTR [eax],al
c00098c0:	28 28                	sub    BYTE PTR [eax],ch
c00098c2:	28 00                	sub    BYTE PTR [eax],al
	...
c00098d0:	00 44 44 44          	add    BYTE PTR [esp+eax*2+0x44],al
c00098d4:	fe 44 44 44          	inc    BYTE PTR [esp+eax*2+0x44]
c00098d8:	44                   	inc    esp
c00098d9:	44                   	inc    esp
c00098da:	fe 44 44 44          	inc    BYTE PTR [esp+eax*2+0x44]
c00098de:	00 00                	add    BYTE PTR [eax],al
c00098e0:	10 3a                	adc    BYTE PTR [edx],bh
c00098e2:	56                   	push   esi
c00098e3:	92                   	xchg   edx,eax
c00098e4:	92                   	xchg   edx,eax
c00098e5:	90                   	nop
c00098e6:	50                   	push   eax
c00098e7:	38 14 12             	cmp    BYTE PTR [edx+edx*1],dl
c00098ea:	92                   	xchg   edx,eax
c00098eb:	92                   	xchg   edx,eax
c00098ec:	d4 b8                	aam    0xb8
c00098ee:	10 10                	adc    BYTE PTR [eax],dl
c00098f0:	62 92 94 94 68 08    	bound  edx,QWORD PTR [edx+0x8689494]
c00098f6:	10 10                	adc    BYTE PTR [eax],dl
c00098f8:	20 2c 52             	and    BYTE PTR [edx+edx*2],ch
c00098fb:	52                   	push   edx
c00098fc:	92                   	xchg   edx,eax
c00098fd:	8c 00                	mov    WORD PTR [eax],es
c00098ff:	00 00                	add    BYTE PTR [eax],al
c0009901:	70 88                	jo     c000988b <PKnFont+0x1eb>
c0009903:	88 88 90 60 47 a2    	mov    BYTE PTR [eax-0x5db89f70],cl
c0009909:	92                   	xchg   edx,eax
c000990a:	8a 84 46 39 00 00 04 	mov    al,BYTE PTR [esi+eax*2+0x4000039]
c0009911:	08 10                	or     BYTE PTR [eax],dl
	...
c000991f:	00 02                	add    BYTE PTR [edx],al
c0009921:	04 08                	add    al,0x8
c0009923:	08 10                	or     BYTE PTR [eax],dl
c0009925:	10 10                	adc    BYTE PTR [eax],dl
c0009927:	10 10                	adc    BYTE PTR [eax],dl
c0009929:	10 10                	adc    BYTE PTR [eax],dl
c000992b:	08 08                	or     BYTE PTR [eax],cl
c000992d:	04 02                	add    al,0x2
c000992f:	00 80 40 20 20 10    	add    BYTE PTR [eax+0x10202040],al
c0009935:	10 10                	adc    BYTE PTR [eax],dl
c0009937:	10 10                	adc    BYTE PTR [eax],dl
c0009939:	10 10                	adc    BYTE PTR [eax],dl
c000993b:	20 20                	and    BYTE PTR [eax],ah
c000993d:	40                   	inc    eax
c000993e:	80 00 00             	add    BYTE PTR [eax],0x0
c0009941:	00 00                	add    BYTE PTR [eax],al
c0009943:	00 00                	add    BYTE PTR [eax],al
c0009945:	10 92 54 38 54 92    	adc    BYTE PTR [edx-0x6dabc7ac],dl
c000994b:	10 00                	adc    BYTE PTR [eax],al
	...
c0009955:	10 10                	adc    BYTE PTR [eax],dl
c0009957:	10 fe                	adc    dh,bh
c0009959:	10 10                	adc    BYTE PTR [eax],dl
c000995b:	10 00                	adc    BYTE PTR [eax],al
	...
c0009969:	00 00                	add    BYTE PTR [eax],al
c000996b:	18 18                	sbb    BYTE PTR [eax],bl
c000996d:	08 08                	or     BYTE PTR [eax],cl
c000996f:	10 00                	adc    BYTE PTR [eax],al
c0009971:	00 00                	add    BYTE PTR [eax],al
c0009973:	00 00                	add    BYTE PTR [eax],al
c0009975:	00 00                	add    BYTE PTR [eax],al
c0009977:	00 fe                	add    dh,bh
	...
c0009989:	00 00                	add    BYTE PTR [eax],al
c000998b:	00 18                	add    BYTE PTR [eax],bl
c000998d:	18 00                	sbb    BYTE PTR [eax],al
c000998f:	00 02                	add    BYTE PTR [edx],al
c0009991:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
c0009994:	08 08                	or     BYTE PTR [eax],cl
c0009996:	08 10                	or     BYTE PTR [eax],dl
c0009998:	10 20                	adc    BYTE PTR [eax],ah
c000999a:	20 40 40             	and    BYTE PTR [eax+0x40],al
c000999d:	40                   	inc    eax
c000999e:	80 80 00 18 24 24 42 	add    BYTE PTR [eax+0x24241800],0x42
c00099a5:	42                   	inc    edx
c00099a6:	42                   	inc    edx
c00099a7:	42                   	inc    edx
c00099a8:	42                   	inc    edx
c00099a9:	42                   	inc    edx
c00099aa:	42                   	inc    edx
c00099ab:	24 24                	and    al,0x24
c00099ad:	18 00                	sbb    BYTE PTR [eax],al
c00099af:	00 00                	add    BYTE PTR [eax],al
c00099b1:	08 18                	or     BYTE PTR [eax],bl
c00099b3:	28 08                	sub    BYTE PTR [eax],cl
c00099b5:	08 08                	or     BYTE PTR [eax],cl
c00099b7:	08 08                	or     BYTE PTR [eax],cl
c00099b9:	08 08                	or     BYTE PTR [eax],cl
c00099bb:	08 08                	or     BYTE PTR [eax],cl
c00099bd:	3e 00 00             	add    BYTE PTR ds:[eax],al
c00099c0:	00 18                	add    BYTE PTR [eax],bl
c00099c2:	24 42                	and    al,0x42
c00099c4:	42                   	inc    edx
c00099c5:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
c00099c8:	10 20                	adc    BYTE PTR [eax],ah
c00099ca:	20 40 40             	and    BYTE PTR [eax+0x40],al
c00099cd:	7e 00                	jle    c00099cf <PKnFont+0x32f>
c00099cf:	00 00                	add    BYTE PTR [eax],al
c00099d1:	18 24 42             	sbb    BYTE PTR [edx+eax*2],ah
c00099d4:	02 02                	add    al,BYTE PTR [edx]
c00099d6:	04 18                	add    al,0x18
c00099d8:	04 02                	add    al,0x2
c00099da:	02 42 24             	add    al,BYTE PTR [edx+0x24]
c00099dd:	18 00                	sbb    BYTE PTR [eax],al
c00099df:	00 00                	add    BYTE PTR [eax],al
c00099e1:	0c 0c                	or     al,0xc
c00099e3:	0c 14                	or     al,0x14
c00099e5:	14 14                	adc    al,0x14
c00099e7:	24 24                	and    al,0x24
c00099e9:	44                   	inc    esp
c00099ea:	7e 04                	jle    c00099f0 <PKnFont+0x350>
c00099ec:	04 1e                	add    al,0x1e
c00099ee:	00 00                	add    BYTE PTR [eax],al
c00099f0:	00 7c 40 40          	add    BYTE PTR [eax+eax*2+0x40],bh
c00099f4:	40                   	inc    eax
c00099f5:	58                   	pop    eax
c00099f6:	64 02 02             	add    al,BYTE PTR fs:[edx]
c00099f9:	02 02                	add    al,BYTE PTR [edx]
c00099fb:	42                   	inc    edx
c00099fc:	24 18                	and    al,0x18
c00099fe:	00 00                	add    BYTE PTR [eax],al
c0009a00:	00 18                	add    BYTE PTR [eax],bl
c0009a02:	24 42                	and    al,0x42
c0009a04:	40                   	inc    eax
c0009a05:	58                   	pop    eax
c0009a06:	64 42                	fs inc edx
c0009a08:	42                   	inc    edx
c0009a09:	42                   	inc    edx
c0009a0a:	42                   	inc    edx
c0009a0b:	42                   	inc    edx
c0009a0c:	24 18                	and    al,0x18
c0009a0e:	00 00                	add    BYTE PTR [eax],al
c0009a10:	00 7e 42             	add    BYTE PTR [esi+0x42],bh
c0009a13:	42                   	inc    edx
c0009a14:	04 04                	add    al,0x4
c0009a16:	08 08                	or     BYTE PTR [eax],cl
c0009a18:	08 10                	or     BYTE PTR [eax],dl
c0009a1a:	10 10                	adc    BYTE PTR [eax],dl
c0009a1c:	10 38                	adc    BYTE PTR [eax],bh
c0009a1e:	00 00                	add    BYTE PTR [eax],al
c0009a20:	00 18                	add    BYTE PTR [eax],bl
c0009a22:	24 42                	and    al,0x42
c0009a24:	42                   	inc    edx
c0009a25:	42                   	inc    edx
c0009a26:	24 18                	and    al,0x18
c0009a28:	24 42                	and    al,0x42
c0009a2a:	42                   	inc    edx
c0009a2b:	42                   	inc    edx
c0009a2c:	24 18                	and    al,0x18
c0009a2e:	00 00                	add    BYTE PTR [eax],al
c0009a30:	00 18                	add    BYTE PTR [eax],bl
c0009a32:	24 42                	and    al,0x42
c0009a34:	42                   	inc    edx
c0009a35:	42                   	inc    edx
c0009a36:	42                   	inc    edx
c0009a37:	42                   	inc    edx
c0009a38:	26 1a 02             	sbb    al,BYTE PTR es:[edx]
c0009a3b:	42                   	inc    edx
c0009a3c:	24 18                	and    al,0x18
c0009a3e:	00 00                	add    BYTE PTR [eax],al
c0009a40:	00 00                	add    BYTE PTR [eax],al
c0009a42:	00 00                	add    BYTE PTR [eax],al
c0009a44:	00 18                	add    BYTE PTR [eax],bl
c0009a46:	18 00                	sbb    BYTE PTR [eax],al
c0009a48:	00 00                	add    BYTE PTR [eax],al
c0009a4a:	00 00                	add    BYTE PTR [eax],al
c0009a4c:	18 18                	sbb    BYTE PTR [eax],bl
c0009a4e:	00 00                	add    BYTE PTR [eax],al
c0009a50:	00 00                	add    BYTE PTR [eax],al
c0009a52:	00 00                	add    BYTE PTR [eax],al
c0009a54:	00 18                	add    BYTE PTR [eax],bl
c0009a56:	18 00                	sbb    BYTE PTR [eax],al
c0009a58:	00 00                	add    BYTE PTR [eax],al
c0009a5a:	00 18                	add    BYTE PTR [eax],bl
c0009a5c:	18 08                	sbb    BYTE PTR [eax],cl
c0009a5e:	08 10                	or     BYTE PTR [eax],dl
c0009a60:	00 02                	add    BYTE PTR [edx],al
c0009a62:	04 08                	add    al,0x8
c0009a64:	10 20                	adc    BYTE PTR [eax],ah
c0009a66:	40                   	inc    eax
c0009a67:	80 80 40 20 10 08 04 	add    BYTE PTR [eax+0x8102040],0x4
c0009a6e:	02 00                	add    al,BYTE PTR [eax]
c0009a70:	00 00                	add    BYTE PTR [eax],al
c0009a72:	00 00                	add    BYTE PTR [eax],al
c0009a74:	00 00                	add    BYTE PTR [eax],al
c0009a76:	fe 00                	inc    BYTE PTR [eax]
c0009a78:	00 fe                	add    dh,bh
c0009a7a:	00 00                	add    BYTE PTR [eax],al
c0009a7c:	00 00                	add    BYTE PTR [eax],al
c0009a7e:	00 00                	add    BYTE PTR [eax],al
c0009a80:	00 80 40 20 10 08    	add    BYTE PTR [eax+0x8102040],al
c0009a86:	04 02                	add    al,0x2
c0009a88:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
c0009a8b:	10 20                	adc    BYTE PTR [eax],ah
c0009a8d:	40                   	inc    eax
c0009a8e:	80 00 00             	add    BYTE PTR [eax],0x0
c0009a91:	38 44 82 82          	cmp    BYTE PTR [edx+eax*4-0x7e],al
c0009a95:	82                   	(bad)  
c0009a96:	04 08                	add    al,0x8
c0009a98:	10 10                	adc    BYTE PTR [eax],dl
c0009a9a:	00 00                	add    BYTE PTR [eax],al
c0009a9c:	18 18                	sbb    BYTE PTR [eax],bl
c0009a9e:	00 00                	add    BYTE PTR [eax],al
c0009aa0:	00 38                	add    BYTE PTR [eax],bh
c0009aa2:	44                   	inc    esp
c0009aa3:	82                   	(bad)  
c0009aa4:	9a aa aa aa aa aa 9c 	call   0x9caa:0xaaaaaaaa
c0009aab:	80 46 38 00          	add    BYTE PTR [esi+0x38],0x0
c0009aaf:	00 00                	add    BYTE PTR [eax],al
c0009ab1:	18 18                	sbb    BYTE PTR [eax],bl
c0009ab3:	18 18                	sbb    BYTE PTR [eax],bl
c0009ab5:	24 24                	and    al,0x24
c0009ab7:	24 24                	and    al,0x24
c0009ab9:	7e 42                	jle    c0009afd <PKnFont+0x45d>
c0009abb:	42                   	inc    edx
c0009abc:	42                   	inc    edx
c0009abd:	e7 00                	out    0x0,eax
c0009abf:	00 00                	add    BYTE PTR [eax],al
c0009ac1:	f0 48                	lock dec eax
c0009ac3:	44                   	inc    esp
c0009ac4:	44                   	inc    esp
c0009ac5:	44                   	inc    esp
c0009ac6:	48                   	dec    eax
c0009ac7:	78 44                	js     c0009b0d <PKnFont+0x46d>
c0009ac9:	42                   	inc    edx
c0009aca:	42                   	inc    edx
c0009acb:	42                   	inc    edx
c0009acc:	44                   	inc    esp
c0009acd:	f8                   	clc    
c0009ace:	00 00                	add    BYTE PTR [eax],al
c0009ad0:	00 3a                	add    BYTE PTR [edx],bh
c0009ad2:	46                   	inc    esi
c0009ad3:	42                   	inc    edx
c0009ad4:	82                   	(bad)  
c0009ad5:	80 80 80 80 80 82 42 	add    BYTE PTR [eax-0x7d7f7f80],0x42
c0009adc:	44                   	inc    esp
c0009add:	38 00                	cmp    BYTE PTR [eax],al
c0009adf:	00 00                	add    BYTE PTR [eax],al
c0009ae1:	f8                   	clc    
c0009ae2:	44                   	inc    esp
c0009ae3:	44                   	inc    esp
c0009ae4:	42                   	inc    edx
c0009ae5:	42                   	inc    edx
c0009ae6:	42                   	inc    edx
c0009ae7:	42                   	inc    edx
c0009ae8:	42                   	inc    edx
c0009ae9:	42                   	inc    edx
c0009aea:	42                   	inc    edx
c0009aeb:	44                   	inc    esp
c0009aec:	44                   	inc    esp
c0009aed:	f8                   	clc    
c0009aee:	00 00                	add    BYTE PTR [eax],al
c0009af0:	00 fe                	add    dh,bh
c0009af2:	42                   	inc    edx
c0009af3:	42                   	inc    edx
c0009af4:	40                   	inc    eax
c0009af5:	40                   	inc    eax
c0009af6:	44                   	inc    esp
c0009af7:	7c 44                	jl     c0009b3d <PKnFont+0x49d>
c0009af9:	40                   	inc    eax
c0009afa:	40                   	inc    eax
c0009afb:	42                   	inc    edx
c0009afc:	42                   	inc    edx
c0009afd:	fe 00                	inc    BYTE PTR [eax]
c0009aff:	00 00                	add    BYTE PTR [eax],al
c0009b01:	fe 42 42             	inc    BYTE PTR [edx+0x42]
c0009b04:	40                   	inc    eax
c0009b05:	40                   	inc    eax
c0009b06:	44                   	inc    esp
c0009b07:	7c 44                	jl     c0009b4d <PKnFont+0x4ad>
c0009b09:	44                   	inc    esp
c0009b0a:	40                   	inc    eax
c0009b0b:	40                   	inc    eax
c0009b0c:	40                   	inc    eax
c0009b0d:	f0 00 00             	lock add BYTE PTR [eax],al
c0009b10:	00 3a                	add    BYTE PTR [edx],bh
c0009b12:	46                   	inc    esi
c0009b13:	42                   	inc    edx
c0009b14:	82                   	(bad)  
c0009b15:	80 80 9e 82 82 82 42 	add    BYTE PTR [eax-0x7d7d7d62],0x42
c0009b1c:	46                   	inc    esi
c0009b1d:	38 00                	cmp    BYTE PTR [eax],al
c0009b1f:	00 00                	add    BYTE PTR [eax],al
c0009b21:	e7 42                	out    0x42,eax
c0009b23:	42                   	inc    edx
c0009b24:	42                   	inc    edx
c0009b25:	42                   	inc    edx
c0009b26:	42                   	inc    edx
c0009b27:	7e 42                	jle    c0009b6b <PKnFont+0x4cb>
c0009b29:	42                   	inc    edx
c0009b2a:	42                   	inc    edx
c0009b2b:	42                   	inc    edx
c0009b2c:	42                   	inc    edx
c0009b2d:	e7 00                	out    0x0,eax
c0009b2f:	00 00                	add    BYTE PTR [eax],al
c0009b31:	7c 10                	jl     c0009b43 <PKnFont+0x4a3>
c0009b33:	10 10                	adc    BYTE PTR [eax],dl
c0009b35:	10 10                	adc    BYTE PTR [eax],dl
c0009b37:	10 10                	adc    BYTE PTR [eax],dl
c0009b39:	10 10                	adc    BYTE PTR [eax],dl
c0009b3b:	10 10                	adc    BYTE PTR [eax],dl
c0009b3d:	7c 00                	jl     c0009b3f <PKnFont+0x49f>
c0009b3f:	00 00                	add    BYTE PTR [eax],al
c0009b41:	1f                   	pop    ds
c0009b42:	04 04                	add    al,0x4
c0009b44:	04 04                	add    al,0x4
c0009b46:	04 04                	add    al,0x4
c0009b48:	04 04                	add    al,0x4
c0009b4a:	04 04                	add    al,0x4
c0009b4c:	84 48 30             	test   BYTE PTR [eax+0x30],cl
c0009b4f:	00 00                	add    BYTE PTR [eax],al
c0009b51:	e7 42                	out    0x42,eax
c0009b53:	44                   	inc    esp
c0009b54:	48                   	dec    eax
c0009b55:	50                   	push   eax
c0009b56:	50                   	push   eax
c0009b57:	60                   	pusha  
c0009b58:	50                   	push   eax
c0009b59:	50                   	push   eax
c0009b5a:	48                   	dec    eax
c0009b5b:	44                   	inc    esp
c0009b5c:	42                   	inc    edx
c0009b5d:	e7 00                	out    0x0,eax
c0009b5f:	00 00                	add    BYTE PTR [eax],al
c0009b61:	f0 40                	lock inc eax
c0009b63:	40                   	inc    eax
c0009b64:	40                   	inc    eax
c0009b65:	40                   	inc    eax
c0009b66:	40                   	inc    eax
c0009b67:	40                   	inc    eax
c0009b68:	40                   	inc    eax
c0009b69:	40                   	inc    eax
c0009b6a:	40                   	inc    eax
c0009b6b:	42                   	inc    edx
c0009b6c:	42                   	inc    edx
c0009b6d:	fe 00                	inc    BYTE PTR [eax]
c0009b6f:	00 00                	add    BYTE PTR [eax],al
c0009b71:	c3                   	ret    
c0009b72:	42                   	inc    edx
c0009b73:	66 66 66 5a          	data16 data16 pop dx
c0009b77:	5a                   	pop    edx
c0009b78:	5a                   	pop    edx
c0009b79:	42                   	inc    edx
c0009b7a:	42                   	inc    edx
c0009b7b:	42                   	inc    edx
c0009b7c:	42                   	inc    edx
c0009b7d:	e7 00                	out    0x0,eax
c0009b7f:	00 00                	add    BYTE PTR [eax],al
c0009b81:	c7 42 62 62 52 52 52 	mov    DWORD PTR [edx+0x62],0x52525262
c0009b88:	4a                   	dec    edx
c0009b89:	4a                   	dec    edx
c0009b8a:	4a                   	dec    edx
c0009b8b:	46                   	inc    esi
c0009b8c:	46                   	inc    esi
c0009b8d:	e2 00                	loop   c0009b8f <PKnFont+0x4ef>
c0009b8f:	00 00                	add    BYTE PTR [eax],al
c0009b91:	38 44 82 82          	cmp    BYTE PTR [edx+eax*4-0x7e],al
c0009b95:	82                   	(bad)  
c0009b96:	82                   	(bad)  
c0009b97:	82                   	(bad)  
c0009b98:	82                   	(bad)  
c0009b99:	82                   	(bad)  
c0009b9a:	82                   	(bad)  
c0009b9b:	82                   	(bad)  
c0009b9c:	44                   	inc    esp
c0009b9d:	38 00                	cmp    BYTE PTR [eax],al
c0009b9f:	00 00                	add    BYTE PTR [eax],al
c0009ba1:	f8                   	clc    
c0009ba2:	44                   	inc    esp
c0009ba3:	42                   	inc    edx
c0009ba4:	42                   	inc    edx
c0009ba5:	42                   	inc    edx
c0009ba6:	44                   	inc    esp
c0009ba7:	78 40                	js     c0009be9 <PKnFont+0x549>
c0009ba9:	40                   	inc    eax
c0009baa:	40                   	inc    eax
c0009bab:	40                   	inc    eax
c0009bac:	40                   	inc    eax
c0009bad:	f0 00 00             	lock add BYTE PTR [eax],al
c0009bb0:	00 38                	add    BYTE PTR [eax],bh
c0009bb2:	44                   	inc    esp
c0009bb3:	82                   	(bad)  
c0009bb4:	82                   	(bad)  
c0009bb5:	82                   	(bad)  
c0009bb6:	82                   	(bad)  
c0009bb7:	82                   	(bad)  
c0009bb8:	82                   	(bad)  
c0009bb9:	82                   	(bad)  
c0009bba:	92                   	xchg   edx,eax
c0009bbb:	8a 44 3a 00          	mov    al,BYTE PTR [edx+edi*1+0x0]
c0009bbf:	00 00                	add    BYTE PTR [eax],al
c0009bc1:	fc                   	cld    
c0009bc2:	42                   	inc    edx
c0009bc3:	42                   	inc    edx
c0009bc4:	42                   	inc    edx
c0009bc5:	42                   	inc    edx
c0009bc6:	7c 44                	jl     c0009c0c <PKnFont+0x56c>
c0009bc8:	42                   	inc    edx
c0009bc9:	42                   	inc    edx
c0009bca:	42                   	inc    edx
c0009bcb:	42                   	inc    edx
c0009bcc:	42                   	inc    edx
c0009bcd:	e7 00                	out    0x0,eax
c0009bcf:	00 00                	add    BYTE PTR [eax],al
c0009bd1:	3a 46 82             	cmp    al,BYTE PTR [esi-0x7e]
c0009bd4:	82                   	(bad)  
c0009bd5:	80 40 38 04          	add    BYTE PTR [eax+0x38],0x4
c0009bd9:	02 82 82 c4 b8 00    	add    al,BYTE PTR [edx+0xb8c482]
c0009bdf:	00 00                	add    BYTE PTR [eax],al
c0009be1:	fe                   	(bad)  
c0009be2:	92                   	xchg   edx,eax
c0009be3:	92                   	xchg   edx,eax
c0009be4:	10 10                	adc    BYTE PTR [eax],dl
c0009be6:	10 10                	adc    BYTE PTR [eax],dl
c0009be8:	10 10                	adc    BYTE PTR [eax],dl
c0009bea:	10 10                	adc    BYTE PTR [eax],dl
c0009bec:	10 7c 00 00          	adc    BYTE PTR [eax+eax*1+0x0],bh
c0009bf0:	00 e7                	add    bh,ah
c0009bf2:	42                   	inc    edx
c0009bf3:	42                   	inc    edx
c0009bf4:	42                   	inc    edx
c0009bf5:	42                   	inc    edx
c0009bf6:	42                   	inc    edx
c0009bf7:	42                   	inc    edx
c0009bf8:	42                   	inc    edx
c0009bf9:	42                   	inc    edx
c0009bfa:	42                   	inc    edx
c0009bfb:	42                   	inc    edx
c0009bfc:	24 3c                	and    al,0x3c
c0009bfe:	00 00                	add    BYTE PTR [eax],al
c0009c00:	00 e7                	add    bh,ah
c0009c02:	42                   	inc    edx
c0009c03:	42                   	inc    edx
c0009c04:	42                   	inc    edx
c0009c05:	42                   	inc    edx
c0009c06:	24 24                	and    al,0x24
c0009c08:	24 24                	and    al,0x24
c0009c0a:	18 18                	sbb    BYTE PTR [eax],bl
c0009c0c:	18 18                	sbb    BYTE PTR [eax],bl
c0009c0e:	00 00                	add    BYTE PTR [eax],al
c0009c10:	00 e7                	add    bh,ah
c0009c12:	42                   	inc    edx
c0009c13:	42                   	inc    edx
c0009c14:	42                   	inc    edx
c0009c15:	5a                   	pop    edx
c0009c16:	5a                   	pop    edx
c0009c17:	5a                   	pop    edx
c0009c18:	5a                   	pop    edx
c0009c19:	24 24                	and    al,0x24
c0009c1b:	24 24                	and    al,0x24
c0009c1d:	24 00                	and    al,0x0
c0009c1f:	00 00                	add    BYTE PTR [eax],al
c0009c21:	e7 42                	out    0x42,eax
c0009c23:	42                   	inc    edx
c0009c24:	24 24                	and    al,0x24
c0009c26:	24 18                	and    al,0x18
c0009c28:	24 24                	and    al,0x24
c0009c2a:	24 42                	and    al,0x42
c0009c2c:	42                   	inc    edx
c0009c2d:	e7 00                	out    0x0,eax
c0009c2f:	00 00                	add    BYTE PTR [eax],al
c0009c31:	ee                   	out    dx,al
c0009c32:	44                   	inc    esp
c0009c33:	44                   	inc    esp
c0009c34:	44                   	inc    esp
c0009c35:	28 28                	sub    BYTE PTR [eax],ch
c0009c37:	28 10                	sub    BYTE PTR [eax],dl
c0009c39:	10 10                	adc    BYTE PTR [eax],dl
c0009c3b:	10 10                	adc    BYTE PTR [eax],dl
c0009c3d:	7c 00                	jl     c0009c3f <PKnFont+0x59f>
c0009c3f:	00 00                	add    BYTE PTR [eax],al
c0009c41:	fe 84 84 08 08 10 10 	inc    BYTE PTR [esp+eax*4+0x10100808]
c0009c48:	20 20                	and    BYTE PTR [eax],ah
c0009c4a:	40                   	inc    eax
c0009c4b:	42                   	inc    edx
c0009c4c:	82                   	(bad)  
c0009c4d:	fe 00                	inc    BYTE PTR [eax]
c0009c4f:	00 00                	add    BYTE PTR [eax],al
c0009c51:	3e 20 20             	and    BYTE PTR ds:[eax],ah
c0009c54:	20 20                	and    BYTE PTR [eax],ah
c0009c56:	20 20                	and    BYTE PTR [eax],ah
c0009c58:	20 20                	and    BYTE PTR [eax],ah
c0009c5a:	20 20                	and    BYTE PTR [eax],ah
c0009c5c:	20 20                	and    BYTE PTR [eax],ah
c0009c5e:	3e 00 80 80 40 40 20 	add    BYTE PTR ds:[eax+0x20404080],al
c0009c65:	20 20                	and    BYTE PTR [eax],ah
c0009c67:	10 10                	adc    BYTE PTR [eax],dl
c0009c69:	08 08                	or     BYTE PTR [eax],cl
c0009c6b:	04 04                	add    al,0x4
c0009c6d:	04 02                	add    al,0x2
c0009c6f:	02 00                	add    al,BYTE PTR [eax]
c0009c71:	7c 04                	jl     c0009c77 <PKnFont+0x5d7>
c0009c73:	04 04                	add    al,0x4
c0009c75:	04 04                	add    al,0x4
c0009c77:	04 04                	add    al,0x4
c0009c79:	04 04                	add    al,0x4
c0009c7b:	04 04                	add    al,0x4
c0009c7d:	04 7c                	add    al,0x7c
c0009c7f:	00 00                	add    BYTE PTR [eax],al
c0009c81:	10 28                	adc    BYTE PTR [eax],ch
c0009c83:	44                   	inc    esp
c0009c84:	82                   	(bad)  
	...
c0009c9d:	00 fe                	add    dh,bh
c0009c9f:	00 10                	add    BYTE PTR [eax],dl
c0009ca1:	08 04 00             	or     BYTE PTR [eax+eax*1],al
	...
c0009cb4:	00 70 08             	add    BYTE PTR [eax+0x8],dh
c0009cb7:	04 3c                	add    al,0x3c
c0009cb9:	44                   	inc    esp
c0009cba:	84 84 8c 76 00 00 c0 	test   BYTE PTR [esp+ecx*4-0x3fffff8a],al
c0009cc1:	40                   	inc    eax
c0009cc2:	40                   	inc    eax
c0009cc3:	40                   	inc    eax
c0009cc4:	40                   	inc    eax
c0009cc5:	58                   	pop    eax
c0009cc6:	64 42                	fs inc edx
c0009cc8:	42                   	inc    edx
c0009cc9:	42                   	inc    edx
c0009cca:	42                   	inc    edx
c0009ccb:	42                   	inc    edx
c0009ccc:	64 58                	fs pop eax
c0009cce:	00 00                	add    BYTE PTR [eax],al
c0009cd0:	00 00                	add    BYTE PTR [eax],al
c0009cd2:	00 00                	add    BYTE PTR [eax],al
c0009cd4:	00 30                	add    BYTE PTR [eax],dh
c0009cd6:	4c                   	dec    esp
c0009cd7:	84 84 80 80 82 44 38 	test   BYTE PTR [eax+eax*4+0x38448280],al
c0009cde:	00 00                	add    BYTE PTR [eax],al
c0009ce0:	0c 04                	or     al,0x4
c0009ce2:	04 04                	add    al,0x4
c0009ce4:	04 34                	add    al,0x34
c0009ce6:	4c                   	dec    esp
c0009ce7:	84 84 84 84 84 4c 36 	test   BYTE PTR [esp+eax*4+0x364c8484],al
c0009cee:	00 00                	add    BYTE PTR [eax],al
c0009cf0:	00 00                	add    BYTE PTR [eax],al
c0009cf2:	00 00                	add    BYTE PTR [eax],al
c0009cf4:	00 38                	add    BYTE PTR [eax],bh
c0009cf6:	44                   	inc    esp
c0009cf7:	82                   	(bad)  
c0009cf8:	82                   	(bad)  
c0009cf9:	fc                   	cld    
c0009cfa:	80 82 42 3c 00 00 0e 	add    BYTE PTR [edx+0x3c42],0xe
c0009d01:	10 10                	adc    BYTE PTR [eax],dl
c0009d03:	10 10                	adc    BYTE PTR [eax],dl
c0009d05:	7c 10                	jl     c0009d17 <PKnFont+0x677>
c0009d07:	10 10                	adc    BYTE PTR [eax],dl
c0009d09:	10 10                	adc    BYTE PTR [eax],dl
c0009d0b:	10 10                	adc    BYTE PTR [eax],dl
c0009d0d:	7c 00                	jl     c0009d0f <PKnFont+0x66f>
c0009d0f:	00 00                	add    BYTE PTR [eax],al
c0009d11:	00 00                	add    BYTE PTR [eax],al
c0009d13:	00 00                	add    BYTE PTR [eax],al
c0009d15:	36 4c                	ss dec esp
c0009d17:	84 84 84 84 4c 34 04 	test   BYTE PTR [esp+eax*4+0x4344c84],al
c0009d1e:	04 38                	add    al,0x38
c0009d20:	c0 40 40 40          	rol    BYTE PTR [eax+0x40],0x40
c0009d24:	40                   	inc    eax
c0009d25:	58                   	pop    eax
c0009d26:	64 42                	fs inc edx
c0009d28:	42                   	inc    edx
c0009d29:	42                   	inc    edx
c0009d2a:	42                   	inc    edx
c0009d2b:	42                   	inc    edx
c0009d2c:	42                   	inc    edx
c0009d2d:	e3 00                	jecxz  c0009d2f <PKnFont+0x68f>
c0009d2f:	00 00                	add    BYTE PTR [eax],al
c0009d31:	10 10                	adc    BYTE PTR [eax],dl
c0009d33:	00 00                	add    BYTE PTR [eax],al
c0009d35:	30 10                	xor    BYTE PTR [eax],dl
c0009d37:	10 10                	adc    BYTE PTR [eax],dl
c0009d39:	10 10                	adc    BYTE PTR [eax],dl
c0009d3b:	10 10                	adc    BYTE PTR [eax],dl
c0009d3d:	38 00                	cmp    BYTE PTR [eax],al
c0009d3f:	00 00                	add    BYTE PTR [eax],al
c0009d41:	04 04                	add    al,0x4
c0009d43:	00 00                	add    BYTE PTR [eax],al
c0009d45:	0c 04                	or     al,0x4
c0009d47:	04 04                	add    al,0x4
c0009d49:	04 04                	add    al,0x4
c0009d4b:	04 04                	add    al,0x4
c0009d4d:	08 08                	or     BYTE PTR [eax],cl
c0009d4f:	30 c0                	xor    al,al
c0009d51:	40                   	inc    eax
c0009d52:	40                   	inc    eax
c0009d53:	40                   	inc    eax
c0009d54:	40                   	inc    eax
c0009d55:	4e                   	dec    esi
c0009d56:	44                   	inc    esp
c0009d57:	48                   	dec    eax
c0009d58:	50                   	push   eax
c0009d59:	60                   	pusha  
c0009d5a:	50                   	push   eax
c0009d5b:	48                   	dec    eax
c0009d5c:	44                   	inc    esp
c0009d5d:	e6 00                	out    0x0,al
c0009d5f:	00 30                	add    BYTE PTR [eax],dh
c0009d61:	10 10                	adc    BYTE PTR [eax],dl
c0009d63:	10 10                	adc    BYTE PTR [eax],dl
c0009d65:	10 10                	adc    BYTE PTR [eax],dl
c0009d67:	10 10                	adc    BYTE PTR [eax],dl
c0009d69:	10 10                	adc    BYTE PTR [eax],dl
c0009d6b:	10 10                	adc    BYTE PTR [eax],dl
c0009d6d:	38 00                	cmp    BYTE PTR [eax],al
c0009d6f:	00 00                	add    BYTE PTR [eax],al
c0009d71:	00 00                	add    BYTE PTR [eax],al
c0009d73:	00 00                	add    BYTE PTR [eax],al
c0009d75:	f6                   	(bad)  
c0009d76:	49                   	dec    ecx
c0009d77:	49                   	dec    ecx
c0009d78:	49                   	dec    ecx
c0009d79:	49                   	dec    ecx
c0009d7a:	49                   	dec    ecx
c0009d7b:	49                   	dec    ecx
c0009d7c:	49                   	dec    ecx
c0009d7d:	db 00                	fild   DWORD PTR [eax]
c0009d7f:	00 00                	add    BYTE PTR [eax],al
c0009d81:	00 00                	add    BYTE PTR [eax],al
c0009d83:	00 00                	add    BYTE PTR [eax],al
c0009d85:	d8 64 42 42          	fsub   DWORD PTR [edx+eax*2+0x42]
c0009d89:	42                   	inc    edx
c0009d8a:	42                   	inc    edx
c0009d8b:	42                   	inc    edx
c0009d8c:	42                   	inc    edx
c0009d8d:	e3 00                	jecxz  c0009d8f <PKnFont+0x6ef>
c0009d8f:	00 00                	add    BYTE PTR [eax],al
c0009d91:	00 00                	add    BYTE PTR [eax],al
c0009d93:	00 00                	add    BYTE PTR [eax],al
c0009d95:	38 44 82 82          	cmp    BYTE PTR [edx+eax*4-0x7e],al
c0009d99:	82                   	(bad)  
c0009d9a:	82                   	(bad)  
c0009d9b:	82                   	(bad)  
c0009d9c:	44                   	inc    esp
c0009d9d:	38 00                	cmp    BYTE PTR [eax],al
c0009d9f:	00 00                	add    BYTE PTR [eax],al
c0009da1:	00 00                	add    BYTE PTR [eax],al
c0009da3:	00 d8                	add    al,bl
c0009da5:	64 42                	fs inc edx
c0009da7:	42                   	inc    edx
c0009da8:	42                   	inc    edx
c0009da9:	42                   	inc    edx
c0009daa:	42                   	inc    edx
c0009dab:	64 58                	fs pop eax
c0009dad:	40                   	inc    eax
c0009dae:	40                   	inc    eax
c0009daf:	e0 00                	loopne c0009db1 <PKnFont+0x711>
c0009db1:	00 00                	add    BYTE PTR [eax],al
c0009db3:	00 34 4c             	add    BYTE PTR [esp+ecx*2],dh
c0009db6:	84 84 84 84 84 4c 34 	test   BYTE PTR [esp+eax*4+0x344c8484],al
c0009dbd:	04 04                	add    al,0x4
c0009dbf:	0e                   	push   cs
c0009dc0:	00 00                	add    BYTE PTR [eax],al
c0009dc2:	00 00                	add    BYTE PTR [eax],al
c0009dc4:	00 dc                	add    ah,bl
c0009dc6:	62 42 40             	bound  eax,QWORD PTR [edx+0x40]
c0009dc9:	40                   	inc    eax
c0009dca:	40                   	inc    eax
c0009dcb:	40                   	inc    eax
c0009dcc:	40                   	inc    eax
c0009dcd:	e0 00                	loopne c0009dcf <PKnFont+0x72f>
c0009dcf:	00 00                	add    BYTE PTR [eax],al
c0009dd1:	00 00                	add    BYTE PTR [eax],al
c0009dd3:	00 00                	add    BYTE PTR [eax],al
c0009dd5:	7a 86                	jp     c0009d5d <PKnFont+0x6bd>
c0009dd7:	82                   	(bad)  
c0009dd8:	c0 38 06             	sar    BYTE PTR [eax],0x6
c0009ddb:	82                   	(bad)  
c0009ddc:	c2 bc 00             	ret    0xbc
c0009ddf:	00 00                	add    BYTE PTR [eax],al
c0009de1:	00 10                	add    BYTE PTR [eax],dl
c0009de3:	10 10                	adc    BYTE PTR [eax],dl
c0009de5:	7c 10                	jl     c0009df7 <PKnFont+0x757>
c0009de7:	10 10                	adc    BYTE PTR [eax],dl
c0009de9:	10 10                	adc    BYTE PTR [eax],dl
c0009deb:	10 10                	adc    BYTE PTR [eax],dl
c0009ded:	0e                   	push   cs
c0009dee:	00 00                	add    BYTE PTR [eax],al
c0009df0:	00 00                	add    BYTE PTR [eax],al
c0009df2:	00 00                	add    BYTE PTR [eax],al
c0009df4:	00 c6                	add    dh,al
c0009df6:	42                   	inc    edx
c0009df7:	42                   	inc    edx
c0009df8:	42                   	inc    edx
c0009df9:	42                   	inc    edx
c0009dfa:	42                   	inc    edx
c0009dfb:	42                   	inc    edx
c0009dfc:	46                   	inc    esi
c0009dfd:	3b 00                	cmp    eax,DWORD PTR [eax]
c0009dff:	00 00                	add    BYTE PTR [eax],al
c0009e01:	00 00                	add    BYTE PTR [eax],al
c0009e03:	00 00                	add    BYTE PTR [eax],al
c0009e05:	e7 42                	out    0x42,eax
c0009e07:	42                   	inc    edx
c0009e08:	42                   	inc    edx
c0009e09:	24 24                	and    al,0x24
c0009e0b:	24 18                	and    al,0x18
c0009e0d:	18 00                	sbb    BYTE PTR [eax],al
c0009e0f:	00 00                	add    BYTE PTR [eax],al
c0009e11:	00 00                	add    BYTE PTR [eax],al
c0009e13:	00 00                	add    BYTE PTR [eax],al
c0009e15:	e7 42                	out    0x42,eax
c0009e17:	42                   	inc    edx
c0009e18:	5a                   	pop    edx
c0009e19:	5a                   	pop    edx
c0009e1a:	5a                   	pop    edx
c0009e1b:	24 24                	and    al,0x24
c0009e1d:	24 00                	and    al,0x0
c0009e1f:	00 00                	add    BYTE PTR [eax],al
c0009e21:	00 00                	add    BYTE PTR [eax],al
c0009e23:	00 00                	add    BYTE PTR [eax],al
c0009e25:	c6 44 28 28 10       	mov    BYTE PTR [eax+ebp*1+0x28],0x10
c0009e2a:	28 28                	sub    BYTE PTR [eax],ch
c0009e2c:	44                   	inc    esp
c0009e2d:	c6 00 00             	mov    BYTE PTR [eax],0x0
c0009e30:	00 00                	add    BYTE PTR [eax],al
c0009e32:	00 00                	add    BYTE PTR [eax],al
c0009e34:	00 e7                	add    bh,ah
c0009e36:	42                   	inc    edx
c0009e37:	42                   	inc    edx
c0009e38:	24 24                	and    al,0x24
c0009e3a:	24 18                	and    al,0x18
c0009e3c:	18 10                	sbb    BYTE PTR [eax],dl
c0009e3e:	10 60 00             	adc    BYTE PTR [eax+0x0],ah
c0009e41:	00 00                	add    BYTE PTR [eax],al
c0009e43:	00 00                	add    BYTE PTR [eax],al
c0009e45:	fe 82 84 08 10 20    	inc    BYTE PTR [edx+0x20100884]
c0009e4b:	42                   	inc    edx
c0009e4c:	82                   	(bad)  
c0009e4d:	fe 00                	inc    BYTE PTR [eax]
c0009e4f:	00 00                	add    BYTE PTR [eax],al
c0009e51:	06                   	push   es
c0009e52:	08 10                	or     BYTE PTR [eax],dl
c0009e54:	10 10                	adc    BYTE PTR [eax],dl
c0009e56:	10 60 10             	adc    BYTE PTR [eax+0x10],ah
c0009e59:	10 10                	adc    BYTE PTR [eax],dl
c0009e5b:	10 08                	adc    BYTE PTR [eax],cl
c0009e5d:	06                   	push   es
c0009e5e:	00 00                	add    BYTE PTR [eax],al
c0009e60:	10 10                	adc    BYTE PTR [eax],dl
c0009e62:	10 10                	adc    BYTE PTR [eax],dl
c0009e64:	10 10                	adc    BYTE PTR [eax],dl
c0009e66:	10 10                	adc    BYTE PTR [eax],dl
c0009e68:	10 10                	adc    BYTE PTR [eax],dl
c0009e6a:	10 10                	adc    BYTE PTR [eax],dl
c0009e6c:	10 10                	adc    BYTE PTR [eax],dl
c0009e6e:	10 10                	adc    BYTE PTR [eax],dl
c0009e70:	00 60 10             	add    BYTE PTR [eax+0x10],ah
c0009e73:	08 08                	or     BYTE PTR [eax],cl
c0009e75:	08 08                	or     BYTE PTR [eax],cl
c0009e77:	06                   	push   es
c0009e78:	08 08                	or     BYTE PTR [eax],cl
c0009e7a:	08 08                	or     BYTE PTR [eax],cl
c0009e7c:	10 60 00             	adc    BYTE PTR [eax+0x0],ah
c0009e7f:	00 00                	add    BYTE PTR [eax],al
c0009e81:	72 8c                	jb     c0009e0f <PKnFont+0x76f>
	...

c000a6a0 <intr_entry_table>:
c000a6a0:	49                   	dec    ecx
c000a6a1:	83 00 c0             	add    DWORD PTR [eax],0xffffffc0
c000a6a4:	74 83                	je     c000a629 <PKnFont+0xf89>
c000a6a6:	00 c0                	add    al,al
c000a6a8:	9f                   	lahf   
c000a6a9:	83 00 c0             	add    DWORD PTR [eax],0xffffffc0
c000a6ac:	ca 83 00             	retf   0x83
c000a6af:	c0                   	(bad)  
c000a6b0:	f5                   	cmc    
c000a6b1:	83 00 c0             	add    DWORD PTR [eax],0xffffffc0
c000a6b4:	20 84 00 c0 4b 84 00 	and    BYTE PTR [eax+eax*1+0x844bc0],al
c000a6bb:	c0                   	(bad)  
c000a6bc:	76 84                	jbe    c000a642 <PKnFont+0xfa2>
c000a6be:	00 c0                	add    al,al
c000a6c0:	a1 84 00 c0 c8       	mov    eax,ds:0xc8c00084
c000a6c5:	84 00                	test   BYTE PTR [eax],al
c000a6c7:	c0                   	(bad)  
c000a6c8:	f3 84 00             	repz test BYTE PTR [eax],al
c000a6cb:	c0 1a 85             	rcr    BYTE PTR [edx],0x85
c000a6ce:	00 c0                	add    al,al
c000a6d0:	41                   	inc    ecx
c000a6d1:	85 00                	test   DWORD PTR [eax],eax
c000a6d3:	c0 6c 85 00 c0       	shr    BYTE PTR [ebp+eax*4+0x0],0xc0
c000a6d8:	93                   	xchg   ebx,eax
c000a6d9:	85 00                	test   DWORD PTR [eax],eax
c000a6db:	c0 ba 85 00 c0 e5 85 	sar    BYTE PTR [edx-0x1a3fff7b],0x85
c000a6e2:	00 c0                	add    al,al
c000a6e4:	10 86 00 c0 37 86    	adc    BYTE PTR [esi-0x79c84000],al
c000a6ea:	00 c0                	add    al,al
c000a6ec:	62 86 00 c0 8d 86    	bound  eax,QWORD PTR [esi-0x79724000]
c000a6f2:	00 c0                	add    al,al
c000a6f4:	b8 86 00 c0 e3       	mov    eax,0xe3c00086
c000a6f9:	86 00                	xchg   BYTE PTR [eax],al
c000a6fb:	c0 0e 87             	ror    BYTE PTR [esi],0x87
c000a6fe:	00 c0                	add    al,al
c000a700:	39 87 00 c0 60 87    	cmp    DWORD PTR [edi-0x789f4000],eax
c000a706:	00 c0                	add    al,al
c000a708:	8b 87 00 c0 b2 87    	mov    eax,DWORD PTR [edi-0x784d4000]
c000a70e:	00 c0                	add    al,al
c000a710:	d9 87 00 c0 04 88    	fld    DWORD PTR [edi-0x77fb4000]
c000a716:	00 c0                	add    al,al
c000a718:	2b 88 00 c0 52 88    	sub    ecx,DWORD PTR [eax-0x77ad4000]
c000a71e:	00 c0                	add    al,al
c000a720:	7d 88                	jge    c000a6aa <intr_entry_table+0xa>
c000a722:	00 c0                	add    al,al
c000a724:	a8 88                	test   al,0x88
c000a726:	00 c0                	add    al,al
c000a728:	d3 88 00 c0 fe 88    	ror    DWORD PTR [eax-0x77014000],cl
c000a72e:	00 c0                	add    al,al
c000a730:	29 89 00 c0 54 89    	sub    DWORD PTR [ecx-0x76ab4000],ecx
c000a736:	00 c0                	add    al,al
c000a738:	7f 89                	jg     c000a6c3 <intr_entry_table+0x23>
c000a73a:	00 c0                	add    al,al
c000a73c:	aa                   	stos   BYTE PTR es:[edi],al
c000a73d:	89 00                	mov    DWORD PTR [eax],eax
c000a73f:	c0 d5 89             	rcl    ch,0x89
c000a742:	00 c0                	add    al,al
c000a744:	00 8a 00 c0 2b 8a    	add    BYTE PTR [edx-0x75d44000],cl
c000a74a:	00 c0                	add    al,al
c000a74c:	56                   	push   esi
c000a74d:	8a 00                	mov    al,BYTE PTR [eax]
c000a74f:	c0 81 8a 00 c0 ac 8a 	rol    BYTE PTR [ecx-0x533fff76],0x8a
c000a756:	00 c0                	add    al,al
c000a758:	d7                   	xlat   BYTE PTR ds:[ebx]
c000a759:	8a 00                	mov    al,BYTE PTR [eax]
c000a75b:	c0 02 8b             	rol    BYTE PTR [edx],0x8b
c000a75e:	00 c0                	add    al,al

Disassembly of section .eh_frame:

c000a760 <.eh_frame>:
c000a760:	10 00                	adc    BYTE PTR [eax],al
c000a762:	00 00                	add    BYTE PTR [eax],al
c000a764:	00 00                	add    BYTE PTR [eax],al
c000a766:	00 00                	add    BYTE PTR [eax],al
c000a768:	01 00                	add    DWORD PTR [eax],eax
c000a76a:	01 7c 08 0c          	add    DWORD PTR [eax+ecx*1+0xc],edi
c000a76e:	04 04                	add    al,0x4
c000a770:	88 01                	mov    BYTE PTR [ecx],al
c000a772:	00 00                	add    BYTE PTR [eax],al
c000a774:	28 00                	sub    BYTE PTR [eax],al
c000a776:	00 00                	add    BYTE PTR [eax],al
c000a778:	18 00                	sbb    BYTE PTR [eax],al
c000a77a:	00 00                	add    BYTE PTR [eax],al
c000a77c:	19 93 00 c0 79 01    	sbb    DWORD PTR [ebx+0x179c000],edx
c000a782:	00 00                	add    BYTE PTR [eax],al
c000a784:	44                   	inc    esp
c000a785:	0c 01                	or     al,0x1
c000a787:	00 47 10             	add    BYTE PTR [edi+0x10],al
c000a78a:	05 02 75 00 43       	add    eax,0x43007502
c000a78f:	0f 03 75 7c          	lsl    esi,WORD PTR [ebp+0x7c]
c000a793:	06                   	push   es
c000a794:	43                   	inc    ebx
c000a795:	2e 0c 49             	cs or  al,0x49
c000a798:	2e 10 03             	adc    BYTE PTR cs:[ebx],al
c000a79b:	5d                   	pop    ebp
c000a79c:	01 2e                	add    DWORD PTR [esi],ebp
c000a79e:	00 00                	add    BYTE PTR [eax],al
c000a7a0:	2c 00                	sub    al,0x0
c000a7a2:	00 00                	add    BYTE PTR [eax],al
c000a7a4:	44                   	inc    esp
c000a7a5:	00 00                	add    BYTE PTR [eax],al
c000a7a7:	00 58 7f             	add    BYTE PTR [eax+0x7f],bl
c000a7aa:	00 c0                	add    al,al
c000a7ac:	1a 00                	sbb    al,BYTE PTR [eax]
c000a7ae:	00 00                	add    BYTE PTR [eax],al
c000a7b0:	41                   	inc    ecx
c000a7b1:	0e                   	push   cs
c000a7b2:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000a7b8:	43                   	inc    ebx
c000a7b9:	2e 04 04             	cs add al,0x4
c000a7bc:	05 00 00 00 2e       	add    eax,0x2e000000
c000a7c1:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000a7c4:	0c 43                	or     al,0x43
c000a7c6:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000a7ca:	00 41 c5             	add    BYTE PTR [ecx-0x3b],al
c000a7cd:	0c 04                	or     al,0x4
c000a7cf:	04 1c                	add    al,0x1c
c000a7d1:	00 00                	add    BYTE PTR [eax],al
c000a7d3:	00 74 00 00          	add    BYTE PTR [eax+eax*1+0x0],dh
c000a7d7:	00 72 7f             	add    BYTE PTR [edx+0x7f],dh
c000a7da:	00 c0                	add    al,al
c000a7dc:	23 00                	and    eax,DWORD PTR [eax]
c000a7de:	00 00                	add    BYTE PTR [eax],al
c000a7e0:	41                   	inc    ecx
c000a7e1:	0e                   	push   cs
c000a7e2:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000a7e8:	47                   	inc    edi
c000a7e9:	0c 04                	or     al,0x4
c000a7eb:	04 c5                	add    al,0xc5
c000a7ed:	00 00                	add    BYTE PTR [eax],al
c000a7ef:	00 50 00             	add    BYTE PTR [eax+0x0],dl
c000a7f2:	00 00                	add    BYTE PTR [eax],al
c000a7f4:	94                   	xchg   esp,eax
c000a7f5:	00 00                	add    BYTE PTR [eax],al
c000a7f7:	00 95 7f 00 c0 be    	add    BYTE PTR [ebp-0x413fff81],dl
c000a7fd:	00 00                	add    BYTE PTR [eax],al
c000a7ff:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000a802:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000a808:	42                   	inc    edx
c000a809:	86 04 87             	xchg   BYTE PTR [edi+eax*4],al
c000a80c:	03 46 83             	add    eax,DWORD PTR [esi-0x7d]
c000a80f:	05 5c 2e 04 04       	add    eax,0x4042e5c
c000a814:	05 00 00 00 2e       	add    eax,0x2e000000
c000a819:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000a81c:	0c 45                	or     al,0x45
c000a81e:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000a822:	00 02                	add    BYTE PTR [edx],al
c000a824:	4e                   	dec    esi
c000a825:	2e 04 04             	cs add al,0x4
c000a828:	02 00                	add    al,BYTE PTR [eax]
c000a82a:	00 00                	add    BYTE PTR [eax],al
c000a82c:	2e 08 41 2e          	or     BYTE PTR cs:[ecx+0x2e],al
c000a830:	0c 41                	or     al,0x41
c000a832:	2e 10 4b 2e          	adc    BYTE PTR cs:[ebx+0x2e],cl
c000a836:	00 62 c3             	add    BYTE PTR [edx-0x3d],ah
c000a839:	41                   	inc    ecx
c000a83a:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000a83e:	0c 04                	or     al,0x4
c000a840:	04 c5                	add    al,0xc5
c000a842:	00 00                	add    BYTE PTR [eax],al
c000a844:	3c 00                	cmp    al,0x0
c000a846:	00 00                	add    BYTE PTR [eax],al
c000a848:	e8 00 00 00 53       	call   1300a84d <AR_CODE32+0x12ffe7b5>
c000a84d:	80 00 c0             	add    BYTE PTR [eax],0xc0
c000a850:	68 00 00 00 41       	push   0x41000000
c000a855:	0e                   	push   cs
c000a856:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000a85c:	46                   	inc    esi
c000a85d:	83 05 86 04 87 03 53 	add    DWORD PTR ds:0x3870486,0x53
c000a864:	2e 04 04             	cs add al,0x4
c000a867:	05 00 00 00 2e       	add    eax,0x2e000000
c000a86c:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000a86f:	0c 45                	or     al,0x45
c000a871:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000a875:	00 74 c3 41          	add    BYTE PTR [ebx+eax*8+0x41],dh
c000a879:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000a87d:	0c 04                	or     al,0x4
c000a87f:	04 c5                	add    al,0xc5
c000a881:	00 00                	add    BYTE PTR [eax],al
c000a883:	00 38                	add    BYTE PTR [eax],bh
c000a885:	00 00                	add    BYTE PTR [eax],al
c000a887:	00 28                	add    BYTE PTR [eax],ch
c000a889:	01 00                	add    DWORD PTR [eax],eax
c000a88b:	00 bc 80 00 c0 a1 00 	add    BYTE PTR [eax+eax*4+0xa1c000],bh
c000a892:	00 00                	add    BYTE PTR [eax],al
c000a894:	41                   	inc    ecx
c000a895:	0e                   	push   cs
c000a896:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000a89c:	4b                   	dec    ebx
c000a89d:	2e 0c 45             	cs or  al,0x45
c000a8a0:	2e 10 52 2e          	adc    BYTE PTR cs:[edx+0x2e],dl
c000a8a4:	0c 43                	or     al,0x43
c000a8a6:	2e 10 5e 2e          	adc    BYTE PTR cs:[esi+0x2e],bl
c000a8aa:	0c 43                	or     al,0x43
c000a8ac:	2e 10 5e 2e          	adc    BYTE PTR cs:[esi+0x2e],bl
c000a8b0:	0c 43                	or     al,0x43
c000a8b2:	2e 10 5e 2e          	adc    BYTE PTR cs:[esi+0x2e],bl
c000a8b6:	0c 43                	or     al,0x43
c000a8b8:	2e 10 54 2e 00       	adc    BYTE PTR cs:[esi+ebp*1+0x0],dl
c000a8bd:	00 00                	add    BYTE PTR [eax],al
c000a8bf:	00 28                	add    BYTE PTR [eax],ch
c000a8c1:	00 00                	add    BYTE PTR [eax],al
c000a8c3:	00 64 01 00          	add    BYTE PTR [ecx+eax*1+0x0],ah
c000a8c7:	00 60 81             	add    BYTE PTR [eax-0x7f],ah
c000a8ca:	00 c0                	add    al,al
c000a8cc:	4d                   	dec    ebp
c000a8cd:	00 00                	add    BYTE PTR [eax],al
c000a8cf:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000a8d2:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000a8d8:	49                   	dec    ecx
c000a8d9:	83 05 86 04 87 03 7d 	add    DWORD PTR ds:0x3870486,0x7d
c000a8e0:	c3                   	ret    
c000a8e1:	41                   	inc    ecx
c000a8e2:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000a8e6:	0c 04                	or     al,0x4
c000a8e8:	04 c5                	add    al,0xc5
c000a8ea:	00 00                	add    BYTE PTR [eax],al
c000a8ec:	1c 00                	sbb    al,0x0
c000a8ee:	00 00                	add    BYTE PTR [eax],al
c000a8f0:	90                   	nop
c000a8f1:	01 00                	add    DWORD PTR [eax],eax
c000a8f3:	00 ad 81 00 c0 25    	add    BYTE PTR [ebp+0x25c00081],ch
c000a8f9:	00 00                	add    BYTE PTR [eax],al
c000a8fb:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000a8fe:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000a904:	61                   	popa   
c000a905:	0c 04                	or     al,0x4
c000a907:	04 c5                	add    al,0xc5
c000a909:	00 00                	add    BYTE PTR [eax],al
c000a90b:	00 a0 00 00 00 b0    	add    BYTE PTR [eax-0x50000000],ah
c000a911:	01 00                	add    DWORD PTR [eax],eax
c000a913:	00 d2                	add    dl,dl
c000a915:	81 00 c0 e5 00 00    	add    DWORD PTR [eax],0xe5c0
c000a91b:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000a91e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000a924:	41                   	inc    ecx
c000a925:	83 03 71             	add    DWORD PTR [ebx],0x71
c000a928:	2e 04 04             	cs add al,0x4
c000a92b:	06                   	push   es
c000a92c:	00 00                	add    BYTE PTR [eax],al
c000a92e:	00 2e                	add    BYTE PTR [esi],ch
c000a930:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000a933:	0c 42                	or     al,0x42
c000a935:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000a939:	14 41                	adc    al,0x41
c000a93b:	2e 18 4b 2e          	sbb    BYTE PTR cs:[ebx+0x2e],cl
c000a93f:	1c 49                	sbb    al,0x49
c000a941:	2e 20 41 2e          	and    BYTE PTR cs:[ecx+0x2e],al
c000a945:	24 42                	and    al,0x42
c000a947:	2e 28 45 2e          	sub    BYTE PTR cs:[ebp+0x2e],al
c000a94b:	2c 41                	sub    al,0x41
c000a94d:	2e 30 4d 2e          	xor    BYTE PTR cs:[ebp+0x2e],cl
c000a951:	00 47 2e             	add    BYTE PTR [edi+0x2e],al
c000a954:	04 04                	add    al,0x4
c000a956:	02 00                	add    al,BYTE PTR [eax]
c000a958:	00 00                	add    BYTE PTR [eax],al
c000a95a:	2e 08 41 2e          	or     BYTE PTR cs:[ecx+0x2e],al
c000a95e:	0c 42                	or     al,0x42
c000a960:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000a964:	14 41                	adc    al,0x41
c000a966:	2e 18 51 2e          	sbb    BYTE PTR cs:[ecx+0x2e],dl
c000a96a:	1c 42                	sbb    al,0x42
c000a96c:	2e 20 41 2e          	and    BYTE PTR cs:[ecx+0x2e],al
c000a970:	24 42                	and    al,0x42
c000a972:	2e 28 45 2e          	sub    BYTE PTR cs:[ebp+0x2e],al
c000a976:	2c 41                	sub    al,0x41
c000a978:	2e 30 4d 2e          	xor    BYTE PTR cs:[ebp+0x2e],cl
c000a97c:	00 47 2e             	add    BYTE PTR [edi+0x2e],al
c000a97f:	04 04                	add    al,0x4
c000a981:	02 00                	add    al,BYTE PTR [eax]
c000a983:	00 00                	add    BYTE PTR [eax],al
c000a985:	2e 08 41 2e          	or     BYTE PTR cs:[ecx+0x2e],al
c000a989:	0c 42                	or     al,0x42
c000a98b:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000a98f:	14 41                	adc    al,0x41
c000a991:	2e 18 51 2e          	sbb    BYTE PTR cs:[ecx+0x2e],dl
c000a995:	1c 42                	sbb    al,0x42
c000a997:	2e 20 41 2e          	and    BYTE PTR cs:[ecx+0x2e],al
c000a99b:	24 42                	and    al,0x42
c000a99d:	2e 28 45 2e          	sub    BYTE PTR cs:[ebp+0x2e],al
c000a9a1:	2c 41                	sub    al,0x41
c000a9a3:	2e 30 48 2e          	xor    BYTE PTR cs:[eax+0x2e],cl
c000a9a7:	00 44 c5 0c          	add    BYTE PTR [ebp+eax*8+0xc],al
c000a9ab:	04 04                	add    al,0x4
c000a9ad:	c3                   	ret    
c000a9ae:	00 00                	add    BYTE PTR [eax],al
c000a9b0:	34 00                	xor    al,0x0
c000a9b2:	00 00                	add    BYTE PTR [eax],al
c000a9b4:	54                   	push   esp
c000a9b5:	02 00                	add    al,BYTE PTR [eax]
c000a9b7:	00 b7 82 00 c0 69    	add    BYTE PTR [edi+0x69c00082],dh
c000a9bd:	00 00                	add    BYTE PTR [eax],al
c000a9bf:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000a9c2:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000a9c8:	02 45 2e             	add    al,BYTE PTR [ebp+0x2e]
c000a9cb:	04 04                	add    al,0x4
c000a9cd:	0c 00                	or     al,0x0
c000a9cf:	00 00                	add    BYTE PTR [eax],al
c000a9d1:	2e 08 41 2e          	or     BYTE PTR cs:[ecx+0x2e],al
c000a9d5:	0c 41                	or     al,0x41
c000a9d7:	2e 10 45 2e          	adc    BYTE PTR cs:[ebp+0x2e],al
c000a9db:	14 44                	adc    al,0x44
c000a9dd:	2e 18 48 2e          	sbb    BYTE PTR cs:[eax+0x2e],cl
c000a9e1:	00 41 c5             	add    BYTE PTR [ecx-0x3b],al
c000a9e4:	0c 04                	or     al,0x4
c000a9e6:	04 00                	add    al,0x0
c000a9e8:	1c 00                	sbb    al,0x0
c000a9ea:	00 00                	add    BYTE PTR [eax],al
c000a9ec:	8c 02                	mov    WORD PTR [edx],es
c000a9ee:	00 00                	add    BYTE PTR [eax],al
c000a9f0:	20 83 00 c0 16 00    	and    BYTE PTR [ebx+0x16c000],al
c000a9f6:	00 00                	add    BYTE PTR [eax],al
c000a9f8:	41                   	inc    ecx
c000a9f9:	0e                   	push   cs
c000a9fa:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000aa00:	4e                   	dec    esi
c000aa01:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
c000aa04:	04 00                	add    al,0x0
c000aa06:	00 00                	add    BYTE PTR [eax],al
c000aa08:	40                   	inc    eax
c000aa09:	00 00                	add    BYTE PTR [eax],al
c000aa0b:	00 ac 02 00 00 30 8b 	add    BYTE PTR [edx+eax*1-0x74d00000],ch
c000aa12:	00 c0                	add    al,al
c000aa14:	69 00 00 00 41 0e    	imul   eax,DWORD PTR [eax],0xe410000
c000aa1a:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000aa20:	44                   	inc    esp
c000aa21:	2e 08 83 03 45 2e 0c 	or     BYTE PTR cs:[ebx+0xc2e4503],al
c000aa28:	45                   	inc    ebp
c000aa29:	2e 10 49 2e          	adc    BYTE PTR cs:[ecx+0x2e],cl
c000aa2d:	0c 41                	or     al,0x41
c000aa2f:	2e 08 42 2e          	or     BYTE PTR cs:[edx+0x2e],al
c000aa33:	0c 42                	or     al,0x42
c000aa35:	2e 10 6c 2e 00       	adc    BYTE PTR cs:[esi+ebp*1+0x0],ch
c000aa3a:	54                   	push   esp
c000aa3b:	0a c5                	or     al,ch
c000aa3d:	0c 04                	or     al,0x4
c000aa3f:	04 c3                	add    al,0xc3
c000aa41:	45                   	inc    ebp
c000aa42:	0b 44 c5 0c          	or     eax,DWORD PTR [ebp+eax*8+0xc]
c000aa46:	04 04                	add    al,0x4
c000aa48:	c3                   	ret    
c000aa49:	00 00                	add    BYTE PTR [eax],al
c000aa4b:	00 94 00 00 00 f0 02 	add    BYTE PTR [eax+eax*1+0x2f00000],dl
c000aa52:	00 00                	add    BYTE PTR [eax],al
c000aa54:	99                   	cdq    
c000aa55:	8b 00                	mov    eax,DWORD PTR [eax]
c000aa57:	c0 8c 00 00 00 41 0e 	ror    BYTE PTR [eax+eax*1+0xe410000],0x8
c000aa5e:	08 
c000aa5f:	85 02                	test   DWORD PTR [edx],eax
c000aa61:	42                   	inc    edx
c000aa62:	0d 05 43 2e 08       	or     eax,0x82e4305
c000aa67:	42                   	inc    edx
c000aa68:	2e 0c 42             	cs or  al,0x42
c000aa6b:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000aa6f:	0c 41                	or     al,0x41
c000aa71:	2e 08 42 2e          	or     BYTE PTR cs:[edx+0x2e],al
c000aa75:	0c 42                	or     al,0x42
c000aa77:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000aa7b:	0c 41                	or     al,0x41
c000aa7d:	2e 08 42 2e          	or     BYTE PTR cs:[edx+0x2e],al
c000aa81:	0c 42                	or     al,0x42
c000aa83:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000aa87:	0c 41                	or     al,0x41
c000aa89:	2e 08 42 2e          	or     BYTE PTR cs:[edx+0x2e],al
c000aa8d:	0c 42                	or     al,0x42
c000aa8f:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000aa93:	0c 41                	or     al,0x41
c000aa95:	2e 08 42 2e          	or     BYTE PTR cs:[edx+0x2e],al
c000aa99:	0c 45                	or     al,0x45
c000aa9b:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000aa9f:	0c 41                	or     al,0x41
c000aaa1:	2e 08 42 2e          	or     BYTE PTR cs:[edx+0x2e],al
c000aaa5:	0c 45                	or     al,0x45
c000aaa7:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000aaab:	0c 41                	or     al,0x41
c000aaad:	2e 08 42 2e          	or     BYTE PTR cs:[edx+0x2e],al
c000aab1:	0c 45                	or     al,0x45
c000aab3:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000aab7:	0c 41                	or     al,0x41
c000aab9:	2e 08 42 2e          	or     BYTE PTR cs:[edx+0x2e],al
c000aabd:	0c 45                	or     al,0x45
c000aabf:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000aac3:	0c 41                	or     al,0x41
c000aac5:	2e 08 45 2e          	or     BYTE PTR cs:[ebp+0x2e],al
c000aac9:	0c 42                	or     al,0x42
c000aacb:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000aacf:	0c 41                	or     al,0x41
c000aad1:	2e 08 45 2e          	or     BYTE PTR cs:[ebp+0x2e],al
c000aad5:	0c 45                	or     al,0x45
c000aad7:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000aadb:	00 41 c5             	add    BYTE PTR [ecx-0x3b],al
c000aade:	0c 04                	or     al,0x4
c000aae0:	04 00                	add    al,0x0
c000aae2:	00 00                	add    BYTE PTR [eax],al
c000aae4:	1c 00                	sbb    al,0x0
c000aae6:	00 00                	add    BYTE PTR [eax],al
c000aae8:	88 03                	mov    BYTE PTR [ebx],al
c000aaea:	00 00                	add    BYTE PTR [eax],al
c000aaec:	25 8c 00 c0 38       	and    eax,0x38c0008c
c000aaf1:	00 00                	add    BYTE PTR [eax],al
c000aaf3:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000aaf6:	08 85 02 44 0d 05    	or     BYTE PTR [ebp+0x50d4402],al
c000aafc:	72 0c                	jb     c000ab0a <_edata+0x3aa>
c000aafe:	04 04                	add    al,0x4
c000ab00:	c5 00                	lds    eax,FWORD PTR [eax]
c000ab02:	00 00                	add    BYTE PTR [eax],al
c000ab04:	20 00                	and    BYTE PTR [eax],al
c000ab06:	00 00                	add    BYTE PTR [eax],al
c000ab08:	a8 03                	test   al,0x3
c000ab0a:	00 00                	add    BYTE PTR [eax],al
c000ab0c:	5d                   	pop    ebp
c000ab0d:	8c 00                	mov    WORD PTR [eax],es
c000ab0f:	c0 2c 00 00          	shr    BYTE PTR [eax+eax*1],0x0
c000ab13:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000ab16:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ab1c:	44                   	inc    esp
c000ab1d:	83 03 63             	add    DWORD PTR [ebx],0x63
c000ab20:	c3                   	ret    
c000ab21:	41                   	inc    ecx
c000ab22:	0c 04                	or     al,0x4
c000ab24:	04 c5                	add    al,0xc5
c000ab26:	00 00                	add    BYTE PTR [eax],al
c000ab28:	1c 00                	sbb    al,0x0
c000ab2a:	00 00                	add    BYTE PTR [eax],al
c000ab2c:	cc                   	int3   
c000ab2d:	03 00                	add    eax,DWORD PTR [eax]
c000ab2f:	00 89 8c 00 c0 eb    	add    BYTE PTR [ecx-0x143fff74],cl
c000ab35:	00 00                	add    BYTE PTR [eax],al
c000ab37:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000ab3a:	08 85 02 44 0d 05    	or     BYTE PTR [ebp+0x50d4402],al
c000ab40:	02 e5                	add    ah,ch
c000ab42:	0c 04                	or     al,0x4
c000ab44:	04 c5                	add    al,0xc5
c000ab46:	00 00                	add    BYTE PTR [eax],al
c000ab48:	2c 00                	sub    al,0x0
c000ab4a:	00 00                	add    BYTE PTR [eax],al
c000ab4c:	ec                   	in     al,dx
c000ab4d:	03 00                	add    eax,DWORD PTR [eax]
c000ab4f:	00 74 8d 00          	add    BYTE PTR [ebp+ecx*4+0x0],dh
c000ab53:	c0 46 00 00          	rol    BYTE PTR [esi+0x0],0x0
c000ab57:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000ab5a:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ab60:	6a 2e                	push   0x2e
c000ab62:	04 04                	add    al,0x4
c000ab64:	01 00                	add    DWORD PTR [eax],eax
c000ab66:	00 00                	add    BYTE PTR [eax],al
c000ab68:	2e 08 45 2e          	or     BYTE PTR cs:[ebp+0x2e],al
c000ab6c:	0c 45                	or     al,0x45
c000ab6e:	2e 10 4c 2e 00       	adc    BYTE PTR cs:[esi+ebp*1+0x0],cl
c000ab73:	41                   	inc    ecx
c000ab74:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
c000ab77:	04 1c                	add    al,0x1c
c000ab79:	00 00                	add    BYTE PTR [eax],al
c000ab7b:	00 1c 04             	add    BYTE PTR [esp+eax*1],bl
c000ab7e:	00 00                	add    BYTE PTR [eax],al
c000ab80:	ba 8d 00 c0 16       	mov    edx,0x16c0008d
c000ab85:	00 00                	add    BYTE PTR [eax],al
c000ab87:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000ab8a:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ab90:	49                   	dec    ecx
c000ab91:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
c000ab94:	04 00                	add    al,0x0
c000ab96:	00 00                	add    BYTE PTR [eax],al
c000ab98:	1c 00                	sbb    al,0x0
c000ab9a:	00 00                	add    BYTE PTR [eax],al
c000ab9c:	3c 04                	cmp    al,0x4
c000ab9e:	00 00                	add    BYTE PTR [eax],al
c000aba0:	d0 8d 00 c0 1e 00    	ror    BYTE PTR [ebp+0x1ec000],1
c000aba6:	00 00                	add    BYTE PTR [eax],al
c000aba8:	41                   	inc    ecx
c000aba9:	0e                   	push   cs
c000abaa:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000abb0:	5a                   	pop    edx
c000abb1:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
c000abb4:	04 00                	add    al,0x0
c000abb6:	00 00                	add    BYTE PTR [eax],al
c000abb8:	1c 00                	sbb    al,0x0
c000abba:	00 00                	add    BYTE PTR [eax],al
c000abbc:	5c                   	pop    esp
c000abbd:	04 00                	add    al,0x0
c000abbf:	00 ee                	add    dh,ch
c000abc1:	8d 00                	lea    eax,[eax]
c000abc3:	c0 1e 00             	rcr    BYTE PTR [esi],0x0
c000abc6:	00 00                	add    BYTE PTR [eax],al
c000abc8:	41                   	inc    ecx
c000abc9:	0e                   	push   cs
c000abca:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000abd0:	5a                   	pop    edx
c000abd1:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
c000abd4:	04 00                	add    al,0x0
c000abd6:	00 00                	add    BYTE PTR [eax],al
c000abd8:	24 00                	and    al,0x0
c000abda:	00 00                	add    BYTE PTR [eax],al
c000abdc:	7c 04                	jl     c000abe2 <_edata+0x482>
c000abde:	00 00                	add    BYTE PTR [eax],al
c000abe0:	0c 8e                	or     al,0x8e
c000abe2:	00 c0                	add    al,al
c000abe4:	15 00 00 00 41       	adc    eax,0x41000000
c000abe9:	0e                   	push   cs
c000abea:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000abf0:	47                   	inc    edi
c000abf1:	0a 0c 04             	or     cl,BYTE PTR [esp+eax*1]
c000abf4:	04 c5                	add    al,0xc5
c000abf6:	45                   	inc    ebp
c000abf7:	0b 41 0c             	or     eax,DWORD PTR [ecx+0xc]
c000abfa:	04 04                	add    al,0x4
c000abfc:	c5 00                	lds    eax,FWORD PTR [eax]
c000abfe:	00 00                	add    BYTE PTR [eax],al
c000ac00:	1c 00                	sbb    al,0x0
c000ac02:	00 00                	add    BYTE PTR [eax],al
c000ac04:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
c000ac05:	04 00                	add    al,0x0
c000ac07:	00 90 8e 00 c0 1e    	add    BYTE PTR [eax+0x1ec0008e],dl
c000ac0d:	00 00                	add    BYTE PTR [eax],al
c000ac0f:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000ac12:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ac18:	5a                   	pop    edx
c000ac19:	0c 04                	or     al,0x4
c000ac1b:	04 c5                	add    al,0xc5
c000ac1d:	00 00                	add    BYTE PTR [eax],al
c000ac1f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000ac22:	00 00                	add    BYTE PTR [eax],al
c000ac24:	c4 04 00             	les    eax,FWORD PTR [eax+eax*1]
c000ac27:	00 ae 8e 00 c0 19    	add    BYTE PTR [esi+0x19c0008e],ch
c000ac2d:	00 00                	add    BYTE PTR [eax],al
c000ac2f:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000ac32:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ac38:	55                   	push   ebp
c000ac39:	0c 04                	or     al,0x4
c000ac3b:	04 c5                	add    al,0xc5
c000ac3d:	00 00                	add    BYTE PTR [eax],al
c000ac3f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000ac42:	00 00                	add    BYTE PTR [eax],al
c000ac44:	e4 04                	in     al,0x4
c000ac46:	00 00                	add    BYTE PTR [eax],al
c000ac48:	c7                   	(bad)  
c000ac49:	8e 00                	mov    es,WORD PTR [eax]
c000ac4b:	c0 1c 00 00          	rcr    BYTE PTR [eax+eax*1],0x0
c000ac4f:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000ac52:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ac58:	58                   	pop    eax
c000ac59:	0c 04                	or     al,0x4
c000ac5b:	04 c5                	add    al,0xc5
c000ac5d:	00 00                	add    BYTE PTR [eax],al
c000ac5f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000ac62:	00 00                	add    BYTE PTR [eax],al
c000ac64:	04 05                	add    al,0x5
c000ac66:	00 00                	add    BYTE PTR [eax],al
c000ac68:	e3 8e                	jecxz  c000abf8 <_edata+0x498>
c000ac6a:	00 c0                	add    al,al
c000ac6c:	1c 00                	sbb    al,0x0
c000ac6e:	00 00                	add    BYTE PTR [eax],al
c000ac70:	41                   	inc    ecx
c000ac71:	0e                   	push   cs
c000ac72:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ac78:	58                   	pop    eax
c000ac79:	0c 04                	or     al,0x4
c000ac7b:	04 c5                	add    al,0xc5
c000ac7d:	00 00                	add    BYTE PTR [eax],al
c000ac7f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000ac82:	00 00                	add    BYTE PTR [eax],al
c000ac84:	24 05                	and    al,0x5
c000ac86:	00 00                	add    BYTE PTR [eax],al
c000ac88:	ff 8e 00 c0 2a 00    	dec    DWORD PTR [esi+0x2ac000]
c000ac8e:	00 00                	add    BYTE PTR [eax],al
c000ac90:	41                   	inc    ecx
c000ac91:	0e                   	push   cs
c000ac92:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ac98:	66 0c 04             	data16 or al,0x4
c000ac9b:	04 c5                	add    al,0xc5
c000ac9d:	00 00                	add    BYTE PTR [eax],al
c000ac9f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000aca2:	00 00                	add    BYTE PTR [eax],al
c000aca4:	44                   	inc    esp
c000aca5:	05 00 00 29 8f       	add    eax,0x8f290000
c000acaa:	00 c0                	add    al,al
c000acac:	12 00                	adc    al,BYTE PTR [eax]
c000acae:	00 00                	add    BYTE PTR [eax],al
c000acb0:	41                   	inc    ecx
c000acb1:	0e                   	push   cs
c000acb2:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000acb8:	4a                   	dec    edx
c000acb9:	0c 04                	or     al,0x4
c000acbb:	04 c5                	add    al,0xc5
c000acbd:	00 00                	add    BYTE PTR [eax],al
c000acbf:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
c000acc2:	00 00                	add    BYTE PTR [eax],al
c000acc4:	64 05 00 00 3b 8f    	fs add eax,0x8f3b0000
c000acca:	00 c0                	add    al,al
c000accc:	27                   	daa    
c000accd:	00 00                	add    BYTE PTR [eax],al
c000accf:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000acd2:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000acd8:	63 0c 04             	arpl   WORD PTR [esp+eax*1],cx
c000acdb:	04 c5                	add    al,0xc5
c000acdd:	00 00                	add    BYTE PTR [eax],al
c000acdf:	00 28                	add    BYTE PTR [eax],ch
c000ace1:	00 00                	add    BYTE PTR [eax],al
c000ace3:	00 84 05 00 00 64 8f 	add    BYTE PTR [ebp+eax*1-0x709c0000],al
c000acea:	00 c0                	add    al,al
c000acec:	66 00 00             	data16 add BYTE PTR [eax],al
c000acef:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000acf2:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000acf8:	46                   	inc    esi
c000acf9:	83 05 86 04 87 03 02 	add    DWORD PTR ds:0x3870486,0x2
c000ad00:	59                   	pop    ecx
c000ad01:	c3                   	ret    
c000ad02:	41                   	inc    ecx
c000ad03:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000ad07:	0c 04                	or     al,0x4
c000ad09:	04 c5                	add    al,0xc5
c000ad0b:	00 44 00 00          	add    BYTE PTR [eax+eax*1+0x0],al
c000ad0f:	00 b0 05 00 00 ca    	add    BYTE PTR [eax-0x35fffffb],dh
c000ad15:	8f 00                	pop    DWORD PTR [eax]
c000ad17:	c0 38 00             	sar    BYTE PTR [eax],0x0
c000ad1a:	00 00                	add    BYTE PTR [eax],al
c000ad1c:	41                   	inc    ecx
c000ad1d:	0e                   	push   cs
c000ad1e:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ad24:	41                   	inc    ecx
c000ad25:	87 03                	xchg   DWORD PTR [ebx],eax
c000ad27:	44                   	inc    esp
c000ad28:	86 04 04             	xchg   BYTE PTR [esp+eax*1],al
c000ad2b:	04 00                	add    al,0x0
c000ad2d:	00 00                	add    BYTE PTR [eax],al
c000ad2f:	83 05 49 2e 04 04 01 	add    DWORD PTR ds:0x4042e49,0x1
c000ad36:	00 00                	add    BYTE PTR [eax],al
c000ad38:	00 2e                	add    BYTE PTR [esi],ch
c000ad3a:	08 43 2e             	or     BYTE PTR [ebx+0x2e],al
c000ad3d:	0c 41                	or     al,0x41
c000ad3f:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000ad43:	14 48                	adc    al,0x48
c000ad45:	2e 00 4c c3 41       	add    BYTE PTR cs:[ebx+eax*8+0x41],cl
c000ad4a:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000ad4e:	0c 04                	or     al,0x4
c000ad50:	04 c5                	add    al,0xc5
c000ad52:	00 00                	add    BYTE PTR [eax],al
c000ad54:	28 00                	sub    BYTE PTR [eax],al
c000ad56:	00 00                	add    BYTE PTR [eax],al
c000ad58:	f8                   	clc    
c000ad59:	05 00 00 02 90       	add    eax,0x90020000
c000ad5e:	00 c0                	add    al,al
c000ad60:	5f                   	pop    edi
c000ad61:	00 00                	add    BYTE PTR [eax],al
c000ad63:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000ad66:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ad6c:	45                   	inc    ebp
c000ad6d:	86 04 87             	xchg   BYTE PTR [edi+eax*4],al
c000ad70:	03 44 83 05          	add    eax,DWORD PTR [ebx+eax*4+0x5]
c000ad74:	02 4f c3             	add    cl,BYTE PTR [edi-0x3d]
c000ad77:	41                   	inc    ecx
c000ad78:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000ad7c:	0c 04                	or     al,0x4
c000ad7e:	04 c5                	add    al,0xc5
c000ad80:	24 00                	and    al,0x0
c000ad82:	00 00                	add    BYTE PTR [eax],al
c000ad84:	24 06                	and    al,0x6
c000ad86:	00 00                	add    BYTE PTR [eax],al
c000ad88:	61                   	popa   
c000ad89:	90                   	nop
c000ad8a:	00 c0                	add    al,al
c000ad8c:	31 00                	xor    DWORD PTR [eax],eax
c000ad8e:	00 00                	add    BYTE PTR [eax],al
c000ad90:	41                   	inc    ecx
c000ad91:	0e                   	push   cs
c000ad92:	08 85 02 44 0d 05    	or     BYTE PTR [ebp+0x50d4402],al
c000ad98:	42                   	inc    edx
c000ad99:	83 04 86 03          	add    DWORD PTR [esi+eax*4],0x3
c000ad9d:	67 c3                	addr16 ret 
c000ad9f:	41                   	inc    ecx
c000ada0:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000ada4:	04 c5                	add    al,0xc5
c000ada6:	00 00                	add    BYTE PTR [eax],al
c000ada8:	38 00                	cmp    BYTE PTR [eax],al
c000adaa:	00 00                	add    BYTE PTR [eax],al
c000adac:	4c                   	dec    esp
c000adad:	06                   	push   es
c000adae:	00 00                	add    BYTE PTR [eax],al
c000adb0:	92                   	xchg   edx,eax
c000adb1:	90                   	nop
c000adb2:	00 c0                	add    al,al
c000adb4:	47                   	inc    edi
c000adb5:	00 00                	add    BYTE PTR [eax],al
c000adb7:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000adba:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000adc0:	44                   	inc    esp
c000adc1:	2e 08 83 03 42 2e 0c 	or     BYTE PTR cs:[ebx+0xc2e4203],al
c000adc8:	45                   	inc    ebp
c000adc9:	2e 10 54 2e 0c       	adc    BYTE PTR cs:[esi+ebp*1+0xc],dl
c000adce:	41                   	inc    ecx
c000adcf:	2e 08 45 2e          	or     BYTE PTR cs:[ebp+0x2e],al
c000add3:	0c 45                	or     al,0x45
c000add5:	2e 10 59 c5          	adc    BYTE PTR cs:[ecx-0x3b],bl
c000add9:	0c 04                	or     al,0x4
c000addb:	04 c3                	add    al,0xc3
c000addd:	41                   	inc    ecx
c000adde:	13 03                	adc    eax,DWORD PTR [ebx]
c000ade0:	2e 00 00             	add    BYTE PTR cs:[eax],al
c000ade3:	00 4c 00 00          	add    BYTE PTR [eax+eax*1+0x0],cl
c000ade7:	00 88 06 00 00 d9    	add    BYTE PTR [eax-0x26fffffa],cl
c000aded:	90                   	nop
c000adee:	00 c0                	add    al,al
c000adf0:	4f                   	dec    edi
c000adf1:	00 00                	add    BYTE PTR [eax],al
c000adf3:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000adf6:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000adfc:	44                   	inc    esp
c000adfd:	2e 08 83 03 45 2e 0c 	or     BYTE PTR cs:[ebx+0xc2e4503],al
c000ae04:	45                   	inc    ebp
c000ae05:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000ae09:	0c 41                	or     al,0x41
c000ae0b:	2e 08 4a 2e          	or     BYTE PTR cs:[edx+0x2e],cl
c000ae0f:	0c 45                	or     al,0x45
c000ae11:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000ae15:	0c 41                	or     al,0x41
c000ae17:	2e 08 42 2e          	or     BYTE PTR cs:[edx+0x2e],al
c000ae1b:	0c 45                	or     al,0x45
c000ae1d:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000ae21:	0c 41                	or     al,0x41
c000ae23:	2e 08 41 2e          	or     BYTE PTR cs:[ecx+0x2e],al
c000ae27:	0c 45                	or     al,0x45
c000ae29:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000ae2d:	00 44 c5 0c          	add    BYTE PTR [ebp+eax*8+0xc],al
c000ae31:	04 04                	add    al,0x4
c000ae33:	c3                   	ret    
c000ae34:	2c 00                	sub    al,0x0
c000ae36:	00 00                	add    BYTE PTR [eax],al
c000ae38:	d8 06                	fadd   DWORD PTR [esi]
c000ae3a:	00 00                	add    BYTE PTR [eax],al
c000ae3c:	28 91 00 c0 9a 00    	sub    BYTE PTR [ecx+0x9ac000],dl
c000ae42:	00 00                	add    BYTE PTR [eax],al
c000ae44:	41                   	inc    ecx
c000ae45:	0e                   	push   cs
c000ae46:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ae4c:	42                   	inc    edx
c000ae4d:	83 03 02             	add    DWORD PTR [ebx],0x2
c000ae50:	8b 0a                	mov    ecx,DWORD PTR [edx]
c000ae52:	c3                   	ret    
c000ae53:	41                   	inc    ecx
c000ae54:	0c 04                	or     al,0x4
c000ae56:	04 c5                	add    al,0xc5
c000ae58:	45                   	inc    ebp
c000ae59:	0b 42 c3             	or     eax,DWORD PTR [edx-0x3d]
c000ae5c:	41                   	inc    ecx
c000ae5d:	0c 04                	or     al,0x4
c000ae5f:	04 c5                	add    al,0xc5
c000ae61:	00 00                	add    BYTE PTR [eax],al
c000ae63:	00 28                	add    BYTE PTR [eax],ch
c000ae65:	00 00                	add    BYTE PTR [eax],al
c000ae67:	00 08                	add    BYTE PTR [eax],cl
c000ae69:	07                   	pop    es
c000ae6a:	00 00                	add    BYTE PTR [eax],al
c000ae6c:	c2 91 00             	ret    0x91
c000ae6f:	c0 25 00 00 00 41 0e 	shl    BYTE PTR ds:0x41000000,0xe
c000ae76:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000ae7c:	42                   	inc    edx
c000ae7d:	83 03 48             	add    DWORD PTR [ebx],0x48
c000ae80:	2e 0c 44             	cs or  al,0x44
c000ae83:	2e 10 49 2e          	adc    BYTE PTR cs:[ecx+0x2e],cl
c000ae87:	00 4a c5             	add    BYTE PTR [edx-0x3b],cl
c000ae8a:	0c 04                	or     al,0x4
c000ae8c:	04 c3                	add    al,0xc3
c000ae8e:	00 00                	add    BYTE PTR [eax],al
c000ae90:	30 00                	xor    BYTE PTR [eax],al
c000ae92:	00 00                	add    BYTE PTR [eax],al
c000ae94:	34 07                	xor    al,0x7
c000ae96:	00 00                	add    BYTE PTR [eax],al
c000ae98:	e7 91                	out    0x91,eax
c000ae9a:	00 c0                	add    al,al
c000ae9c:	2f                   	das    
c000ae9d:	00 00                	add    BYTE PTR [eax],al
c000ae9f:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000aea2:	08 85 02 44 0d 05    	or     BYTE PTR [ebp+0x50d4402],al
c000aea8:	46                   	inc    esi
c000aea9:	87 03                	xchg   DWORD PTR [ebx],eax
c000aeab:	4d                   	dec    ebp
c000aeac:	2e 04 04             	cs add al,0x4
c000aeaf:	01 00                	add    DWORD PTR [eax],eax
c000aeb1:	00 00                	add    BYTE PTR [eax],al
c000aeb3:	2e 08 43 2e          	or     BYTE PTR cs:[ebx+0x2e],al
c000aeb7:	0c 46                	or     al,0x46
c000aeb9:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000aebd:	00 44 c5 0c          	add    BYTE PTR [ebp+eax*8+0xc],al
c000aec1:	04 04                	add    al,0x4
c000aec3:	c7                   	(bad)  
c000aec4:	38 00                	cmp    BYTE PTR [eax],al
c000aec6:	00 00                	add    BYTE PTR [eax],al
c000aec8:	68 07 00 00 18       	push   0x18000007
c000aecd:	92                   	xchg   edx,eax
c000aece:	00 c0                	add    al,al
c000aed0:	47                   	inc    edi
c000aed1:	00 00                	add    BYTE PTR [eax],al
c000aed3:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000aed6:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000aedc:	45                   	inc    ebp
c000aedd:	83 04 86 03          	add    DWORD PTR [esi+eax*4],0x3
c000aee1:	52                   	push   edx
c000aee2:	2e 04 04             	cs add al,0x4
c000aee5:	05 00 00 00 2e       	add    eax,0x2e000000
c000aeea:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000aeed:	0c 45                	or     al,0x45
c000aeef:	2e 10 4e 2e          	adc    BYTE PTR cs:[esi+0x2e],cl
c000aef3:	00 50 c3             	add    BYTE PTR [eax-0x3d],dl
c000aef6:	41                   	inc    ecx
c000aef7:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000aefb:	04 c5                	add    al,0xc5
c000aefd:	00 00                	add    BYTE PTR [eax],al
c000aeff:	00 3c 00             	add    BYTE PTR [eax+eax*1],bh
c000af02:	00 00                	add    BYTE PTR [eax],al
c000af04:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
c000af05:	07                   	pop    es
c000af06:	00 00                	add    BYTE PTR [eax],al
c000af08:	5f                   	pop    edi
c000af09:	92                   	xchg   edx,eax
c000af0a:	00 c0                	add    al,al
c000af0c:	4a                   	dec    edx
c000af0d:	00 00                	add    BYTE PTR [eax],al
c000af0f:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000af12:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000af18:	46                   	inc    esi
c000af19:	83 05 86 04 87 03 56 	add    DWORD PTR ds:0x3870486,0x56
c000af20:	2e 04 04             	cs add al,0x4
c000af23:	05 00 00 00 2e       	add    eax,0x2e000000
c000af28:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000af2b:	0c 45                	or     al,0x45
c000af2d:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000af31:	00 53 c3             	add    BYTE PTR [ebx-0x3d],dl
c000af34:	41                   	inc    ecx
c000af35:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
c000af39:	0c 04                	or     al,0x4
c000af3b:	04 c5                	add    al,0xc5
c000af3d:	00 00                	add    BYTE PTR [eax],al
c000af3f:	00 3c 00             	add    BYTE PTR [eax+eax*1],bh
c000af42:	00 00                	add    BYTE PTR [eax],al
c000af44:	e4 07                	in     al,0x7
c000af46:	00 00                	add    BYTE PTR [eax],al
c000af48:	a9 92 00 c0 42       	test   eax,0x42c00092
c000af4d:	00 00                	add    BYTE PTR [eax],al
c000af4f:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
c000af52:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000af58:	41                   	inc    ecx
c000af59:	86 03                	xchg   BYTE PTR [ebx],al
c000af5b:	44                   	inc    esp
c000af5c:	83 04 04 10          	add    DWORD PTR [esp+eax*1],0x10
c000af60:	00 00                	add    BYTE PTR [eax],al
c000af62:	00 2e                	add    BYTE PTR [esi],ch
c000af64:	04 04                	add    al,0x4
c000af66:	05 00 00 00 2e       	add    eax,0x2e000000
c000af6b:	08 42 2e             	or     BYTE PTR [edx+0x2e],al
c000af6e:	0c 45                	or     al,0x45
c000af70:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000af74:	00 53 c3             	add    BYTE PTR [ebx-0x3d],dl
c000af77:	41                   	inc    ecx
c000af78:	c6 41 0c 04          	mov    BYTE PTR [ecx+0xc],0x4
c000af7c:	04 c5                	add    al,0xc5
c000af7e:	00 00                	add    BYTE PTR [eax],al
c000af80:	40                   	inc    eax
c000af81:	00 00                	add    BYTE PTR [eax],al
c000af83:	00 24 08             	add    BYTE PTR [eax+ecx*1],ah
c000af86:	00 00                	add    BYTE PTR [eax],al
c000af88:	ec                   	in     al,dx
c000af89:	92                   	xchg   edx,eax
c000af8a:	00 c0                	add    al,al
c000af8c:	2d 00 00 00 41       	sub    eax,0x41000000
c000af91:	0e                   	push   cs
c000af92:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
c000af98:	43                   	inc    ebx
c000af99:	2e 08 42 2e          	or     BYTE PTR cs:[edx+0x2e],al
c000af9d:	0c 42                	or     al,0x42
c000af9f:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000afa3:	0c 41                	or     al,0x41
c000afa5:	2e 08 45 2e          	or     BYTE PTR cs:[ebp+0x2e],al
c000afa9:	0c 42                	or     al,0x42
c000afab:	2e 10 46 2e          	adc    BYTE PTR cs:[esi+0x2e],al
c000afaf:	0c 41                	or     al,0x41
c000afb1:	2e 08 42 2e          	or     BYTE PTR cs:[edx+0x2e],al
c000afb5:	0c 42                	or     al,0x42
c000afb7:	2e 10 48 2e          	adc    BYTE PTR cs:[eax+0x2e],cl
c000afbb:	00 41 c5             	add    BYTE PTR [ecx-0x3b],al
c000afbe:	0c 04                	or     al,0x4
c000afc0:	04 00                	add    al,0x0
	...

Disassembly of section .rodata:

c000afc4 <_rodata>:
c000afc4:	62 79 74             	bound  edi,QWORD PTR [ecx+0x74]
c000afc7:	65 5f                	gs pop edi
c000afc9:	69 6e 64 65 78 20 3c 	imul   ebp,DWORD PTR [esi+0x64],0x3c207865
c000afd0:	20 28                	and    BYTE PTR [eax],ch
c000afd2:	62 74 6d 70          	bound  esi,QWORD PTR [ebp+ebp*2+0x70]
c000afd6:	2d 3e 62 74 6d       	sub    eax,0x6d74623e
c000afdb:	70 5f                	jo     c000b03c <__func__.864+0x1c>
c000afdd:	62 79 74             	bound  edi,QWORD PTR [ecx+0x74]
c000afe0:	65 73 5f             	gs jae c000b042 <__func__.864+0x22>
c000afe3:	6c                   	ins    BYTE PTR es:[edi],dx
c000afe4:	65 6e                	outs   dx,BYTE PTR gs:[esi]
c000afe6:	29 00                	sub    DWORD PTR [eax],eax
c000afe8:	6c                   	ins    BYTE PTR es:[edi],dx
c000afe9:	69 62 2f 62 69 74 6d 	imul   esp,DWORD PTR [edx+0x2f],0x6d746962
c000aff0:	61                   	popa   
c000aff1:	70 2e                	jo     c000b021 <__func__.864+0x1>
c000aff3:	63 00                	arpl   WORD PTR [eax],ax
c000aff5:	76 61                	jbe    c000b058 <__func__.864+0x38>
c000aff7:	6c                   	ins    BYTE PTR es:[edi],dx
c000aff8:	75 65                	jne    c000b05f <__func__.864+0x3f>
c000affa:	20 3d 3d 20 30 20    	and    BYTE PTR ds:0x2030203d,bh
c000b000:	7c 7c                	jl     c000b07e <__func__.864+0x5e>
c000b002:	20 76 61             	and    BYTE PTR [esi+0x61],dh
c000b005:	6c                   	ins    BYTE PTR es:[edi],dx
c000b006:	75 65                	jne    c000b06d <__func__.864+0x4d>
c000b008:	20 3d 3d 20 31 00    	and    BYTE PTR ds:0x31203d,bh
	...

c000b010 <__func__.847>:
c000b010:	62 69 74             	bound  ebp,QWORD PTR [ecx+0x74]
c000b013:	6d                   	ins    DWORD PTR es:[edi],dx
c000b014:	61                   	popa   
c000b015:	70 5f                	jo     c000b076 <__func__.864+0x56>
c000b017:	61                   	popa   
c000b018:	6c                   	ins    BYTE PTR es:[edi],dx
c000b019:	6c                   	ins    BYTE PTR es:[edi],dx
c000b01a:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b01b:	63 00                	arpl   WORD PTR [eax],ax
c000b01d:	00 00                	add    BYTE PTR [eax],al
	...

c000b020 <__func__.864>:
c000b020:	62 69 74             	bound  ebp,QWORD PTR [ecx+0x74]
c000b023:	6d                   	ins    DWORD PTR es:[edi],dx
c000b024:	61                   	popa   
c000b025:	70 5f                	jo     c000b086 <__func__.864+0x66>
c000b027:	73 65                	jae    c000b08e <__func__.864+0x6e>
c000b029:	74 00                	je     c000b02b <__func__.864+0xb>
c000b02b:	45                   	inc    ebp
c000b02c:	72 72                	jb     c000b0a0 <__func__.864+0x80>
c000b02e:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b02f:	72 0a                	jb     c000b03b <__func__.864+0x1b>
c000b031:	00 46 69             	add    BYTE PTR [esi+0x69],al
c000b034:	6c                   	ins    BYTE PTR es:[edi],dx
c000b035:	65 3a 00             	cmp    al,BYTE PTR gs:[eax]
c000b038:	49                   	dec    ecx
c000b039:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b03a:	20 66 75             	and    BYTE PTR [esi+0x75],ah
c000b03d:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b03e:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
c000b042:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b043:	3a 20                	cmp    ah,BYTE PTR [eax]
c000b045:	00 4c 69 6e          	add    BYTE PTR [ecx+ebp*2+0x6e],cl
c000b049:	65 3a 00             	cmp    al,BYTE PTR gs:[eax]
c000b04c:	43                   	inc    ebx
c000b04d:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b04e:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b04f:	64 69 74 69 6f 6e 3a 	imul   esi,DWORD PTR fs:[ecx+ebp*2+0x6f],0x203a6e
c000b056:	20 00 
c000b058:	69 6e 74 72 3a 00 75 	imul   ebp,DWORD PTR [esi+0x74],0x75003a72
c000b05f:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b060:	6b 6e 6f 77          	imul   ebp,DWORD PTR [esi+0x6f],0x77
c000b064:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b065:	00 23                	add    BYTE PTR [ebx],ah
c000b067:	44                   	inc    esp
c000b068:	45                   	inc    ebp
c000b069:	20 44 69 76          	and    BYTE PTR [ecx+ebp*2+0x76],al
c000b06d:	69 64 65 20 45 72 72 	imul   esp,DWORD PTR [ebp+eiz*2+0x20],0x6f727245
c000b074:	6f 
c000b075:	72 00                	jb     c000b077 <__func__.864+0x57>
c000b077:	23 44 42 20          	and    eax,DWORD PTR [edx+eax*2+0x20]
c000b07b:	44                   	inc    esp
c000b07c:	65 62 75 67          	bound  esi,QWORD PTR gs:[ebp+0x67]
c000b080:	20 45 78             	and    BYTE PTR [ebp+0x78],al
c000b083:	63 65 70             	arpl   WORD PTR [ebp+0x70],sp
c000b086:	74 69                	je     c000b0f1 <__func__.864+0xd1>
c000b088:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b089:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b08a:	00 4e 4d             	add    BYTE PTR [esi+0x4d],cl
c000b08d:	49                   	dec    ecx
c000b08e:	20 49 6e             	and    BYTE PTR [ecx+0x6e],cl
c000b091:	74 65                	je     c000b0f8 <__func__.864+0xd8>
c000b093:	72 72                	jb     c000b107 <__func__.864+0xe7>
c000b095:	75 70                	jne    c000b107 <__func__.864+0xe7>
c000b097:	74 00                	je     c000b099 <__func__.864+0x79>
c000b099:	23 42 50             	and    eax,DWORD PTR [edx+0x50]
c000b09c:	20 42 72             	and    BYTE PTR [edx+0x72],al
c000b09f:	65 61                	gs popa 
c000b0a1:	6b 70 6f 69          	imul   esi,DWORD PTR [eax+0x6f],0x69
c000b0a5:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b0a6:	74 20                	je     c000b0c8 <__func__.864+0xa8>
c000b0a8:	45                   	inc    ebp
c000b0a9:	78 63                	js     c000b10e <__func__.864+0xee>
c000b0ab:	65 70 74             	gs jo  c000b122 <__func__.864+0x102>
c000b0ae:	69 6f 6e 00 23 4f 46 	imul   ebp,DWORD PTR [edi+0x6e],0x464f2300
c000b0b5:	20 4f 76             	and    BYTE PTR [edi+0x76],cl
c000b0b8:	65 72 66             	gs jb  c000b121 <__func__.864+0x101>
c000b0bb:	6c                   	ins    BYTE PTR es:[edi],dx
c000b0bc:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b0bd:	77 20                	ja     c000b0df <__func__.864+0xbf>
c000b0bf:	45                   	inc    ebp
c000b0c0:	78 63                	js     c000b125 <__func__.864+0x105>
c000b0c2:	65 70 74             	gs jo  c000b139 <__func__.864+0x119>
c000b0c5:	69 6f 6e 00 23 42 52 	imul   ebp,DWORD PTR [edi+0x6e],0x52422300
c000b0cc:	20 42 4f             	and    BYTE PTR [edx+0x4f],al
c000b0cf:	55                   	push   ebp
c000b0d0:	4e                   	dec    esi
c000b0d1:	44                   	inc    esp
c000b0d2:	20 52 61             	and    BYTE PTR [edx+0x61],dl
c000b0d5:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b0d6:	67 65 20 45 78       	and    BYTE PTR gs:[di+0x78],al
c000b0db:	63 65 65             	arpl   WORD PTR [ebp+0x65],sp
c000b0de:	64 65 64 20 45 78    	fs gs and BYTE PTR fs:[ebp+0x78],al
c000b0e4:	63 65 70             	arpl   WORD PTR [ebp+0x70],sp
c000b0e7:	74 69                	je     c000b152 <__func__.864+0x132>
c000b0e9:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b0ea:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b0eb:	00 23                	add    BYTE PTR [ebx],ah
c000b0ed:	55                   	push   ebp
c000b0ee:	44                   	inc    esp
c000b0ef:	20 49 6e             	and    BYTE PTR [ecx+0x6e],cl
c000b0f2:	76 61                	jbe    c000b155 <__func__.864+0x135>
c000b0f4:	6c                   	ins    BYTE PTR es:[edi],dx
c000b0f5:	69 64 20 4f 70 63 6f 	imul   esp,DWORD PTR [eax+eiz*1+0x4f],0x646f6370
c000b0fc:	64 
c000b0fd:	65 20 45 78          	and    BYTE PTR gs:[ebp+0x78],al
c000b101:	63 65 70             	arpl   WORD PTR [ebp+0x70],sp
c000b104:	74 69                	je     c000b16f <__func__.864+0x14f>
c000b106:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b107:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b108:	00 23                	add    BYTE PTR [ebx],ah
c000b10a:	4e                   	dec    esi
c000b10b:	4d                   	dec    ebp
c000b10c:	20 44 65 76          	and    BYTE PTR [ebp+eiz*2+0x76],al
c000b110:	69 63 65 20 4e 6f 74 	imul   esp,DWORD PTR [ebx+0x65],0x746f4e20
c000b117:	20 41 76             	and    BYTE PTR [ecx+0x76],al
c000b11a:	61                   	popa   
c000b11b:	69 6c 61 62 6c 65 20 	imul   ebp,DWORD PTR [ecx+eiz*2+0x62],0x4520656c
c000b122:	45 
c000b123:	78 63                	js     c000b188 <__func__.864+0x168>
c000b125:	65 70 74             	gs jo  c000b19c <__func__.864+0x17c>
c000b128:	69 6f 6e 00 23 44 46 	imul   ebp,DWORD PTR [edi+0x6e],0x46442300
c000b12f:	20 44 6f 75          	and    BYTE PTR [edi+ebp*2+0x75],al
c000b133:	62 6c 65 20          	bound  ebp,QWORD PTR [ebp+eiz*2+0x20]
c000b137:	46                   	inc    esi
c000b138:	61                   	popa   
c000b139:	75 6c                	jne    c000b1a7 <__func__.864+0x187>
c000b13b:	74 20                	je     c000b15d <__func__.864+0x13d>
c000b13d:	45                   	inc    ebp
c000b13e:	78 63                	js     c000b1a3 <__func__.864+0x183>
c000b140:	65 70 74             	gs jo  c000b1b7 <__func__.864+0x197>
c000b143:	69 6f 6e 00 43 6f 70 	imul   ebp,DWORD PTR [edi+0x6e],0x706f4300
c000b14a:	72 6f                	jb     c000b1bb <__func__.864+0x19b>
c000b14c:	63 65 73             	arpl   WORD PTR [ebp+0x73],sp
c000b14f:	73 6f                	jae    c000b1c0 <__func__.864+0x1a0>
c000b151:	72 20                	jb     c000b173 <__func__.864+0x153>
c000b153:	53                   	push   ebx
c000b154:	65 67 6d             	gs ins DWORD PTR es:[di],dx
c000b157:	65 6e                	outs   dx,BYTE PTR gs:[esi]
c000b159:	74 20                	je     c000b17b <__func__.864+0x15b>
c000b15b:	4f                   	dec    edi
c000b15c:	76 65                	jbe    c000b1c3 <__func__.864+0x1a3>
c000b15e:	72 72                	jb     c000b1d2 <__func__.864+0x1b2>
c000b160:	75 6e                	jne    c000b1d0 <__func__.864+0x1b0>
c000b162:	00 23                	add    BYTE PTR [ebx],ah
c000b164:	54                   	push   esp
c000b165:	53                   	push   ebx
c000b166:	20 49 6e             	and    BYTE PTR [ecx+0x6e],cl
c000b169:	76 61                	jbe    c000b1cc <__func__.864+0x1ac>
c000b16b:	6c                   	ins    BYTE PTR es:[edi],dx
c000b16c:	69 64 20 54 53 53 20 	imul   esp,DWORD PTR [eax+eiz*1+0x54],0x45205353
c000b173:	45 
c000b174:	78 63                	js     c000b1d9 <__func__.864+0x1b9>
c000b176:	65 70 74             	gs jo  c000b1ed <__func__.864+0x1cd>
c000b179:	69 6f 6e 00 23 4e 50 	imul   ebp,DWORD PTR [edi+0x6e],0x504e2300
c000b180:	20 53 65             	and    BYTE PTR [ebx+0x65],dl
c000b183:	67 6d                	ins    DWORD PTR es:[di],dx
c000b185:	65 6e                	outs   dx,BYTE PTR gs:[esi]
c000b187:	74 20                	je     c000b1a9 <__func__.864+0x189>
c000b189:	4e                   	dec    esi
c000b18a:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b18b:	74 20                	je     c000b1ad <__func__.864+0x18d>
c000b18d:	50                   	push   eax
c000b18e:	72 65                	jb     c000b1f5 <__func__.864+0x1d5>
c000b190:	73 65                	jae    c000b1f7 <__func__.864+0x1d7>
c000b192:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b193:	74 00                	je     c000b195 <__func__.864+0x175>
c000b195:	23 53 53             	and    edx,DWORD PTR [ebx+0x53]
c000b198:	20 53 74             	and    BYTE PTR [ebx+0x74],dl
c000b19b:	61                   	popa   
c000b19c:	63 6b 20             	arpl   WORD PTR [ebx+0x20],bp
c000b19f:	46                   	inc    esi
c000b1a0:	61                   	popa   
c000b1a1:	75 6c                	jne    c000b20f <__func__.864+0x1ef>
c000b1a3:	74 20                	je     c000b1c5 <__func__.864+0x1a5>
c000b1a5:	45                   	inc    ebp
c000b1a6:	78 63                	js     c000b20b <__func__.864+0x1eb>
c000b1a8:	65 70 74             	gs jo  c000b21f <__func__.864+0x1ff>
c000b1ab:	69 6f 6e 00 23 47 50 	imul   ebp,DWORD PTR [edi+0x6e],0x50472300
c000b1b2:	20 47 65             	and    BYTE PTR [edi+0x65],al
c000b1b5:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b1b6:	65 72 61             	gs jb  c000b21a <__func__.864+0x1fa>
c000b1b9:	6c                   	ins    BYTE PTR es:[edi],dx
c000b1ba:	20 50 72             	and    BYTE PTR [eax+0x72],dl
c000b1bd:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b1be:	74 65                	je     c000b225 <__func__.864+0x205>
c000b1c0:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
c000b1c4:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b1c5:	20 45 78             	and    BYTE PTR [ebp+0x78],al
c000b1c8:	63 65 70             	arpl   WORD PTR [ebp+0x70],sp
c000b1cb:	74 69                	je     c000b236 <__func__.864+0x216>
c000b1cd:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b1ce:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b1cf:	00 23                	add    BYTE PTR [ebx],ah
c000b1d1:	50                   	push   eax
c000b1d2:	46                   	inc    esi
c000b1d3:	20 50 61             	and    BYTE PTR [eax+0x61],dl
c000b1d6:	67 65 2d 46 61 75 6c 	addr16 gs sub eax,0x6c756146
c000b1dd:	74 20                	je     c000b1ff <__func__.864+0x1df>
c000b1df:	45                   	inc    ebp
c000b1e0:	78 63                	js     c000b245 <__func__.864+0x225>
c000b1e2:	65 70 74             	gs jo  c000b259 <__func__.864+0x239>
c000b1e5:	69 6f 6e 00 52 65 73 	imul   ebp,DWORD PTR [edi+0x6e],0x73655200
c000b1ec:	65 72 76             	gs jb  c000b265 <__func__.864+0x245>
c000b1ef:	65 64 00 23          	gs add BYTE PTR fs:[ebx],ah
c000b1f3:	4d                   	dec    ebp
c000b1f4:	46                   	inc    esi
c000b1f5:	20 78 38             	and    BYTE PTR [eax+0x38],bh
c000b1f8:	37                   	aaa    
c000b1f9:	20 46 50             	and    BYTE PTR [esi+0x50],al
c000b1fc:	55                   	push   ebp
c000b1fd:	20 46 6c             	and    BYTE PTR [esi+0x6c],al
c000b200:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b201:	61                   	popa   
c000b202:	74 69                	je     c000b26d <__func__.864+0x24d>
c000b204:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b205:	67 2d 50 6f 69 6e    	addr16 sub eax,0x6e696f50
c000b20b:	74 20                	je     c000b22d <__func__.864+0x20d>
c000b20d:	45                   	inc    ebp
c000b20e:	72 72                	jb     c000b282 <digits.933+0x12>
c000b210:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b211:	72 00                	jb     c000b213 <__func__.864+0x1f3>
c000b213:	23 41 43             	and    eax,DWORD PTR [ecx+0x43]
c000b216:	20 41 6c             	and    BYTE PTR [ecx+0x6c],al
c000b219:	69 67 6e 6d 65 6e 74 	imul   esp,DWORD PTR [edi+0x6e],0x746e656d
c000b220:	20 43 68             	and    BYTE PTR [ebx+0x68],al
c000b223:	65 63 6b 20          	arpl   WORD PTR gs:[ebx+0x20],bp
c000b227:	45                   	inc    ebp
c000b228:	78 63                	js     c000b28d <digits.933+0x1d>
c000b22a:	65 70 74             	gs jo  c000b2a1 <digits.933+0x31>
c000b22d:	69 6f 6e 00 23 4d 43 	imul   ebp,DWORD PTR [edi+0x6e],0x434d2300
c000b234:	20 4d 61             	and    BYTE PTR [ebp+0x61],cl
c000b237:	63 68 69             	arpl   WORD PTR [eax+0x69],bp
c000b23a:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b23b:	65 2d 43 68 65 63    	gs sub eax,0x63656843
c000b241:	6b 20 45             	imul   esp,DWORD PTR [eax],0x45
c000b244:	78 63                	js     c000b2a9 <digits.933+0x39>
c000b246:	65 70 74             	gs jo  c000b2bd <digits.933+0x4d>
c000b249:	69 6f 6e 00 23 58 46 	imul   ebp,DWORD PTR [edi+0x6e],0x46582300
c000b250:	20 53 49             	and    BYTE PTR [ebx+0x49],dl
c000b253:	4d                   	dec    ebp
c000b254:	44                   	inc    esp
c000b255:	20 46 6c             	and    BYTE PTR [esi+0x6c],al
c000b258:	6f                   	outs   dx,DWORD PTR ds:[esi]
c000b259:	61                   	popa   
c000b25a:	74 69                	je     c000b2c5 <digits.933+0x55>
c000b25c:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b25d:	67 2d 50 6f 69 6e    	addr16 sub eax,0x6e696f50
c000b263:	74 20                	je     c000b285 <digits.933+0x15>
c000b265:	45                   	inc    ebp
c000b266:	78 63                	js     c000b2cb <digits.933+0x5b>
c000b268:	65 70 74             	gs jo  c000b2df <digits.933+0x6f>
c000b26b:	69 6f 6e 00 00 30 31 	imul   ebp,DWORD PTR [edi+0x6e],0x31300000

c000b270 <digits.933>:
c000b270:	30 31                	xor    BYTE PTR [ecx],dh
c000b272:	32 33                	xor    dh,BYTE PTR [ebx]
c000b274:	34 35                	xor    al,0x35
c000b276:	36 37                	ss aaa 
c000b278:	38 39                	cmp    BYTE PTR [ecx],bh
c000b27a:	41                   	inc    ecx
c000b27b:	42                   	inc    edx
c000b27c:	43                   	inc    ebx
c000b27d:	44                   	inc    esp
c000b27e:	45                   	inc    ebp
c000b27f:	46                   	inc    esi
c000b280:	47                   	inc    edi
c000b281:	48                   	dec    eax
c000b282:	49                   	dec    ecx
c000b283:	4a                   	dec    edx
c000b284:	4b                   	dec    ebx
c000b285:	4c                   	dec    esp
c000b286:	4d                   	dec    ebp
c000b287:	4e                   	dec    esi
c000b288:	4f                   	dec    edi
c000b289:	50                   	push   eax
c000b28a:	51                   	push   ecx
c000b28b:	52                   	push   edx
c000b28c:	53                   	push   ebx
c000b28d:	54                   	push   esp
c000b28e:	55                   	push   ebp
c000b28f:	56                   	push   esi
c000b290:	57                   	push   edi
c000b291:	58                   	pop    eax
c000b292:	59                   	pop    ecx
c000b293:	5a                   	pop    edx
c000b294:	00 00                	add    BYTE PTR [eax],al
c000b296:	00 00                	add    BYTE PTR [eax],al
c000b298:	64 73 74             	fs jae c000b30f <Screen+0x7>
c000b29b:	5f                   	pop    edi
c000b29c:	5f                   	pop    edi
c000b29d:	20 21                	and    BYTE PTR [ecx],ah
c000b29f:	3d 20 4e 55 4c       	cmp    eax,0x4c554e20
c000b2a4:	4c                   	dec    esp
c000b2a5:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
c000b2a9:	2f                   	das    
c000b2aa:	73 74                	jae    c000b320 <Screen+0x18>
c000b2ac:	72 69                	jb     c000b317 <Screen+0xf>
c000b2ae:	6e                   	outs   dx,BYTE PTR ds:[esi]
c000b2af:	67 2e 63 00          	arpl   WORD PTR cs:[bx+si],ax
c000b2b3:	64 73 74             	fs jae c000b32a <intr_name+0x6>
c000b2b6:	5f                   	pop    edi
c000b2b7:	5f                   	pop    edi
c000b2b8:	20 21                	and    BYTE PTR [ecx],ah
c000b2ba:	3d 20 4e 55 4c       	cmp    eax,0x4c554e20
c000b2bf:	4c                   	dec    esp
c000b2c0:	20 26                	and    BYTE PTR [esi],ah
c000b2c2:	26 20 73 72          	and    BYTE PTR es:[ebx+0x72],dh
c000b2c6:	63 5f 5f             	arpl   WORD PTR [edi+0x5f],bx
c000b2c9:	20 21                	and    BYTE PTR [ecx],ah
c000b2cb:	3d 20 4e 55 4c       	cmp    eax,0x4c554e20
c000b2d0:	4c                   	dec    esp
c000b2d1:	00 70 31             	add    BYTE PTR [eax+0x31],dh
c000b2d4:	5f                   	pop    edi
c000b2d5:	5f                   	pop    edi
c000b2d6:	20 21                	and    BYTE PTR [ecx],ah
c000b2d8:	3d 20 4e 55 4c       	cmp    eax,0x4c554e20
c000b2dd:	4c                   	dec    esp
c000b2de:	20 26                	and    BYTE PTR [esi],ah
c000b2e0:	26 20 70 32          	and    BYTE PTR es:[eax+0x32],dh
c000b2e4:	5f                   	pop    edi
c000b2e5:	5f                   	pop    edi
c000b2e6:	20 21                	and    BYTE PTR [ecx],ah
c000b2e8:	3d 20 4e 55 4c       	cmp    eax,0x4c554e20
c000b2ed:	4c                   	dec    esp
	...

c000b2f0 <__func__.820>:
c000b2f0:	6d                   	ins    DWORD PTR es:[edi],dx
c000b2f1:	65 6d                	gs ins DWORD PTR es:[edi],dx
c000b2f3:	73 65                	jae    c000b35a <intr_name+0x36>
c000b2f5:	74 00                	je     c000b2f7 <__func__.820+0x7>
	...

c000b2f8 <__func__.831>:
c000b2f8:	6d                   	ins    DWORD PTR es:[edi],dx
c000b2f9:	65 6d                	gs ins DWORD PTR es:[edi],dx
c000b2fb:	63 70 79             	arpl   WORD PTR [eax+0x79],si
	...

c000b300 <__func__.843>:
c000b300:	6d                   	ins    DWORD PTR es:[edi],dx
c000b301:	65 6d                	gs ins DWORD PTR es:[edi],dx
c000b303:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
	...

Disassembly of section .bss:

c000b308 <Screen>:
	...

c000b324 <intr_name>:
	...

c000b3e0 <idt>:
	...

c000b558 <idt_table>:
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
