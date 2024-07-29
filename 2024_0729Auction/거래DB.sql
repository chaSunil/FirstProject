/*

create sequence seq_deal_idx

create table deal
(
	d_idx		int,					-- 거래번호 
	d_price		int,					-- 거래가격
	d_regtime	date default sysdate,	-- 거래시간
	item_idx	int,					-- 아이템일련번호(거래번호)
	mem_idx		int						-- 구매?판매?자 회원번호
)


*/