SELECT
    ctck_thong_tin_id,
    ten_viet_tat,
    ten_tieng_viet,
    (
        SELECT
            COUNT(DISTINCT nguoi_dung_id)
        FROM
            lk_nguoi_dung_ctck
        WHERE
            ctck_id = ctck_thong_tin_id
    ) so_luong
FROM
    ctck_thong_tin
WHERE
    is_bang_tam = 0;



SELECT
    COUNT(DISTINCT nguoi_dung_id)
FROM
    lk_nguoi_dung_ctck
WHERE
    ctck_id = 961;