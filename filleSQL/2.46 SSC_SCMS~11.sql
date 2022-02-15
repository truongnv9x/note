select *from ctck_nhan_su_cao_cap where id = 7779;

select *from CTCK_NGUOI_HANH_NGHE_CK;

select *from CTCK_NGUOI_HANH_NGHE_CK where hoTen like '%Tr??ng Minh Giám%';

select *from ctck_thong_tin where ctck_thong_tin_id = 1122;

select *from qt_nguoi_dung where tai_khoan like 'truongnv';

select *from ctck_nhan_su_cao_cap where ctck_thong_tin_id = 1122 and nguoi_tao_id = 2591;

select *from CTCK_NGUOI_HANH_NGHE_CK where ctck_thong_tin_id = 1122 and nguoi_tao_id = 2591;

select *from ctck_nhan_su_cao_cap where id = 8607;

select *from CTCK_NGUOI_HANH_NGHE_CK where id like '92860';

delete from CTCK_NGUOI_HANH_NGHE_CK where hoTen like 'nguyen van a';
commit;

select *from ctck_nhan_su_cao_cap where ctck_thong_tin_id = 1122 and nguoi_tao_id = 2591;

select *from ctck_nhan_su_cao_cap where ho_ten like 'Tr?n Thi?n Th?';

select *from CTCK_NGUOI_HANH_NGHE_CK where ctck_nhan_su_id = 8291;

delete from CTCK_NGUOI_HANH_NGHE_CK where id = 92856;
commit;

select *from CTCK_NGUOI_HANH_NGHE_CK where gioitinh is null;

select *from ctck_thong_tin where ctck_thong_tin_id = 842;
select *from QLRR_KBC_CTCK_CHI_TIET;

select *from QLRR_KY_BAO_CAO;

Select *From QLRR_KBC_CTCK_CHI_TIET where 1=1 and ( QLRR_KBC_CTCK_ID  in  (2219, 1069, 2560))  order by id desc
