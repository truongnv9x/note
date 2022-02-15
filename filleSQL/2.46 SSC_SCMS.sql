select id, ctck_thong_tin_id, data from CBTT_BAO_CAO where id = 16694;


select *  from CBTT_BAO_CAO where id = 16727;

select count(*) from ctck_nguoi_hanh_nghe_ck where is_sync = false;

select * from ctck_nguoi_hanh_nghe_ck where is_sync = 0 and (trang_thai_xoa is null or  trang_thai_xoa = 0);
select * from ctck_nhan_su_cao_cap where trang_thai_xoa = 0;
select * from ctck_nguoi_hanh_nghe_ck where trang_thai_xoa = 0;

update ctck_nguoi_hanh_nghe_ck set trang_thai_xoa = 0 where trang_thai_xoa = 1;
commit;


select *from CTCK_HS_LICH_SU;

select *from ctck_thong_tin where ctck_thong_tin_id = 843;

select *from ctck_thong_tin where ten_TIENG_VIET like '%XYZ%';

select *from ctck_chi_nhanh where ten_day_du like 'Test';

delete from ctck_chi_nhanh where ten_day_du like 'Test';
commit;

SELECT c.id ,c.ten_co_dong FROM CTCK_CO_DONG c WHERE (c.ctck_Thong_Tin_Id = 842);

SELECT c.id ,c.ten_co_dong FROM CTCK_CO_DONG c WHERE c.id = 1488;

select *from ctck_nhan_su_cao_cap;

select *From dm_chuc_vu;

select *from ctck_chi_nhanh order by id desc;

commit;



SELECT * FROM CTCK_NGUOI_HANH_NGHE_CK WHERE so_chung_chi_hnck LIKE '003020' OR so_chung_chi_hnck LIKE '003020/MGCK';
