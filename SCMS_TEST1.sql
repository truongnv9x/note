SELECT
    *
FROM
    (
        SELECT
            t1.id,
            ( t1.ten_viet_tat
              || '-'
              || t1.ten_tieng_viet ) AS ctck,
            t1.ten_viet_tat,
            t3.ten_nganh_nghe_kd,
            t4.ten_trang_thai_ctck
        FROM
            ctck_thong_tin       t1
         JOIN (
                SELECT
                    ctck_id AS ctck_id,
                    LISTAGG(t2.id, ',') WITHIN GROUP(
                        ORDER BY
                            t2.id
                    ) AS nganh_nghe_kd_id,
                    LISTAGG(t2.ten_nganh_nghe_kd, ',') WITHIN GROUP(
                        ORDER BY
                            nganh_nghe_kd_id
                    ) AS ten_nganh_nghe_kd
                FROM
                    lk_ctck_nganh_nghe_kd   t1
                    JOIN dm_nganh_nghe_kd        t2 ON t1.nganh_nghe_kd_id = t2.id
                                                AND t1.trang_thai = 1
                                                Where t1.nganh_nghe_kd_id IN (
                4,
                3
            )
                GROUP BY
                    ctck_id
            ) t3 ON t3.ctck_id = t1.ctck_thong_tin_id
            JOIN dm_trang_thai_ctck   t4 ON t1.trang_thai = t4.id
        WHERE
            t1.is_bang_tam = 0
            AND t1.ctck_thong_tin_id IN (
                SELECT DISTINCT
                    ctck_id
                FROM
                    lk_nguoi_dung_ctck   t1
                    JOIN ctck_thong_tin       t2 ON nguoi_dung_id = 754
                                              AND t1.ctck_id = t2.ctck_thong_tin_id
                                              AND t2.is_bang_tam = 0
            )
           
        ORDER BY
            t1.id DESC
    )
WHERE
    ROWNUM <= 10;