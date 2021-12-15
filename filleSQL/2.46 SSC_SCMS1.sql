SELECT DISTINCT
    t1.id,CASE
        WHEN t1.LOAI_BC_GUI = 'BT' THEN t1.TEN_BAO_CAO
        WHEN t2.TEN_BAO_CAO IS NULL THEN t1.TEN_BAO_CAO
        ELSE t2.TEN_BAO_CAO
    END TEN_BAO_CAO,t4.TEN_CONG_TY,CASE
        WHEN t1.KY_BAO_CAO = 'BN' THEN TO_CHAR(t1.NAM_CANH_BAO)
        ELSE TO_CHAR(t1.GIA_TRI_KY_BC)
    END GIA_TRI_KY_BC,CASE
        WHEN t3.KY_BAO_CAO IS NULL THEN '2020'
        ELSE t1.NAM_CANH_BAO
    END AS NAM_THOI_HAN,CASE t1.HUY_BAO_CAO
        WHEN 1   THEN 'B? h?y'
        WHEN 2   THEN 'Yêu c?u h?y'
        WHEN 0   THEN CASE t1.TRANG_THAI
            WHEN 1   THEN 'Ch?a g?i'
            WHEN 2   THEN '?ã g?i'
            WHEN 3   THEN 'G?i mu?n'
            WHEN 5   THEN 'Yêu c?u g?i l?i'
        END
                    || CASE t1.KHOA_BAO_CAO
            WHEN 1   THEN ' (Khóa)'
        END
    END AS TRANG_THAIv,CASE
        WHEN t1.KY_BAO_CAO IS NULL THEN t1.LOAI_BC_GUI
        ELSE TO_CHAR(t1.KY_BAO_CAO)
    END KyBC,TO_CHAR(t1.THOI_HAN_GIA_HAN,'dd/mm/yyyy') AS THOI_HAN_GIA_HAN,TO_CHAR(t1.NGAY_GUI,'dd/mm/yyyy HH24:MI') AS NGAY_GUI,
    TO_CHAR(t1.THOI_HAN_GUI,'dd/mm/yyyy HH24:MI') AS THOI_HAN_GUI,t4.id   AS idCongTy,t2.id   AS idBaoCao,t1.TRANG_THAI,t1.KHOA_BAO_CAO
   ,t1.HUY_BAO_CAO,t2.CAN_CBTT,t1.IS_VALID_GUI_BC,t2.CAN_IMPORT,t2.NHOM_BAO_CAO,t1.BM_BAO_CAO_ID,CASE
        WHEN t1.KY_BAO_CAO = 'N' THEN TO_CHAR(TO_DATE(t1.GIA_TRI_KY_BC,'dd/MM/yyyy'),'yyyyMMdd')
        ELSE TO_CHAR(t1.GIA_TRI_KY_BC)
    END SORTGT
FROM
    BC_THANH_VIEN t1
    LEFT JOIN BM_BAO_CAO t2 ON t2.id = t1.BM_BAO_CAO_ID
    LEFT JOIN (
        SELECT
            bbcdk.ID,bbcdk.KY_BAO_CAO
        FROM
            BM_BAO_CAO_DINH_KY bbcdk
    ) t3 ON t3.id = t1.BM_BAO_CAO_DINH_KY_ID
    RIGHT JOIN (
        SELECT
            ctt.ID, ( ctt.TEN_VIET_TAT
                      || '-'
                      || ctt.TEN_TIENG_VIET ) AS TEN_CONG_TY,ctt.CTCK_THONG_TIN_ID
        FROM
            CTCK_THONG_TIN ctt
        WHERE
            ctt.IS_BANG_TAM = 0
            AND ctt.CTCK_THONG_TIN_ID IN (
                918,1098,892,878,947,963,889,964,944,948,862,965,966,853,949,894,895,1097,903,880,920,921,854,846,922,937,1105,941
               ,872,931,1113,905,881,935,962,901,934,899,1088,874,917,867,1111,914,891,896,887,845,849,902,1122,869,879,856,938,
                875,933,915,886,913,932,1090,946,926,929,900,873,942,868,939,924,890,863,911,893,871,907,870,928,910,912,930,925,
                860,961,940,842,1112,1089,923,865,945,888,884,864,866,909,1109,1096,2126,1091,908,2111,843,957,936,882
            )
    ) t4 ON t4.CTCK_THONG_TIN_ID = t1.CTCK_THONG_TIN_ID
WHERE
    1 = 1
    AND ( t1.XOA_DU_LIEU IS NULL
          OR t1.XOA_DU_LIEU != 1 )
ORDER BY
    t1.BM_BAO_CAO_ID,KyBC,GIA_TRI_KY_BC DESC;

SELECT
    *
FROM
    BC_THANH_VIEN
WHERE
    loai_bc_gui = 'BT';

SELECT
    tv.id,tv.ngay_gui,tv.trang_thai,tv.bm_bao_cao_dinh_ky_id,tv.ctck_thong_tin_id,tt.ten_tieng_viet,tv.ten_bao_cao,tv.ky_bao_cao    AS
    KBC_1,tv.loai_bc_gui,tv.file_dinh_kem,bck.ky_bao_cao   AS KBC_2,tv.gia_tri_ky_bc,tv.huy_bao_cao,tv.khoa_bao_cao,tv.file_bao_cao,
    tv.IS_VALID_GUI_BC,tv.FILENAME,tv.nam_canh_bao,tv.thoi_han_gui
FROM
    bc_thanh_vien tv
    LEFT JOIN ctck_thong_tin tt ON tv.ctck_thong_tin_id = tt.ctck_thong_tin_id
                                   AND tt.IS_BANG_TAM = 0
    LEFT JOIN bm_bao_cao_dinh_ky bck ON tv.bm_bao_cao_dinh_ky_id = bck.id
WHERE
    tv.id = 214373
    AND tv.bm_bao_cao_id = 2687
ORDER BY
    tv.id DESC  


     
