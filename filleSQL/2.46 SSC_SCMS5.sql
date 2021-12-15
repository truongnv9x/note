SELECT
    *
FROM ( SELECT
    t1.*,ROWNUM AS rnum
FROM ( SELECT
    u.id,u.ctck_Thong_Tin_Id,u.ctck_Chi_Nhanh_Id,u.ho_Ten,u.gioi_Tinh,u.trang_Thai_Nhan_Su,u.dia_Chi,u.so_Cmnd,u.ngay_Cap,u.noi_Cap
   ,u.ngay_Sinh,u.noi_Sinh,u.dm_Quoc_Tich_Id,qt.ten_Quoc_Tich,u.dien_Thoai,u.fax,u.email,u.chuc_Vu_Id,u.email_Cong_Bo_Tt,u.loai_Co_Dong
   ,u.ngay_Bat_Dau_Lam_Viec,u.ghi_Chu,u.nguoi_Tao_Id,u.ngay_Tao,u.nguoi_Cap_Nhat_Id,u.ngay_Cap_Nhat,u.trang_Thai,u.is_bang_tam,u
    .ctck_Phong_Giao_Dich_Id,u.ctck_Vp_Dai_Dien_Id,u.phong_Ban,u.ngay_Thoi_Viec,u.noi_Dung_Bao_Cao,ctck.ten_Viet_Tat
|| '- '
|| ctck.ten_Tieng_Viet AS ten_cong_ty,cn.ten_Day_Du     AS td1,pdg.ten_Day_Du    AS td2,vpdd.ten_Day_Du   AS td3,u.chung_Chi_Hanh_Nghe,u.nguoi_Cong_Bo_Thong_Tin
,ctck.ten_Viet_Tat,u.file_Dinh_Kem,nd.ho_Ten         AS ht1,nd1.ho_Ten        AS ht2,ROW_NUMBER() OVER(
        PARTITION BY u.CTCK_THONG_TIN_ID
        ORDER BY
            u.ctck_Thong_Tin_Id DESC
    ) seq_no
FROM
    ctck_nhan_su_cao_cap u
    LEFT JOIN dm_quoc_tich qt ON u.dm_Quoc_Tich_Id = qt.id
    LEFT JOIN ctck_thong_tin ctck ON u.ctck_Thong_Tin_Id = ctck.ctck_Thong_Tin_Id
                                     AND ctck.is_bang_tam = 0
    LEFT JOIN ctck_chi_nhanh cn ON u.ctck_Chi_Nhanh_Id = cn.ctck_Chi_Nhanh_Id
    LEFT JOIN ctck_phong_giao_dich pdg ON u.ctck_Phong_Giao_Dich_Id = pdg.ctck_Giao_Dich_Id
    LEFT JOIN ctck_vp_dai_dien vpdd ON u.ctck_Vp_Dai_Dien_Id = vpdd.ctck_Vp_Dai_Dien_Id
    LEFT JOIN qt_nguoi_dung nd ON u.nguoi_Tao_Id = nd.id
    LEFT JOIN qt_nguoi_dung nd1 ON u.nguoi_Cap_Nhat_Id = nd1.id
WHERE
    1 = 1
    AND u.trang_Thai_Xoa = 0
    AND ( ( LOWER(u.ho_Ten) LIKE '%an bình%' )
          or ( LOWER(ctck.ten_tieng_viet) LIKE '%an bình%' )
                OR ( LOWER(u.so_Cmnd) LIKE '%an bình%' ) )
              AND u.ctck_Thong_Tin_Id IN (
        843,1122,871,962,1098,842,935,949,925,867,961,869,932,873,942,1109,947,930,920,845,854,874,878,1091,922,895,964,937,875,1097
       ,945,914,921,894,880,849,901,881,889,940,879,1096,966,1089,931,1088,939,915,957,1113,868,1105,963,1112,917,909,913,948,928
       ,929,944,896,866,946,923,910,1090,933,886,936,1111,908,912,887,882,918,870,856,965,899,938,864,891,872,893,911,941,892,862
       ,924,926,853,905,865,884,888,863,902,890,907,934,903,900,860,846
    ) )t1 ) order by rnum asc ;
    
    
    
    