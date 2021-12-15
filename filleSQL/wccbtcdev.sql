Select DateADD('dd' , -10, to_date('05/APR/2004')) from dual;

select * from TVS_CONTENT_TO_SPEECH WHERE CREATED_DATE + 6 > SYSDATE;


select count(*) from TVS_CONTENT_TO_SPEECH;

select *from TVS_CONTENT_TO_SPEECH WHERE DDOCNAME LIKE 'MOFUCM1';

delete from TVS_CONTENT_TO_SPEECH where VOICE_TYPE in ('v2','v3');
commit;