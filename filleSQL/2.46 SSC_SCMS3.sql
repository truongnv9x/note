Select e.*,ROWNUM as rownums FROM (SELECT u.id, u.ctck_Thong_Tin_Id , u.ctck_Nhan_Su_Id, t5.DM_NGANH_NGHE_KD_ID, u.SO_CHUNG_CHI_HNCK, u.ngay_Cap_CCHN, u.IS_SYNC, u.THOI_GIAN_SYNC,
u.ghi_Chu, u.nguoi_Tao_Id, u.ngay_Tao, u.trang_Thai as TRANGTHAINHN, ctck.ten_tieng_viet, CASE WHEN TO_NCHAR(u.hoTen) is null THEN ns.ho_Ten ELSE TO_NCHAR(u.hoTen) END AS HOTEN,
CASE WHEN TO_NCHAR(u.soCMT) is null THEN ns.so_Cmnd ELSE TO_NCHAR(u.soCMT) END AS SOCMND,  CASE WHEN u.NGAYBATDAU is null THEN ns.ngay_bat_dau_lam_viec ELSE u.NGAYBATDAU END AS ngayBatDau,
CASE WHEN u.NGAYKETTHUC is null THEN ns.ngay_thoi_viec ELSE u.NGAYKETTHUC END AS ngayKetThuc , nnkd.ten_Nganh_Nghe_Kd, ns.chuc_Vu_Id, ns.TRANG_THAI AS TRANGTHAINHANSU, ctck.ten_Viet_Tat, u.SOGIAYPHEP, 
CASE WHEN u.ngaySinh is null THEN ns.ngay_sinh ELSE u.ngaySinh END AS NGAYSINH, u.CTCK_DICH_VU_ID, u.chucVu as ChucVuNHN, ROW_NUMBER() OVER (PARTITION BY u.SO_CHUNG_CHI_HNCK,u.soCMT ORDER BY u.ctck_thong_tin_id) AS rownumber,
CASE WHEN u.ngayCapCMT is null THEN ns.ngay_cap ELSE u.ngayCapCMT END AS ngayCapCMT, CASE WHEN ns.noi_cap is null THEN TO_NCHAR(u.noiCapCMT) ELSE ns.noi_cap END AS NoiCapCMT, u.gioitinh,
u.QUOCTICH, u.DIACHITHUONGTRU, u.HOKHAUTHUONGTRU,u.NOISINH, u.DIENTHOAI,u.DIDONG, u.EMAIL, u.TENTIENGANH, u.PHONGBAN, u.CONTENT,cn.ten_day_du as ten_chi_nhanh, pgd.ten_day_du as ten_phong_giao_dich,
vpdd.ten_day_du as ten_vpdd, u.tenCongTy as TENCONGTYNHN, u.tenTiengAnh AS TENTIENGANHNHN, u.tenVietTat AS TENVIETTATNHN,
ROW_NUMBER () OVER (PARTITION BY u.CTCK_THONG_TIN_ID  order by u.ctck_thong_tin_id desc) seq_no 
from ctck_nguoi_hanh_nghe_ck u 
left join ctck_thong_tin ctck on u.ctck_thong_tin_id = ctck.ctck_thong_tin_id and ctck.is_bang_tam = 0 
LEFT JOIN (SELECT nguoi_hanh_nghe_ck_id,LISTAGG(dm_nganh_Nghe_id, ',') WITHIN GROUP (ORDER BY nguoi_hanh_nghe_ck_id) "DM_NGANH_NGHE_KD_ID" 
FROM LK_NHN_CK_NGANH_NGHE_KD GROUP BY nguoi_hanh_nghe_ck_id) t5 on t5.nguoi_hanh_nghe_ck_id = u.id 
left join ctck_nhan_su_cao_cap ns on u.ctck_nhan_su_id = ns.id 
left join dm_nganh_nghe_kd nnkd on t5.dm_nganh_nghe_kd_id = TO_CHAR(nnkd.id) 
left join dm_dich_vu dv on u.ctck_Dich_vu_id = dv.id 
left join ctck_chi_nhanh cn ON u.CTCK_CHI_NHANH_ID = cn.CTCK_CHI_NHANH_ID and cn.is_bang_tam = 0 
left join ctck_phong_giao_dich pgd on u.ctck_phong_giao_dich_id = pgd.ctck_giao_dich_id and pgd.is_bang_tam = 0 
left join ctck_vp_dai_dien vpdd on u.ctck_vp_dai_dien_id = vpdd.ctck_vp_dai_dien_id and vpdd.is_bang_tam = 0  where 1=1 AND (ns.trang_Thai_Xoa IS NULL OR ns.trang_Thai_Xoa = 0)
and u.ctck_Thong_Tin_Id in (884,882,891,1105,872,871,890,936,891) ) e order by rownums;




SELECT * FROM (SELECT t1.*,ROWNUM AS rnum from (Select u.id, u.ctck_Thong_Tin_Id , u.ctck_Chi_Nhanh_Id, u.ho_Ten, u.gioi_Tinh, 
u.trang_Thai_Nhan_Su, u.dia_Chi, u.so_Cmnd, u.ngay_Cap, u.noi_Cap, u.ngay_Sinh, u.noi_Sinh, u.dm_Quoc_Tich_Id, qt.ten_Quoc_Tich, u.dien_Thoai, u.fax, u.email, u.chuc_Vu_Id, 
u.email_Cong_Bo_Tt, u.loai_Co_Dong, u.ngay_Bat_Dau_Lam_Viec, u.ghi_Chu, u.nguoi_Tao_Id, u.ngay_Tao, u.nguoi_Cap_Nhat_Id, u.ngay_Cap_Nhat, u.trang_Thai, u.is_bang_tam, u.ctck_Phong_Giao_Dich_Id,
u.ctck_Vp_Dai_Dien_Id, u.phong_Ban , u.ngay_Thoi_Viec, u.noi_Dung_Bao_Cao, ctck.ten_Viet_Tat || '- ' || ctck.ten_Tieng_Viet as ten_cong_ty, cn.ten_Day_Du as td1, pdg.ten_Day_Du as td2 , 
vpdd.ten_Day_Du as td3, u.chung_Chi_Hanh_Nghe, u.nguoi_Cong_Bo_Thong_Tin, ctck.ten_Viet_Tat, u.file_Dinh_Kem, nd.ho_Ten as ht1, nd1.ho_Ten as ht2,
ROW_NUMBER () OVER (PARTITION BY u.CTCK_THONG_TIN_ID  order by u.ctck_Thong_Tin_Id desc) seq_no 
From ctck_nhan_su_cao_cap u 
LEFT JOIN dm_quoc_tich qt ON u.dm_Quoc_Tich_Id = qt.id 
LEFT JOIN ctck_thong_tin ctck ON u.ctck_Thong_Tin_Id = ctck.ctck_Thong_Tin_Id and ctck.is_bang_tam = 0 
LEFT JOIN ctck_chi_nhanh cn ON u.ctck_Chi_Nhanh_Id = cn.ctck_Chi_Nhanh_Id 
LEFT JOIN ctck_phong_giao_dich pdg ON u.ctck_Phong_Giao_Dich_Id = pdg.ctck_Giao_Dich_Id 
LEFT JOIN ctck_vp_dai_dien vpdd ON u.ctck_Vp_Dai_Dien_Id = vpdd.ctck_Vp_Dai_Dien_Id 
LEFT JOIN qt_nguoi_dung nd ON u.nguoi_Tao_Id = nd.id 
LEFT JOIN qt_nguoi_dung nd1 ON u.nguoi_Cap_Nhat_Id = nd1.id  where 1=1 AND u.trang_Thai_Xoa = 0 and u.ctck_Thong_Tin_Id in (1105,872,891,891,882,936,890,871,884)) t1) order by rnum asc;


