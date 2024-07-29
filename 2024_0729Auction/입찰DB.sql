/*

create sequence seq_bid_idx

create table bid
(
	b_idx			int,					-- 입찰(구매) 번호
	b_bid_price		int,					-- 입찰 가격
	b_regtime		date default sysdate,	-- 입찰 일시
	b_sledding		varchar2(1)	not null,	-- 입찰 상태(입찰 중'y', 완료/입찰x 'n')
	item_idx		int,					-- 아이템일련번호(거래번호)
	mem_idx			int,					-- 입찰자회원번호
	mem_name		varchar2(100) not null,	-- 입찰자명
	mem_point		int						-- 입찰자 포인트
)

alter table bid
	add constraint pk_bid_idx primary key(b_idx);

alter table bid
	add constraint fk_bid_item_idx foreign key(item_idx)
								   references items(item_idx);	
								   	
alter table bid
	add constraint fk_bid_mem_idx foreign key(mem_idx)
								   references member(mem_idx);		

create or replace view bid_list_view
    as
    select
        t.*,b.b_idx,b.b_bid_price,b_regtime,b_sledding,mem_idx,mem_name,b.item_idx as itemno
    from trade_order_by_view t inner join bid b on t.item_idx = b.item_idx 

*/