SELECT
    *
FROM
    BC_KHAI_THAC_GT
WHERE
    BCKT_ID = 1033;

SELECT
    *
FROM
    CTCK_NHAN_SU_CAO_CAP
WHERE
    TRANG_THAI_NHAN_SU = 2;

UPDATE CTCK_NHAN_SU_CAO_CAP
SET
    TRANG_THAI_NHAN_SU = 2
WHERE
    GHI_CHU = '2';

COMMIT;

--select * from BC_THANH_VIEN where ctck_thong_tin_id = 918 and ky_bao_cao = 'TH' and trang_thai = 2 and nam_canh_bao = 2021;

SELECT
    COUNT(*)
FROM
    BC_THANH_VIEN
WHERE
    ky_bao_cao = 'TH'
    AND trang_thai = 2
    OR trang_thai = 3
    AND nam_canh_bao = 2021;

SELECT
    ky_bao_cao,gia_tri_ky_bc,nam_canh_bao,thoi_han_gui,trang_thai,ngay_gui
FROM
    BC_THANH_VIEN
WHERE
    ky_bao_cao = 'BN';

SELECT
    *
FROM
    ctck_thong_tin;

SELECT
    COUNT(*)
FROM
    CB_CTCK_VI_PHAM
ORDER BY
    id DESC;

SELECT
    *
FROM
    CB_CTCK_VI_PHAM
ORDER BY
    id DESC;

SELECT
    *
FROM
    CBTT_BAO_CAO
WHERE
    ky_bao_cao IS NOT NULL;

SELECT
    *
FROM
    CB_CTCK_VI_PHAM
WHERE
    CTCK_THONG_TIN_ID = 905
ORDER BY
    id DESC;

SELECT
    *
FROM
    CB_CTCK_VI_PHAM
WHERE
    NAM_CANH_BAO IS NOT NULL;

SELECT
    *
FROM
    CB_CTCK_VI_PHAM
WHERE
    GIA_TRI_THUC_TE = 0;

SELECT
    COUNT(*)
FROM
    (
        SELECT
            id,bm_bao_cao_dinh_ky_id,nam_canh_bao,ky_bao_cao,trang_thai
        FROM
            bc_thanh_vien
        WHERE
            nam_canh_bao = '2020'
            AND ky_bao_cao = 'TH'
            AND ( huy_bao_cao = 0
                  OR huy_bao_cao IS NULL )
    );

SELECT
    COUNT(*)
FROM
    (
        SELECT
            id,bm_bao_cao_dinh_ky_id,nam_canh_bao,ky_bao_cao,trang_thai
        FROM
            bc_thanh_vien
        WHERE
            nam_canh_bao = '2020'
            AND ky_bao_cao = 'TH'
            AND trang_thai IN (
                2,3
            )
            AND ( huy_bao_cao = 0
                  OR huy_bao_cao IS NULL )
    );

SELECT
    *
FROM
    bc_thanh_vien
WHERE
    nam_canh_bao = '2019'
    AND ky_bao_cao = 'NAM'
    AND ( huy_bao_cao = 0
          OR huy_bao_cao IS NULL )
    AND TRANG_THAI IN (
        2,3
    );

SELECT
    *
FROM
    bc_bao_cao_gt
WHERE
    bm_sheet_ct_vao_id = 57935
    AND KY_BAO_CAO = 'TH';

SELECT
    *
FROM
    bc_bao_cao_gt
WHERE
    bm_sheet_ct_vao_id = 272512
    AND KY_BAO_CAO = 'BN';

SELECT
    *
FROM
    bc_thanh_vien
WHERE
    ID = 95452;

SELECT
    *
FROM
    bc_bao_cao_gt
WHERE
    bm_sheet_ct_vao_id = 272512
    AND ky_bao_cao = 'BN';

SELECT
    t2.bm_sheet_ct_vao_id,t1.*
FROM
    bc_thanh_vien t1
    LEFT JOIN bc_bao_cao_gt t2 ON t1.id = t2.bc_thanh_vien_Id
WHERE
    t2.ky_bao_cao = 'BN'
    AND t2.bm_sheet_ct_vao_id = 270913;

SELECT
    *
FROM
    bc_bao_cao_gt
WHERE
    bm_sheet_ct_vao_id = 272512
    AND ky_bao_cao = 'BN';

SELECT
    *
FROM
    bc_bao_cao_gt
WHERE
    BC_THANH_VIEN_ID = 95452;
--and t2.ky_bao_cao = 'BN' and t2.bm_sheet_ct_id = 272512;

SELECT
    t1.*
FROM
    bc_thanh_vien t1
    LEFT JOIN bc_bao_cao_gt t2 ON t1.id = t2.bc_thanh_vien_Id
WHERE
    t2.ky_bao_cao = 'Q'
    AND t1.ky_bao_cao = 'Q'
    AND t2.bm_sheet_ct_vao_id IN (
        272512,57935
    );

SELECT
    gt.*
FROM
    bc_bao_cao_gt gt
WHERE
    1 = 1
    AND ( gt.bc_thanh_vien_Id = 41274 )
    AND ( gt.bm_sheet_ct_vao_id IS NOT NULL )
    AND ( gt.bm_sheet_ct_vao_id = 261310 )
ORDER BY
    gt.id DESC;

SELECT
    gt.*
FROM
    bc_bao_cao_gt gt
WHERE
    1 = 1
    AND ( gt.bc_thanh_vien_Id = 41274 )
    AND ( gt.bm_sheet_ct_vao_id = 261310 )
ORDER BY
    gt.id DESC;

SELECT
    ct.*
FROM
    BM_SHEET_CT ct
WHERE
    1 = 1
    AND ( ct.BM_SHEET_CT_VAO_ID IS NOT NULL )
    AND ( ct.BM_SHEET_CT_VAO_ID = 261310 )
ORDER BY
    ct.id DESC;
  
--select 
--    bcgt.id, bcgt.bm_bao_cao_id, bcgt.ctck_thong_tin_id, bcgt.bm_sheet_ct_id,  bcgt.bm_sheet_id, bcgt.bm_sheet_hang_id, bcgt.bm_sheet_cot_id, 
--    bcgt.gia_tri, bcgt.bm_bao_cao_dinh_ky_id 

261292
select 
    bcgt.ten_cot, bcgt
from bc_bao_cao_gt bcgt 
where 1 = 1  
    and bcgt.bm_bao_cao_id = 2755 
    and bcgt.bc_thanh_vien_id  = 41274 
    and bcgt.bm_sheet_id  =  5807 
order by bcgt.id desc;

  select gt.* from bc_bao_cao_gt gt  where 1 = 1 and  (gt.bc_thanh_vien_Id =  41274 )  order by gt.id desc;
  
  select *from  261292

baoCaoId: 2755
thanhVienId: 41274
sheetId: 5807

272512

select *from bc_bao_cao_gt where bm_sheet_ct_vao_id = 57935;



select *from BM_SHEET_CT where BM_SHEET_CT_VAO_ID = 57935;

select *from bc_bao_cao_gt;
SELECT *FROM BM_BAO_CAO_DINH_KY WHERE ID = 2219;

SELECT *FROM BM_BAO_CAO WHERE ID = 2755;
SELECT *FROM BM_BAO_CAO;


select count(*) from bc_thanh_vien where ky_bao_cao = 'Q' AND NAM_CANH_BAO = 2021 and TRANG_THAI in (2,3);
select count(*) from bc_thanh_vien where ky_bao_cao = 'TH' AND NAM_CANH_BAO = 2021 and TRANG_THAI in (2,3);
select count(*) from bc_thanh_vien where ky_bao_cao = 'BN' AND NAM_CANH_BAO = 2021 and TRANG_THAI in (2,3);
select count(*) from bc_thanh_vien where ky_bao_cao = 'NAM' AND NAM_CANH_BAO = 2021 and TRANG_THAI in (2,3);

select count(*) from bc_thanh_vien where (ky_bao_cao = 'Q' OR ky_bao_cao = 'TH' OR ky_bao_cao = 'BN' OR ky_bao_cao = 'NAM') AND NAM_CANH_BAO = 2021 and TRANG_THAI in (2,3);

select *from cb_chi_tieu;

SELECT count(*) FROM CB_CTCK_VI_PHAM;
SELECT * FROM CB_CTCK_VI_PHAM order by id desc;


select *from BC_THANH_VIEN where huy_bao_cao = null or huy_bao_cao != 1;


DELETE FROM CB_CTCK_VI_PHAM;
COMMIT;

select *from QLRR_KY_BAO_CAO where id = 257;
select *from QLRR_KY_BAO_CAO_CTCK where ctck_thong_tin_id = 842;

SELECT *FROM CB_CTCK_VI_PHAM where CB_CHI_TIEU_ID != 205 order by id desc;
SELECT count(*) FROM CB_CTCK_VI_PHAM where cb_chi_tieu_id = 205;

DELETE FROM CB_CTCK_VI_PHAM where cb_chi_tieu_id = 205;
COMMIT;

select count(*) from CTCK_NGUOI_HANH_NGHE_CK;
SELECT * FROM CTCK_NGUOI_HANH_NGHE_CK where trang_thai = 2;
SELECT hoten, socmt, so_chung_chi_hnck FROM CTCK_NGUOI_HANH_NGHE_CK where trang_thai = 2;
SELECT count(*) FROM CTCK_NGUOI_HANH_NGHE_CK where  trang_thai = 2;
SELECT count(*) FROM CTCK_NGUOI_HANH_NGHE_CK where  trang_thai = 1;
SELECT count(*) FROM CTCK_NGUOI_HANH_NGHE_CK where  trang_thai = 0;


select from ctck_thong_tin;

select *from BM_SHEET_CT WHERE ID = 58378;
select *from BM_SHEET_CT WHERE ID = 58405;
select *from BM_SHEET_CT WHERE ID = 58428;
select *from BM_SHEET_CT WHERE ID = 270930;
select *from BM_SHEET_CT WHERE ID = 270608;
select *from BM_SHEET_CT WHERE ID = 270686;



UPDATE CTCK_NGUOI_HANH_NGHE_CK SET trang_thai_xoa = 0 where trang_thai = 2;
commit;

select *from cb_chi_tieu;

select *from bc_thanh_vien;
select *from bm_bao_cao;
select *from bm_sheet_ct where bm_sheet_ct_vao_id in (261310, 301368);

select tv.id, tv.ctck_Thong_Tin_Id, tv.nam_Canh_Bao, tv.ky_Bao_Cao, tv.gia_Tri_Ky_Bc
from bc_thanh_vien tv  
left join bm_bao_cao bm on tv.bm_bao_cao_id = bm.id and bm.su_dung = 0
left join bm_sheet_ct ct on ct.bm_bao_cao_id = bm.id
where tv.trang_Thai in (2,3) and tv.huy_Bao_Cao = 0 
and tv.nam_Canh_Bao = 2021  and tv.ky_Bao_Cao = 'BN'  ;
and ct.bm_sheet_ct_vao_id in (261310, 301368)  order by tv.id desc ;


SELECT *FROM bc_thanh_vien WHERE  BM_BAO_CAO_DINH_KY_ID = 301368;

select *from bc_thanh_vien where nam_canh_bao = 2019 and ky_bao_cao = 'NAM' AND ;

select *from CTCK_NHAN_SU_CAO_CAP where id = 7449;
select *from CTCK_NHAN_SU_CAO_CAP where id = 7450;

select *from CTCK_NHAN_SU_CAO_CAP where ho_ten like 'Nguy?n ?? L?ng';

select count(*)from CTCK_NHAN_SU_CAO_CAP;

select *from ctck_thong_tin where ctck_thong_tin_id = 918;
select *from ctck_thong_tin where ten_viet_tat like 'TVS';
select *from CBTT_BAO_CAO;

DELETE FROM ctck_thong_tin WHERE ID IN (2126,2111);
COMMIT;




SELECT CTCK_THONG_TIN_ID, TO_CHAR(NGAY_CBTT,'DD/MM/YYYY'),ngay_gui FROM CBTT_BAO_CAO where ctck_thong_tin_id = 918;

SELECT CTCK_THONG_TIN_ID, NGAY_CBTT FROM CBTT_BAO_CAO WHERE NGAY_CBTT >= TO_DATE('20/04/2021','dd/MM/YYYY');

SELECT CTCK_THONG_TIN_ID, NGAY_CBTT FROM CBTT_BAO_CAO WHERE NGAY_CBTT >= TO_DATE('20/07/2021','dd/MM/YYYY');

update CBTT_BAO_CAO SET NGAY_CBTT = NGAY_GUI where ctck_thong_tin_id = 918 and ngay_cbtt is null;
commit;



select ngay_cbtt,TO_CHAR(NGAY_CBTT,'DD/MM/YYYY') from CBTT_BAO_CAO where ngay_cbtt is not null order by ngay_cbtt desc;

select *from QLRR_NHOM_CHI_TIEU;

select *from QLRR_CHI_TIEU where ma_chi_tieu = 'M11';

UPDATE QLRR_CHI_TIEU SET LOAI_HINH = 'M' WHERE ma_chi_tieu = 'M11';
COMMIT;


SELECT * FROM  (SELECT t1.* ,ROWNUM AS rnum from (SELECT cbtt.id, cbtt.CTCK_THONG_TIN_ID,ctck.ten_tieng_viet,ctck.ten_viet_tat,cbtt.tieu_de, cbtt.NOI_DUNG_TRICH_YEU, cbtt.trang_thai, 
cbtt.FILE_DINH_KEM, cbtt.loai_cong_bo, cbtt.ngay_gui, cbtt.ngay_cbtt, cbtt.nguoi_cbtt,'' as t12,'' as t13,'' as t14,'' as t15,'' as t16,'' as t17, '' as t18,
ROW_NUMBER () OVER (PARTITION BY cbtt.CTCK_THONG_TIN_ID ORDER BY cbtt.ngay_gui desc ) seq_no   
FROM CBTT_BAO_CAO cbtt  left join CTCK_THONG_TIN ctck on ctck.CTCK_THONG_TIN_ID = cbtt.CTCK_THONG_TIN_ID  
where 1=1  and ctck.is_bang_tam = 0  and (cbtt.ngay_Cbtt >=TO_DATE('24/10/2021','DD/MM/YY'))
and (cbtt.ngay_Cbtt <=TO_DATE('27/10/2021 23:59:59','DD/MM/YYYY HH24:MI:SS')) ) t1) tabAll ;

-----------------------------------
DELETE FROM CB_CTCK_VI_PHAM where CB_CHI_TIEU_ID = 205;
COMMIT;


------

select *from CTCK_THONG_TIN where trang_thai = 13;
select *from DM_TRANG_THAI_CTCK;

select * from ctck_nguoi_hanh_nghe_ck where hoten like '%V?nh B?o Qu?c%';
select * from ctck_nguoi_hanh_nghe_ck where hoten like '%V?nh B?o Qu?c%';
select * from CTCK_NHAN_SU_CAO_CAP where id = 7304;
select *from ctck_thong_tin where ten_tieng_viet like '%Qu?c T?%';
            
select * from ctck_chi_nhanh where CTCK_CHI_NHANH_ID = 484;


select *from bc_thanh_vien;
select *from bm_bao_cao;
select *from bm_sheet_ct;



SELECT * FROM  (SELECT t1.* ,ROWNUM AS rnum from (SELECT cbtt.id, cbtt.CTCK_THONG_TIN_ID,ctck.ten_tieng_viet,ctck.ten_viet_tat,cbtt.tieu_de, cbtt.NOI_DUNG_TRICH_YEU, cbtt.trang_thai, 
cbtt.FILE_DINH_KEM, cbtt.loai_cong_bo, cbtt.ngay_gui, cbtt.ngay_cbtt, cbtt.nguoi_cbtt,cbtt.filename,'' as t13,'' as t14,'' as t15,'' as t16,cbtt.ky_bao_cao, cbtt.nam,
ROW_NUMBER () OVER (PARTITION BY cbtt.ngay_cbtt ORDER BY cbtt.ngay_cbtt desc ) seq_no   
FROM CBTT_BAO_CAO cbtt 
left join CTCK_THONG_TIN ctck on ctck.CTCK_THONG_TIN_ID = cbtt.CTCK_THONG_TIN_ID 
where 1=1 and cbtt.ngay_cbtt is not null and ctck.is_bang_tam = 0 
and ( cbtt.ctck_Thong_Tin_Id= 843) and (  cbtt.loai_Tin = 5)  and (  cbtt.trang_Thai= 1) ) t1) tabAll
order by tabAll.ngay_cbtt desc;


select *from QLRR_KY_BAO_CAO;
select *from QLRR_KY_BAO_CAO where id = 258;

select *from QLRR_KY_BAO_CAO where ky = 'BN' and nam = 2019;

select *from QLRR_KBC_CTCK_CHI_TIET WHERE QLRR_KBC_CTCK_ID IN (3323);
select *from QLRR_KBC_CTCK_CHI_TIET where ky_bao_cao = 'BN';

SELECT * FROM CB_CTCK_VI_PHAM;

SELECT count(*)FROM CB_CTCK_VI_PHAM;

select *from bm_sheet_ct where id = 58378;

DELETE FROM QLRR_KBC_CTCK_CHI_TIET WHERE CTCK_THONG_TIN_ID = 842;
COMMIT;


 SELECT gt.id, gt.bm_bao_cao_id, gt.ctck_thong_tin_id, gt.bm_sheet_ct_id, gt.bm_sheet_id, gt.bm_sheet_hang_id, gt.bm_sheet_cot_id, gt.gia_tri, gt.bm_bao_cao_dinh_ky_id, gt.bc_thanh_vien_id, 
 '' as kieu_sheet, gt.nam, gt.ky_bao_cao, gt.gia_tri_ky_bc, gt.bm_sheet_ct_vao_id,gt.don_vi_tinh,gt.dinh_dang, gt.thu_tu_hang 
 FROM BC_BAO_CAO_GT gt 
 left join BC_THANH_VIEN tv ON gt.BC_THANH_VIEN_ID = tv.id 
 where 1 = 1 and( tv.huy_bao_cao = null or tv.huy_bao_cao != 1) and (tv.trang_thai = 2 or tv.trang_thai = 3) 
 and ( gt.ky_Bao_Cao like 'BN')  and ( gt.nam like '2021')  and ( gt.gia_Tri_Ky_Bc like '1')  and gt.ctck_Thong_Tin_Id in (923,842,856)  order by gt.id desc ;
 
  SELECT gt.id, gt.bm_bao_cao_id, gt.ctck_thong_tin_id, gt.bm_sheet_ct_id, gt.bm_sheet_id, gt.bm_sheet_hang_id, gt.bm_sheet_cot_id, gt.gia_tri, gt.bm_bao_cao_dinh_ky_id, gt.bc_thanh_vien_id, 
 '' as kieu_sheet, gt.nam, gt.ky_bao_cao, gt.gia_tri_ky_bc, gt.bm_sheet_ct_vao_id,gt.don_vi_tinh,gt.dinh_dang, gt.thu_tu_hang 
 FROM BC_BAO_CAO_GT gt 
 left join BC_THANH_VIEN tv ON gt.BC_THANH_VIEN_ID = tv.id 
 where 1 = 1 and( tv.huy_bao_cao = null or tv.huy_bao_cao != 1) and (tv.trang_thai = 2 or tv.trang_thai = 3) 
 and ( gt.ky_Bao_Cao like 'BN')  and ( gt.nam like '2021') and gt.ctck_Thong_Tin_Id in (923,842,856)  order by gt.id desc ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 