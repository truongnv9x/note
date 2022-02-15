create table IDCTEXT1_COPY as select * from IDCTEXT1 where 1=0;

select *from IDCTEXT1_COPY;

update IDCTEXT1 set XMMUCHIENTHI = XMMUCTINHIENTHI;
update IDCTEXT1 set XMMUCHIENTHI = XMMUCTINHIENTHI;
update IDCTEXT1 set XMDONVI = XMLINHVUC;
update IDCTEXT1 set XMANHDAIDIEN = XMANHMOTA;
update IDCTEXT1 set XMXOA = 0 where XMXOA is null;
commit;

select XMANHDAIDIEN from IDCTEXT1;

ALTER TABLE IDCTEXT1 
    ADD ( XMBINHLUAN VARCHAR2(30 CHAR));
ALTER TABLE IDCTEXT1 
    ADD (
        XMBINHLUAN VARCHAR2(30 CHAR),
        XMCHUYENMUCANH	VARCHAR2(200 CHAR),
        XMDONGSUKIEN	VARCHAR2(200 CHAR),
        XMNGAYTAO	DATE,
        XMTEPTINDINHKEM	VARCHAR2(200 CHAR),
        XMSOLANDOC	NUMBER(38,0),
        XMTHUTU	NUMBER(38,0),
        XMNGUONTHUTHAP	VARCHAR2(200 CHAR),
        XMTENBENMOITHAU	VARCHAR2(2000 CHAR),
        XMDANHGIA	VARCHAR2(30 CHAR),
        XMCAPDUYET	VARCHAR2(200 CHAR),
        XMCHUYENMUCVIDEO	VARCHAR2(200 CHAR),
        XMTENGOITHAU	VARCHAR2(2000 CHAR),
        XMNGUOIDUYETCOSO	VARCHAR2(200 CHAR),
        XMTRANGTHAI	VARCHAR2(30 CHAR),
        XMDONVI	VARCHAR2(200 CHAR),
        XMALBUM	VARCHAR2(200 CHAR),
        XMDOCNAMEREMIX	VARCHAR2(30 CHAR),
        XMNGAYHETHAN	DATE,
        XMNGUOISUA	VARCHAR2(200 CHAR),
        XMSOLANBINHCHON	NUMBER(38,0),
        XMLIENKETWEB	VARCHAR2(200 CHAR),
        XMNGUOITAO	VARCHAR2(200 CHAR),
        XMNHOMDUYET	VARCHAR2(200 CHAR),
        XMSOQUYETDINHCONGBO	VARCHAR2(2000 CHAR),
        XMNGAYTHUTHAP	DATE,
        XMNGUOIDUYET	VARCHAR2(200 CHAR),
        XMNGAYHETHIEULUC	DATE,
        XMLOAISUKIEN	VARCHAR2(200 CHAR),
        XMNGUOITAOPHIENBAN	VARCHAR2(200 CHAR),
        XMBIEUMAU	VARCHAR2(2000 CHAR),
        XMBINHCHON	VARCHAR2(30 CHAR),
        XMXOA	NUMBER(38,0),
        XMNGAYSUA	DATE,
        XMANHDAIDIEN	VARCHAR2(200 CHAR),
        XMMUCHIENTHI	VARCHAR2(2000 CHAR)
    );
commit;