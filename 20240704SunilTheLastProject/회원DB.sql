/*
drop table member
drop sequence seq_member_idx
-- 일련 번호 시퀀스 관리객체
create sequence seq_member_idx
create table member
(
    mem_idx             int,                        -- 회원번호
    mem_name            varchar2(100) not null,     -- 이름
    mem_id              varchar2(100) not null,     -- 아이디
    mem_pwd             varchar2(100) not null,     -- 비밀번호
    mem_nickname        varchar2(100) not null,     -- 닉네임
    mem_zipcode         char(5)       not null,     -- 우편번호
    mem_addr            varchar2(1000)not null,     -- 주소
    mem_ip              varchar2(100) not null,     -- 아이피
    mem_regdate         date default sysdate,       -- 가입일자
    mem_grade           varchar2(100) default '일반'-- 회원등급
)
-- 기본키
alter table member
    add constraint pk_member_idx primary key(mem_idx);
    
-- 아이디(unique)
    
alter table member
    add constraint unique_member_id unique(mem_id);
    
-- 닉네임(nickname)
    
alter table member
    add constraint unique_member_nickname unique(mem_nickname);
-- 회원등급(check)
alter table member
    add constraint ck_member_grade check(mem_grade in ('일반','관리자'));
insert into member values(seq_member_idx.nextVal,'일정환','asdf','1234','일정환','00000','서울시 양작구','localhost',default,default)
insert into member values(seq_member_idx.nextVal,'관리자','admin','admin','관리자','00000','서울시 양작구','localhost',default,'관리자')   
select * from member          
*/