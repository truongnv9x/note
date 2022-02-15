SELECT 
     u.id, u.ctck_thong_tin_id,u.ma_so, u.ten_viet_tat,u.ten_tieng_viet,u.ten_tieng_anh,u.dia_chi,u.tinh_thanh_id,
    tt.ten_tinh_thanh,u.quan_huyen, u.phuong_xa,u.quoc_gia_id,qt.ten_quoc_tich,u.dien_thoai,u.fax, u.email,
    u.website,u.von_dieu_le,u.ma_so_thue, u.giay_phep_kinh_doanh,u.ngay_cap_gpkd, u.noi_cap_gpkd, u.loai_cong_ty_id,lct.ten_loai_cong_ty, 
    u.so_luong_co_phan,u.nganh_nghe_kinh_doanh,u.niem_yet, u.san_niem_yet,u.ma_chung_khoan, u.ngay_dang_ky_ctdc,u.so_quyet_dinh,
    u.ngay_ket_thuc_ctdc,u.so_quyet_dinh_ket_thuc,u.nguoi_tao_id,u.ngay_tao,u.nguoi_cap_nhat_id,u.ngay_cap_nhat, u.trang_thai,
    ttct.ten_trang_thai_ctck,u.is_bang_tam,u.ngay_niem_yet,u.ma_doanh_nghiep, u.gdtt_trang_thai,u.gdtt_so_quyet_dinh,u.gdtt_ngay_qd, u.gdtt_ly_do,
    u.ghi_chu, u.file_dinh_kem,u.nganh_nghe_kinh_doanh_dc, u.quan_huyen_id,u.phuong_xa_id, t1.ho_ten, u.giay_chung_nhan , t1.chuc_vu_id 
FROM ctck_thong_tin u
    LEFT JOIN dm_tinh_thanh tt ON u.tinh_thanh_id = tt.id
    LEFT JOIN dm_quoc_tich qt ON u.quoc_gia_id = qt.id
    LEFT JOIN dm_trang_thai_ctck ttct ON u.trang_thai = ttct.id
    LEFT JOIN dm_loai_cong_ty lct ON u.loai_cong_ty_id = lct.id 
    LEFT JOIN(SELECT DisTINCT CTCK_THONG_TIN_ID, HO_TEN, CHUC_VU_ID,dai_dien_phap_luat,trang_thai_xoa FROM ctck_nhan_su_cao_cap
        WHERE dai_dien_phap_luat = 1 AND trang_thai_xoa = 0 
        AND CTCK_CHI_NHANH_ID is null AND CTCK_PHONG_GIAO_DICH_ID IS NULL AND CTCK_VP_DAI_DIEN_ID IS NULL)t1
            ON u.ctck_thong_tin_id = t1.CTCK_THONG_TIN_ID  
    where 1=1 and u.is_bang_Tam = 0 
            and u.ctck_Thong_Tin_Id in (843,1122,871,962,1098,842,935,949,925,867,961,869,932,873,942,1109,947,930,920,845,854,874,878,1091,922,895,964,937,875,1097,945,914,921,894,880,849,901,881,889,940,879,1096,966,1089,931,1088,939,915,957,1113,868,1105,963,1112,917,909,913,948,928,929,944,896,866,946,923,910,1090,933,886,936,1111,908,912,887,882,918,870,856,1566,965,899,938,864,891,872,893,911,941,892,862,924,926,853,905,865,884,888,863,902,890,907,934,903,900,860,846) order by u.ten_viet_tat asc;
            

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
    LEFT JOIN dm_loai_cong_ty lct ON u.loai_cong_ty_id = lct.id 
            where 1=1 and u.is_bang_Tam = 0 ;