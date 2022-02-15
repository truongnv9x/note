Select u.id, u.ctck_Thong_Tin_Id, u.ctck_Cd_Chuyen, u.so_Van_Ban, u.ngay_Van_Ban, u.ngay_Chuyen, u.so_Luong_Chuyen, u.ty_Le_Chuyen, 
t.ten_Tieng_Viet, c.ten_Co_Dong, n.ten_Co_Dong, t.ten_Viet_Tat,
ROW_NUMBER() OVER (PARTITION BY u.ctck_Thong_Tin_Id ORDER BY u.ctck_Thong_Tin_Id desc) seq_no
From CTCK_CD_CHUYEN_NHUONG u 
LEFT JOIN CTCK_THONG_TIN t on u.ctck_Thong_Tin_Id = t.ctck_Thong_Tin_Id 
LEFT JOIN CTCK_CO_DONG c on u.ctck_Cd_Chuyen =c.id 
LEFT JOIN CTCK_CO_DONG n on u.ctck_Cd_Nhan =n.id  
where 1=1 and t.is_bang_tam = 0;


DELETE FROM THONG_BAO
WHERE rowid not in
(SELECT MIN(rowid)
FROM THONG_BAO
GROUP BY TIEU_DE,
    NOI_DUNG,
    LINK_HREF,
    LIST_NGUOI_NHAN);

commit;

select count(*) From THONG_BAO;

select *from BC_KHAI_THAC where id = 2839;
select *from BC_KHAI_THAC where bm_bao_cao_id = 3385 order by id desc;
select *from BC_KHAI_THAC_GT WHERE BCKT_ID = 2850 AND BM_BAO_CAO_ID = 3385 ORDER BY ID DESC;

select *from BC_KHAI_THAC_GT;

select *from BC_BAO_CAO_GT;

select *from bm_bao_cao where id in (2813,2754,2755); 
261310

select *from bm_sheet_ct where bm_sheet_ct_vao_id = 261310;

select *from QLRR_TONG_HOP;

select *from qlrr_thang_diem;

select *from qlrr_thang_diem where QLRR_CHI_TIEU_ID = 244;
select *from qlrr_thang_diem where QLRR_CHI_TIEU_ID = 248;
select *from qlrr_thang_diem where QLRR_CHI_TIEU_ID = 270;


select *from qlrr_chi_tieu where id = 270;

select *from qlrr_chi_tieu where ma_chi_tieu like 'C1';

select *from qlrr_tong_hop where id = 335;

select *from qlrr_tong_hop  where qlrr_ky_bao_cao_id = 329;
delete from qlrr_tong_hop where qlrr_ky_bao_cao_id = 329;
commit;

SELECT * FROM qlrr_kbc_ctck_chi_tiet where qlrr_ky_bao_cao_id = 336;

select * from qlrr_kbc_ctck_chi_tiet where QLRR_KY_BAO_CAO_ID not in (select id from qlrr_ky_bao_cao);

delete from qlrr_kbc_ctck_chi_tiet where QLRR_KY_BAO_CAO_ID not in (select id from qlrr_ky_bao_cao);
commit;


select *from qlrr_ky_bao_cao;
select count(*) from QLRR_KY_BAO_CAO_CTCK where qlrr_ky_bao_cao_id = 336;
SELECT count(*) FROM qlrr_kbc_ctck_chi_tiet where qlrr_ky_bao_cao_id = 336;




delete from qlrr_ky_bao_cao  where id = 335;
commit;

select * from qlrr_tong_hop_chi_tiet;
select * from qlrr_tong_hop;
select count(*) from qlrr_tong_hop_chi_tiet where qlrr_tong_hop_id not in (select id from qlrr_tong_hop);

delete from qlrr_tong_hop_chi_tiet where qlrr_tong_hop_id not in (select id from qlrr_tong_hop);
commit;

select * from qlrr_tong_hop where QLRR_KY_BAO_CAO_ID not in (select id from qlrr_ky_bao_cao);
delete from qlrr_tong_hop where QLRR_KY_BAO_CAO_ID not in (select id from qlrr_ky_bao_cao);

----

Select count(*) From QLRR_TONG_HOP u 
where 1=1  
and u.ctck_Thong_Tin_Id in (843,1122,871,962,1098,842,935,949,925,867,961,869,932,873,942,1109,947,930,920,845,854,874,878,1091,922,895,964,937,875,1097,945,914,921,894,880,849,901,881,889,940,879,1096,966,1089,931,1088,939,915,957,1113,868,1105,963,1112,917,909,913,948,928,929,944,896,866,946,923,910,1090,933,886,936,1111,908,912,887,882,918,870,856,965,899,938,864,891,872,893,911,941,892,862,924,926,853,905,865,884,888,863,902,890,907,934,903,900,860,846)
and u.ctck_Thong_Tin_Id in (select ctck_thong_tin_id from ctck_thong_tin where is_bang_tam = 0)
order by u.id desc;


select *from ctck_nhan_su_cao_cap order by id desc;

select *from ctck_chi_nhanh where ctck_chi_nhanh_id = 942;

select *from ctck_chi_nhanh where ctck_chi_nhanh_id = 942;

select *from ctck_chi_nhanh where ctck_thong_tin_id = 1105;


------

select *from BC_THANH_VIEN where loai_bc_gui is not null;

------------------------------------
SELECT GIA_TRI_KY_BC FROM BC_THANH_VIEN WHERE KY_BAO_CAO = 'TH';

SELECT  
    CASE TO_CHAR(t1.KY_BAO_CAO) WHEN 'NAM' THEN 6 WHEN 'BN' THEN 5 WHEN 'Q' THEN 4 WHEN 'TH' THEN 3 WHEN 'TU' THEN 2 WHEN 'N' THEN 1 ELSE 0 END AS STT_KY,
    ROW_NUMBER () OVER (PARTITION BY t1.CTCK_THONG_TIN_ID, t1.nam_canh_bao, CASE TO_CHAR(t1.KY_BAO_CAO) WHEN 'NAM' THEN 6 WHEN 'BN' THEN 5 WHEN 'Q' THEN 4 WHEN 'TH' THEN 3 WHEN 'TU' THEN 2 WHEN 'N' THEN 1 ELSE 0 END
    order by CASE TO_CHAR(t1.KY_BAO_CAO) WHEN 'NAM' THEN 6 WHEN 'BN' THEN 5 WHEN 'Q' THEN 4 WHEN 'TH' THEN 3 WHEN 'TU' THEN 2 WHEN 'N' THEN 1 ELSE 0 END DESC
    ,CASE WHEN t1.KY_BAO_CAO = 'N' THEN TO_CHAR(TO_DATE(t1.GIA_TRI_KY_BC, 'dd/MM/yyyy'),'yyyyMMdd') WHEN t1.KY_BAO_CAO = 'TH' THEN TO_CHAR(TO_DATE(TO_CHAR('01/'|| t1.GIA_TRI_KY_BC || '/' || t1.nam_canh_bao), 'dd/MM/yyyy'),'yyyyMMdd')  ELSE TO_CHAR(t1.GIA_TRI_KY_BC) END DESC) seq_no,
    t1.id, 
    CASE WHEN t1.LOAI_BC_GUI = 'BT' THEN t1.TEN_BAO_CAO  WHEN t2.TEN_BAO_CAO IS NULL THEN t1.TEN_BAO_CAO ELSE t2.TEN_BAO_CAO
    END TEN_BAO_CAO, t4.TEN_CONG_TY,
    CASE WHEN t1.KY_BAO_CAO = 'BN' THEN TO_CHAR(t1.NAM_CANH_BAO) ELSE TO_CHAR(t1.GIA_TRI_KY_BC) END GIA_TRI_KY_BC, 
    NAM_CANH_BAO AS NAM_THOI_HAN,
    CASE t1.HUY_BAO_CAO WHEN 1 THEN 'B? h?y' WHEN 2 THEN 'Yêu c?u h?y' ELSE CASE t1.TRANG_THAI 	WHEN 1 THEN 'Ch?a g?i' 	WHEN 2 THEN '?ã g?i' 	
    WHEN 3 THEN 'G?i mu?n' 	WHEN 5 THEN 'Yêu c?u g?i l?i'  END || CASE t1.KHOA_BAO_CAO WHEN 1 THEN ' (Khóa)' END END AS TRANG_THAIv,
    CASE WHEN t1.KY_BAO_CAO IS NULL THEN TO_CHAR(t1.LOAI_BC_GUI) ELSE TO_CHAR(t1.KY_BAO_CAO) END KyBC,  
    TO_CHAR(t1.THOI_HAN_GIA_HAN,'dd/mm/yyyy') as THOI_HAN_GIA_HAN,TO_CHAR(t1.NGAY_GUI,'dd/mm/yyyy HH24:MI') as NGAY_GUI,  TO_CHAR(t1.THOI_HAN_GUI,'dd/mm/yyyy HH24:MI') AS THOI_HAN_GUI
    , t4.id AS idCongTy  ,  t2.id as idBaoCao ,t1.TRANG_THAI, t1.KHOA_BAO_CAO, t1.HUY_BAO_CAO, t2.CAN_CBTT, t1.IS_VALID_GUI_BC, t2.CAN_IMPORT, t2.NHOM_BAO_CAO, t1.BM_BAO_CAO_ID, 
    CASE WHEN t1.KY_BAO_CAO = 'N' THEN TO_CHAR(TO_DATE(t1.GIA_TRI_KY_BC, 'dd/MM/yyyy'),'yyyyMMdd') WHEN t1.KY_BAO_CAO = 'TH' THEN TO_CHAR(TO_DATE(TO_CHAR('01/'|| t1.GIA_TRI_KY_BC || '/' || t1.nam_canh_bao), 'dd/MM/yyyy'),'yyyyMMdd')  ELSE TO_CHAR(t1.GIA_TRI_KY_BC) END SORTGT
    , t1.ctck_thong_tin_id 
    , t1.nam_canh_bao
FROM BC_THANH_VIEN t1    
    LEFT JOIN BM_BAO_CAO t2  ON t2.id = t1.BM_BAO_CAO_ID 
    LEFT JOIN ( SELECT bbcdk.ID,bbcdk.KY_BAO_CAO   FROM BM_BAO_CAO_DINH_KY bbcdk ) t3  ON t3.id = t1.BM_BAO_CAO_DINH_KY_ID  
    RIGHT JOIN ( SELECT ctt.ID,(ctt.TEN_VIET_TAT||'-'||ctt.TEN_TIENG_VIET) AS TEN_CONG_TY,ctt.CTCK_THONG_TIN_ID 
    FROM CTCK_THONG_TIN ctt WHERE ctt.IS_BANG_TAM =0 
    AND ctt.CTCK_THONG_TIN_ID in (918,1098,892,878,947,963,889,944,948,964,862,965,966,949,894,895,1097,903,880,920,921,908,854,853,846,922,937,1105,941,
    872,931,1113,905,881,935,962,901,934,899,1088,874,917,932,1090,867,1111,914,891,896,887,845,849,902,1122,869,856,938,879,875,933,915,886,913,957,946,926
    ,929,900,873,942,939,868,882,936,924,890,863,911,893,871,907,870,928,910,912,930,925,860,843,961,940,842,1112,1089,923,865,945,888,884,864,866,909,1109,1096,1091)) t4 
    ON t4.CTCK_THONG_TIN_ID = t1.CTCK_THONG_TIN_ID  
WHERE 1=1
    And t1.ctck_thong_tin_id is not null 
--     and TO_CHAR(t1.KY_BAO_CAO) IS NULL 
    AND (t1.XOA_DU_LIEU IS NULL OR t1.XOA_DU_LIEU != 1)
Order by t1.ctck_thong_tin_id, t1.nam_canh_bao desc, STT_KY DESC;
     
     
