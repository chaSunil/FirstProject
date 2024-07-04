/*
drop table assessment
drop view assessment_view
drop sequence seq_assessment_idx
게임평 DB
-- 시퀀스
create sequence seq_assessment_idx
-- 방명록 테이블 생성
create table assessment
(
    a_idx           int,                        -- 댓글번호
    a_regdate       date,                       -- 작성일자
    a_ip            varchar2(100)   not null,   -- 아이피
    a_content       varchar2(2000)  not null,   -- 내용
    mem_idx         int,                        -- 회원번호
    mem_nickname    varchar2(100)   not null,    -- 회원닉네임
    a_cate			varchar2(1000)  not null	-- 카테고리
)   
    
-- 기본키
alter table assessment
    add constraint pk_assessment_idx primary key(a_idx) ;
-- 외래키
alter table assessment
    add constraint fk_assessment_mem_idx    foreign key(mem_idx) 
                                        references member(mem_idx) 
                                        on delete cascade -- 회원을 삭제할 때, 올린 게시물까지 삭제하는 방법(부모키를 죽이면 자식 키들도 다 죽임)                                           
                                           
    
select * from assessment_view

create or replace view assessment_view
as
    select
        rownum as a_no, a.*
    from
        (select * from assessment order by a_idx desc) a    
                
*/