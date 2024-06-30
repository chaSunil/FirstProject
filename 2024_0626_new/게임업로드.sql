

-- 일련 번호 시퀀스 관리객체
create sequence seq_profile_idx
	

-- 테이블 생성

create table profile
(
	p_idx		int,						-- 일련번호
	p_content	varchar2(2000) default '멋진 나만의 한줄평으로 나를 소개해보세요',	-- 한줄평
	b_filename	varchar2(200) default 'member_background.jpg',	-- 백그라운드 파일명
	p_filename	varchar2(200) default 'member_icon.png',		-- 프로필 파일명
	p_ip		varchar2(100) not null,		-- 아이피
	mem_idx		int,						-- 작성자
	mem_name	varchar2(100) not null,		-- 회원명
	mem_nickname varchar2(100) not null	-- 회원닉네임
)

alter table profile
	add constraint pk_profile_idx primary key(p_idx);
	
drop table profile

select * from profile
	
alter table profile
	add constraint fk_profile_mem_idx foreign key(mem_idx)
								references member(mem_idx)
								
select * from member

insert into profile values(seq_profile_idx.nextVal,
default,default,default,'192.168.219.170',22,'김회원','킹자반');								