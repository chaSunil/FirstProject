/*

drop sequence seq_auction_idx

drop table auction


create sequence seq_auction_idx

create table auction
(
	a_idx				int,					-- 경매(판매)번호
	a_initial_price		int default 0,			-- 최초경매가
	a_direct_price		int default 0,			-- 즉시구매가
	a_regtime			date default sysdate,	-- 등록시간
	a_selltime			varchar2(100) not null,	-- 판매시간
	a_endtime			date,					-- 종료시간
	a_sledding			varchar2(1) default 'y',-- 진행상태(진행중'y'-완료'n')
	item_idx			int,					-- 아이템일련번호(거래번호)
	mem_idx				int,					-- 판매자회원번호
	mem_name			varchar2(100) not null,	-- 판매자명
	mem_point			int						-- 판매자 보유 포인트
)

select * from auction
select * from auction_list_view where item_idx = 120

select * from auction_list_view where item_idx = #{ item_idx }


UPDATE auction
SET a_endtime = a_regtime + 
    CASE
        WHEN TRIM(a_selltime) = '3' THEN INTERVAL '3' MINUTE
        WHEN TRIM(a_selltime) = '10' THEN INTERVAL '10' MINUTE
        WHEN TRIM(a_selltime) = '30' THEN INTERVAL '30' MINUTE
        WHEN TRIM(a_selltime) = '60' THEN INTERVAL '60' MINUTE
        ELSE NULL
    END
WHERE a_idx = 50;



SELECT 
    TO_CHAR(a_regtime, 'YYYY-MM-DD HH24:MI:SS') AS formatted_regtime,
    TO_CHAR(a_endtime, 'YYYY-MM-DD HH24:MI:SS') AS formatted_endtime,
    a_selltime,
    a_regtime,
    a_endtime
FROM 
    auction;




alter table auction
	add constraint pk_auction_idx primary key(a_idX);
	
alter table auction
	add constraint fk_auction_item_idx foreign key(item_idx)
								       references items(item_idx);	
								       
alter table auction
	add constraint fk_auction_member_idx foreign key(mem_idx)
								         references member(mem_idx);	
								         							
drop view list_view
        
 create or replace view auction_list_view
    as
    select
        t.*,a.a_idx,a.a_initial_price,a.a_direct_price,a_regtime,a_selltime,a_sledding,mem_idx,mem_name,a.item_idx as itemno
    from trade_order_by_view t inner join auction a on t.item_idx = a.item_idx     	
    
    		
    							   
-- 이거 추가해서 넣으면 된다   							         								         					         								               								         					         								         
create or replace view auction_list_view
    as
    select
        t.*,a.a_idx,a.a_initial_price,a.a_direct_price,a_regtime,a_selltime,a_sledding,mem_idx,mem_name,a.item_idx as itemno,a.a_endtime,
        b.b_idx,b.b_bid_price,b.b_regtime,b.b_sledding,b.gumae_mem_idx
    from trade_order_by_view t inner join auction a on t.item_idx = a.item_idx
    inner join bid b on t.item_idx = b.item_idx								         								         							         								         
    							         								         							         								         							         								         
    							         								         							         								         							         								         							         								         							         								         							         								         

		select * from
		(
			select
				rank() over(order by item_idx desc) as no,
				i.*
			from
				(select * from list_view) i
		)
		where no between 1 and 5
		
		
select * from auction
		


*/