/*
drop sequence seq_auction_idx
drop table auction
create sequence seq_auction_idx
create table auction
(
    a_idx               int,                    -- 경매번호
    a_initial_price     int default 0,          -- 최초경매가
    a_direct_price      int default 0,          -- 즉시구매가
    a_regtime           date default sysdate,   -- 등록시간
    a_selltime          varchar2(100) not null, -- 판매시간
    a_sledding          varchar2(1) default 'y',-- 진행상태(진행중'y'-완료'n')
    item_idx            int                     -- 아이템일련번호(거래번호)
)
    mem_idx             int,                    -- 판매자회원번호
    mem_name            varchar2(100) not null  -- 판매자명
alter table auction
    add constraint pk_auction_idx primary key(a_idX);
    
    
    
alter view trade_order_by_view
    add constraint pk_auction_idx primary key(item_idx);
    
    
    
    
alter table auction
    add constraint fk_auction_item_idx foreign key(item_idx)
                                       references trade_order_by_view(item_idx);  
                                       
alter table auction
    add constraint fk_auction_member_idx foreign key(mem_idx)
                                         references member(mem_idx);    
                                         
                                         
    select * from auction                                     
	-- items view 생성
	create or replace view items23_item_o1_view
	as
	select
		i.*,go1.gibon_option1_name gibon_option1_name, go2.gibon_option2_name gibon_option2_name, go3.gibon_option3_name gibon_option3_name,
		go4.gibon_option4_name gibon_option4_name, go5.gibon_option5_name gibon_option5_name, go6.gibon_option6_name gibon_option6_name,
		go7.gibon_option7_name gibon_option7_name,
		o1.item_o1 option_name1, o2.item_o2 option_name2, o3.item_o3 option_name3,
		o4.item_o4 option_name4, o5.item_o5 option_name5, o6.item_o6 option_name6, o7.item_o7 option_name7, o8.item_o8 option_name8
	from items23 i left outer join gibon_option1 go1 on i.gibon_option1 = go1.gibon_option1
		left outer join gibon_option2 go2 on i.gibon_option2 = go2.gibon_option2
		left outer join gibon_option3 go3 on i.gibon_option3 = go3.gibon_option3
		left outer join gibon_option4 go4 on i.gibon_option4 = go4.gibon_option4
		left outer join gibon_option5 go5 on i.gibon_option5 = go5.gibon_option5
		left outer join gibon_option6 go6 on i.gibon_option6 = go6.gibon_option6
		left outer join gibon_option7 go7 on i.gibon_option7 = go7.gibon_option7
		left outer join options o1 on i.option1_idx = o1.option1_idx
		left outer join options2 o2 on i.option2_idx = o2.option2_idx
		left outer join options3 o3 on i.option3_idx = o3.option3_idx
		left outer join options4 o4 on i.option4_idx = o4.option4_idx
		left outer join options5 o5 on i.option5_idx = o5.option5_idx
		left outer join options6 o6 on i.option6_idx = o6.option6_idx
		left outer join options7 o7 on i.option7_idx = o7.option7_idx
		left outer join options8 o8 on i.option8_idx = o8.option8_idx;
		
	select * from trade_order_by_view
	
		                                    
		                                    	                                    	                                    
		                                                                           
	create or replace view list_view
	as
	select
		t.*,a.a_idx,a.a_initial_price,a.a_direct_price,a_regtime,a_selltime,a_sledding,a.item_idx as itemno
	from trade_order_by_view t inner join auction a on t.item_idx = a.item_idx                                                                                                                                               
                                         
                                         
                                         
                                         
                                         
*/