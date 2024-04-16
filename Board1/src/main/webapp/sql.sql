create table board_tbl(
idx number(6) not null primary key,
writer varchar2(20),
subject varchar2(255),
content CLOB,
date1 timestamp,
crystal timestamp
);

insert into board_tbl values(emp_seq.NEXTVAL, '조종찬', '인생 망했다', '너무 졸립고 힘들다', '2024-03-22 10:33:34','');

drop table board_tbl;
drop table comment_tbl ;

select * from board_tbl order by date1;

insert into board_tbl values(1, '김상일', '정보처리산업기사 쉽다', 'JSP 쉽네용', '2018-07-31 12:34:56', '');
insert into board_tbl values(2, '김상일', '웹 디자인 기능사 어렵다', '제이쿼리 어렵다', '2018-07-31 12:43:43', '');
insert into board_tbl values(3, '이도제', '정보처리산업기사 어렵다', 'JSP 어렵다', '2018-08-01 13:34:56', '');
insert into board_tbl values(4, '이도제', '정보처리기사 쉽다.', '제이쿼리 쉽다', '2018-08-01 13:43:34', '');
insert into board_tbl values(5, '박상일', '최신 머신러닝', '머신러닝어렵다', '2018-08-02 13:12:10', '');
insert into board_tbl values(6, '박상일', '텐서플로우 배우자', '텐서플로우 쉽다', '2018-08-03 14:34:20', '');
insert into board_tbl values(7, '강도제', '하드코딩하는 사람들', '가입하면 좋다', '2018-08-04 14:56:30', '');
insert into board_tbl values(8, '나도제', '깃허브를 사용하자', '신세계', '2018-08-05 15:43:35', '');
insert into board_tbl values(9, '문도제', '노는게 제일좋아', '모두모두 모여라', '2018-08-06 16:21:40', '');
insert into board_tbl values(10, '지도제', '가을아', '부탁해', '2018-08-07 17:01:45', '');

create table comment_tbl(
idx number(6) not null primary key,
b_idx  number(6), 
writer varchar2(20),
content CLOB,
date1 timestamp,
foreign key (b_idx) references board_tbl(idx)
);

insert into comment_tbl values(1, 1, '김상일', 'Lorem ipsum dolor sit amet', '2018-07-31 12:34:56');
insert into comment_tbl values(2, 3, '김상일', 'consectetur adipiscing elit', '2018-07-31 12:43:43');
insert into comment_tbl values(3, 5, '이도제', 'sed do eiusmod tempor', '2018-08-01 13:34:56');
insert into comment_tbl values(4, 7, '이도제', 'incididunt ut labore et', '2018-08-01 13:43:34');
insert into comment_tbl values(5, 9, '박상일', 'dolore magna aliqua', '2018-08-02 13:12:10');
insert into comment_tbl values(6, 2, '박상일', 'minim veniam, quis nostrud', '2018-08-03 14:34:20');
insert into comment_tbl values(7, 3, '강도제', 'exercitation ullamco laboris', '2018-08-04 14:56:30');
insert into comment_tbl values(8, 5, '나도제', 'nisi ut aliquip', '2018-08-05 15:43:35');
insert into comment_tbl values(9, 7, '문도제', 'ex ea commodo consequat', '2018-08-06 16:21:40');
insert into comment_tbl values(10, 2, '지도제', 'Duis aute irure dolor', '2018-08-07 17:01:45');

select
c.writer,
c.content,
c.date1
from board_tbl b, comment_tbl c
where b.idx = c.b_idx
order by c.date1;

CREATE SEQUENCE emp_seq
       INCREMENT BY 1
       START WITH 11
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;
       
       CREATE SEQUENCE con_seq
       INCREMENT BY 1
       START WITH 11
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;