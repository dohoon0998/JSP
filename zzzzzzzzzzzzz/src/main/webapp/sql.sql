create table userTBL(
useID varchar2(8) not null primary key,
userName varchar2(10),
birthYear varchar2(4),
addr char(6),
mobile1 char(3),
mobile2 char(8),
height number(3),
mDate date
);

insert into userTBL values('yjs','유재석','1972','서울','010'	,'11111111',178,'2008-8-8');
insert into userTBL values('khd','강호동','1970','서울','010'	,'22222222',182,'2008-8-8');
insert into userTBL values('kkj','김국진','1965','서울','010'	,'33333333',171,'2008-8-8');
insert into userTBL values('kym','김용만','1967','서울','010'	,'44444444',177,'2008-8-8');
insert into userTBL values('kid','김제동','1974','서울',''		,''			,173,'2008-8-8');
insert into userTBL values('nhs','남희석','1971','서울','010'	,'66666666',180,'2008-8-8');
insert into userTBL values('sdy','신동엽','1971','서울',''		,''			,176,'2008-8-8');
insert into userTBL values('lhj','이휘재','1972','서울','010'	,'88888888',180,'2008-8-8');
insert into userTBL values('lkk','이경규','1972','서울','010'	,'99999999',170,'2008-8-8');
insert into userTBL values('psh','박수홍','1972','서울','010'	,'00000000',183,'2008-8-8');