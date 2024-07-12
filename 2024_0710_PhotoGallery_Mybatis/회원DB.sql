/*

--일련(회원)번호 관리객체
create sequence seq_member_idx

-- 회원테이블
create table member 
(
	mem_idx		int,								-- 회원번호
	mem_name	varchar2(100) 	not null,			-- 회원명
	mem_id		varchar2(100) 	not null,			-- 아이디
	mem_pwd		varchar2(100) 	not null,			-- 비밀번호
	mem_zipcode	char(5)	  		not null,			-- 우편번호(5자리 고정)
	mem_addr	varchar2(1000)  not null,			-- 주소
	mem_ip		varchar2(100)	not null,			-- 아이피
	mem_regdate	date			default sysdate,	-- 가입일자
	mem_grade	varchar2(100)	default '일반'		-- 회원등급
)

-- 기본키
alter table member
	add constraint pk_member_idx	primary key(mem_idx);
	
-- 아이디(unique)
alter table member
	add constraint unique_member_id unique(mem_id) ;

-- 회원등급(check)
alter table member
	add constraint ck_member_grade check(mem_grade in('일반','관리자'));		
	
-- sample data
insert into member values(seq_member_idx.nextVal, 
						  '김관리',
						  'admin', 
						  'admin', 
						  '00000', 
						  '서울시 관악구',
						  '127.0.0.1',
						  sysdate,
						  '관리자' 
						  );
						  
insert into member values(seq_member_idx.nextVal, 
						  '일길동',
						  'one', 
						  '1234', 
						  '00000', 
						  '서울시 관악구',
						  '127.0.0.1',
						  default,
						  default 
						  );
delete from member where mem_idx = 15
select * from member						  						  

*/