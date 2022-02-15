SELECT * FROM (SELECT t1.*, ROWNUM AS rnum FROM (SELECT kt.id, kt.ct_Kiem_Toan_Id, (select ten_Tieng_Viet from CT_KIEM_TOAN where id = kt.ct_Kiem_Toan_Id) ten_tieng_viet, kt.ho_Ten, kt.so_Chung_Chi, kt.trang_Thai, kt.ngay_Cap,
        ROW_NUMBER ()
        OVER (PARTITION BY kt.CT_KIEM_TOAN_ID
              ORDER BY kt.HO_TEN) seq_no
   FROM CT_KIEM_TOAN_VIEN kt) t1 ) tblAll WHERE rnum >= 31 AND rnum <= 45;
   


SELECT * FROM (SELECT t1.*, ROWNUM AS rnum FROM (SELECT kt.id, kt.ct_Kiem_Toan_Id, (select ten_Tieng_Viet from CT_KIEM_TOAN where id = kt.ct_Kiem_Toan_Id) ten_tieng_viet,
kt.ho_Ten, kt.so_Chung_Chi, kt.trang_Thai, kt.ngay_Cap,
        ROW_NUMBER ()
        OVER (PARTITION BY kt.CT_KIEM_TOAN_ID
              ORDER BY kt.HO_TEN) seq_no
   FROM CT_KIEM_TOAN_VIEN kt ) t1 ) tblAll where 1=1  and (( LOWER(tblAll.ten_tieng_viet) like '%%')  or ( LOWER(tblAll.ho_Ten) like '%%')  
   or ( LOWER(tblAll.so_Chung_Chi) like '%%') ) and ( tblAll.trang_thai  = 1) ORDER BY tblAll.ct_Kiem_Toan_Id, tblAll.id, tblAll.seq_no  desc;
   
   
SELECT * FROM (SELECT t1.*, ROWNUM AS rnum FROM (SELECT kt.id, kt.ct_Kiem_Toan_Id, (select ten_Tieng_Viet from CT_KIEM_TOAN where id = kt.ct_Kiem_Toan_Id and LOWER(ten_tieng_viet) like '%ngô bá duy%') ten_tieng_viet, 
kt.ho_Ten, kt.so_Chung_Chi, kt.trang_Thai, kt.ngay_Cap,
        ROW_NUMBER () OVER (PARTITION BY kt.CT_KIEM_TOAN_ID ORDER BY kt.HO_TEN) seq_no    FROM CT_KIEM_TOAN_VIEN kt  where 1=1
        and ( LOWER(kt.ho_Ten) like '%ngô bá duy%')  or ( LOWER(kt.so_Chung_Chi) like '%ngô bá duy%') and ( kt.trang_thai  = 1) ) t1 ) tblAll;
        
SELECT * FROM 
    (SELECT t1.*, ROWNUM AS rnum 
    FROM (SELECT kt.id, kt.ct_Kiem_Toan_Id, ct.ten_Tieng_Viet, 
kt.ho_Ten, kt.so_Chung_Chi, kt.trang_Thai, kt.ngay_Cap,  ROW_NUMBER () OVER (PARTITION BY kt.CT_KIEM_TOAN_ID ORDER BY kt.HO_TEN) seq_no   
FROM CT_KIEM_TOAN_VIEN kt  left join CT_KIEM_TOAN ct on ct.id = kt.ct_Kiem_Toan_Id
where 1=1  and ( LOWER(kt.ho_Ten) like '%ngô bá duy%')  or ( LOWER(kt.so_Chung_Chi) like '%ngô bá duy%' ) and ( kt.trang_thai  = 1) ) t1 ) tblAll;







SELECT * FROM 
(SELECT t1.*, ROWNUM AS rnum 
FROM (SELECT kt.id, kt.ct_Kiem_Toan_Id, ct.ten_Tieng_Viet, kt.ho_Ten, kt.so_Chung_Chi, kt.trang_Thai, kt.ngay_Cap, ROW_NUMBER () OVER (PARTITION BY kt.CT_KIEM_TOAN_ID ORDER BY kt.HO_TEN) seq_no  
FROM CT_KIEM_TOAN_VIEN kt LEFT JOIN CT_KIEM_TOAN ct on ct.id = kt.ct_Kiem_Toan_Id 
where 1=1  and (( LOWER(ct.ten_tieng_viet) like '%%')  or ( LOWER(kt.ho_Ten) like '%%')  or ( LOWER(kt.so_Chung_Chi) like '%%'))   and ( kt.trang_thai  = 1) ) t1 ) tblAll;


select *from CBTT_BAO_CAO;

SELECT * FROM  (SELECT t1.*,ROWNUM AS rnum from (SELECT cbtt.id, cbtt.CTCK_THONG_TIN_ID,ctck.ten_tieng_viet,ctck.ten_viet_tat,cbtt.tieu_de, cbtt.NOI_DUNG_TRICH_YEU, cbtt.trang_thai, 
cbtt.FILE_DINH_KEM, cbtt.loai_cong_bo, cbtt.ngay_gui, cbtt.ngay_cbtt, cbtt.nguoi_cbtt,'12','13','14','15','16','17', '18', ROW_NUMBER () OVER (PARTITION BY cbtt.CTCK_THONG_TIN_ID ORDER BY cbtt.tieu_de) seq_no   
FROM CBTT_BAO_CAO cbtt  left join CTCK_THONG_TIN ctck on ctck.CTCK_THONG_TIN_ID = cbtt.CTCK_THONG_TIN_ID) t1) ;

SELECT count(*) FROM  (SELECT t1.* ,ROWNUM AS rnum from (SELECT cbtt.id, cbtt.CTCK_THONG_TIN_ID,ctck.ten_tieng_viet,ctck.ten_viet_tat,cbtt.tieu_de, cbtt.NOI_DUNG_TRICH_YEU, cbtt.trang_thai, 
cbtt.FILE_DINH_KEM, cbtt.loai_cong_bo, cbtt.ngay_gui, cbtt.ngay_cbtt, cbtt.nguoi_cbtt,'' as t12,'' as t13,'' as t14,'' as t15,'' as t16,'' as t17, '' as t18, ROW_NUMBER () OVER (PARTITION BY cbtt.CTCK_THONG_TIN_ID ORDER BY cbtt.tieu_de) seq_no   
FROM CBTT_BAO_CAO cbtt  left join CTCK_THONG_TIN ctck on ctck.CTCK_THONG_TIN_ID = cbtt.CTCK_THONG_TIN_ID) t1) tabAll ;



SELECT * FROM  (SELECT t1.*,ROWNUM AS rnum from (SELECT u.id, u.so_van_ban, u.ngay_van_ban, u.ngay_hop_le, u.hinh_thuc_chao_ban,
u.doi_tuong_chao_ban, u.khoi_luong, u.gia_tri, u.trang_thai, u.ctck_thong_tin_id,t.ten_tieng_viet,t.ten_viet_tat, '' as t12,'' as t13, 
ROW_NUMBER () OVER (PARTITION BY u.CTCK_THONG_TIN_ID ORDER BY u.ngay_van_ban) seq_no   
FROM CBTT_CHAO_BAN_CHUNG_KHOAN u  left join CTCK_THONG_TIN t on t.CTCK_THONG_TIN_ID = u.CTCK_THONG_TIN_ID) t1) ;



SELECT * FROM  (SELECT t1.*,ROWNUM AS rnum from (SELECT u.id, u.loai_giao_dich_id, u.tieu_de, u.noi_dung_trich_yeu, u.file_dinh_kem,
u.ngay_gui, u.ctck_thong_tin_id,t.ten_tieng_viet,t.ten_viet_tat, u.trang_thai, '' as t12, 
ROW_NUMBER () OVER (PARTITION BY u.CTCK_THONG_TIN_ID ORDER BY u.ngay_gui) seq_no   
FROM CBTT_CO_DONG u  left join CTCK_THONG_TIN t on t.CTCK_THONG_TIN_ID = u.CTCK_THONG_TIN_ID) t1) ;



SELECT * FROM  (SELECT t1.*,ROWNUM AS rnum from (SELECT u.id, u.loai_giao_dich_id, u.tieu_de, u.noi_dung_trich_yeu, u.file_dinh_kem,u.ngay_gui, u.ctck_thong_tin_id,
t.ten_tieng_viet,t.ten_viet_tat, u.trang_thai, '' as t12, '' as t13,ROW_NUMBER () OVER (PARTITION BY u.CTCK_THONG_TIN_ID  order by t.ten_viet_tat, u.ngay_Gui  desc) seq_no FROM CBTT_CO_DONG u 
left join CTCK_THONG_TIN t on t.CTCK_THONG_TIN_ID = u.CTCK_THONG_TIN_ID  where 1=1  and t.is_bang_tam =0) t1) ;


-------------------------------------------
SELECT * FROM (SELECT t1.*,ROWNUM AS rnum from (Select 
    u.id,  u.ctck_Thong_Tin_Id , u.ctck_Chi_Nhanh_Id,  u.ho_Ten, u.gioi_Tinh, u.trang_Thai_Nhan_Su, u.dia_Chi, u.so_Cmnd, u.ngay_Cap, u.noi_Cap, u.ngay_Sinh, u.noi_Sinh,
    u.dm_Quoc_Tich_Id, qt.ten_Quoc_Tich, u.dien_Thoai, u.fax, u.email, u.chuc_Vu_Id, u.email_Cong_Bo_Tt, u.loai_Co_Dong, u.ngay_Bat_Dau_Lam_Viec, u.ghi_Chu,
    u.nguoi_Tao_Id, u.ngay_Tao, u.nguoi_Cap_Nhat_Id, u.ngay_Cap_Nhat, u.trang_Thai, u.is_bang_tam, u.ctck_Phong_Giao_Dich_Id, u.ctck_Vp_Dai_Dien_Id, u.phong_Ban , 
    u.ngay_Thoi_Viec, u.noi_Dung_Bao_Cao, ctck.ten_Viet_Tat || '- ' || ctck.ten_Tieng_Viet as ten_cong_ty, cn.ten_Day_Du as td1, pdg.ten_Day_Du as td2 , vpdd.ten_Day_Du as td3, u.chung_Chi_Hanh_Nghe,
    u.nguoi_Cong_Bo_Thong_Tin, ctck.ten_Viet_Tat, u.file_Dinh_Kem, nd.ho_Ten as ht1,  nd1.ho_Ten as ht2,
    ROW_NUMBER () OVER (PARTITION BY u.CTCK_THONG_TIN_ID order by u.ctck_thong_tin_id, u.ctck_Chi_Nhanh_Id,u.ho_ten desc) seq_no
From ctck_nhan_su_cao_cap u 
    LEFT JOIN ctck_nguoi_hanh_nghe_ck u99 on u.id  = u99.ctck_Nhan_Su_Id 
    LEFT JOIN dm_quoc_tich qt ON u.dm_Quoc_Tich_Id = qt.id  
    LEFT JOIN ctck_thong_tin ctck ON u.ctck_Thong_Tin_Id = ctck.ctck_Thong_Tin_Id and ctck.is_bang_tam = 0  
    LEFT JOIN ctck_chi_nhanh cn ON u.ctck_Chi_Nhanh_Id = cn.ctck_Chi_Nhanh_Id  
    LEFT JOIN ctck_phong_giao_dich pdg ON u.ctck_Phong_Giao_Dich_Id = pdg.ctck_Giao_Dich_Id 
    LEFT JOIN ctck_vp_dai_dien vpdd ON u.ctck_Vp_Dai_Dien_Id = vpdd.ctck_Vp_Dai_Dien_Id  
    LEFT JOIN qt_nguoi_dung nd ON u.nguoi_Tao_Id = nd.id  
    LEFT JOIN qt_nguoi_dung nd1 ON u.nguoi_Cap_Nhat_Id = nd1.id 
where 1=1 AND u.trang_Thai_Xoa = 0) t1);

select * from ctck_nhan_su_cao_cap;
select *from ctck_nguoi_hanh_nghe_ck;
SELECT  ROW_NUMBER () OVER (PARTITION BY u.CTCK_THONG_TIN_ID order by u.ho_ten desc) seq_no, u.* FROM ctck_nhan_su_cao_cap u;


SELECT * FROM (SELECT t1.*,ROWNUM AS rnum from (Select u.id, u.ctck_Thong_Tin_Id , u.ctck_Chi_Nhanh_Id, u.ho_Ten, u.gioi_Tinh, u.trang_Thai_Nhan_Su, u.dia_Chi, u.so_Cmnd, u.ngay_Cap, u.noi_Cap, u.ngay_Sinh, u.noi_Sinh, u.dm_Quoc_Tich_Id, qt.ten_Quoc_Tich, u.dien_Thoai, u.fax, u.email, u.chuc_Vu_Id, u.email_Cong_Bo_Tt, u.loai_Co_Dong, u.ngay_Bat_Dau_Lam_Viec, u.ghi_Chu, u.nguoi_Tao_Id, u.ngay_Tao, u.nguoi_Cap_Nhat_Id, u.ngay_Cap_Nhat, u.trang_Thai, u.is_bang_tam, u.ctck_Phong_Giao_Dich_Id, u.ctck_Vp_Dai_Dien_Id, u.phong_Ban , u.ngay_Thoi_Viec, u.noi_Dung_Bao_Cao, ctck.ten_Viet_Tat || '- ' || ctck.ten_Tieng_Viet as ten_cong_ty, cn.ten_Day_Du as td1, pdg.ten_Day_Du as td2 , vpdd.ten_Day_Du as td3, u.chung_Chi_Hanh_Nghe, u.nguoi_Cong_Bo_Thong_Tin, ctck.ten_Viet_Tat, u.file_Dinh_Kem, nd.ho_Ten as ht1, nd1.ho_Ten as ht2, ROW_NUMBER () OVER (PARTITION BY u.CTCK_THONG_TIN_ID  order by u.ctck_Thong_Tin_Id,u.ctck_Chi_Nhanh_Id, u.ho_Ten  desc) seq_no  From ctck_nhan_su_cao_cap u LEFT JOIN ctck_nguoi_hanh_nghe_ck u99 on u.id = u99.ctck_Nhan_Su_Id LEFT JOIN dm_quoc_tich qt ON u.dm_Quoc_Tich_Id = qt.id LEFT JOIN ctck_thong_tin ctck ON u.ctck_Thong_Tin_Id = ctck.ctck_Thong_Tin_Id and ctck.is_bang_tam = 0 LEFT JOIN ctck_chi_nhanh cn ON u.ctck_Chi_Nhanh_Id = cn.ctck_Chi_Nhanh_Id LEFT JOIN ctck_phong_giao_dich pdg ON u.ctck_Phong_Giao_Dich_Id = pdg.ctck_Giao_Dich_Id LEFT JOIN ctck_vp_dai_dien vpdd ON u.ctck_Vp_Dai_Dien_Id = vpdd.ctck_Vp_Dai_Dien_Id LEFT JOIN qt_nguoi_dung nd ON u.nguoi_Tao_Id = nd.id LEFT JOIN qt_nguoi_dung nd1 ON u.nguoi_Cap_Nhat_Id = nd1.id  where 1=1 AND u.trang_Thai_Xoa = 0 ) t1);


SELECT * FROM (SELECT t1.*,ROWNUM AS rnum from (Select distinct(u.id),u99.so_chung_chi_hnck, u.ctck_Thong_Tin_Id , u.ctck_Chi_Nhanh_Id, u.ho_Ten, u.gioi_Tinh, u.trang_Thai_Nhan_Su, u.dia_Chi,
u.so_Cmnd, u.ngay_Cap, u.noi_Cap, u.ngay_Sinh, u.noi_Sinh, u.dm_Quoc_Tich_Id, qt.ten_Quoc_Tich, u.dien_Thoai, u.fax, u.email, u.chuc_Vu_Id, u.email_Cong_Bo_Tt, u.loai_Co_Dong,
u.ngay_Bat_Dau_Lam_Viec, u.ghi_Chu, u.nguoi_Tao_Id, u.ngay_Tao, u.nguoi_Cap_Nhat_Id, u.ngay_Cap_Nhat, u.trang_Thai, u.is_bang_tam, u.ctck_Phong_Giao_Dich_Id, u.ctck_Vp_Dai_Dien_Id,
u.phong_Ban , u.ngay_Thoi_Viec, u.noi_Dung_Bao_Cao, ctck.ten_Viet_Tat || '- ' || ctck.ten_Tieng_Viet as ten_cong_ty, cn.ten_Day_Du as td1, pdg.ten_Day_Du as td2 , vpdd.ten_Day_Du as td3, 
u.chung_Chi_Hanh_Nghe, u.nguoi_Cong_Bo_Thong_Tin, ctck.ten_Viet_Tat, u.file_Dinh_Kem, nd.ho_Ten as ht1, nd1.ho_Ten as ht2,
ROW_NUMBER () OVER (PARTITION BY u.CTCK_THONG_TIN_ID  order by u.ctck_Thong_Tin_Id,u.ctck_Chi_Nhanh_Id, u.ho_Ten  desc) seq_no  
From ctck_nhan_su_cao_cap u 
 JOIN ctck_nguoi_hanh_nghe_ck u99 on u.id = u99.ctck_Nhan_Su_Id
LEFT JOIN dm_quoc_tich qt ON u.dm_Quoc_Tich_Id = qt.id
LEFT JOIN ctck_thong_tin ctck ON u.ctck_Thong_Tin_Id = ctck.ctck_Thong_Tin_Id and ctck.is_bang_tam = 0
LEFT JOIN ctck_chi_nhanh cn ON u.ctck_Chi_Nhanh_Id = cn.ctck_Chi_Nhanh_Id
LEFT JOIN ctck_phong_giao_dich pdg ON u.ctck_Phong_Giao_Dich_Id = pdg.ctck_Giao_Dich_Id
LEFT JOIN ctck_vp_dai_dien vpdd ON u.ctck_Vp_Dai_Dien_Id = vpdd.ctck_Vp_Dai_Dien_Id
LEFT JOIN qt_nguoi_dung nd ON u.nguoi_Tao_Id = nd.id LEFT JOIN qt_nguoi_dung nd1 ON u.nguoi_Cap_Nhat_Id = nd1.id  
where 1=1 AND u.trang_Thai_Xoa = 0  and (( LOWER(u.ho_Ten) like '%nguy?n hoàng tùng%')  or ( LOWER(u.so_Cmnd) like '%nguy?n hoàng tùng%')) 
and u.ctck_Thong_Tin_Id in 
(843,1122,871,962,1098,842,935,949,925,867,961,869,932,873,942,1109,947,930,920,845,854,874,878,1091,922,895,964,937,875,1097,945,914,921,894,880,849,901,881,889,940,879,1096,966,
1089,931,1088,939,915,957,1113,868,1105,963,1112,917,909,913,948,928,929,944,896,866,946,923,910,1090,933,886,936,1111,908,912,887,882,918,870,856,965,899,938,864,891,872,893,911,941,892
,862,924,926,853,905,865,884,888,863,902,890,907,934,903,900,860,846)) t1);


SELECT * FROM (SELECT t1.*,ROWNUM AS rnum from (Select u.id, u.ctck_Thong_Tin_Id , u.ctck_Chi_Nhanh_Id, u.ho_Ten, u.gioi_Tinh, u.trang_Thai_Nhan_Su, u.dia_Chi, u.so_Cmnd,
u.ngay_Cap, u.noi_Cap, u.ngay_Sinh, u.noi_Sinh, u.dm_Quoc_Tich_Id, qt.ten_Quoc_Tich, u.dien_Thoai, u.fax, u.email, u.chuc_Vu_Id, u.email_Cong_Bo_Tt, u.loai_Co_Dong,
u.ngay_Bat_Dau_Lam_Viec, u.ghi_Chu, u.nguoi_Tao_Id, u.ngay_Tao, u.nguoi_Cap_Nhat_Id, u.ngay_Cap_Nhat, u.trang_Thai, u.is_bang_tam, u.ctck_Phong_Giao_Dich_Id, u.ctck_Vp_Dai_Dien_Id,
u.phong_Ban , u.ngay_Thoi_Viec, u.noi_Dung_Bao_Cao, ctck.ten_Viet_Tat || '- ' || ctck.ten_Tieng_Viet as ten_cong_ty, cn.ten_Day_Du as td1, pdg.ten_Day_Du as td2 , vpdd.ten_Day_Du as td3,
u.chung_Chi_Hanh_Nghe, u.nguoi_Cong_Bo_Thong_Tin, ctck.ten_Viet_Tat, u.file_Dinh_Kem, nd.ho_Ten as ht1, nd1.ho_Ten as ht2, 
ROW_NUMBER () OVER (PARTITION BY u.CTCK_THONG_TIN_ID  order by u.ctck_Thong_Tin_Id,u.ctck_Chi_Nhanh_Id, u.ho_Ten  desc) seq_no  
From ctck_nhan_su_cao_cap u LEFT JOIN dm_quoc_tich qt ON u.dm_Quoc_Tich_Id = qt.id 
LEFT JOIN ctck_thong_tin ctck ON u.ctck_Thong_Tin_Id = ctck.ctck_Thong_Tin_Id and ctck.is_bang_tam = 0 
LEFT JOIN ctck_chi_nhanh cn ON u.ctck_Chi_Nhanh_Id = cn.ctck_Chi_Nhanh_Id 
LEFT JOIN ctck_phong_giao_dich pdg ON u.ctck_Phong_Giao_Dich_Id = pdg.ctck_Giao_Dich_Id 
LEFT JOIN ctck_vp_dai_dien vpdd ON u.ctck_Vp_Dai_Dien_Id = vpdd.ctck_Vp_Dai_Dien_Id 
LEFT JOIN qt_nguoi_dung nd ON u.nguoi_Tao_Id = nd.id LEFT JOIN qt_nguoi_dung nd1 ON u.nguoi_Cap_Nhat_Id = nd1.id  
where 1=1 AND u.trang_Thai_Xoa = 0  and ( u.ctck_Chi_Nhanh_Id is not null ) and u.ctck_thong_tin_id = 843
    and u.ctck_Thong_Tin_Id in (843,1122,871,962,1098,842,935,949,925,867,961,869,932,873,942,1109,947,930,920,845,854,874,878,1091,922,895,964,937,875,1097,945,
    914,921,894,880,849,901,881,889,940,879,1096,966,1089,931,1088,939,915,957,1113,868,1105,963,1112,917,909,913,948,928,929,944,896,866,946,923,910,1090,933,886,936,
    1111,908,912,887,882,918,870,856,965,899,938,864,891,872,893,911,941,892,862,924,926,853,905,865,884,888,863,902,890,907,934,903,900,860,846)) t1);

select *from ctck_thong_tin where ten_viet_tat = 'AGRISECO' and is_bang_tam = 0;

Select e.* FROM (SELECT u.id, u.ctck_Thong_Tin_Id , u.ctck_Nhan_Su_Id, u.dm_Nganh_Nghe_Kd_Id, u.SO_CHUNG_CHI_HNCK, u.ngay_Cap_CCHN, u.IS_SYNC, u.THOI_GIAN_SYNC, u.ghi_Chu,
    u.nguoi_Tao_Id, u.ngay_Tao, u.trang_Thai as TRANGTHAINHN, ctck.ten_tieng_viet, CASE WHEN TO_NCHAR(u.hoTen) is null THEN ns.ho_Ten ELSE TO_NCHAR(u.hoTen) END AS HOTEN, 
    CASE WHEN TO_NCHAR(u.soCMT) is null THEN ns.so_Cmnd ELSE TO_NCHAR(u.soCMT) END AS SOCMND,  CASE WHEN u.NGAYBATDAU is null THEN ns.ngay_bat_dau_lam_viec ELSE u.NGAYBATDAU END AS ngayBatDau,
    CASE WHEN u.NGAYKETTHUC is null THEN ns.ngay_thoi_viec ELSE u.NGAYKETTHUC END AS ngayKetThuc , nnkd.ten_Nganh_Nghe_Kd, ns.chuc_Vu_Id, ns.TRANG_THAI AS TRANGTHAINHANSU, ctck.ten_Viet_Tat, u.SOGIAYPHEP,
    CASE WHEN u.ngaySinh is null THEN ns.ngay_sinh ELSE u.ngaySinh END AS NGAYSINH, u.CTCK_DICH_VU_ID, u.chucVu as ChucVuNHN, 
    ROW_NUMBER() OVER (PARTITION BY u.SO_CHUNG_CHI_HNCK, u.soCMT ORDER BY u.SO_CHUNG_CHI_HNCK) AS rownumber, CASE WHEN u.ngayCapCMT is null THEN ns.ngay_cap ELSE u.ngayCapCMT END AS ngayCapCMT, 
    CASE WHEN ns.noi_cap is null THEN TO_NCHAR(u.noiCapCMT) ELSE ns.noi_cap END AS NoiCapCMT, u.gioitinh, u.QUOCTICH, u.DIACHITHUONGTRU, u.HOKHAUTHUONGTRU,u.NOISINH, u.DIENTHOAI,u.DIDONG,
    u.EMAIL, u.TENTIENGANH, u.PHONGBAN, u.CONTENT,cn.ten_day_du as ten_chi_nhanh, pgd.ten_day_du as ten_phong_giao_dich, vpdd.ten_day_du as ten_vpdd, u.tenCongTy as TENCONGTYNHN,
    u.tenTiengAnh AS TENTIENGANHNHN, u.tenVietTat AS TENVIETTATNHN,
    ROW_NUMBER () OVER (PARTITION BY u.CTCK_THONG_TIN_ID  order by u.ctck_Thong_Tin_Id desc) seq_no  
from ctck_nguoi_hanh_nghe_ck u 
left join ctck_thong_tin ctck on u.ctck_thong_tin_id = ctck.ctck_thong_tin_id and ctck.is_bang_tam = 0 
left join ctck_nhan_su_cao_cap ns on u.ctck_nhan_su_id = ns.id 
left join dm_nganh_nghe_kd nnkd on u.dm_nganh_nghe_kd_id = nnkd.id 
left join dm_dich_vu dv on u.ctck_Dich_vu_id = dv.id 
left join ctck_chi_nhanh cn ON ns.CTCK_CHI_NHANH_ID = cn.CTCK_CHI_NHANH_ID  
left join ctck_phong_giao_dich pgd on ns.ctck_phong_giao_dich_id = pgd.ctck_giao_dich_id 
left join ctck_vp_dai_dien vpdd on ns.ctck_vp_dai_dien_id = vpdd.ctck_vp_dai_dien_id 
where 1=1 AND (ns.trang_Thai_Xoa IS NULL OR ns.trang_Thai_Xoa = 0)
and u.ctck_Thong_Tin_Id in (843,1122,871,962,1098,842,935,949,925,867,961,869,932,873,942,1109,947,930,920,845,854,874,878,1091,922,895,964,
937,875,1097,945,914,921,894,880,849,901,881,889,940,879,1096,966,1089,931,1088,939,915,957,1113,868,1105,963,1112,917,909,913,948,928,929,944,896,866,946,923,
910,1090,933,886,936,1111,908,912,887,882,918,870,856,1566,965,899,938,864,891,872,893,911,941,892,862,924,926,853,905,865,884,888,863,902,890,907,934,903,900,860,1574,846) ) e;



Select e.* FROM (SELECT u.id, u.ctck_Thong_Tin_Id , u.ctck_Nhan_Su_Id, u.dm_Nganh_Nghe_Kd_Id, u.SO_CHUNG_CHI_HNCK, u.ngay_Cap_CCHN, u.IS_SYNC, u.THOI_GIAN_SYNC, u.ghi_Chu, u.nguoi_Tao_Id,
u.ngay_Tao, u.trang_Thai as TRANGTHAINHN, ctck.ten_tieng_viet, CASE WHEN TO_NCHAR(u.hoTen) is null THEN ns.ho_Ten ELSE TO_NCHAR(u.hoTen) END AS HOTEN,
CASE WHEN TO_NCHAR(u.soCMT) is null THEN ns.so_Cmnd ELSE TO_NCHAR(u.soCMT) END AS SOCMND,  CASE WHEN u.NGAYBATDAU is null THEN ns.ngay_bat_dau_lam_viec ELSE u.NGAYBATDAU END AS ngayBatDau,
CASE WHEN u.NGAYKETTHUC is null THEN ns.ngay_thoi_viec ELSE u.NGAYKETTHUC END AS ngayKetThuc , nnkd.ten_Nganh_Nghe_Kd, ns.chuc_Vu_Id, ns.TRANG_THAI AS TRANGTHAINHANSU, ctck.ten_Viet_Tat, u.SOGIAYPHEP,
CASE WHEN u.ngaySinh is null THEN ns.ngay_sinh ELSE u.ngaySinh END AS NGAYSINH, u.CTCK_DICH_VU_ID, u.chucVu as ChucVuNHN,
ROW_NUMBER() OVER (PARTITION BY u.SO_CHUNG_CHI_HNCK,u.soCMT ORDER BY u.SO_CHUNG_CHI_HNCK) AS rownumber, CASE WHEN u.ngayCapCMT is null THEN ns.ngay_cap ELSE u.ngayCapCMT END AS ngayCapCMT,
CASE WHEN ns.noi_cap is null THEN TO_NCHAR(u.noiCapCMT) ELSE ns.noi_cap END AS NoiCapCMT, u.gioitinh, u.QUOCTICH, u.DIACHITHUONGTRU, u.HOKHAUTHUONGTRU,u.NOISINH, u.DIENTHOAI,u.DIDONG, u.EMAIL,
u.TENTIENGANH, u.PHONGBAN, u.CONTENT,cn.ten_day_du as ten_chi_nhanh, pgd.ten_day_du as ten_phong_giao_dich, vpdd.ten_day_du as ten_vpdd, u.tenCongTy as TENCONGTYNHN, u.tenTiengAnh AS TENTIENGANHNHN,
u.tenVietTat AS TENVIETTATNHN, ROW_NUMBER () OVER (PARTITION BY u.CTCK_THONG_TIN_ID  order by u.ctck_thong_tin_id desc) seq_no 
from ctck_nguoi_hanh_nghe_ck u 
left join ctck_thong_tin ctck on u.ctck_thong_tin_id = ctck.ctck_thong_tin_id and ctck.is_bang_tam = 0
left join ctck_nhan_su_cao_cap ns on u.ctck_nhan_su_id = ns.id left join dm_nganh_nghe_kd nnkd on u.dm_nganh_nghe_kd_id = nnkd.id 
left join dm_dich_vu dv on u.ctck_Dich_vu_id = dv.id left join ctck_chi_nhanh cn ON ns.CTCK_CHI_NHANH_ID = cn.CTCK_CHI_NHANH_ID  
left join ctck_phong_giao_dich pgd on ns.ctck_phong_giao_dich_id = pgd.ctck_giao_dich_id 
left join ctck_vp_dai_dien vpdd on ns.ctck_vp_dai_dien_id = vpdd.ctck_vp_dai_dien_id  
where 1=1 AND (ns.trang_Thai_Xoa IS NULL OR ns.trang_Thai_Xoa = 0) 
and u.ctck_Thong_Tin_Id in (843,1122,871,962,1098,842,935,949,925,867,961,869,932,873,942,1109,947,930,920,845,854,874,878,1091,922,895,964,937,
875,1097,945,914,921,894,880,849,901,881,889,940,879,1096,966,1089,931,1088,939,915,957,1113,868,1105,963,1112,917,909,913,948,928,929,944,896,866,946
,923,910,1090,933,886,936,1111,908,912,887,882,918,870,856,1566,965,899,938,864,891,872,893,911,941,892,862,924,926,853,905,865,884,888,863,902,890,907,
934,903,900,860,1574,846) ) e ;






select count(*) from BC_THANH_VIEN where ky_bao_cao = 'TH' and nam_canh_bao = 2020 AND trang_thai in (2,3) and huy_bao_cao = 0;

select *from bc_khai_thac_gt where bc_khai_thac_id = 1659;


Select e.* FROM (SELECT u.id, u.ctck_Thong_Tin_Id , u.ctck_Nhan_Su_Id, u.dm_Nganh_Nghe_Kd_Id, u.SO_CHUNG_CHI_HNCK, u.ngay_Cap_CCHN, u.IS_SYNC, u.THOI_GIAN_SYNC, u.ghi_Chu, u.nguoi_Tao_Id, u.ngay_Tao, u.trang_Thai as TRANGTHAINHN, ctck.ten_tieng_viet, CASE WHEN TO_NCHAR(u.hoTen) is null THEN ns.ho_Ten ELSE TO_NCHAR(u.hoTen) END AS HOTEN,  CASE WHEN TO_NCHAR(u.soCMT) is null THEN ns.so_Cmnd ELSE TO_NCHAR(u.soCMT) END AS SOCMND,  CASE WHEN u.NGAYBATDAU is null THEN ns.ngay_bat_dau_lam_viec ELSE u.NGAYBATDAU END AS ngayBatDau,CASE WHEN u.NGAYKETTHUC is null THEN ns.ngay_thoi_viec ELSE u.NGAYKETTHUC END AS ngayKetThuc , nnkd.ten_Nganh_Nghe_Kd, ns.chuc_Vu_Id, ns.TRANG_THAI AS TRANGTHAINHANSU, ctck.ten_Viet_Tat, u.SOGIAYPHEP, CASE WHEN u.ngaySinh is null THEN ns.ngay_sinh ELSE u.ngaySinh END AS NGAYSINH, u.CTCK_DICH_VU_ID, u.chucVu as ChucVuNHN, ROW_NUMBER() OVER (PARTITION BY u.SO_CHUNG_CHI_HNCK,u.soCMT ORDER BY u.SO_CHUNG_CHI_HNCK) AS rownumber, CASE WHEN u.ngayCapCMT is null THEN ns.ngay_cap ELSE u.ngayCapCMT END AS ngayCapCMT, CASE WHEN ns.noi_cap is null THEN TO_NCHAR(u.noiCapCMT) ELSE ns.noi_cap END AS NoiCapCMT, u.gioitinh, u.QUOCTICH, u.DIACHITHUONGTRU, u.HOKHAUTHUONGTRU,u.NOISINH, u.DIENTHOAI,u.DIDONG, u.EMAIL, u.TENTIENGANH, u.PHONGBAN, u.CONTENT,cn.ten_day_du as ten_chi_nhanh, pgd.ten_day_du as ten_phong_giao_dich, vpdd.ten_day_du as ten_vpdd, u.tenCongTy as TENCONGTYNHN, u.tenTiengAnh AS TENTIENGANHNHN, u.tenVietTat AS TENVIETTATNHN, ROW_NUMBER () OVER (PARTITION BY u.CTCK_THONG_TIN_ID  order by u.ctck_thong_tin_id desc) seq_no from ctck_nguoi_hanh_nghe_ck u left join ctck_thong_tin ctck on u.ctck_thong_tin_id = ctck.ctck_thong_tin_id and ctck.is_bang_tam = 0 left join ctck_nhan_su_cao_cap ns on u.ctck_nhan_su_id = ns.id left join dm_nganh_nghe_kd nnkd on u.dm_nganh_nghe_kd_id = nnkd.id left join dm_dich_vu dv on u.ctck_Dich_vu_id = dv.id left join ctck_chi_nhanh cn ON ns.CTCK_CHI_NHANH_ID = cn.CTCK_CHI_NHANH_ID  left join ctck_phong_giao_dich pgd on ns.ctck_phong_giao_dich_id = pgd.ctck_giao_dich_id left join ctck_vp_dai_dien vpdd on ns.ctck_vp_dai_dien_id = vpdd.ctck_vp_dai_dien_id  where 1=1 AND (ns.trang_Thai_Xoa IS NULL OR ns.trang_Thai_Xoa = 0)and u.ctck_Thong_Tin_Id in (843,1122,871,962,1098,842,935,949,925,867,961,869,932,873,942,1109,947,930,920,845,854,874,878,1091,922,895,964,937,875,1097,945,914,921,894,880,849,901,881,889,940,879,1096,966,1089,931,1088,939,915,957,1113,868,1105,963,1112,917,909,913,948,928,929,944,896,866,946,923,910,1090,933,886,936,1111,908,912,887,882,918,870,856,1566,965,899,938,864,891,872,893,911,941,892,862,924,926,853,905,865,884,888,863,902,890,907,934,903,900,860,1574,846) ) e  where (e.ctck_Thong_Tin_Id = 843) ;


SELECT t1.id, (t1.TEN_VIET_TAT||'-'||t1.TEN_TIENG_VIET) AS CTCK,
	   t1.TEN_VIET_TAT,  t1.SAN_NIEM_YET AS NIEM_YET_TAI,
CASE 
WHEN t1.NIEM_YET=1 THEN 'Không' WHEN t1.NIEM_YET=0 THEN 'Có'
WHEN t1.NIEM_YET IS NULL THEN '?ang tr?ng'
END AS DAI_CHUNG, t1.NGAY_NIEM_YET  FROM CTCK_THONG_TIN t1  WHERE t1.IS_BANG_TAM = 0 AND t1.CTCK_THONG_TIN_ID IN 
(SELECT DISTINCT t1.CTCK_ID FROM LK_NGUOI_DUNG_CTCK t1 JOIN CTCK_THONG_TIN t2 ON NGUOI_DUNG_ID = 2591 AND t1.CTCK_ID = t2.CTCK_THONG_TIN_ID
AND t2.IS_BANG_TAM = 0 AND t2.TRANG_THAI  in (SELECT id FROM DM_TRANG_THAI_CTCK WHERE UPPER(TEN_TRANG_THAI_CTCK) = UPPER('Ho?t ??ng') AND TRANG_THAI =1))
AND LOWER(t1.SAN_NIEM_YET) LIKE :sanNiemYet ORDER BY t1.id DESC;


SELECT 
    DISTINCT u.id,  u.ctck_thong_tin_id,u.ma_so, u.ten_viet_tat,u.ten_tieng_viet,
    u.ten_tieng_anh,u.dia_chi,u.tinh_thanh_id,
    tt.ten_tinh_thanh,u.quan_huyen, u.phuong_xa,u.quoc_gia_id,qt.ten_quoc_tich,u.dien_thoai,u.fax, u.email,
    u.website,u.von_dieu_le,u.ma_so_thue, u.giay_phep_kinh_doanh,u.ngay_cap_gpkd, u.noi_cap_gpkd, u.loai_cong_ty_id,lct.ten_loai_cong_ty, 
    u.so_luong_co_phan,u.nganh_nghe_kinh_doanh,u.niem_yet, u.san_niem_yet,u.ma_chung_khoan, u.ngay_dang_ky_ctdc,u.so_quyet_dinh,
    u.ngay_ket_thuc_ctdc,u.so_quyet_dinh_ket_thuc,u.nguoi_tao_id,u.ngay_tao,u.nguoi_cap_nhat_id,u.ngay_cap_nhat, u.trang_thai,
    ttct.ten_trang_thai_ctck,u.is_bang_tam,u.ngay_niem_yet,u.ma_doanh_nghiep, u.gdtt_trang_thai,u.gdtt_so_quyet_dinh,u.gdtt_ngay_qd, u.gdtt_ly_do,
    u.ghi_chu, u.file_dinh_kem,u.nganh_nghe_kinh_doanh_dc, u.quan_huyen_id,u.phuong_xa_id,
    (SELECT ho_ten FROM ctck_nhan_su_cao_cap WHERE ctck_thong_tin_id = u.ctck_thong_tin_id AND dai_dien_phap_luat = 1 AND trang_thai_xoa = 0 AND TRANG_THAI_NHAN_SU = 1 AND ROWNUM = 1 ) ho_ten, 
    u.giay_chung_nhan, 
    (SELECT CHUC_VU_ID FROM ctck_nhan_su_cao_cap WHERE ctck_thong_tin_id = u.ctck_thong_tin_id AND dai_dien_phap_luat = 1 AND trang_thai_xoa = 0 AND TRANG_THAI_NHAN_SU = 1 AND ROWNUM = 1 ) chuc_vu
FROM ctck_thong_tin u
    LEFT JOIN dm_tinh_thanh tt ON u.tinh_thanh_id = tt.id
    LEFT JOIN dm_quoc_tich qt ON u.quoc_gia_id = qt.id
    LEFT JOIN dm_trang_thai_ctck ttct ON u.trang_thai = ttct.id
    LEFT JOIN dm_loai_cong_ty lct ON u.loai_cong_ty_id = lct.id  where 1=1 and u.is_bang_Tam = 0  and ( LOWER(u.ctck_thong_tin_id) like '%923%') 
    and u.ctck_Thong_Tin_Id in (843,1122,871,962,1098,842,935,949,925,867,961,869,932,873,942,1109,947,930,920,845,854,874,878,1091,922,895,964,937,875,1097,945,914,921
    ,894,880,849,901,881,889,940,879,1096,966,1089,931,1088,939,915,957,1113,868,1105,963,1112,917,909,913,948,928,929,944,896,866,946,923,910,1090,933,886,936,1111,908,
    912,887,882,918,870,856,965,899,938,864,891,872,893,911,941,892,862,924,926,853,905,865,884,888,863,902,890,907,934,903,900,860,846) order by u.ten_viet_tat asc;

SELECT *FROM CTCK_THONG_TIN;


select *from ctck_nguoi_hanh_nghe_ck order by id desc;

Select e.* FROM (SELECT 

 (SELECT LISTAGG(ten_Nganh_Nghe_Kd, ', ') WITHIN GROUP(ORDER BY ten_Nganh_Nghe_Kd) ten_Nganh_Nghe_Kd FROM DM_NGANH_NGHE_KD WHERE ID IN 
 (SELECT regexp_substr(u.dm_Nganh_Nghe_Kd_Id,'[^,]+', 1, level) AS list FROM dual CONNECT BY regexp_substr(u.dm_Nganh_Nghe_Kd_Id, '[^,]+', 1, level) IS NOT NULL)) TEN_NGANH_NGHE_KD_2,
 
u.id, u.ctck_Thong_Tin_Id , u.ctck_Nhan_Su_Id, u.dm_Nganh_Nghe_Kd_Id, u.SO_CHUNG_CHI_HNCK, u.ngay_Cap_CCHN, u.IS_SYNC, u.THOI_GIAN_SYNC, u.ghi_Chu, 
u.nguoi_Tao_Id, u.ngay_Tao, u.trang_Thai as TRANGTHAINHN, ctck.ten_tieng_viet, CASE WHEN TO_NCHAR(u.hoTen) is null THEN ns.ho_Ten ELSE TO_NCHAR(u.hoTen) END AS HOTEN,
CASE WHEN TO_NCHAR(u.soCMT) is null THEN ns.so_Cmnd ELSE TO_NCHAR(u.soCMT) END AS SOCMND,  CASE WHEN u.NGAYBATDAU is null THEN ns.ngay_bat_dau_lam_viec ELSE u.NGAYBATDAU END AS ngayBatDau,
CASE WHEN u.NGAYKETTHUC is null THEN ns.ngay_thoi_viec ELSE u.NGAYKETTHUC END AS ngayKetThuc , nnkd.ten_Nganh_Nghe_Kd, ns.chuc_Vu_Id, ns.TRANG_THAI AS TRANGTHAINHANSU, ctck.ten_Viet_Tat, u.SOGIAYPHEP,
CASE WHEN u.ngaySinh is null THEN ns.ngay_sinh ELSE u.ngaySinh END AS NGAYSINH, u.CTCK_DICH_VU_ID, u.chucVu as ChucVuNHN, ROW_NUMBER() OVER (PARTITION BY u.SO_CHUNG_CHI_HNCK,u.soCMT ORDER BY u.SO_CHUNG_CHI_HNCK) AS rownumber, 
CASE WHEN u.ngayCapCMT is null THEN ns.ngay_cap ELSE u.ngayCapCMT END AS ngayCapCMT, CASE WHEN ns.noi_cap is null THEN TO_NCHAR(u.noiCapCMT) ELSE ns.noi_cap END AS NoiCapCMT, u.gioitinh, u.QUOCTICH, 
u.DIACHITHUONGTRU, u.HOKHAUTHUONGTRU,u.NOISINH, u.DIENTHOAI,u.DIDONG, u.EMAIL, u.TENTIENGANH, u.PHONGBAN, u.CONTENT,cn.ten_day_du as ten_chi_nhanh, pgd.ten_day_du as ten_phong_giao_dich, vpdd.ten_day_du as ten_vpdd, 
u.tenCongTy as TENCONGTYNHN, u.tenTiengAnh AS TENTIENGANHNHN, u.tenVietTat AS TENVIETTATNHN, ROW_NUMBER () OVER (PARTITION BY u.CTCK_THONG_TIN_ID  order by u.ctck_thong_tin_id desc) seq_no 
from ctck_nguoi_hanh_nghe_ck u left join ctck_thong_tin ctck on u.ctck_thong_tin_id = ctck.ctck_thong_tin_id and ctck.is_bang_tam = 0,
left join ctck_nhan_su_cao_cap ns on u.ctck_nhan_su_id = ns.id 
--left join dm_nganh_nghe_kd nnkd on u.dm_nganh_nghe_kd_id = TO_CHAR(nnkd.id) 
left join dm_dich_vu dv on u.ctck_Dich_vu_id = dv.id left join ctck_chi_nhanh cn ON u.CTCK_CHI_NHANH_ID = cn.CTCK_CHI_NHANH_ID 
left join ctck_phong_giao_dich pgd on u.ctck_phong_giao_dich_id = pgd.ctck_giao_dich_id left join ctck_vp_dai_dien vpdd on u.ctck_vp_dai_dien_id = vpdd.ctck_vp_dai_dien_id 
where 1=1 AND (ns.trang_Thai_Xoa IS NULL OR ns.trang_Thai_Xoa = 0)
and u.ctck_Thong_Tin_Id in (843,1122,871,962,1098,842,935,949,925,867,961,869,932,873,942,1109,947,930,920,845,854,874,878,1091,922,895,964,937,875,1097,945,914,921,894,880
,849,901,881,889,940,879,1096,966,1089,931,1088,939,915,957,1113,868,1105,963,1112,917,909,913,948,928,929,944,896,866,946,923,910,1090,933,886,936,1111,908,912,887,882,918,
870,856,1566,965,899,938,864,891,872,893,911,941,892,862,924,926,853,905,865,884,888,863,902,890,907,934,903,900,860,1574,846) ) e ;



  CREATE TABLE LK_NHN_CK_NGANH_NGHE_KD
   (	"NGUOI_HANH_NGHE_CK_ID" NUMBER(10,0) NOT NULL ENABLE, 
	"DM_NGANH_NGHE_ID" NUMBER(10,0) NOT NULL ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
  
  
  SELECT * FROM LK_NHN_CK_NGANH_NGHE_KD;
  select *from ctck_nguoi_hanh_nghe_ck order by id desc;
  
  select *from ctck_chi_nhanh where id = 2143;
  select *from ctck_chi_nhanh where id = 1030;
  
  
  
  
-----

  SELECT * FROM (SELECT tbl1.CTCK_THONG_TIN_ID,
CASE WHEN SUM_HOI_SO IS NULL THEN 0 ELSE SUM_HOI_SO END SUM_HOI_SO,
CASE WHEN SUM_CHI_NHANH IS NULL THEN 0 ELSE SUM_CHI_NHANH END SUM_CHI_NHANH,
CASE WHEN SUM_PGD IS NULL THEN 0 ELSE SUM_PGD END SUM_PGD,
CASE WHEN SUM_VPDD IS NULL THEN 0 ELSE SUM_VPDD END SUM_VPDD
FROM CTCK_THONG_TIN tbl1 LEFT JOIN (SELECT CTCK_THONG_TIN_ID
,SUM(CASE WHEN CTCK_CHI_NHANH_ID IS NULL AND CTCK_PHONG_GIAO_DICH_ID IS NULL AND CTCK_VP_DAI_DIEN_ID IS NULL THEN COUNT_NHN ELSE 0 END) SUM_HOI_SO 
,SUM(CASE WHEN CTCK_CHI_NHANH_ID IS NOT NULL AND CTCK_PHONG_GIAO_DICH_ID IS NULL AND CTCK_VP_DAI_DIEN_ID IS NULL THEN COUNT_NHN ELSE 0 END) SUM_CHI_NHANH
,SUM(CASE WHEN CTCK_CHI_NHANH_ID IS NULL AND CTCK_PHONG_GIAO_DICH_ID IS NOT NULL AND CTCK_VP_DAI_DIEN_ID IS NULL THEN COUNT_NHN ELSE 0 END) SUM_PGD
,SUM(CASE WHEN CTCK_CHI_NHANH_ID IS NULL AND CTCK_PHONG_GIAO_DICH_ID IS NULL AND CTCK_VP_DAI_DIEN_ID IS NOT NULL THEN COUNT_NHN ELSE 0 END) SUM_VPDD
FROM (select t1.CTCK_THONG_TIN_ID, t1.CTCK_CHI_NHANH_ID, t1.CTCK_PHONG_GIAO_DICH_ID, t1.CTCK_VP_DAI_DIEN_ID, t2.DM_NGANH_NGHE_ID
, COUNT(t1.ID) COUNT_NHN
from ctck_nguoi_hanh_nghe_ck t1 
LEFT JOIN LK_NHN_CK_NGANH_NGHE_KD t2 on t2.nguoi_hanh_nghe_ck_id = t1.id
--JOIN ctck_nhan_su_cao_cap t2 ON t1.CTCK_NHAN_SU_ID = t2.ID AND t2.TRANG_THAI = 1 AND t1.ctck_nhan_su_id IS NOT NULL 
GROUP BY t1.CTCK_THONG_TIN_ID, t1.CTCK_CHI_NHANH_ID, t1.CTCK_PHONG_GIAO_DICH_ID, t1.CTCK_VP_DAI_DIEN_ID, t2.DM_NGANH_NGHE_ID) 
GROUP BY CTCK_THONG_TIN_ID) t3 ON tbl1.CTCK_THONG_TIN_ID = t3.CTCK_THONG_TIN_ID AND tbl1.IS_BANG_TAM = 0) tblAll 
WHERE 1=1  AND CTCK_THONG_TIN_ID NOT IN (SELECT CTCK_THONG_TIN_ID FROM CB_CTCK_VI_PHAM WHERE CB_CHI_TIEU_ID = 205 AND TO_CHAR(NGAY_TAO,'ddmmyyyy') = TO_CHAR(CURRENT_DATE,'ddmmyyyy'));


----

SELECT 
    tbl1.CTCK_THONG_TIN_ID,
    CASE WHEN SUM_HOI_SO IS NULL THEN 0 ELSE SUM_HOI_SO END SUM_HOI_SO,
    CASE WHEN SUM_CHI_NHANH IS NULL THEN 0 ELSE SUM_CHI_NHANH END SUM_CHI_NHANH,
    CASE WHEN SUM_PGD IS NULL THEN 0 ELSE SUM_PGD END SUM_PGD,
    CASE WHEN SUM_VPDD IS NULL THEN 0 ELSE SUM_VPDD END SUM_VPDD
FROM CTCK_THONG_TIN tbl1 
    LEFT JOIN (SELECT CTCK_THONG_TIN_ID,SUM(CASE WHEN CTCK_CHI_NHANH_ID IS NULL AND CTCK_PHONG_GIAO_DICH_ID IS NULL AND CTCK_VP_DAI_DIEN_ID IS NULL THEN COUNT_NHN ELSE 0 END) SUM_HOI_SO 
    ,SUM(CASE WHEN CTCK_CHI_NHANH_ID IS NOT NULL AND CTCK_PHONG_GIAO_DICH_ID IS NULL AND CTCK_VP_DAI_DIEN_ID IS NULL THEN COUNT_NHN ELSE 0 END) SUM_CHI_NHANH
    ,SUM(CASE WHEN CTCK_CHI_NHANH_ID IS NULL AND CTCK_PHONG_GIAO_DICH_ID IS NOT NULL AND CTCK_VP_DAI_DIEN_ID IS NULL THEN COUNT_NHN ELSE 0 END) SUM_PGD
    ,SUM(CASE WHEN CTCK_CHI_NHANH_ID IS NULL AND CTCK_PHONG_GIAO_DICH_ID IS NULL AND CTCK_VP_DAI_DIEN_ID IS NOT NULL THEN COUNT_NHN ELSE 0 END) SUM_VPDD
FROM (select t1.CTCK_THONG_TIN_ID, t2.CTCK_CHI_NHANH_ID, t2.CTCK_PHONG_GIAO_DICH_ID, t2.CTCK_VP_DAI_DIEN_ID, t1.DM_NGANH_NGHE_KD_ID
, COUNT(t1.ID) COUNT_NHN
from ctck_nguoi_hanh_nghe_ck t1 
JOIN ctck_nhan_su_cao_cap t2 ON t1.CTCK_NHAN_SU_ID = t2.ID AND t2.TRANG_THAI = 1 AND t1.ctck_nhan_su_id IS NOT NULL 
GROUP BY t1.CTCK_THONG_TIN_ID, t2.CTCK_CHI_NHANH_ID, t1.DM_NGANH_NGHE_KD_ID, t2.CTCK_PHONG_GIAO_DICH_ID, t2.CTCK_VP_DAI_DIEN_ID) 
GROUP BY CTCK_THONG_TIN_ID) t3 ON tbl1.CTCK_THONG_TIN_ID = t3.CTCK_THONG_TIN_ID AND tbl1.IS_BANG_TAM = 0;


SELECT CTCK_THONG_TIN_ID,
    SUM(CASE WHEN CTCK_CHI_NHANH_ID IS NULL AND CTCK_PHONG_GIAO_DICH_ID IS NULL AND CTCK_VP_DAI_DIEN_ID IS NULL THEN COUNT_NHN ELSE 0 END) SUM_HOI_SO,
    SUM(CASE WHEN CTCK_CHI_NHANH_ID IS NOT NULL AND CTCK_PHONG_GIAO_DICH_ID IS NULL AND CTCK_VP_DAI_DIEN_ID IS NULL THEN COUNT_NHN ELSE 0 END) SUM_CHI_NHANH,
    SUM(CASE WHEN CTCK_CHI_NHANH_ID IS NULL AND CTCK_PHONG_GIAO_DICH_ID IS NOT NULL AND CTCK_VP_DAI_DIEN_ID IS NULL THEN COUNT_NHN ELSE 0 END) SUM_PGD,
    SUM(CASE WHEN CTCK_CHI_NHANH_ID IS NULL AND CTCK_PHONG_GIAO_DICH_ID IS NULL AND CTCK_VP_DAI_DIEN_ID IS NOT NULL THEN COUNT_NHN ELSE 0 END) SUM_VPDD
    FROM (select t1.CTCK_THONG_TIN_ID, t1.CTCK_CHI_NHANH_ID, t1.CTCK_PHONG_GIAO_DICH_ID, t1.CTCK_VP_DAI_DIEN_ID, t1.DM_NGANH_NGHE_KD_ID,
    COUNT(t1.ID) COUNT_NHN
from ctck_nguoi_hanh_nghe_ck t1 
JOIN ctck_nhan_su_cao_cap t2 ON t1.CTCK_NHAN_SU_ID = t2.ID AND t2.TRANG_THAI = 1 AND t1.ctck_nhan_su_id IS NOT NULL 
GROUP BY t1.CTCK_THONG_TIN_ID, t1.CTCK_CHI_NHANH_ID, t1.DM_NGANH_NGHE_KD_ID, t1.CTCK_PHONG_GIAO_DICH_ID, t1.CTCK_VP_DAI_DIEN_ID) 
GROUP BY CTCK_THONG_TIN_ID;



-----------------------------------
