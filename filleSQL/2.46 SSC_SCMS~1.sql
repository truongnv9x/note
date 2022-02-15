SELECT
    e.*
FROM
    (
        SELECT
            u.id,u.ctck_Thong_Tin_Id,u.ctck_Nhan_Su_Id,u.dm_Nganh_Nghe_Kd_Id,u.SO_CHUNG_CHI_HNCK,u.ngay_Cap_CCHN,u.IS_SYNC,u.THOI_GIAN_SYNC
           ,u.ghi_Chu,u.nguoi_Tao_Id,u.ngay_Tao,u.trang_Thai    AS TRANGTHAINHN,ctck.ten_tieng_viet,CASE
                WHEN ns.ho_Ten IS NULL THEN TO_NCHAR(u.hoTen)
                ELSE ns.ho_Ten
            END AS HOTEN,CASE
                WHEN ns.so_Cmnd IS NULL THEN TO_NCHAR(u.soCMT)
                ELSE ns.so_Cmnd
            END AS SOCMND,CASE
                WHEN ns.ngay_bat_dau_lam_viec IS NULL THEN u.NGAYBATDAU
                ELSE ns.ngay_bat_dau_lam_viec
            END AS ngayBatDau,CASE
                WHEN ns.ngay_thoi_viec IS NULL THEN u.NGAYKETTHUC
                ELSE ns.ngay_thoi_viec
            END AS ngayKetThuc,nnkd.ten_Nganh_Nghe_Kd,ns.chuc_Vu_Id,ns.TRANG_THAI   AS TRANGTHAINHANSU,ctck.ten_Viet_Tat,u.SOGIAYPHEP
           ,CASE
                WHEN ns.ngay_sinh IS NULL THEN u.ngaySinh
                ELSE ns.ngay_sinh
            END AS NGAYSINH,
            u.CTCK_DICH_VU_ID,
            u.chucVu        AS ChucVuNHN,
            ROW_NUMBER() OVER( PARTITION BY u.SO_CHUNG_CHI_HNCK ORDER BY u.SO_CHUNG_CHI_HNCK) AS rownumber,CASE
                WHEN ns.ngay_cap IS NULL THEN u.ngayCapCMT
                ELSE ns.ngay_cap
            END AS ngayCapCMT,CASE
                WHEN ns.noi_cap IS NULL THEN TO_NCHAR(u.noiCapCMT)
                ELSE ns.noi_cap
            END AS NoiCapCMT,u.GIOITINH,u.QUOCTICH,u.DIACHITHUONGTRU,u.HOKHAUTHUONGTRU,u.NOISINH,u.DIENTHOAI,u.DIDONG,u.EMAIL,u.TENTIENGANH
           ,u.PHONGBAN,u.CONTENT
        FROM
            ctck_nguoi_hanh_nghe_ck u
            LEFT JOIN ctck_thong_tin ctck ON u.ctck_thong_tin_id = ctck.ctck_thong_tin_id
                                             AND ctck.is_bang_tam = 0
            LEFT JOIN ctck_nhan_su_cao_cap ns ON u.ctck_nhan_su_id = ns.id
            LEFT JOIN dm_nganh_nghe_kd nnkd ON u.dm_nganh_nghe_kd_id = nnkd.id
            LEFT JOIN dm_dich_vu dv ON u.ctck_Dich_vu_id = dv.id
        WHERE
            1 = 1
            AND ( ns.trang_Thai_Xoa IS NULL
                  OR ns.trang_Thai_Xoa = 0 )
            AND ( ( LOWER(u.ghi_Chu) LIKE '%chi mai%' )
                  OR ( LOWER(ns.ho_Ten) LIKE '%chi mai%' )
                  OR ( LOWER(u.hoTen) LIKE '%chi mai%' )
                  OR ( LOWER(ns.so_Cmnd) LIKE '%chi mai%' )
                  OR ( LOWER(u.soCMT) LIKE '%chi mai%' )
                  OR ( LOWER(u.SO_CHUNG_CHI_HNCK) LIKE '%chi mai%' )
                  OR ( LOWER(ctck.ten_Tieng_Viet) LIKE '%chi mai%' ) )
            AND u.ctck_Thong_Tin_Id IN (
                1574,843,1122,871,962,1098,842,935,949,925,867,961,869,932,873,942,1109,947,930,920,845,854,874,878,1091,922,895,
                964,937,875,1097,945,914,921,894,880,849,901,881,889,940,879,1096,966,1089,931,1088,939,915,957,1113,868,1105,963
               ,1112,917,909,913,948,928,929,944,896,866,946,923,910,1090,933,886,936,1111,908,912,887,882,918,870,856,1566,965,
                899,938,864,891,872,893,911,941,892,862,924,926,853,905,865,884,888,863,902,890,907,934,903,900,860,846
            )
        ORDER BY
            ctck.ten_Viet_Tat DESC
    ) e
WHERE
    1 = 1;
    
    
    


select *from QT_CHUC_NANG_CHI_TIET where API_ROUTE LIKE '/api/v1/phanquyenbaocao';

select *from QT_CHUC_NANG_CHI_TIET where API_ROUTE LIKE '/api/v1/phanquyenbaocaoctck';

select *from QT_CHUC_NANG_CHI_TIET where ten_chuc_nang like 'Phân quy?n báo cáo';

select *from qt_chuc_nang where ten_chuc_nang like 'Phân quy?n báo cáo%';


select *from LK_CTCK_BAO_CAO;


SELECT * FROM QT_CHUC_NANG_CHI_TIET ORDER BY ID Desc;

Select 
    DISTINCT u.id, u.ten_Chuc_Nang, u.khoa_Cha_Id , u.action_Id, u.icon, u.is_menu, u.nguoi_Tao_Id, u.is_deleted, u.trang_Thai, c.vue_Route, c.api_Route, c.ten_Chuc_Nang, u.thu_Tu
    From qt_chuc_nang u 
    left join QT_CHUC_NANG_CHI_TIET c on u.action_Id  = c.id where  (u.is_menu = 1) and (u.trang_Thai = 1) and (c.trang_Thai = 1)
    ORDER BY u.khoa_Cha_Id, c.ten_Chuc_Nang  ASC