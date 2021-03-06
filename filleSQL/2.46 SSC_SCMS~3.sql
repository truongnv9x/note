

SELECT * FROM(SELECT CTCK_THONG_TIN_ID, 
CASE WHEN MIN(SUM_DV_HOI_SO) IS NULL THEN 0 ELSE MIN(SUM_DV_HOI_SO) END MIN_SUM_DV_HOI_SO, 
CASE WHEN MAX(SUM_DV_HOI_SO) IS NULL THEN 0 ELSE MAX(SUM_DV_HOI_SO) END MAX_SUM_DV_HOI_SO, 
CASE WHEN MIN(SUM_DV_CHI_NHANH) IS NOT NULL THEN MIN(SUM_DV_CHI_NHANH) WHEN MIN(SUM_DV_CHI_NHANH) IS NULL AND C_CHI_NHANH > 0 THEN 0 END MIN_SUM_DV_CHI_NHANH,
CASE WHEN MAX(SUM_DV_CHI_NHANH) IS NOT NULL THEN MAX(SUM_DV_CHI_NHANH) WHEN MAX(SUM_DV_CHI_NHANH) IS NULL AND C_CHI_NHANH > 0 THEN 0 END MAX_SUM_DV_CHI_NHANH, 
CASE WHEN MIN(SUM_DV_PGD) IS NOT NULL THEN MIN(SUM_DV_PGD) WHEN MIN(SUM_DV_PGD) IS NULL AND C_PHONG_GD > 0 THEN 0  END MIN_SUM_DV_PGD, 
CASE WHEN MAX(SUM_DV_PGD) IS NOT NULL THEN MAX(SUM_DV_PGD) WHEN MAX(SUM_DV_PGD) IS NULL AND C_PHONG_GD > 0 THEN 0  END MAX_SUM_DV_PGD, 
CASE WHEN MIN(SUM_DV_VPDD) IS NOT NULL THEN MIN(SUM_DV_VPDD) WHEN MIN(SUM_DV_VPDD) IS NULL AND C_VPDD > 0 THEN 0  END MIN_SUM_DV_VPDD,
CASE WHEN MAX(SUM_DV_VPDD) IS NOT NULL THEN MAX(SUM_DV_VPDD) WHEN MAX(SUM_DV_VPDD) IS NULL AND C_VPDD > 0 THEN 0  END MAX_SUM_DV_VPDD
FROM ( SELECT DISTINCT tbl1.CTCK_THONG_TIN_ID, tbl2.SUM_DV_HOI_SO, tbl2.SUM_DV_CHI_NHANH, tbl2.SUM_DV_PGD, tbl2.SUM_DV_VPDD
,(SELECT COUNT(ID) FROM CTCK_CHI_NHANH WHERE CTCK_THONG_TIN_ID = tbl1.CTCK_THONG_TIN_ID AND IS_BANG_TAM = 0) C_CHI_NHANH 
,(SELECT COUNT(ID) FROM CTCK_PHONG_GIAO_DICH WHERE CTCK_THONG_TIN_ID = tbl1.CTCK_THONG_TIN_ID AND IS_BANG_TAM = 0) C_PHONG_GD 
,(SELECT COUNT(ID) FROM CTCK_VP_DAI_DIEN WHERE CTCK_THONG_TIN_ID = tbl1.CTCK_THONG_TIN_ID AND IS_BANG_TAM = 0) C_VPDD 
FROM (SELECT CTCK_THONG_TIN_ID, TRANG_THAI,
trim(COLUMN_VALUE) NGANH_NGHE_KD_ID FROM (SELECT CTCK_THONG_TIN_ID, TRANG_THAI, NGANH_NGHE_KINH_DOANH NGANH_NGHE_KD_ID FROM CTCK_THONG_TIN
WHERE IS_BANG_TAM = 0), xmltable(('"' || REPLACE(NGANH_NGHE_KD_ID, ',', '","') || '"')) NGANH_NGHE_KD_ID) tbl1 LEFT JOIN ( SELECT CTCK_THONG_TIN_ID, 
SUM(CASE WHEN CTCK_CHI_NHANH_ID IS NULL AND CTCK_PHONG_GIAO_DICH_ID IS NULL AND CTCK_VP_DAI_DIEN_ID IS NULL THEN COUNT_NHN ELSE 0 END) SUM_DV_HOI_SO , 
SUM(CASE WHEN CTCK_CHI_NHANH_ID IS NOT NULL AND CTCK_PHONG_GIAO_DICH_ID IS NULL AND CTCK_VP_DAI_DIEN_ID IS NULL THEN COUNT_NHN END) SUM_DV_CHI_NHANH , 
SUM(CASE WHEN CTCK_CHI_NHANH_ID IS NULL AND CTCK_PHONG_GIAO_DICH_ID IS NOT NULL AND CTCK_VP_DAI_DIEN_ID IS NULL THEN COUNT_NHN END) SUM_DV_PGD , 
SUM(CASE WHEN CTCK_CHI_NHANH_ID IS NULL AND CTCK_PHONG_GIAO_DICH_ID IS NULL AND CTCK_VP_DAI_DIEN_ID IS NOT NULL THEN COUNT_NHN END) SUM_DV_VPDD
FROM ( select t1.CTCK_THONG_TIN_ID, t1.CTCK_CHI_NHANH_ID, t1.CTCK_PHONG_GIAO_DICH_ID, t1.CTCK_VP_DAI_DIEN_ID, t5.DM_NGANH_NGHE_KD_ID, COUNT(t5.nguoi_hanh_nghe_ck_id) COUNT_NHN from ctck_nguoi_hanh_nghe_ck t1 
LEFT JOIN (SELECT nguoi_hanh_nghe_ck_id,LISTAGG(dm_nganh_Nghe_id, ',') WITHIN GROUP (ORDER BY nguoi_hanh_nghe_ck_id) "DM_NGANH_NGHE_KD_ID" FROM LK_NHN_CK_NGANH_NGHE_KD GROUP BY nguoi_hanh_nghe_ck_id) t5 on t5.nguoi_hanh_nghe_ck_id = t1.id and t1.trang_thai = 1 
--LEFT JOIN ctck_nhan_su_cao_cap t2 ON t1.CTCK_NHAN_SU_ID = t2.ID AND t2.TRANG_THAI = 1 AND t1.ctck_nhan_su_id IS NOT NULL --xoa di nhe
GROUP BY t1.CTCK_THONG_TIN_ID, t1.CTCK_CHI_NHANH_ID, t1.CTCK_PHONG_GIAO_DICH_ID, t1.CTCK_VP_DAI_DIEN_ID, t5.DM_NGANH_NGHE_KD_ID having t5.DM_NGANH_NGHE_KD_ID is not null) GROUP BY CTCK_THONG_TIN_ID) tbl2 
ON tbl1.CTCK_THONG_TIN_ID = tbl2.CTCK_THONG_TIN_ID  AND tbl1.CTCK_THONG_TIN_ID IN (SELECT CTCK_THONG_TIN_ID FROM CTCK_THONG_TIN WHERE TRANG_THAI IN (SELECT ID FROM DM_TRANG_THAI_CTCK WHERE TRANG_THAI = 1) AND IS_BANG_TAM = 0) 
) tblAll GROUP BY CTCK_THONG_TIN_ID, C_CHI_NHANH, C_PHONG_GD, C_VPDD) ttt WHERE 1=1;
--OR  MIN_SUM_DV_HOI_SO < 3.0 OR (MIN_SUM_DV_CHI_NHANH IS NOT NULL AND MIN_SUM_DV_CHI_NHANH < 2.0) OR (MIN_SUM_DV_PGD IS NULL AND MIN_SUM_DV_PGD < 2.0);

--------------

SELECT * FROM(SELECT CTCK_THONG_TIN_ID, CASE WHEN MIN(SUM_DV_HOI_SO) IS NULL THEN 0 ELSE MIN(SUM_DV_HOI_SO) END MIN_SUM_DV_HOI_SO, 
CASE WHEN MAX(SUM_DV_HOI_SO) IS NULL THEN 0 ELSE MAX(SUM_DV_HOI_SO) END MAX_SUM_DV_HOI_SO, CASE WHEN MIN(SUM_DV_CHI_NHANH) IS NULL THEN 0 ELSE MIN(SUM_DV_CHI_NHANH) END MIN_SUM_DV_CHI_NHANH,
CASE WHEN MAX(SUM_DV_CHI_NHANH) IS NULL THEN 0 ELSE MAX(SUM_DV_CHI_NHANH) END MAX_SUM_DV_CHI_NHANH, CASE WHEN MIN(SUM_DV_PGD) IS NULL THEN 0 ELSE MIN(SUM_DV_PGD) END MIN_SUM_DV_PGD,
CASE WHEN MAX(SUM_DV_PGD) IS NULL THEN 0 ELSE MAX(SUM_DV_PGD) END MAX_SUM_DV_PGD, CASE WHEN MIN(SUM_DV_VPDD) IS NULL THEN 0 ELSE MIN(SUM_DV_VPDD) END MIN_SUM_DV_VPDD, CASE WHEN MAX(SUM_DV_VPDD) IS NULL THEN 0 ELSE MAX(SUM_DV_VPDD) END MAX_SUM_DV_VPDD FROM ( SELECT DISTINCT tbl1.CTCK_THONG_TIN_ID, tbl2.SUM_DV_HOI_SO, tbl2.SUM_DV_CHI_NHANH, tbl2.SUM_DV_PGD, tbl2.SUM_DV_VPDD FROM ( SELECT CTCK_THONG_TIN_ID, TRANG_THAI, trim(COLUMN_VALUE) NGANH_NGHE_KD_ID FROM (SELECT CTCK_THONG_TIN_ID, TRANG_THAI, NGANH_NGHE_KINH_DOANH NGANH_NGHE_KD_ID FROM CTCK_THONG_TIN WHERE IS_BANG_TAM = 0), xmltable(('"' || REPLACE(NGANH_NGHE_KD_ID, ',', '","') || '"')) NGANH_NGHE_KD_ID) tbl1 LEFT JOIN ( SELECT CTCK_THONG_TIN_ID, SUM(CASE WHEN CTCK_CHI_NHANH_ID IS NULL AND CTCK_PHONG_GIAO_DICH_ID IS NULL AND CTCK_VP_DAI_DIEN_ID IS NULL THEN COUNT_NHN ELSE 0 END) SUM_DV_HOI_SO , SUM(CASE WHEN CTCK_CHI_NHANH_ID IS NOT NULL AND CTCK_PHONG_GIAO_DICH_ID IS NULL AND CTCK_VP_DAI_DIEN_ID IS NULL THEN COUNT_NHN ELSE 0 END) SUM_DV_CHI_NHANH , SUM(CASE WHEN CTCK_CHI_NHANH_ID IS NULL AND CTCK_PHONG_GIAO_DICH_ID IS NOT NULL AND CTCK_VP_DAI_DIEN_ID IS NULL THEN COUNT_NHN ELSE 0 END) SUM_DV_PGD , SUM(CASE WHEN CTCK_CHI_NHANH_ID IS NULL AND CTCK_PHONG_GIAO_DICH_ID IS NULL AND CTCK_VP_DAI_DIEN_ID IS NOT NULL THEN COUNT_NHN ELSE 0 END) SUM_DV_VPDD FROM ( select t1.CTCK_THONG_TIN_ID, t1.CTCK_CHI_NHANH_ID, t1.CTCK_PHONG_GIAO_DICH_ID, t1.CTCK_VP_DAI_DIEN_ID, t5.DM_NGANH_NGHE_KD_ID, COUNT(t5.nguoi_hanh_nghe_ck_id) COUNT_NHN from ctck_nguoi_hanh_nghe_ck t1 LEFT JOIN (SELECT nguoi_hanh_nghe_ck_id,LISTAGG(dm_nganh_Nghe_id, ',') WITHIN GROUP (ORDER BY nguoi_hanh_nghe_ck_id) "DM_NGANH_NGHE_KD_ID" FROM LK_NHN_CK_NGANH_NGHE_KD GROUP BY nguoi_hanh_nghe_ck_id) t5 on t5.nguoi_hanh_nghe_ck_id = t1.id and t1.trang_thai = 1 LEFT JOIN ctck_nhan_su_cao_cap t2 ON t1.CTCK_NHAN_SU_ID = t2.ID AND t2.TRANG_THAI = 1 AND t1.ctck_nhan_su_id IS NOT NULL GROUP BY t1.CTCK_THONG_TIN_ID, t1.CTCK_CHI_NHANH_ID, t1.CTCK_PHONG_GIAO_DICH_ID, t1.CTCK_VP_DAI_DIEN_ID, t5.DM_NGANH_NGHE_KD_ID having t5.DM_NGANH_NGHE_KD_ID is not null) GROUP BY CTCK_THONG_TIN_ID) tbl2 ON tbl1.CTCK_THONG_TIN_ID = tbl2.CTCK_THONG_TIN_ID  AND tbl1.CTCK_THONG_TIN_ID IN (SELECT CTCK_THONG_TIN_ID FROM CTCK_THONG_TIN WHERE TRANG_THAI IN (SELECT ID FROM DM_TRANG_THAI_CTCK WHERE TRANG_THAI = 1) AND IS_BANG_TAM = 0) ) tblAll GROUP BY CTCK_THONG_TIN_ID)
WHERE 1=1  OR (MIN_SUM_DV_HOI_SO IS NOT NULL AND MIN_SUM_DV_HOI_SO > 3.0) OR (MIN_SUM_DV_CHI_NHANH IS NOT NULL AND MIN_SUM_DV_CHI_NHANH > 2.0) OR (MIN_SUM_DV_PGD IS NOT NULL AND MIN_SUM_DV_PGD > 2.0);

-----

SELECT * FROM(SELECT CTCK_THONG_TIN_ID, 
CASE WHEN MIN(SUM_DV_HOI_SO) IS NULL THEN 0 ELSE MIN(SUM_DV_HOI_SO) END MIN_SUM_DV_HOI_SO, 
CASE WHEN MAX(SUM_DV_HOI_SO) IS NULL THEN 0 ELSE MAX(SUM_DV_HOI_SO) END MAX_SUM_DV_HOI_SO, 
CASE WHEN MIN(SUM_DV_CHI_NHANH) IS NOT NULL THEN MIN(SUM_DV_CHI_NHANH) WHEN MIN(SUM_DV_CHI_NHANH) IS NULL AND C_CHI_NHANH > 0 THEN 0 END MIN_SUM_DV_CHI_NHANH,
CASE WHEN MAX(SUM_DV_CHI_NHANH) IS NOT NULL THEN MAX(SUM_DV_CHI_NHANH) WHEN MAX(SUM_DV_CHI_NHANH) IS NULL AND C_CHI_NHANH > 0 THEN 0 END MAX_SUM_DV_CHI_NHANH, 
CASE WHEN MIN(SUM_DV_PGD) IS NOT NULL THEN MIN(SUM_DV_PGD) WHEN MIN(SUM_DV_PGD) IS NULL AND C_PHONG_GD > 0 THEN 0  END MIN_SUM_DV_PGD, 
CASE WHEN MAX(SUM_DV_PGD) IS NOT NULL THEN MAX(SUM_DV_PGD) WHEN MAX(SUM_DV_PGD) IS NULL AND C_PHONG_GD > 0 THEN 0  END MAX_SUM_DV_PGD, 
CASE WHEN MIN(SUM_DV_VPDD) IS NOT NULL THEN MIN(SUM_DV_VPDD) WHEN MIN(SUM_DV_VPDD) IS NULL AND C_VPDD > 0 THEN 0  END MIN_SUM_DV_VPDD,
CASE WHEN MAX(SUM_DV_VPDD) IS NOT NULL THEN MAX(SUM_DV_VPDD) WHEN MAX(SUM_DV_VPDD) IS NULL AND C_VPDD > 0 THEN 0  END MAX_SUM_DV_VPDD
FROM ( SELECT DISTINCT tbl1.CTCK_THONG_TIN_ID, tbl2.SUM_DV_HOI_SO, tbl2.SUM_DV_CHI_NHANH, tbl2.SUM_DV_PGD, tbl2.SUM_DV_VPDD
,(SELECT COUNT(ID) FROM CTCK_CHI_NHANH WHERE CTCK_THONG_TIN_ID = tbl1.CTCK_THONG_TIN_ID AND IS_BANG_TAM = 0) C_CHI_NHANH 
,(SELECT COUNT(ID) FROM CTCK_PHONG_GIAO_DICH WHERE CTCK_THONG_TIN_ID = tbl1.CTCK_THONG_TIN_ID AND IS_BANG_TAM = 0) C_PHONG_GD 
,(SELECT COUNT(ID) FROM CTCK_VP_DAI_DIEN WHERE CTCK_THONG_TIN_ID = tbl1.CTCK_THONG_TIN_ID AND IS_BANG_TAM = 0) C_VPDD 
FROM (SELECT CTCK_THONG_TIN_ID, TRANG_THAI,
trim(COLUMN_VALUE) NGANH_NGHE_KD_ID FROM (SELECT CTCK_THONG_TIN_ID, TRANG_THAI, NGANH_NGHE_KINH_DOANH NGANH_NGHE_KD_ID FROM CTCK_THONG_TIN
WHERE IS_BANG_TAM = 0), xmltable(('"' || REPLACE(NGANH_NGHE_KD_ID, ',', '","') || '"')) NGANH_NGHE_KD_ID) tbl1 LEFT JOIN ( SELECT CTCK_THONG_TIN_ID, 
SUM(CASE WHEN CTCK_CHI_NHANH_ID IS NULL AND CTCK_PHONG_GIAO_DICH_ID IS NULL AND CTCK_VP_DAI_DIEN_ID IS NULL THEN COUNT_NHN ELSE 0 END) SUM_DV_HOI_SO , 
SUM(CASE WHEN CTCK_CHI_NHANH_ID IS NOT NULL AND CTCK_PHONG_GIAO_DICH_ID IS NULL AND CTCK_VP_DAI_DIEN_ID IS NULL THEN COUNT_NHN END) SUM_DV_CHI_NHANH , 
SUM(CASE WHEN CTCK_CHI_NHANH_ID IS NULL AND CTCK_PHONG_GIAO_DICH_ID IS NOT NULL AND CTCK_VP_DAI_DIEN_ID IS NULL THEN COUNT_NHN END) SUM_DV_PGD , 
SUM(CASE WHEN CTCK_CHI_NHANH_ID IS NULL AND CTCK_PHONG_GIAO_DICH_ID IS NULL AND CTCK_VP_DAI_DIEN_ID IS NOT NULL THEN COUNT_NHN END) SUM_DV_VPDD
FROM ( select t1.CTCK_THONG_TIN_ID, t1.CTCK_CHI_NHANH_ID, t1.CTCK_PHONG_GIAO_DICH_ID, t1.CTCK_VP_DAI_DIEN_ID, t5.DM_NGANH_NGHE_KD_ID, COUNT(t5.nguoi_hanh_nghe_ck_id) COUNT_NHN from ctck_nguoi_hanh_nghe_ck t1 
LEFT JOIN (SELECT nguoi_hanh_nghe_ck_id,LISTAGG(dm_nganh_Nghe_id, ',') WITHIN GROUP (ORDER BY nguoi_hanh_nghe_ck_id) "DM_NGANH_NGHE_KD_ID" FROM LK_NHN_CK_NGANH_NGHE_KD GROUP BY nguoi_hanh_nghe_ck_id) t5 on t5.nguoi_hanh_nghe_ck_id = t1.id and t1.trang_thai = 1 
--LEFT JOIN ctck_nhan_su_cao_cap t2 ON t1.CTCK_NHAN_SU_ID = t2.ID AND t2.TRANG_THAI = 1 AND t1.ctck_nhan_su_id IS NOT NULL --xoa di nhe
GROUP BY t1.CTCK_THONG_TIN_ID, t1.CTCK_CHI_NHANH_ID, t1.CTCK_PHONG_GIAO_DICH_ID, t1.CTCK_VP_DAI_DIEN_ID, t5.DM_NGANH_NGHE_KD_ID having t5.DM_NGANH_NGHE_KD_ID is not null) GROUP BY CTCK_THONG_TIN_ID) tbl2 
ON tbl1.CTCK_THONG_TIN_ID = tbl2.CTCK_THONG_TIN_ID  AND tbl1.CTCK_THONG_TIN_ID IN (SELECT CTCK_THONG_TIN_ID FROM CTCK_THONG_TIN WHERE TRANG_THAI IN (SELECT ID FROM DM_TRANG_THAI_CTCK WHERE TRANG_THAI = 1) AND IS_BANG_TAM = 0) 
) tblAll GROUP BY CTCK_THONG_TIN_ID, C_CHI_NHANH, C_PHONG_GD, C_VPDD) ttt WHERE 1=1 AND   
(MIN_SUM_DV_HOI_SO IS NOT NULL AND MIN_SUM_DV_HOI_SO < 3.0) OR  (MIN_SUM_DV_CHI_NHANH IS NOT NULL AND MIN_SUM_DV_CHI_NHANH < 2.0) OR  (MIN_SUM_DV_PGD IS NOT NULL AND MIN_SUM_DV_PGD < 2.0);


-----
UPDATE CTCK_NGUOI_HANH_NGHE_CK SET Trang_THAI = 1 WHERE TRANG_THAI = 2; 
COMMIT;


SELECT * FROM CTCK_THONG_TIN WHERE TEN_TIENG_VIET LIKE '%K? Th??ng%';


select *from qlrr_chi_tieu;

select count(*) from QLRR_TONG_HOP;
select count(*) from QLRR_TONG_HOP where tong_diem = 0;


select *from qlrr_chi_tieu;
select *from qlrr_ky_bao_cao;
select *from QLRR_KY_BAO_CAO_CTCK;

select count(*) from QLRR_TONG_HOP where qlrr_ky_bao_cao_id = 305;
select count(*) from QLRR_TONG_HOP where qlrr_ky_bao_cao_id = 306;

select count(*) from QLRR_TONG_HOP where qlrr_ky_bao_cao_id = 305;

select count(*) from QLRR_TONG_HOP;

select count(*) from QLRR_TONG_HOP where qlrr_ky_bao_cao_id in (select id from qlrr_ky_bao_cao);

delete from QLRR_TONG_HOP where qlrr_ky_bao_cao_id not in (select id from qlrr_ky_bao_cao);
delete from QLRR_TONG_HOP_CHI_TIET where qlrr_ky_bao_cao_id not in (select id from qlrr_ky_bao_cao);
delete from QLRR_KY_BAO_CAO_CTCK where qlrr_ky_bao_cao_id not in (select id from qlrr_ky_bao_cao);
delete from QLRR_KBC_CTCK_CHI_TIET where qlrr_ky_bao_cao_id not in (select id from qlrr_ky_bao_cao);
delete from QLRR_KBC_CTCK_CHI_TIET where qlrr_ky_bao_cao_id not in (select id from qlrr_ky_bao_cao);
commit;

UPDATE BC_KHAI_THAC SET TRANG_THAI = 1;
COMMIT;


select *from cbtt_bao_cao where id = 18481;

select *from ctck_thong_tin where ctck_thong_tin_id = 1566;

select count(*) from QLRR_TONG_HOP where ctck_thong_tin_id in (select ctck_thong_tin_id from ctck_thong_tin where is_bang_tam = 0);
select * from ctck_thong_tin;


delete from QLRR_TONG_HOP where ctck_thong_tin_id = 1566;
commit;


---------------------------
SELECT * FROM (
SELECT ID, MA_NGUOI_DUNG, TAI_KHOAN, 'mat_khau', MAT_KHAU_DEFAULT, DM_CHUC_VU_ID, HO_TEN, EMAIL, DI_DONG, CHU_KY_SO, IS_THANH_VIEN, CTCK_ID, GHI_CHU, 
NGUOI_TAO_ID, NGAY_TAO, NGAY_HET_HAN, TRANG_THAI, TOKEN_USER, 'chucVuTen',
(SELECT rtrim( xmlcast( xmlagg( xmlelement(e, TEN_VIET_TAT || '-' || TEN_TIENG_VIET ,'<br />') ORDER BY id) AS clob), ',')  FROM CTCK_THONG_TIN 
WHERE (CTCK_THONG_TIN_ID IN (SELECT CTCK_ID FROM LK_NGUOI_DUNG_CTCK t2 WHERE t2.NGUOI_DUNG_ID = t1.ID AND t1.IS_THANH_VIEN = 0 ) OR (CTCK_THONG_TIN_ID = t1.CTCK_ID AND t1.IS_THANH_VIEN = 1)) 
AND IS_BANG_TAM = 0) TEN_CTCK,
ANH_DAI_DIEN
,(SELECT LISTAGG(TEN_NHOM_NGUOI_DUNG, '<br />') WITHIN GROUP (ORDER BY TEN_NHOM_NGUOI_DUNG) FROM QT_NHOM_NGUOI_DUNG 
WHERE ID IN (SELECT NHOM_NGUOI_DUNG_ID FROM LK_NGUOI_DUNG_NHOM WHERE NGUOI_DUNG_ID= t1.ID) AND TRANG_THAI = 1) NHOM_NGUOI_DUNG
, (',' || (SELECT LISTAGG(TRANG_THAI, ',') within group (order by TRANG_THAI) FROM CTCK_THONG_TIN 
WHERE (CTCK_THONG_TIN_ID IN (SELECT DISTINCT CTCK_ID FROM LK_NGUOI_DUNG_CTCK t2 WHERE t2.NGUOI_DUNG_ID = t1.ID) OR CTCK_THONG_TIN_ID = t1.CTCK_ID) 
AND IS_BANG_TAM = 0) || ',') TRANG_THAI_CTCK 
FROM QT_NGUOI_DUNG t1) where 1=1 order by NGAY_TAO asc;

select *from LK_NGUOI_DUNG_CTCK;

select *from QT_NGUOI_DUNG;

106577
select *from bc_thanh_vien where id = 105341;
select *from bc_thanh_vien where id = 106577;

 select tv.bm_bao_cao_id , bc.ten_bao_cao, tv.bm_bao_cao_dinh_ky_id , tv.gia_tri_ky_bc, ky.ky_bao_cao  
 from bc_thanh_vien tv 
 left join bm_bao_cao_dinh_ky ky on tv.bm_bao_cao_dinh_ky_id = ky.id  
 left join bm_bao_cao  bc on tv.bm_bao_cao_id = bc.id   where tv.id = 106577 order by tv.id desc;
bm_bao_cao = 2755
bm_bao_cao_dinh_ky_id = 2219

----------------------
 select tv.bm_bao_cao_id , bc.ten_bao_cao, bc.ma_bao_cao, tv.bm_bao_cao_dinh_ky_id , tv.gia_tri_ky_bc, ky.ky_bao_cao   
 from bc_thanh_vien tv  
 left join bm_bao_cao_dinh_ky ky on tv.bm_bao_cao_dinh_ky_id = ky.id  
 left join bm_bao_cao  bc on tv.bm_bao_cao_id = bc.id   where tv.id = 106577 order by tv.id desc;
 
 SELECT * FROM BC_THANH_VIEN WHERE ID = 106577;
 SELECT * FROM BM_BAO_CAO_DINH_KY WHERE ID = 2219;
SELECT * FROM BM_BAO_CAO_DINH_KY WHERE BM_BAO_CAO_ID= 2755;



SELECT * FROM BC_THANH_VIEN WHERE BM_BAO_CAO_ID  = 2755;


SELECT RPTID FROM rptlogs@smslink WHERE LOGSID = 159763;



 SELECT bm_bao_cao_id, dk.id
                FROM bm_bao_cao_dinh_ky dk
                WHERE bm_bao_cao_id IN (
                    SELECT bm_id
                    FROM bm_bao_cao_lich_su
                    WHERE su_dung = 1
                ) 
--                  AND BM_BAO_CAO_ID IN (SELECT BM_BAO_CAO_ID FROM BM_BAO_CAO_DINH_KY WHERE RPTID = r_logs.RPTID) 
                      AND dk.rptid = 'RPT231'
                      AND bm_bao_cao_id IN (
                    SELECT id
                    FROM bm_bao_cao
                    WHERE lower(ma_bao_cao) = lower('BCTLAT')
                )
                       AND ROWNUM = 1;





SELECT * FROM BM_BAO_CAO_DINH_KY WHERE RPTID = 'RPT231';


SELECT GIA_TRI_KY_BC, ky_bao_cao, (SELECT ID FROM BM_BAO_CAO_DINH_KY WHERE BM_BAO_CAO_ID = t1.BM_BAO_CAO_ID AND RPTID = (SELECT RPTID FROM rptlogs@smslink WHERE LOGSID = t1.LOGSID)) KY_BAO_CAO FROM BC_THANH_VIEN t1 where id = 106577;

COMMIT;


  SELECT
 DISTINCT t1.id,
	t3.TEN_CONG_TY,
	TO_CHAR(t1.NGAY_TAO, 'dd/mm/yyyy hh24:MI:ss'),
CASE
		WHEN t2.TEN_SU_VU IS NOT NULL THEN t2.TEN_SU_VU
		ELSE n'Th?m m?i'
	END AS TEN_SU_VU,
CASE
		WHEN t1.BANG_LIEN_KET = n'CTCK_THONG_TIN' THEN 'H? s? c?ng ty ch?ng kho?n'
		WHEN t1.BANG_LIEN_KET = n'CTCK_DICH_VU' THEN 'D?ch v?'
		WHEN t1.BANG_LIEN_KET = n'CTCK_CHI_NHANH' THEN 'H? s? chi nh?nh'
		WHEN t1.BANG_LIEN_KET = n'CTCK_NHAN_SU_CAO_CAP' THEN 'H? s? nh?n s? cao c?p'
		WHEN t1.BANG_LIEN_KET = n'CTCK_VP_DAI_DIEN' THEN 'V?n ph?ng ??i di?n'
		WHEN t1.BANG_LIEN_KET = n'CTCK_PHONG_GIAO_DICH' THEN 'Ph?ng giao d?ch'
		
	END AS TEN_CHUC_NANG,
	t4.HO_TEN
FROM
CTCK_HS_LICH_SU t1
LEFT JOIN DM_SU_VU t2 ON
t1.DM_SU_VU_ID = t2.ID
LEFT JOIN (
SELECT
	CTCK_THONG_TIN_ID,(TEN_VIET_TAT || '-' || TEN_TIENG_VIET) AS TEN_CONG_TY, ID
FROM
	CTCK_THONG_TIN wHERE is_BANG_TAM = 0) t3 ON
t1.CTCK_THONG_TIN_ID = t3.CTCK_THONG_TIN_ID
LEFT JOIN QT_NGUOI_DUNG t4 ON
t1.NGUOI_TAO_ID = t4.ID
WHERE
t1.TRANG_THAI = 0
AND t1.ctck_thong_tin_id IN (
SELECT
	DISTINCT t1.CTCK_ID
FROM
	LK_NGUOI_DUNG_CTCK t1
LEFT JOIN CTCK_THONG_TIN t2 ON
	t1.ctck_id = t2.CTCK_THONG_TIN_ID
	AND t1.CTCK_ID = t2.CTCK_THONG_TIN_ID
	AND t2.IS_BANG_TAM = 0
	AND t2.TRANG_THAI IN (
	SELECT
		id
	FROM
		DM_TRANG_THAI_CTCK
	WHERE
		UPPER(TEN_TRANG_THAI_CTCK) = UPPER('Ho?t ??ng')
		AND TRANG_THAI = 1 )
LEFT JOIN QT_NGUOI_DUNG t3 ON
	t3.id = t1.NGUOI_DUNG_ID
	AND t3.IS_THANH_VIEN = 0
WHERE
	t1.NGUOI_DUNG_ID = 2591);
    
    
---------------------------

 SELECT
     t1.ID,
	t3.TEN_CONG_TY,
	t2.TEN_BAO_CAO,
CASE
		t4.KY_BAO_CAO WHEN n'NAM' THEN 'N?m'
		WHEN n'BN' THEN 'B?n ni?n'
		WHEN n'Q' THEN 'Qu?'
		WHEN n'TH' THEN 'Th?ng'
		WHEN n'TU' THEN 'Tu?n'
		WHEN n'N' THEN 'Ng?y'
	END AS KY_BAO_CAO,
	t1.GIA_TRI_KY_BC,
	TO_CHAR(t1.THOI_HAN_GUI, 'yyyy') AS NAM_THOI_HAN,
	TO_CHAR(t1.THOI_HAN_GUI, 'dd/mm/yyyy hh24:MI:ss') AS THOI_HAN_GUI_BAO_CAO,
    ROW_NUMBER () OVER (PARTITION BY t1.CTCK_THONG_TIN_ID  order by t1.ctck_thong_tin_id desc) seq_no 
FROM
	BC_THANH_VIEN t1
JOIN (SELECT ID, TEN_BAO_CAO FROM BM_BAO_CAO ) t2 ON t1.BM_BAO_CAO_ID = t2.ID
JOIN (SELECT ID, KY_BAO_CAO FROM BM_BAO_CAO_DINH_KY ) t4 ON t1.BM_BAO_CAO_DINH_KY_ID = t4.id
JOIN (SELECT CTCK_THONG_TIN_ID,(TEN_VIET_TAT || '-' || TEN_TIENG_VIET) AS TEN_CONG_TY, ID FROM CTCK_THONG_TIN ) t3 ON t1.CTCK_THONG_TIN_ID = t3.CTCK_THONG_TIN_ID
WHERE
	TRANG_THAI = 1
	AND t1.THOI_HAN_GUI < SYSDATE
	AND t1.ctck_thong_tin_id IN (
	SELECT
		DISTINCT t1.CTCK_ID
	FROM
		LK_NGUOI_DUNG_CTCK t1
	LEFT JOIN CTCK_THONG_TIN t2 ON
		t1.ctck_id = t2.CTCK_THONG_TIN_ID
		AND t1.CTCK_ID = t2.CTCK_THONG_TIN_ID
		AND t2.IS_BANG_TAM = 0
		AND t2.TRANG_THAI IN (SELECT id FROM DM_TRANG_THAI_CTCK WHERE UPPER(TEN_TRANG_THAI_CTCK) = UPPER('Ho?t ??ng') AND TRANG_THAI = 1 )
	LEFT JOIN QT_NGUOI_DUNG t3 ON
		t3.id = t1.NGUOI_DUNG_ID
		AND t3.IS_THANH_VIEN = 0
	WHERE
		t1.NGUOI_DUNG_ID = 2591) ORDER BY t1.ctck_thong_tin_id;
        
        
--------------------

 SELECT
	 t1.ID,
	(t2.TEN_VIET_TAT || '-' || t2.TEN_TIENG_VIET) AS TEN_CONG_TY,
	t1.DIEU_KIEN,
	t1.GIA_TRI_THUC_TE ,
	t1.NAM_CANH_BAO,
	CASE
		t1.KY_BAO_CAO 
		WHEN 'NAM' THEN 'N?m'
		WHEN 'BN' THEN 'B?n ni?n'
		WHEN 'Q' THEN 'Qu?'
		WHEN 'TH' THEN 'Th?ng'
		WHEN 'TU' THEN 'Tu?n'
		WHEN 'N' THEN 'Ng?y'
	END AS KY_BAO_CAO,
	t1.GIA_TRI_KY_BC,
	TO_CHAR(t1.NGAY_TAO, 'dd/mm/yyyy hh24:MI:ss'),
	t1.CAP_DO, t3.ten_canh_bao,
    ROW_NUMBER () OVER (PARTITION BY t1.CTCK_THONG_TIN_ID  order by t1.ctck_thong_tin_id desc) seq_no 
FROM
	CB_CTCK_VI_PHAM t1
JOIN CTCK_THONG_TIN t2 ON
	t1.CTCK_THONG_TIN_ID = t2.CTCK_THONG_TIN_ID
JOIN CB_CHI_TIEU t3 ON
	t1.CB_CHI_TIEU_ID = t3.ID
WHERE
	t1.CTCK_THONG_TIN_ID IN (
	SELECT
		DISTINCT t1.CTCK_ID
	FROM
		LK_NGUOI_DUNG_CTCK t1
	LEFT JOIN CTCK_THONG_TIN t2 ON
		t1.ctck_id = t2.CTCK_THONG_TIN_ID
		AND t1.CTCK_ID = t2.CTCK_THONG_TIN_ID
		AND t2.IS_BANG_TAM = 0
		AND t2.TRANG_THAI IN (
		SELECT
			id
		FROM
			DM_TRANG_THAI_CTCK
		WHERE
			UPPER(TEN_TRANG_THAI_CTCK) = UPPER('Ho?t ??ng')
			AND TRANG_THAI = 1 )
	LEFT JOIN QT_NGUOI_DUNG t3 ON
		t3.id = t1.NGUOI_DUNG_ID
		AND t3.IS_THANH_VIEN = 0
	WHERE
		t1.NGUOI_DUNG_ID = 2591);
-----

  SELECT
  t1.id,
	t3.TEN_CONG_TY,
	TO_CHAR(t1.NGAY_TAO, 'dd/mm/yyyy hh24:MI:ss'), 
CASE
		WHEN t2.TEN_SU_VU IS NOT NULL THEN t2.TEN_SU_VU
		ELSE n'Th?m m?i'
	END AS TEN_SU_VU,
CASE
		WHEN t1.BANG_LIEN_KET = n'CTCK_THONG_TIN' THEN 'H? s? c?ng ty ch?ng kho?n'
		WHEN t1.BANG_LIEN_KET = n'CTCK_DICH_VU' THEN 'D?ch v?'
		WHEN t1.BANG_LIEN_KET = n'CTCK_CHI_NHANH' THEN 'H? s? chi nh?nh'
		WHEN t1.BANG_LIEN_KET = n'CTCK_NHAN_SU_CAO_CAP' THEN 'H? s? nh?n s? cao c?p'
		WHEN t1.BANG_LIEN_KET = n'CTCK_VP_DAI_DIEN' THEN 'V?n ph?ng ??i di?n'
		WHEN t1.BANG_LIEN_KET = n'CTCK_PHONG_GIAO_DICH' THEN 'Ph?ng giao d?ch'
		
	END AS TEN_CHUC_NANG,
	t4.HO_TEN,
    ROW_NUMBER () OVER (PARTITION BY t1.CTCK_THONG_TIN_ID  order by t1.ctck_thong_tin_id desc) seq_no
FROM
CTCK_HS_LICH_SU t1
LEFT JOIN DM_SU_VU t2 ON
t1.DM_SU_VU_ID = t2.ID
LEFT JOIN (
SELECT
	CTCK_THONG_TIN_ID,(TEN_VIET_TAT || '-' || TEN_TIENG_VIET) AS TEN_CONG_TY, ID
FROM
	CTCK_THONG_TIN wHERE is_BANG_TAM = 0) t3 ON
t1.CTCK_THONG_TIN_ID = t3.CTCK_THONG_TIN_ID
LEFT JOIN QT_NGUOI_DUNG t4 ON
t1.NGUOI_TAO_ID = t4.ID
WHERE
t1.TRANG_THAI = 0
AND t1.ctck_thong_tin_id IN (
SELECT
	DISTINCT t1.CTCK_ID
FROM
	LK_NGUOI_DUNG_CTCK t1
LEFT JOIN CTCK_THONG_TIN t2 ON
	t1.ctck_id = t2.CTCK_THONG_TIN_ID
	AND t1.CTCK_ID = t2.CTCK_THONG_TIN_ID
	AND t2.IS_BANG_TAM = 0
	AND t2.TRANG_THAI IN (
	SELECT
		id
	FROM
		DM_TRANG_THAI_CTCK
	WHERE
		UPPER(TEN_TRANG_THAI_CTCK) = UPPER('Ho?t ??ng')
		AND TRANG_THAI = 1 )
LEFT JOIN QT_NGUOI_DUNG t3 ON
	t3.id = t1.NGUOI_DUNG_ID
	AND t3.IS_THANH_VIEN = 0
WHERE
	t1.NGUOI_DUNG_ID = 2591);
    
    ---
    
    select *from CTCK_HS_LICH_SU;
    
    ----------------
    
 SELECT
 	t1.id,
	(t2.TEN_VIET_TAT || '-' || t2.TEN_TIENG_VIET) AS TEN_CONG_TY,
	t1.TIEU_DE,
CASE
		WHEN t1.LOAI_CONG_BO = '1' THEN n'C?ng b? th?ng tin ??nh k?'
		WHEN t1.LOAI_CONG_BO = '2' THEN n'C?ng b? th?ng tin b?t th??ng'
		WHEN t1.LOAI_CONG_BO = '3' THEN n'C?ng b? th?ng tin,theo y?u c?u'
		WHEN t1.LOAI_CONG_BO = '4' THEN n'C?ng b? th?ng tin kh?c'
	END AS LOAI_CONG_BO,
	t1.NGUOI_CBTT,
	TO_CHAR(t1.NGAY_GUI, 'dd/mm/yyyy'),
    ROW_NUMBER () OVER (PARTITION BY t1.CTCK_THONG_TIN_ID  order by t1.ctck_thong_tin_id desc) seq_no
FROM
	CBTT_BAO_CAO t1
JOIN CTCK_THONG_TIN t2 ON
	t1.CTCK_THONG_TIN_ID = t2.CTCK_THONG_TIN_ID
WHERE
	TO_TIMESTAMP(TO_CHAR(t1.NGAY_GUI, 'dd/mm/yyyy'),'dd/mm/yyyy') = TO_TIMESTAMP(TO_CHAR(SYSDATE, 'dd/mm/yyyy'),'dd/mm/yyyy')
	AND t1.ctck_thong_tin_id IN (
	SELECT
		CTCK_ID
	FROM
		LK_NGUOI_DUNG_CTCK
	WHERE
		NGUOI_DUNG_ID = 2591);
        
        select *from CBTT_BAO_CAO;