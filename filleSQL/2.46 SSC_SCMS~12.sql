SELECT
    e.*
FROM ( SELECT
    u.id,u.ctck_Thong_Tin_Id,u.ctck_Nhan_Su_Id,u.dm_Nganh_Nghe_Kd_Id,u.SO_CHUNG_CHI_HNCK,u.ngay_Cap_CCHN,u.IS_SYNC,u.THOI_GIAN_SYNC
   ,u.ghi_Chu,u.nguoi_Tao_Id,u.ngay_Tao,u.trang_Thai      AS TRANGTHAINHN,ctck.ten_tieng_viet,CASE
        WHEN TO_NCHAR(u.hoTen) IS NULL THEN ns.ho_Ten
        ELSE TO_NCHAR(u.hoTen)
    END AS HOTEN,CASE
        WHEN TO_NCHAR(u.soCMT) IS NULL THEN ns.so_Cmnd
        ELSE TO_NCHAR(u.soCMT)
    END AS SOCMND,CASE
        WHEN u.NGAYBATDAU IS NULL THEN ns.ngay_bat_dau_lam_viec
        ELSE u.NGAYBATDAU
    END AS ngayBatDau,CASE
        WHEN u.NGAYKETTHUC IS NULL THEN ns.ngay_thoi_viec
        ELSE u.NGAYKETTHUC
    END AS ngayKetThuc,nnkd.ten_Nganh_Nghe_Kd,ns.chuc_Vu_Id,ns.TRANG_THAI AS TRANGTHAINHANSU,ctck.ten_Viet_Tat,u.SOGIAYPHEP,CASE
        WHEN u.ngaySinh IS NULL THEN ns.ngay_sinh
        ELSE u.ngaySinh
    END AS NGAYSINH,u.CTCK_DICH_VU_ID,u.chucVu    AS ChucVuNHN,
    ROW_NUMBER() OVER(
        PARTITION BY u.SO_CHUNG_CHI_HNCK, u.ctck_thong_tin_id
        ORDER BY u.SO_CHUNG_CHI_HNCK
    ) AS rownumber,
    CASE
        WHEN u.ngayCapCMT IS NULL THEN ns.ngay_cap
        ELSE u.ngayCapCMT
    END AS ngayCapCMT,CASE
        WHEN ns.noi_cap IS NULL THEN TO_NCHAR(u.noiCapCMT)
        ELSE ns.noi_cap
    END AS NoiCapCMT,u.gioitinh,u.QUOCTICH,u.DIACHITHUONGTRU,u.HOKHAUTHUONGTRU,u.NOISINH,u.DIENTHOAI,u.DIDONG,u.EMAIL,u.TENTIENGANH
   ,u.PHONGBAN,u.CONTENT,cn.ten_day_du     AS ten_chi_nhanh,pgd.ten_day_du    AS ten_phong_giao_dich,vpdd.ten_day_du   AS ten_vpdd,u.tenCongTy       AS
    TENCONGTYNHN,u.tenTiengAnh     AS TENTIENGANHNHN,u.tenVietTat      AS TENVIETTATNHN
FROM
    ctck_nguoi_hanh_nghe_ck u
    LEFT JOIN ctck_thong_tin ctck ON u.ctck_thong_tin_id = ctck.ctck_thong_tin_id AND ctck.is_bang_tam = 0
    LEFT JOIN ctck_nhan_su_cao_cap ns ON u.ctck_nhan_su_id = ns.id
    LEFT JOIN dm_nganh_nghe_kd nnkd ON u.dm_nganh_nghe_kd_id = nnkd.id
    LEFT JOIN dm_dich_vu dv ON u.ctck_Dich_vu_id = dv.id
    LEFT JOIN ctck_chi_nhanh cn ON ns.CTCK_CHI_NHANH_ID = cn.CTCK_CHI_NHANH_ID
    LEFT JOIN ctck_phong_giao_dich pgd ON ns.ctck_phong_giao_dich_id = pgd.ctck_giao_dich_id
    LEFT JOIN ctck_vp_dai_dien vpdd ON ns.ctck_vp_dai_dien_id = vpdd.ctck_vp_dai_dien_id
WHERE
    1 = 1
    AND ( ns.trang_Thai_Xoa IS NULL
          OR ns.trang_Thai_Xoa = 0 )
    AND ( ( LOWER(u.ghi_Chu) LIKE '%giám%' )
          OR ( LOWER(ns.ho_Ten) LIKE '%giám%' )
          OR ( LOWER(u.hoTen) LIKE '%giám%' )
          OR ( LOWER(ns.so_Cmnd) LIKE '%giám%' )
          OR ( LOWER(u.soCMT) LIKE '%giám%' )
          OR ( LOWER(u.SO_CHUNG_CHI_HNCK) LIKE '%giám%' )
          OR ( LOWER(ctck.ten_Tieng_Viet) LIKE '%giám%' ) )
          OR ( LOWER(u.TENCONGTY) LIKE '%giám%') 
ORDER BY
    ctck.ten_Viet_Tat DESC
) e
WHERE
    e.rownumber = 1;
--    and 
--    e.ctck_Thong_Tin_Id in(
--    843,1122,871,962,1098,842,935,949,925,867,961,869,932,873,942,1109,947,930,920,845,854,874,878,1091,922,895,964,937,875,1097,
--    945,914,921,894,880,849,901,881,889,940,879,1096,966,1089,931,1088,939,915,957,1113,868,1105,963,1112,917,909,913,948,928,929
--   ,944,896,866,946,923,910,1090,933,886,936,1111,908,912,887,882,918,870,856,1566,965,899,938,864,891,872,893,911,941,892,862,924
--   ,926,853,905,865,884,888,863,902,890,907,934,903,900,860,1574,846
--);

select *from ctck_thong_tin where ctck_thong_tin_id = 842;
select *from ctck_thong_tin where ctck_thong_tin_id = 1098;

select *from CTCK_NGUOI_HANH_NGHE_CK where hoTen like '%Tr??ng Minh Giám%';




