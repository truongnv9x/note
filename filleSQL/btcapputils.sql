SELECT a.* FROM VBDT_TOPIC a INNER JOIN CATEGORIES b ON b.ID = a.CATEGORIES_ID  WHERE b.MODULE = 'VBDT' AND b.DELETED = 0 AND b.STATUS = 1  and (  a.SUGGESTION <> 1   or a.EXPRIDATE is null )  and a.deleted = 0  and a.DEPARTMENT_ID = 1  and a.LANG = 'v1'  ORDER BY a.PUBLISHED_DATE DESC;

select *from VBDT_SUGGESTION order by id desc;
select *from VBDT_SUGGESTION where title like 'Góp ý TT h??ng d?n N? s?a ??i N? 163/2018/N?-CP';

select *from VBDT_TOPIC;

select *from VBDT_TOPIC WHERE ID = 15440;