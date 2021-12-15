select *from qt_nguoi_dung where tai_khoan like 'anhntv';

select *from CTCK_NGUOI_HANH_NGHE_CK where NGUOI_TAO_ID = 714 and ngay_tao >= SYSDATE;

select *from CTCK_NGUOI_HANH_NGHE_CK where IS_SYNC = 0 and trang_thai_xoa = 0 or trang_thai_xoa is null;

select *from CTCK_NGUOI_HANH_NGHE_CK where ctck_thong_tin_id = 856;

select count(*) from CTCK_NGUOI_HANH_NGHE_CK;

Select e.* FROM 
    (SELECT u.id, u.ctck_Thong_Tin_Id , u.ctck_Nhan_Su_Id, u.dm_Nganh_Nghe_Kd_Id, u.SO_CHUNG_CHI_HNCK, u.ngay_Cap_CCHN, u.IS_SYNC, u.THOI_GIAN_SYNC, u.ghi_Chu, u.nguoi_Tao_Id, 
    u.ngay_Tao, u.trang_Thai as TRANGTHAINHN, ctck.ten_tieng_viet, CASE WHEN TO_NCHAR(u.hoTen) is null THEN ns.ho_Ten ELSE TO_NCHAR(u.hoTen) END AS HOTEN,  
    CASE WHEN TO_NCHAR(u.soCMT) is null THEN ns.so_Cmnd ELSE TO_NCHAR(u.soCMT) END AS SOCMND,  CASE WHEN u.NGAYBATDAU is null THEN ns.ngay_bat_dau_lam_viec ELSE u.NGAYBATDAU END AS ngayBatDau,
    CASE WHEN u.NGAYKETTHUC is null THEN ns.ngay_thoi_viec ELSE u.NGAYKETTHUC END AS ngayKetThuc , nnkd.ten_Nganh_Nghe_Kd, ns.chuc_Vu_Id, ns.TRANG_THAI AS TRANGTHAINHANSU, ctck.ten_Viet_Tat, u.SOGIAYPHEP,
    CASE WHEN u.ngaySinh is null THEN ns.ngay_sinh ELSE u.ngaySinh END AS NGAYSINH, u.CTCK_DICH_VU_ID, u.chucVu as ChucVuNHN, ROW_NUMBER() OVER (PARTITION BY u.SO_CHUNG_CHI_HNCK ORDER BY u.SO_CHUNG_CHI_HNCK) AS rownumber,
    CASE WHEN u.ngayCapCMT is null THEN ns.ngay_cap ELSE u.ngayCapCMT END AS ngayCapCMT, CASE WHEN ns.noi_cap is null THEN TO_NCHAR(u.noiCapCMT) ELSE ns.noi_cap END AS NoiCapCMT, u.gioitinh, 
    u.QUOCTICH, u.DIACHITHUONGTRU, u.HOKHAUTHUONGTRU,u.NOISINH, u.DIENTHOAI,u.DIDONG, u.EMAIL, u.TENTIENGANH, u.PHONGBAN, u.CONTENT,cn.ten_day_du as ten_chi_nhanh, pgd.ten_day_du as ten_phong_giao_dich, 
    vpdd.ten_day_du as ten_vpdd, u.tenCongTy as TENCONGTYNHN, u.tenTiengAnh AS TENTIENGANHNHN, u.tenVietTat AS TENVIETTATNHN 
from ctck_nguoi_hanh_nghe_ck u left join ctck_thong_tin ctck on u.ctck_thong_tin_id = ctck.ctck_thong_tin_id and ctck.is_bang_tam = 0 
left join ctck_nhan_su_cao_cap ns on u.ctck_nhan_su_id = ns.id 
left join dm_nganh_nghe_kd nnkd on u.dm_nganh_nghe_kd_id = nnkd.id 
left join dm_dich_vu dv on u.ctck_Dich_vu_id = dv.id 
left join ctck_chi_nhanh cn ON ns.CTCK_CHI_NHANH_ID = cn.CTCK_CHI_NHANH_ID  
left join ctck_phong_giao_dich pgd on ns.ctck_phong_giao_dich_id = pgd.ctck_giao_dich_id 
left join ctck_vp_dai_dien vpdd on ns.ctck_vp_dai_dien_id = vpdd.ctck_vp_dai_dien_id  
    where 1=1 AND (ns.trang_Thai_Xoa IS NULL OR ns.trang_Thai_Xoa = 0) and ( LOWER(ns.ho_Ten) like '%lan%')  or ( LOWER(u.hoTen) like '%lan%')  
    and u.ctck_Thong_Tin_Id in (843,1122,871,962,1098,842,935,949,925,867,961,869,932,873,942,1109,947,930,920,845,854,874,878,
    1091,922,895,964,937,875,1097,945,914,921,894,880,849,901,881,889,940,879,1096,966,1089,931,1088,939,915,957,1113,868,1105,963,1112,917,909,913,948,928,929,944,896,
    866,946,923,910,1090,933,886,936,1111,908,912,887,882,918,870,856,1566,965,899,938,864,891,872,893,911,941,892,862,924,926,853,905,865,884,888,863,902,890,
    907,934,903,900,860,1574,846) order by ctck.ten_Viet_Tat desc ) e where e.rownumber = 1 and e.ctck_Thong_Tin_Id = 856;
    
