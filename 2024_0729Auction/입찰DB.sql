/*

create sequence seq_bid_idx

create table bid
(
	b_idx			int,					-- 입찰(구매) 번호
	b_bid_price		int,					-- 입찰 가격
	b_regtime		date default sysdate,	-- 입찰 일시
	b_sledding		varchar2(1)	not null,	-- 입찰 상태(입찰 중'y', 완료/입찰x 'n')
	item_idx		int,					-- 아이템일련번호(거래번호)
	gumae_mem_idx   int						-- 입찰에 들어가있는 멤버
)

alter table bid
	add constraint pk_bid_idx primary key(b_idx);

alter table bid
	add constraint fk_bid_item_idx foreign key(item_idx)
								   references items(item_idx);	
								   	
alter table bid
	add constraint fk_bid_mem_idx foreign key(mem_idx)
								   references member(mem_idx);		


    
    
insert into bid values(
					seq_bid_idx.nextVal,
					#{ a_initial_price },
					sysdate,
					'y',
					#{ item_idx }
					)
					
select * from bid

				
    
    
-- 이거 추가해서 넣으면 된다.
create or replace view auction_list_view
    as
    select
        t.*,a.a_idx,a.a_initial_price,a.a_direct_price,a_regtime,a_selltime,a_sledding,mem_idx,mem_name,a.item_idx as itemno,
        b.b_idx,b.b_bid_price,b.b_regtime,b.b_sledding,b.gumae_mem_idx
    from trade_order_by_view t inner join auction a on t.item_idx = a.item_idx
    inner join bid b on t.item_idx = b.item_idx	

        update bid
        set gumae_mem_idx = 1 ,
        b_bid_price = 10000
        where item_idx = 95

*/