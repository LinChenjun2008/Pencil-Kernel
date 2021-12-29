;DESC
;%1:base %2:limit %3:ar

%macro DESC 3
    dw (%2 & 0xffff)      ;段界限15～0
    dw (%1 & 0xffff)      ;段基址15～0
    db ((%1 >> 16) & 0xff);段基址23～16
    db (%3 & 0xff)        ;段属性 (P DPL S TYPE)
    db (((%2 >> 16)& 0x0f) | ((%3 >> 8)& 0xf0)) ;段界限19～16(低位) 和段属性(G D/B L AVL)
    db ((%1 >> 24)& 0xff)                       ;段基址31～24
%endmacro

