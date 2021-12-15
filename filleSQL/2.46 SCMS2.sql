Select e.* 
    FROM 
    (SELECT distinct(u.id), u.ctck_Thong_Tin_Id , u.ctck_Nhan_Su_Id, u.dm_Nganh_Nghe_Kd_Id, u.SO_CHUNG_CHI_HNCK, u.ngay_Cap_CCHN, 
    u.IS_SYNC, u.THOI_GIAN_SYNC, u.ghi_Chu, u.nguoi_Tao_Id, u.ngay_Tao, u.trang_Thai as TRANGTHAINHN, ctck.ten_tieng_viet, 
    CASE WHEN ns.ho_Ten is null THEN TO_NCHAR(u.hoTen) ELSE ns.ho_Ten END AS HOTEN,  
    CASE WHEN ns.so_Cmnd is null THEN TO_NCHAR(u.soCMT) ELSE ns.so_Cmnd END AS SOCMND,  
    CASE WHEN ns.ngay_bat_dau_lam_viec is null THEN u.NGAYBATDAU ELSE ns.ngay_bat_dau_lam_viec END AS ngayBatDau,
    CASE WHEN ns.ngay_thoi_viec is null THEN u.NGAYKETTHUC ELSE ns.ngay_thoi_viec END AS ngayKetThuc , 
    nnkd.ten_Nganh_Nghe_Kd, ns.chuc_Vu_Id, ns.TRANG_THAI AS TRANGTHAINHANSU, ctck.ten_Viet_Tat, u.SOGIAYPHEP,
    CASE WHEN ns.ngay_sinh is null THEN u.ngaySinh ELSE ns.ngay_sinh END AS NGAYSINH, u.CTCK_DICH_VU_ID, u.chucVu as ChucVuNHN, 
    ROW_NUMBER() OVER (PARTITION BY u.SO_CHUNG_CHI_HNCK ORDER BY u.SO_CHUNG_CHI_HNCK) AS rownumber, 
    CASE WHEN ns.ngay_cap is null THEN u.ngayCapCMT ELSE ns.ngay_cap END AS ngayCapCMT, 
    CASE WHEN ns.noi_cap is null THEN TO_NCHAR(u.noiCapCMT) ELSE ns.noi_cap END AS NoiCapCMT, u.gioitinh, u.QUOCTICH, 
    u.DIACHITHUONGTRU, u.HOKHAUTHUONGTRU,u.NOISINH, u.DIENTHOAI,u.DIDONG, u.EMAIL, u.TENTIENGANH, u.PHONGBAN, u.CONTENT 
        from ctck_nguoi_hanh_nghe_ck u 
        left join ctck_thong_tin ctck on u.ctck_thong_tin_id = ctck.ctck_thong_tin_id and ctck.is_bang_tam = 0 
        left join ctck_nhan_su_cao_cap ns on u.ctck_nhan_su_id = ns.id 
        left join dm_nganh_nghe_kd nnkd on u.dm_nganh_nghe_kd_id = nnkd.id 
        left join dm_dich_vu dv on u.ctck_Dich_vu_id = dv.id  
        LEFT JOIN ctck_chi_nhanh cn ON ctck.ctck_thong_tin_id = cn.ctck_thong_tin_id  
        where 1=1 AND (ns.trang_Thai_Xoa IS NULL OR ns.trang_Thai_Xoa = 0) and (( LOWER(u.ghi_Chu) like '%test%')  or 
        (LOWER(ns.ho_Ten) like '%test%')  or (LOWER(u.hoTen) like '%test%')  or (LOWER(ns.so_Cmnd) like '%test%')  or 
        (LOWER(u.soCMT) like '%test%')  or (LOWER(u.SO_CHUNG_CHI_HNCK) like '%test%')  or (LOWER(ctck.ten_Tieng_Viet) like '%test%'))
        and ( LOWER(ctck.ten_Tieng_Viet) like '%công ty tnhh ch?ng khoán ngân hàng tmcp ngo?i thu?ng vi?t nam%') 
        and u.ctck_Thong_Tin_Id in (843,1122,871,962,1098,842,935,949,925,867,961,869,932,873,942,1109,947,930,920,
        845,854,874,878,1091,922,895,896,964,937,875,1097,945,914,921,894,880,849,901,881,889,940,879,1096,966,1089,
        931,1088,939,915,957,1113,868,1105,963,1112,917,909,913,948,928,929,944,866,946,923,910,1090,933,886,936,1111,
        908,912,887,882,918,870,856,965,899,938,864,891,872,893,911,941,892,862,924,926,853,905,865,884,888,863,902,890,
        907,934,903,900,860,846,2126,2111) order by ctck.ten_Viet_Tat desc ) e ;