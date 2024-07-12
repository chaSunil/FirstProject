/*

-- 일련번호 관리객체
create sequence seq_photo_idx

select * from photo

-- 테이블 생성
create table photo
(
	p_idx	   int,						-- 일련번호
	p_title	   varchar2(200)  not null,	-- 제목
	p_content  varchar2(2000) not null,	-- 내용
	p_filename varchar2(200)  not null, -- 화일명
	p_ip	   varchar2(100)  not null,	-- 아이피
	p_regdate  date,					-- 등록일자
	mem_idx	   int,						-- 회원번호
	mem_name   varchar2(100)  not null	-- 회원명
)

-- 기본키
alter table photo
	add constraint pk_photo_idx primary key(p_idx) ;
	
-- 외래키
alter table photo
	add constraint fk_photo_mem_idx	 foreign key(mem_idx) 
									 references member(mem_idx) 
									 on delete cascade -- 회원을 삭제할 때, 올린 게시물까지 삭제하는 방법(부모키를 죽이면 자식 키들도 다 죽임)
									 
									 

									 
	
	





*/