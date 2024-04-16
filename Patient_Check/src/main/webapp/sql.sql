select r.p_no, p.p_name, l.t_name, r.t_sdate, r.t_status, r.t_ldate, r.t_result from tbl_result_202004 r, tbl_patient_202004 p, tbl_lab_test_202004 l where r.p_no = p.p_no and r.t_code = l.t_code

select distinct p.p_city, COUNT(*) AS row_count 
from tbl_result_202004 re join tbl_patient_202004 p on re.p_no = p.p_no 
GROUP BY p_city order by p.p_city

select p.p_city, count(p.p_no) as total from tbl_result_202004 r, tbl_patient_202004 p where r.p_no = p.p_no group by p.p_city order by p.p_city;



create table tbl_patient_202004 (
p_no char(4) not null primary key,
p_name varchar(20),
p_birth char(8),
p_gender char(1),
p_tel1 char(3),
p_tel2 char(4),
p_tel3 char(4),
p_city char(2)
);

create table tbl_result_202004(
p_no char(4) not null,
t_code char(4),
t_sdate date,
t_status char(4),
t_ldate date,
t_result char(4),
primary key(p_no, t_code, t_sdate)
);





select p.p_city, count(r.p_no) 
from tbl_patient_202004 p, tbl_result_202004 r
where p.p_no = r.p_no
group by p.p_city 
order by p.p_city;

















