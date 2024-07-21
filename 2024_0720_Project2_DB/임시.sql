
	-- 1. items table 넣기


	--------- items---------
	
	create table items(
		item_idx int, 						-- 아이템 번호(부모키)
		item_name varchar2(100) not null,	-- 아이템명(유니크)
		item_image varchar2(2000) not null,	-- 이미지경로
		item_type varchar2(100) not null,	-- 아이템타입
		item_grade varchar2(100) not null,	-- 아이템등급
		item_rarity varchar2(100) not null,	-- 아이템레어도
		item_im varchar2(100) default '수리가능',	-- 무형
		item_shot int default '0',			-- 솟개수
		
		gibon_option1		int,			-- 기본방어도(변동옵션)296~342
		gibon_option1_val	int,			
		gibon_option2		int,			-- 기본내구도
		gibon_option2_val	int,		
		gibon_option3		int,			-- 기본필요힘
		gibon_option3_val	int,		
		gibon_option4		int,			-- 요구레벨
		gibon_option4_val	int,
		gibon_option5		int,
		gibon_option5_val	int,
		gibon_option6		int,
		gibon_option6_val	int,
		gibon_option7		int,
		gibon_option7_val	int,
		
		
		--item_defense int,						-- 기본방어도(변동옵션)296~342
		--item_durability int,					-- 기본내구도
		--item_strength int,					-- 기본필요힘
		--item_level int,						-- 요구레벨
		
		option1_idx int,					-- 적중당 생명력 훔침(변동옵션)9~12
		item_o1_val int,
		option2_idx int,					-- 방어력 증가(변동옵션)160~200
		item_o2_val int,
		option3_idx int,					-- 민첩
		item_o3_val int,
		option4_idx int,					-- 생명력
		item_o4_val int,
		option5_idx int,					-- 마나
		item_o5_val int,
		option6_idx int,					-- 화염저항
		item_o6_val int,
		option7_idx int,					-- 괴물에게서 얻는 금화 증가(변동옵션)80~100
		item_o7_val int
	)
	
	-- 2. items values 넣기
	
	insert into items values(
							seq_items_item_idx.nextVal,
							'도둑의 왕관 그랜드 크라운',
							'https://i.namu.wiki/i/VWIqJEY_9plMvxGjwHVmD8_DxstRpWJktK_shcidWWiL08-C6LNmgA65wlAtLpevMOIn4GX8e7-DngstxOJwHA.webp',
							'투구',
							'익셉셔널',
							'유니크',
							'수리불가',4,
							-- 기본옵션
							3,342,4,50,5,103,7,49,0,0,0,0,0,0,
							-- 하단 변동옵션
							1,12,
							2,200,
							3,25,
							4,50,
							5,35,
							6,33,
							7,100
						)
	
	select * from items
	drop table items
	
	
	-- 3. items 변동옵션 제약조건 넣기
	
	-- ㅁㅁㅁ 변동옵션 제약조건
	alter table items
		add constraint ck_item_defense_val check(gibon_option1_val between 296 and 342);
	alter table items
		add constraint ck_item_o1_val check(item_o1_val between 9 and 12);
	alter table items
		add constraint ck_item_o2_val check(item_o2_val between 160 and 200);
	alter table items
		add constraint ck_item_o7_val check(item_o7_val between 80 and 100);
	
	-- 아이템 제약조건 설정
	
	alter table items
		add constraint pk_items_item_idx primary key (item_idx);
	
	alter table items
		add constraint unique_items_item unique (item_name);
	
	-- item_im 무형 타입 제한
	alter table items
		add constraint ck_item_im check(item_im in ('수리가능','수리불가'));
		
	-- item_shot 솟개수제한
	alter table items
		add constraint ck_item_shot check(item_shot between 0 and 4);
		
	-- foreign key(foreign key는 안넣어도됨 만약을 위해서 냅둠)
	alter table items
		add constraint fk_items_item_o1 foreign key(option1_idx)
										references options(option1_idx);
	alter table items
		add constraint fk_items_item_o2 foreign key(option2_idx)
										references options2(option2_idx);									
										
	-- foreign key
	alter table items
		add constraint fk_gibon_option1 foreign key(gibon_option1)
										references gibon_option1(gibon_option1);
	alter table items
		add constraint fk_gibon_option2 foreign key(gibon_option2)
										references gibon_option2(gibon_option2);
	-- foreign key delete
	alter table items drop constraint fk_gibon_option1;
	alter table items drop constraint fk_gibon_option2;
	alter table items drop constraint fk_gibon_option3;
	alter table items drop constraint fk_gibon_option4;
	
	
	-- 4. items view 생성하기(items 뒤에 번호만 변경해주면 됌!! view명, from 뒤 items명)
	
	-- items view 생성
	create or replace view items1_item_o1_view
	as
	select
		i.*,go1.gibon_option1_name gibon_option1_name, go2.gibon_option2_name gibon_option2_name, go3.gibon_option3_name gibon_option3_name,
		go4.gibon_option4_name gibon_option4_name, go5.gibon_option5_name gibon_option5_name, go6.gibon_option6_name gibon_option6_name,
		go7.gibon_option7_name gibon_option7_name,
		o1.item_o1 option_name1, o2.item_o2 option_name2, o3.item_o3 option_name3,
		o4.item_o4 option_name4, o5.item_o5 option_name5, o6.item_o6 option_name6, o7.item_o7 option_name7
	from items i left outer join gibon_option1 go1 on i.gibon_option1 = go1.gibon_option1
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
	
	select * from options_option_1_view
	
		
	create sequence seq_items_item_idx
	
	
	-- 1. items table 넣기
							
	-- itmes2	
	create table items2(
		item_idx int, 						-- 아이템 번호(부모키)
		item_name varchar2(100) not null,	-- 아이템명(유니크)
		item_image varchar2(2000) not null,	-- 이미지경로
		item_type varchar2(100) not null,	-- 아이템타입
		item_grade varchar2(100) not null,	-- 아이템등급
		item_rarity varchar2(100) not null,	-- 아이템레어도
		item_im varchar2(100) default '수리가능',	-- 무형
		item_shot int default '0',			-- 솟개수
		
		
		gibon_option1		int,			-- 기본방어도(변동옵션)349~399
		gibon_option1_val	int,			
		gibon_option2		int,			-- 기본필요힘
		gibon_option2_val	int,		
		gibon_option3		int,			-- 요구레벨
		gibon_option3_val	int,		
		gibon_option4		int,			
		gibon_option4_val	int,
		gibon_option5		int,
		gibon_option5_val	int,
		gibon_option6		int,
		gibon_option6_val	int,
		gibon_option7		int,
		gibon_option7_val	int,
		
		
		--item_defense int,					-- 기본방어도(변동옵션)349~399
		--item_durability int,				-- 기본내구도
		--item_strength int,				-- 기본필요힘
		--item_level int,					-- 요구레벨
		
		option1_idx int,					-- 파괴불가
		item_o1_val int,
		option2_idx int,					-- 모든 기술
		item_o2_val int,
		option3_idx int,					-- 타격 회복 속도
		item_o3_val int,
		option4_idx int,					-- 방어력 증가
		item_o4_val int,
		option5_idx int,					-- 방어력(변동옵션)100~150
		item_o5_val int,
		option6_idx int,					-- 모든 저항(변동옵션)20~30
		item_o6_val int,
		option7_idx int,					-- 받는 물리 피해 감소(변동옵션) 10~15
		item_o7_val int
	)
	
	create sequence seq_items2_item_idx
					
	drop table items2
	
	-- 2. items values 넣기
	
	insert into items2 values(
								seq_items_item_idx.nextVal,
								'시대의 왕관 코로나',
								'https://i.namu.wiki/i/U4zanxaQMgnVVRbgYWkYN2PU0isNXs1mpOC3s2FeLQhWTpzoadg5A0jgIAnYI6J0neBUCNIlPScec-o9lvnULw.webp',
								'투구',
								'익셉셔널',
								'유니크',
								'수리가능',2,
								-- 기본옵션
								3,399,5,174,7,82,0,0,0,0,0,0,0,0,
								-- 하단 변동옵션
								8,0,
								9,1,
								10,30,
								2,50,
								10,150,
								11,30,
								12,15
							)
	select * from items2
	
	-- 3. items 변동옵션 제약조건 넣기
	
	-- ㅁㅁㅁ 변동옵션 제약조건
	alter table items2
		add constraint ck_item2_defense_val check(gibon_option1_val between 349 and 399);
	alter table items2
		add constraint ck_item2_o5_val check(item_o5_val between 100 and 150);
	alter table items2
		add constraint ck_item2_o6_val check(item_o6_val between 20 and 30);
	alter table items2
		add constraint ck_item2_o7_val check(item_o7_val between 10 and 15);
		
	-- 아이템 제약조건 설정
	
	alter table items2
		add constraint pk_items_item_idx primary key (item_idx);
	
	alter table items2
		add constraint unique_items_item unique (item_name);
	
	-- item_im 무형 타입 제한
	alter table items
		add constraint ck_item_im check(item_im in ('수리가능','수리불가'));
		
	-- item_shot 솟개수제한
	alter table items
		add constraint ck_item_shot check(item_shot between 0 and 4);
	
	-- 4. items view 생성하기(items 뒤에 번호만 변경해주면 됌!! view명, from 뒤 items명)	
		
	-- items view 생성
	create or replace view items2_item_o1_view
	as
	select
		i.*,go1.gibon_option1_name gibon_option1_name, go2.gibon_option2_name gibon_option2_name, go3.gibon_option3_name gibon_option3_name,
		go4.gibon_option4_name gibon_option4_name, go5.gibon_option5_name gibon_option5_name, go6.gibon_option6_name gibon_option6_name,
		go7.gibon_option7_name gibon_option7_name,
		o1.item_o1 option_name1, o2.item_o2 option_name2, o3.item_o3 option_name3,
		o4.item_o4 option_name4, o5.item_o5 option_name5, o6.item_o6 option_name6, o7.item_o7 option_name7
	from items2 i left outer join gibon_option1 go1 on i.gibon_option1 = go1.gibon_option1
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
	
		
	select * from items2_item_o1_view
	
	drop table items3
	
	-- 1. items table 넣기
	
	-- itmes3
	create table items3(
		item_idx int, 						-- 아이템 번호(부모키)
		item_name varchar2(100) not null,	-- 아이템명(유니크)
		item_image varchar2(2000) not null,	-- 이미지경로
		item_type varchar2(100) not null,	-- 아이템타입
		item_grade varchar2(100) not null,	-- 아이템등급
		item_rarity varchar2(100) not null,	-- 아이템레어도
		item_im varchar2(100) default '수리가능',	-- 무형
		item_shot int default '0',			-- 솟개수
		
		
		gibon_option1		int,			-- 기본방어도(변동옵션)99~113
		gibon_option1_val	int,			
		gibon_option2		int,			-- 기본내구도
		gibon_option2_val	int,		
		gibon_option3		int,			-- 기본필요힘
		gibon_option3_val	int,		
		gibon_option4		int,			-- 요구레벨
		gibon_option4_val	int,
		gibon_option5		int,
		gibon_option5_val	int,
		gibon_option6		int,
		gibon_option6_val	int,
		gibon_option7		int,
		gibon_option7_val	int,
		
		
		--item_defense int,					-- 기본방어도(변동옵션)99~113
		--item_durability int,				-- 기본내구도
		--item_strength int,				-- 기본필요힘
		--item_level int,					-- 요구레벨
		
		option1_idx int,					-- 언데드에게 주는 피해
		item_o1_val int,
		option2_idx int,					-- 언데드에 대한 명중률(변동옵션)50~100
		item_o2_val int,
		option3_idx int,					-- 적중당 생명력 훔침
		item_o3_val int,
		option4_idx int,					-- 해골 숙련(강령술사 전용)
		item_o4_val int,
		option5_idx int,					-- 방어력 증가(변동옵션)30~60
		item_o5_val int,
		option6_idx int,					-- 방어력
		item_o6_val int,
		option7_idx int,					-- 독 저항
		item_o7_val int
	)
				
	-- 2. items values 넣기
	
	insert into items3 values(
								seq_items_item_idx.nextVal,
								'언데드 왕관 크라운',
								'https://i.namu.wiki/i/U4zanxaQMgnVVRbgYWkYN2PU0isNXs1mpOC3s2FeLQhWTpzoadg5A0jgIAnYI6J0neBUCNIlPScec-o9lvnULw.webp',
								'투구',
								'익셉셔널',
								'유니크',
								'수리가능',0,
								-- 기본옵션
								3,113,4,50,5,55,7,29,0,0,0,0,0,0,
								-- 하단 변동옵션
								14,50,
								15,100,
								1,5,
								16,3,
								2,60,
								11,40,
								17,50
							)
	select * from items3
	drop table items3
	
	-- 3. items 변동옵션 제약조건 넣기
	
	-- ㅁㅁㅁ 변동옵션 제약조건
	alter table items3
		add constraint ck_gibon_option1_val check(gibon_option1_val between 99 and 113);
	alter table items3
		add constraint ck_item3_o2_val check(item_o2_val between 50 and 100);
	alter table items3
		add constraint ck_item3_o5_val check(item_o5_val between 30 and 60);
			
	-- 아이템 제약조건 설정
	
	alter table items
		add constraint pk_items_item_idx primary key (item_idx);
	
	alter table items
		add constraint unique_items_item unique (item_name);
	
	-- item_im 무형 타입 제한
	alter table items
		add constraint ck_item_im check(item_im in ('수리가능','수리불가'));
		
	-- item_shot 솟개수제한
	alter table items
		add constraint ck_item_shot check(item_shot between 0 and 4);
		
	-- 4. items view 생성하기(items 뒤에 번호만 변경해주면 됌!! view명, from 뒤 items명)		
	
	-- items view 생성
	create or replace view items3_item_o1_view
	as
	select
		i.*,go1.gibon_option1_name gibon_option1_name, go2.gibon_option2_name gibon_option2_name, go3.gibon_option3_name gibon_option3_name,
		go4.gibon_option4_name gibon_option4_name, go5.gibon_option5_name gibon_option5_name, go6.gibon_option6_name gibon_option6_name,
		go7.gibon_option7_name gibon_option7_name,
		o1.item_o1 option_name1, o2.item_o2 option_name2, o3.item_o3 option_name3,
		o4.item_o4 option_name4, o5.item_o5 option_name5, o6.item_o6 option_name6, o7.item_o7 option_name7
	from items3 i left outer join gibon_option1 go1 on i.gibon_option1 = go1.gibon_option1
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
	
	-- 1. items table 넣기
		
	-- itmes4 (두손검)
	create table items4(
		item_idx int, 						-- 아이템 번호(부모키)
		item_name varchar2(100) not null,	-- 아이템명(유니크)
		item_image varchar2(2000) not null,	-- 이미지경로
		item_type varchar2(100) not null,	-- 아이템타입
		item_grade varchar2(100) not null,	-- 아이템등급
		item_rarity varchar2(100) not null,	-- 아이템레어도
		item_im varchar2(100) default '수리가능',	-- 무형
		item_shot int default '0',			-- 솟개수
		
		
		gibon_option1		int,			-- 기본 한손 피해 5~6 - 28~32
		gibon_option1_val	int,			
		gibon_option2		int,			-- 기본 양손 피해 16~18 - 50~56
		gibon_option2_val	int,		
		gibon_option3		int default 50,			-- 기본내구도
		gibon_option3_val	int,		
		gibon_option4		int default 34,			-- 기본필요민첩
		gibon_option4_val	int,
		gibon_option5		int default 56,			-- 기본필요힘
		gibon_option5_val	int,
		gibon_option6		int default 23,			-- 요구레벨
		gibon_option6_val	int,
		gibon_option7		int default 0,			-- 기본 공격속도
		gibon_option7_val	int,
		
		
		
		--item_damage varchar2(100),		-- 기본 한손 피해 5~6 - 28~32
		--item_2hand_damage varchar2(100),	-- 기본 양손 피해 16~18 - 50~56
		--item_durability int,				-- 기본내구도
		--item_dex int,			  			-- 기본필요민첩
		--item_strength int,				-- 기본필요힘
		--item_level int,					-- 요구레벨
		--item_weapon_speed int,			-- 기본 공격속도
		
		option1_idx int,					-- 피해 증가(변동옵션)80~100
		item_o1_val int,
		option2_idx int,					-- 명중률(변동옵션)100~150
		item_o2_val int,
		option3_idx int,					-- 화염 피해 추가(변동옵션)20~40
		item_o3_val int,
		option4_idx int,					-- 신성한 불꽃(성기사 전용)
		item_o4_val int,
		option5_idx int,					-- 마나
		item_o5_val int,
		option6_idx int,					
		item_o6_val int,
		option7_idx int,					
		item_o7_val int
	)
	
	drop table items4
	
	-- 2. items values 넣기
							
	insert into items4 values(
								seq_items_item_idx.nextVal,
								'키네밀의 송곳 자이언트 소드',
								'https://i.namu.wiki/i/J3RjOsUmJpKXvQ-vYymj60TT6OY4TSpHvsB2bDDgyoX6NS084xF0Ycq6E0xd0REMW33KBuunLs537-jiIuVoiw.webp',
								'양손검',
								'익셉셔널',
								'유니크',
								'수리가능',0,
								-- 기본옵션
							    --g1   g2   g3   g4   g5   g6   g7
								1,32,2,56,4,50,6,34,5,56,7,23,14,0,
								-- 하단 변동옵션
								19,100,		-- option1_idx
								20,150, 	-- option2_idx
								21,20,		-- option3_idx
								22,6,		-- option4_idx
								23,20,  	-- option5_idx
								24,0, 	 	-- option6_idx
								24,0		-- option7_idx
							)

							
	-- 3. items 변동옵션 제약조건 넣기
	
	-- ㅁㅁㅁ 변동옵션 제약조건
	alter table items4
		add constraint ck_item4_attack_val1 check(gibon_option1_val between 28 and 32);
	alter table items4
		add constraint ck_item4_attack_val2 check(gibon_option2_val between 50 and 56);
	alter table items4
		add constraint ck_item4_o1_val check(item_o1_val between 80 and 100);
	alter table items4
		add constraint ck_item4_o2_val check(item_o2_val between 100 and 150);
	alter table items4
		add constraint ck_item4_o3_val check(item_o3_val between 20 and 40);
		
	-- 아이템 제약조건 설정
	
	alter table items
		add constraint pk_items_item_idx primary key (item_idx);
	
	alter table items
		add constraint unique_items_item unique (item_name);
		
	
	-- item_im 무형 타입 제한
	alter table items
		add constraint ck_item_im check(item_im in ('수리가능','수리불가'));
		
	-- item_shot 솟개수제한
	alter table items
		add constraint ck_item_shot check(item_shot between 0 and 4);
		
		
	-- 4. items view 생성하기(items 뒤에 번호만 변경해주면 됌!! view명, from 뒤 items명)	
							
	-- items view 생성
	create or replace view items4_item_o1_view
	as
	select
		i.*,go1.gibon_option1_name gibon_option1_name, go2.gibon_option2_name gibon_option2_name, go3.gibon_option3_name gibon_option3_name,
		go4.gibon_option4_name gibon_option4_name, go5.gibon_option5_name gibon_option5_name, go6.gibon_option6_name gibon_option6_name,
		go7.gibon_option7_name gibon_option7_name,
		o1.item_o1 option_name1, o2.item_o2 option_name2, o3.item_o3 option_name3,
		o4.item_o4 option_name4, o5.item_o5 option_name5, o6.item_o6 option_name6, o7.item_o7 option_name7
	from items4 i left outer join gibon_option1 go1 on i.gibon_option1 = go1.gibon_option1
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

		
		
		
	-------- item trade table --------
	
	create or replace view trade_view
	as
	(SELECT * FROM items1_item_o1_view)
	UNION ALL
	(SELECT * FROM items2_item_o1_view)
	UNION ALL
	(SELECT * FROM items3_item_o1_view)
	UNION ALL
	(SELECT * FROM items4_item_o1_view);
	
	-------- item trade table 오름차순 정렬 --------
	
	create or replace view trade_order_by_view
	as
	select * from
	(
		select
		t.*,
		rank() over(order by item_idx desc) as rank
		from (select * from trade_view)t
	)
	
	select * from trade_order_by_view
		where option_name1 like '방어력'
		or    option_name2 like '방어력'
		or    option_name3 like '방어력'
		or    option_name4 like '방어력'
		or    option_name5 like '방어력'
		or    option_name6 like '방어력'
		or    option_name7 like '방어력'
	
	select * from trade_order_by_view
		where option_name1 = '방어력'
		or    option_name2 = '방어력'
		or    option_name3 = '방어력'
		or    option_name4 = '방어력'
		or    option_name5 = '방어력'
		or    option_name6 = '방어력'
		or    option_name7 = '방어력'

	-- option name + option val
	create or replace view trade_order_by_view2
	as
	select s.*, option_name1 || item_o1_val as option1, 
	option_name2 || item_o2_val as option2, 
	option_name3 || item_o3_val as option3, 
	option_name4 || item_o4_val as option4, 
	option_name5 || item_o5_val as option5, 
	option_name6 || item_o6_val as option6, 
	option_name7 || item_o7_val as option7 
	from
	(select * from trade_order_by_view)s
	
	select * from trade_order_by_view2
	where option5 substring
	
	
	select s3.* from
	(select s2.* from
	(select s.* from
	(select * from trade_order_by_view
		where option_name1 = '방어력' and item_o1_val>=10
		or    option_name2 = '방어력' and item_o2_val>=10		
		or    option_name3 = '방어력' and item_o3_val>=10		
		or    option_name4 = '방어력' and item_o4_val>=10		
		or    option_name5 = '방어력' and item_o5_val>=10		
		or    option_name6 = '방어력' and item_o6_val>=10		
		or    option_name7 = '방어력' and item_o7_val>=10)
		s
		where option_name1 like '파괴불가'
		or	  option_name2 like '파괴불가'
		or	  option_name3 like '파괴불가'
		or	  option_name4 like '파괴불가'
		or	  option_name5 like '파괴불가'
		or	  option_name6 like '파괴불가'
		or	  option_name7 like '파괴불가')s2
		where option_name1 like '모든 저항' and item_o1_val>=10
		or option_name2 = '모든 저항' and item_o2_val>=10
		or option_name3 = '모든 저항' and item_o3_val>=10
		or option_name4 = '모든 저항' and item_o4_val>=10
		or option_name5 = '모든 저항' and item_o5_val>=10
		or option_name6 = '모든 저항' and item_o6_val>=10
		or option_name7 = '모든 저항' and item_o7_val>=10)s3
		where option_name1 = '방어력 증가' and item_o1_val>=10
		or option_name2 = '방어력 증가' and item_o2_val>=10
		or option_name3 = '방어력 증가' and item_o3_val>=10
		or option_name4 = '방어력 증가' and item_o4_val>=10
		or option_name5 = '방어력 증가' and item_o5_val>=10
		or option_name6 = '방어력 증가' and item_o6_val>=10
		or option_name7 = '방어력 증가' and item_o7_val>=10
		where item_type = '투구'
		
		
		or	  option_name1 = '방어력 증가' and item_o1_val>40
		or	  option_name2 = '방어력 증가' and item_o2_val>40
		or	  option_name3 = '방어력 증가' and item_o3_val>40
		or	  option_name4 = '방어력 증가' and item_o4_val>40
		or	  option_name5 = '방어력 증가' and item_o5_val>40
		or	  option_name6 = '방어력 증가' and item_o6_val>40
		or	  option_name7 = '방어력 증가' and item_o7_val>40
		or	  option_name1 like '파괴불가'
		or	  option_name2 like '파괴불가'
		or	  option_name3 like '파괴불가'
		or	  option_name4 like '파괴불가'
		or	  option_name5 like '파괴불가'
		or	  option_name6 like '파괴불가'
		or	  option_name7 like '파괴불가'
		
		
	select * from trade_order_by_view
		where option_name6 = '방어력' and item_o6_val>=10 and option_name1 like '파괴불가'
	
	
	select * from trade_order_by_view
		where 기본옵션명1 like '요구 레벨' and gibon_option1_val>20
		or    기본옵션명2 like '요구 레벨' and gibon_option2_val>20
		or    기본옵션명3 like '요구 레벨' and gibon_option3_val>20
		or    기본옵션명4 like '요구 레벨' and gibon_option4_val>20
		or    기본옵션명5 like '요구 레벨' and gibon_option5_val>20
		or    기본옵션명6 like '요구 레벨' and gibon_option6_val>20
		or    기본옵션명7 like '요구 레벨' and gibon_option7_val>20
	
	
	(SELECT * FROM trade_view)
	UNION ALL
	(SELECT * FROM items4_item_o1_view);
	
	create or replace view trade_view_add
	as
	select
	
	form trade_view t outer join items4_item_o1_view i4 on 
	
	
	
	select * from trade_view
		where 옵션명1 like '방어력' and item_o1_val>20
		or    옵션명2 like '방어력' and item_o2_val>20
		or    옵션명3 like '방어력' and item_o3_val>20
		or    옵션명4 like '방어력' and item_o4_val>20
		or    옵션명5 like '방어력' and item_o5_val>20
		or    옵션명6 like '방어력' and item_o6_val>20
		or    옵션명7 like '방어력' and item_o7_val>20
		
	select * from trade_view
		where item_shot<4
		
	
		
	--------- gibon-option ---------
		
		
		
	create table gibon_option1(
		gibon_option1 int,
		gibon_option1_name varchar2(100)
	)
	
	alter table gibon_option1
		add constraint pk_gibon_option1 primary key (gibon_option1)
	
		
	create sequence seq_gibon_option1
	

	select * from gibon_option1
	
	
	insert into gibon_option1 values(seq_gibon_option1.nextVal,'한손 피해'); 	-- 1
	insert into gibon_option1 values(seq_gibon_option1.nextVal,'양손 피해'); 	-- 2
	insert into gibon_option1 values(seq_gibon_option1.nextVal,'방어력'); 		-- 3
	insert into gibon_option1 values(seq_gibon_option1.nextVal,'내구도'); 		-- 4
	insert into gibon_option1 values(seq_gibon_option1.nextVal,'필요 힘'); 		-- 5
	insert into gibon_option1 values(seq_gibon_option1.nextVal,'필요 민첩');	-- 6
	insert into gibon_option1 values(seq_gibon_option1.nextVal,'요구 레벨');	-- 7
	insert into gibon_option1 values(seq_gibon_option1.nextVal,'허리띠 크기');	-- 8
	insert into gibon_option1 values(seq_gibon_option1.nextVal,'막기 확률');	-- 9
	insert into gibon_option1 values(seq_gibon_option1.nextVal,'성기사 강타 피해');	-- 10
	insert into gibon_option1 values(seq_gibon_option1.nextVal,'투척 피해');	-- 11
	insert into gibon_option1 values(seq_gibon_option1.nextVal,'수량');			-- 12
	insert into gibon_option1 values(seq_gibon_option1.nextVal,'암살자 전용');	-- 13
	
	
	
	
	
	
	
		
		
	
	--------- options---------
	
	create table options(
		option1_idx int,						 -- 옵션명(부모키)
		item_o1 varchar2(100)					 -- 아이템 옵션1
	);
	
	create table options2(
		option2_idx int,						 -- 옵션명(부모키)
		item_o2 varchar2(100)					 -- 아이템 옵션2
	);
	
	create table options3(
		option3_idx int,						 -- 옵션명(부모키)
		item_o3 varchar2(100)					 -- 아이템 옵션3
	);
	
	create table options4(
		option4_idx int,						 -- 옵션명(부모키)
		item_o4 varchar2(100)					 -- 아이템 옵션4
	);
	
	create table options5(
		option5_idx int,						 -- 옵션명(부모키)
		item_o5 varchar2(100)					 -- 아이템 옵션5
	);
	
	create table options6(
		option6_idx int,						 -- 옵션명(부모키)
		item_o6 varchar2(100)					 -- 아이템 옵션6
	);
	
	create table options7(
		option7_idx int,						 -- 옵션명(부모키)
		item_o7 varchar2(100)					 -- 아이템 옵션7
	);
	
	create table options8(
		option8_idx int,						 -- 옵션명(부모키)
		item_o8 varchar2(100)					 -- 아이템 옵션8
	);
	
	
	drop table options
	drop table options2
	select item_o1 as option_name1 from options
	select * from options6
	
	
	-- option1_idx 부모키 지정
	alter table options
		add constraint pk_options_option_idx primary key (option1_idx);
	-- option2_idx 부모키 지정
	alter table options2
		add constraint pk_options_option2_idx primary key (option2_idx);
	-- option2_idx 부모키 지정
	alter table options3
		add constraint pk_options_option3_idx primary key (option3_idx);
	-- option2_idx 부모키 지정
	alter table options4
		add constraint pk_options_option4_idx primary key (option4_idx);
	-- option2_idx 부모키 지정
	alter table options5
		add constraint pk_options_option5_idx primary key (option5_idx);
	-- option2_idx 부모키 지정
	alter table options6
		add constraint pk_options_option6_idx primary key (option6_idx);
	-- option2_idx 부모키 지정
	alter table options7
		add constraint pk_options_option7_idx primary key (option7_idx);
	-- option8_idx 부모키 지정
	alter table options8
		add constraint pk_options_option8_idx primary key (option8_idx);
		
	insert into options values(seq_options_option_idx.nextVal,'적중당 생명력 훔침');
	insert into options values(seq_options_option_idx.nextVal,'방어력 증가');
	insert into options values(seq_options_option_idx.nextVal,'민첩');
	insert into options values(seq_options_option_idx.nextVal,'생명력');
	insert into options values(seq_options_option_idx.nextVal,'마나');
	insert into options values(seq_options_option_idx.nextVal,'화염저항');
	insert into options values(seq_options_option_idx.nextVal,'괴물에게서 얻는 금화 증가');
	insert into options values(seq_options_option_idx.nextVal,'파괴불가');
	insert into options values(seq_options_option_idx.nextVal,'모든 기술');
	insert into options values(seq_options_option_idx.nextVal,'타격 회복 속도');
	insert into options values(seq_options_option_idx.nextVal,'방어력');
	insert into options values(seq_options_option_idx.nextVal,'모든 저항');
	insert into options values(seq_options_option_idx.nextVal,'받는 물리 피해 감소');
	insert into options values(seq_options_option_idx.nextVal,'언데드에게 주는 피해');
	insert into options values(seq_options_option_idx.nextVal,'언데드에게 대한 명중률');
	insert into options values(seq_options_option_idx.nextVal,'해골 숙련(강령술사 전용)');
	insert into options values(seq_options_option_idx.nextVal,'독 저항');
	insert into options values(seq_options_option_idx.nextVal,'빙결 지속시간 절반으로 감소');
	insert into options values(seq_options_option_idx.nextVal,'피해 증가');
	insert into options values(seq_options_option_idx.nextVal,'명중률');
	insert into options values(seq_options_option_idx.nextVal,'화염 피해 추가');
	insert into options values(seq_options_option_idx.nextVal,'신성한 불꽃(성기사 전용)');
	insert into options values(seq_options_option_idx.nextVal,'마나');
	insert into options values(seq_options_option_idx.nextVal,'빈옵션');
		
		
	
		
	
	-- options sequence 설정(옵션번호)
	
	create sequence seq_options_option_idx;
	create sequence seq_options2_option2_idx;
	create sequence seq_options3_option3_idx;
	create sequence seq_options4_option4_idx;
	create sequence seq_options5_option5_idx;
	create sequence seq_options6_option6_idx;
	create sequence seq_options7_option7_idx;
	create sequence seq_options8_option8_idx;
	drop sequence seq_options_option_idx;
	drop sequence seq_options2_option2_idx;
	drop sequence seq_options3_option3_idx;
	drop sequence seq_options4_option4_idx;
	drop sequence seq_options5_option5_idx;
	drop sequence seq_options6_option6_idx;
	drop sequence seq_options7_option7_idx;
	drop sequence seq_options8_option8_idx;
		

	
	
	
	insert into options2 values(seq_options2_option2_idx.nextVal,'적중당 생명력 훔침');
	insert into options2 values(seq_options2_option2_idx.nextVal,'방어력 증가');
	insert into options2 values(seq_options2_option2_idx.nextVal,'민첩');
	insert into options2 values(seq_options2_option2_idx.nextVal,'생명력');
	insert into options2 values(seq_options2_option2_idx.nextVal,'마나');
	insert into options2 values(seq_options2_option2_idx.nextVal,'화염저항');
	insert into options2 values(seq_options2_option2_idx.nextVal,'괴물에게서 얻는 금화 증가');
	insert into options2 values(seq_options2_option2_idx.nextVal,'파괴불가');
	insert into options2 values(seq_options2_option2_idx.nextVal,'모든 기술');
	insert into options2 values(seq_options2_option2_idx.nextVal,'타격 회복 속도');
	insert into options2 values(seq_options2_option2_idx.nextVal,'방어력');
	insert into options2 values(seq_options2_option2_idx.nextVal,'모든 저항');
	insert into options2 values(seq_options2_option2_idx.nextVal,'받는 물리 피해 감소');
	insert into options2 values(seq_options2_option2_idx.nextVal,'언데드에게 주는 피해');
	insert into options2 values(seq_options2_option2_idx.nextVal,'언데드에게 대한 명중률');
	insert into options2 values(seq_options2_option2_idx.nextVal,'해골 숙련(강령술사 전용)');
	insert into options2 values(seq_options2_option2_idx.nextVal,'독 저항');
	insert into options2 values(seq_options2_option2_idx.nextVal,'빙결 지속시간 절반으로 감소');
	insert into options2 values(seq_options2_option2_idx.nextVal,'피해 증가');
	insert into options2 values(seq_options2_option2_idx.nextVal,'명중률');
	insert into options2 values(seq_options2_option2_idx.nextVal,'화염 피해 추가');
	insert into options2 values(seq_options2_option2_idx.nextVal,'신성한 불꽃(성기사 전용)');
	insert into options2 values(seq_options2_option2_idx.nextVal,'마나');
	insert into options values(seq_options2_option2_idx.nextVal,'빈옵션');
	
	insert into options3 values(seq_options3_option3_idx.nextVal,'적중당 생명력 훔침');
	insert into options3 values(seq_options3_option3_idx.nextVal,'방어력 증가');
	insert into options3 values(seq_options3_option3_idx.nextVal,'민첩');
	insert into options3 values(seq_options3_option3_idx.nextVal,'생명력');
	insert into options3 values(seq_options3_option3_idx.nextVal,'마나');
	insert into options3 values(seq_options3_option3_idx.nextVal,'화염저항');
	insert into options3 values(seq_options3_option3_idx.nextVal,'괴물에게서 얻는 금화 증가');
	insert into options3 values(seq_options3_option3_idx.nextVal,'파괴불가');
	insert into options3 values(seq_options3_option3_idx.nextVal,'모든 기술');
	insert into options3 values(seq_options3_option3_idx.nextVal,'타격 회복 속도');
	insert into options3 values(seq_options3_option3_idx.nextVal,'방어력');
	insert into options3 values(seq_options3_option3_idx.nextVal,'모든 저항');
	insert into options3 values(seq_options3_option3_idx.nextVal,'받는 물리 피해 감소');
	insert into options3 values(seq_options3_option3_idx.nextVal,'언데드에게 주는 피해');
	insert into options3 values(seq_options3_option3_idx.nextVal,'언데드에게 대한 명중률');
	insert into options3 values(seq_options3_option3_idx.nextVal,'해골 숙련(강령술사 전용)');
	insert into options3 values(seq_options3_option3_idx.nextVal,'독 저항');
	insert into options3 values(seq_options3_option3_idx.nextVal,'빙결 지속시간 절반으로 감소');
	insert into options3 values(seq_options3_option3_idx.nextVal,'피해 증가');
	insert into options3 values(seq_options3_option3_idx.nextVal,'명중률');
	insert into options3 values(seq_options3_option3_idx.nextVal,'화염 피해 추가');
	insert into options3 values(seq_options3_option3_idx.nextVal,'신성한 불꽃(성기사 전용)');
	insert into options3 values(seq_options3_option3_idx.nextVal,'마나');
	insert into options3 values(seq_options3_option3_idx.nextVal,'빈옵션');
	
	insert into options4 values(seq_options4_option4_idx.nextVal,'적중당 생명력 훔침');
	insert into options4 values(seq_options4_option4_idx.nextVal,'방어력 증가');
	insert into options4 values(seq_options4_option4_idx.nextVal,'민첩');
	insert into options4 values(seq_options4_option4_idx.nextVal,'생명력');
	insert into options4 values(seq_options4_option4_idx.nextVal,'마나');
	insert into options4 values(seq_options4_option4_idx.nextVal,'화염저항');
	insert into options4 values(seq_options4_option4_idx.nextVal,'괴물에게서 얻는 금화 증가');
	insert into options4 values(seq_options4_option4_idx.nextVal,'파괴불가');
	insert into options4 values(seq_options4_option4_idx.nextVal,'모든 기술');
	insert into options4 values(seq_options4_option4_idx.nextVal,'타격 회복 속도');
	insert into options4 values(seq_options4_option4_idx.nextVal,'방어력');
	insert into options4 values(seq_options4_option4_idx.nextVal,'모든 저항');
	insert into options4 values(seq_options4_option4_idx.nextVal,'받는 물리 피해 감소');
	insert into options4 values(seq_options4_option4_idx.nextVal,'언데드에게 주는 피해');
	insert into options4 values(seq_options4_option4_idx.nextVal,'언데드에게 대한 명중률');
	insert into options4 values(seq_options4_option4_idx.nextVal,'해골 숙련(강령술사 전용)');
	insert into options4 values(seq_options4_option4_idx.nextVal,'독 저항');
	insert into options4 values(seq_options4_option4_idx.nextVal,'빙결 지속시간 절반으로 감소');
	insert into options4 values(seq_options4_option4_idx.nextVal,'피해 증가');
	insert into options4 values(seq_options4_option4_idx.nextVal,'명중률');
	insert into options4 values(seq_options4_option4_idx.nextVal,'화염 피해 추가');
	insert into options4 values(seq_options4_option4_idx.nextVal,'신성한 불꽃(성기사 전용)');
	insert into options4 values(seq_options4_option4_idx.nextVal,'마나');
	insert into options4 values(seq_options4_option4_idx.nextVal,'빈옵션');
	
	insert into options5 values(seq_options5_option5_idx.nextVal,'적중당 생명력 훔침');
	insert into options5 values(seq_options5_option5_idx.nextVal,'방어력 증가');
	insert into options5 values(seq_options5_option5_idx.nextVal,'민첩');
	insert into options5 values(seq_options5_option5_idx.nextVal,'생명력');
	insert into options5 values(seq_options5_option5_idx.nextVal,'마나');
	insert into options5 values(seq_options5_option5_idx.nextVal,'화염저항');
	insert into options5 values(seq_options5_option5_idx.nextVal,'괴물에게서 얻는 금화 증가');
	insert into options5 values(seq_options5_option5_idx.nextVal,'파괴불가');
	insert into options5 values(seq_options5_option5_idx.nextVal,'모든 기술');
	insert into options5 values(seq_options5_option5_idx.nextVal,'타격 회복 속도');
	insert into options5 values(seq_options5_option5_idx.nextVal,'방어력');
	insert into options5 values(seq_options5_option5_idx.nextVal,'모든 저항');
	insert into options5 values(seq_options5_option5_idx.nextVal,'받는 물리 피해 감소');
	insert into options5 values(seq_options5_option5_idx.nextVal,'언데드에게 주는 피해');
	insert into options5 values(seq_options5_option5_idx.nextVal,'언데드에게 대한 명중률');
	insert into options5 values(seq_options5_option5_idx.nextVal,'해골 숙련(강령술사 전용)');
	insert into options5 values(seq_options5_option5_idx.nextVal,'독 저항');
	insert into options5 values(seq_options5_option5_idx.nextVal,'빙결 지속시간 절반으로 감소');
	insert into options5 values(seq_options5_option5_idx.nextVal,'피해 증가');
	insert into options5 values(seq_options5_option5_idx.nextVal,'명중률');
	insert into options5 values(seq_options5_option5_idx.nextVal,'화염 피해 추가');
	insert into options5 values(seq_options5_option5_idx.nextVal,'신성한 불꽃(성기사 전용)');
	insert into options5 values(seq_options5_option5_idx.nextVal,'마나');
	insert into options5 values(seq_options5_option5_idx.nextVal,'빈옵션');
	
	insert into options6 values(seq_options6_option6_idx.nextVal,'적중당 생명력 훔침');
	insert into options6 values(seq_options6_option6_idx.nextVal,'방어력 증가');
	insert into options6 values(seq_options6_option6_idx.nextVal,'민첩');
	insert into options6 values(seq_options6_option6_idx.nextVal,'생명력');
	insert into options6 values(seq_options6_option6_idx.nextVal,'마나');
	insert into options6 values(seq_options6_option6_idx.nextVal,'화염저항');
	insert into options6 values(seq_options6_option6_idx.nextVal,'괴물에게서 얻는 금화 증가');
	insert into options6 values(seq_options6_option6_idx.nextVal,'파괴불가');
	insert into options6 values(seq_options6_option6_idx.nextVal,'모든 기술');
	insert into options6 values(seq_options6_option6_idx.nextVal,'타격 회복 속도');
	insert into options6 values(seq_options6_option6_idx.nextVal,'방어력');
	insert into options6 values(seq_options6_option6_idx.nextVal,'모든 저항');
	insert into options6 values(seq_options6_option6_idx.nextVal,'받는 물리 피해 감소');
	insert into options6 values(seq_options6_option6_idx.nextVal,'언데드에게 주는 피해');
	insert into options6 values(seq_options6_option6_idx.nextVal,'언데드에게 대한 명중률');
	insert into options6 values(seq_options6_option6_idx.nextVal,'해골 숙련(강령술사 전용)');
	insert into options6 values(seq_options6_option6_idx.nextVal,'독 저항');
	insert into options6 values(seq_options6_option6_idx.nextVal,'빙결 지속시간 절반으로 감소');
	insert into options6 values(seq_options6_option6_idx.nextVal,'피해 증가');
	insert into options6 values(seq_options6_option6_idx.nextVal,'명중률');
	insert into options6 values(seq_options6_option6_idx.nextVal,'화염 피해 추가');
	insert into options6 values(seq_options6_option6_idx.nextVal,'신성한 불꽃(성기사 전용)');
	insert into options6 values(seq_options6_option6_idx.nextVal,'마나');
	insert into options6 values(seq_options6_option6_idx.nextVal,'빈옵션');
	
	insert into options7 values(seq_options7_option7_idx.nextVal,'적중당 생명력 훔침');
	insert into options7 values(seq_options7_option7_idx.nextVal,'방어력 증가');
	insert into options7 values(seq_options7_option7_idx.nextVal,'민첩');
	insert into options7 values(seq_options7_option7_idx.nextVal,'생명력');
	insert into options7 values(seq_options7_option7_idx.nextVal,'마나');
	insert into options7 values(seq_options7_option7_idx.nextVal,'화염저항');
	insert into options7 values(seq_options7_option7_idx.nextVal,'괴물에게서 얻는 금화 증가');
	insert into options7 values(seq_options7_option7_idx.nextVal,'파괴불가');
	insert into options7 values(seq_options7_option7_idx.nextVal,'모든 기술');
	insert into options7 values(seq_options7_option7_idx.nextVal,'타격 회복 속도');
	insert into options7 values(seq_options7_option7_idx.nextVal,'방어력');
	insert into options7 values(seq_options7_option7_idx.nextVal,'모든 저항');
	insert into options7 values(seq_options7_option7_idx.nextVal,'받는 물리 피해 감소');
	insert into options7 values(seq_options7_option7_idx.nextVal,'언데드에게 주는 피해');
	insert into options7 values(seq_options7_option7_idx.nextVal,'언데드에게 대한 명중률');
	insert into options7 values(seq_options7_option7_idx.nextVal,'해골 숙련(강령술사 전용)');
	insert into options7 values(seq_options7_option7_idx.nextVal,'독 저항');
	insert into options7 values(seq_options7_option7_idx.nextVal,'빙결 지속시간 절반으로 감소');
	insert into options7 values(seq_options7_option7_idx.nextVal,'피해 증가');
	insert into options7 values(seq_options7_option7_idx.nextVal,'명중률');
	insert into options7 values(seq_options7_option7_idx.nextVal,'화염 피해 추가');
	insert into options7 values(seq_options7_option7_idx.nextVal,'신성한 불꽃(성기사 전용)');
	insert into options7 values(seq_options7_option7_idx.nextVal,'마나');
	insert into options7 values(seq_options7_option7_idx.nextVal,'빈옵션');
	
	
	insert into options8 values(seq_options8_option8_idx.nextVal,'적중당 생명력 훔침');
	insert into options8 values(seq_options8_option8_idx.nextVal,'방어력 증가');
	insert into options8 values(seq_options8_option8_idx.nextVal,'민첩');
	insert into options8 values(seq_options8_option8_idx.nextVal,'생명력');
	insert into options8 values(seq_options8_option8_idx.nextVal,'마나');
	insert into options8 values(seq_options8_option8_idx.nextVal,'화염저항');
	insert into options8 values(seq_options8_option8_idx.nextVal,'괴물에게서 얻는 금화 증가');
	insert into options8 values(seq_options8_option8_idx.nextVal,'파괴불가');
	insert into options8 values(seq_options8_option8_idx.nextVal,'모든 기술');
	insert into options8 values(seq_options8_option8_idx.nextVal,'타격 회복 속도');
	insert into options8 values(seq_options8_option8_idx.nextVal,'방어력');
	insert into options8 values(seq_options8_option8_idx.nextVal,'모든 저항');
	insert into options8 values(seq_options8_option8_idx.nextVal,'받는 물리 피해 감소');
	insert into options8 values(seq_options8_option8_idx.nextVal,'언데드에게 주는 피해');
	insert into options8 values(seq_options8_option8_idx.nextVal,'언데드에게 대한 명중률');
	insert into options8 values(seq_options8_option8_idx.nextVal,'해골 숙련(강령술사 전용)');
	insert into options8 values(seq_options8_option8_idx.nextVal,'독 저항');
	insert into options8 values(seq_options8_option8_idx.nextVal,'빙결 지속시간 절반으로 감소');
	insert into options8 values(seq_options8_option8_idx.nextVal,'피해 증가');
	insert into options8 values(seq_options8_option8_idx.nextVal,'명중률');
	insert into options8 values(seq_options8_option8_idx.nextVal,'화염 피해 추가');
	insert into options8 values(seq_options8_option8_idx.nextVal,'신성한 불꽃(성기사 전용)');
	insert into options8 values(seq_options8_option8_idx.nextVal,'마나');
	insert into options8 values(seq_options8_option8_idx.nextVal,'빈옵션');
	
	
	
	
	
	create table gibon_option2(
		gibon_option2 int,
		gibon_option2_name varchar2(100)
	)
	
	alter table gibon_option2
		add constraint pk_gibon_option2 primary key (gibon_option2)
	
		
	create sequence seq_gibon_option2
	

	select * from gibon_option2
	
	
	insert into gibon_option2 values(seq_gibon_option2.nextVal,'한손 피해'); 	-- 1
	insert into gibon_option2 values(seq_gibon_option2.nextVal,'양손 피해'); 	-- 2
	insert into gibon_option2 values(seq_gibon_option2.nextVal,'방어력'); 		-- 3
	insert into gibon_option2 values(seq_gibon_option2.nextVal,'내구도'); 		-- 4
	insert into gibon_option2 values(seq_gibon_option2.nextVal,'필요 힘'); 		-- 5
	insert into gibon_option2 values(seq_gibon_option2.nextVal,'필요 민첩');	-- 6
	insert into gibon_option2 values(seq_gibon_option2.nextVal,'요구 레벨');	-- 7
	insert into gibon_option2 values(seq_gibon_option2.nextVal,'허리띠 크기');	-- 8
	insert into gibon_option2 values(seq_gibon_option2.nextVal,'막기 확률');	-- 9
	insert into gibon_option2 values(seq_gibon_option2.nextVal,'성기사 강타 피해');	-- 10
	insert into gibon_option2 values(seq_gibon_option2.nextVal,'투척 피해');	-- 11
	insert into gibon_option2 values(seq_gibon_option2.nextVal,'수량');			-- 12
	insert into gibon_option2 values(seq_gibon_option2.nextVal,'암살자 전용');	-- 13
	
	
	
	
	create table gibon_option3(
		gibon_option3 int,
		gibon_option3_name varchar2(100)
	)
	
	alter table gibon_option3
		add constraint pk_gibon_option3 primary key (gibon_option3)
	
		
	create sequence seq_gibon_option3
	

	select * from gibon_option3
	
	
	insert into gibon_option3 values(seq_gibon_option3.nextVal,'한손 피해'); 	-- 1
	insert into gibon_option3 values(seq_gibon_option3.nextVal,'양손 피해'); 	-- 2
	insert into gibon_option3 values(seq_gibon_option3.nextVal,'방어력'); 		-- 3
	insert into gibon_option3 values(seq_gibon_option3.nextVal,'내구도'); 		-- 4
	insert into gibon_option3 values(seq_gibon_option3.nextVal,'필요 힘'); 		-- 5
	insert into gibon_option3 values(seq_gibon_option3.nextVal,'필요 민첩');	-- 6
	insert into gibon_option3 values(seq_gibon_option3.nextVal,'요구 레벨');	-- 7
	insert into gibon_option3 values(seq_gibon_option3.nextVal,'허리띠 크기');	-- 8
	insert into gibon_option3 values(seq_gibon_option3.nextVal,'막기 확률');	-- 9
	insert into gibon_option3 values(seq_gibon_option3.nextVal,'성기사 강타 피해');	-- 10
	insert into gibon_option3 values(seq_gibon_option3.nextVal,'투척 피해');	-- 11
	insert into gibon_option3 values(seq_gibon_option3.nextVal,'수량');			-- 12
	insert into gibon_option3 values(seq_gibon_option3.nextVal,'암살자 전용');	-- 13
	
	
	
	
	create table gibon_option4(
		gibon_option4 int,
		gibon_option4_name varchar2(100)
	)
	
	alter table gibon_option4
		add constraint pk_gibon_option4 primary key (gibon_option4)
	
		
	create sequence seq_gibon_option4
	

	select * from gibon_option4
	
	
	insert into gibon_option4 values(seq_gibon_option4.nextVal,'한손 피해'); 	-- 1
	insert into gibon_option4 values(seq_gibon_option4.nextVal,'양손 피해'); 	-- 2
	insert into gibon_option4 values(seq_gibon_option4.nextVal,'방어력'); 		-- 3
	insert into gibon_option4 values(seq_gibon_option4.nextVal,'내구도'); 		-- 4
	insert into gibon_option4 values(seq_gibon_option4.nextVal,'필요 힘'); 		-- 5
	insert into gibon_option4 values(seq_gibon_option4.nextVal,'필요 민첩');	-- 6
	insert into gibon_option4 values(seq_gibon_option4.nextVal,'요구 레벨');	-- 7
	insert into gibon_option4 values(seq_gibon_option4.nextVal,'허리띠 크기');	-- 8
	insert into gibon_option4 values(seq_gibon_option4.nextVal,'막기 확률');	-- 9
	insert into gibon_option4 values(seq_gibon_option4.nextVal,'성기사 강타 피해');	-- 10
	insert into gibon_option4 values(seq_gibon_option4.nextVal,'투척 피해');	-- 11
	insert into gibon_option4 values(seq_gibon_option4.nextVal,'수량');			-- 12
	insert into gibon_option4 values(seq_gibon_option4.nextVal,'암살자 전용');	-- 13
	
	
	
	
	create table gibon_option5(
		gibon_option5 int,
		gibon_option5_name varchar2(100)
	)
	
	alter table gibon_option5
		add constraint pk_gibon_option5 primary key (gibon_option5)
	
		
	create sequence seq_gibon_option5
	

	select * from gibon_option5
	
	
	insert into gibon_option5 values(seq_gibon_option5.nextVal,'한손 피해'); 	-- 1
	insert into gibon_option5 values(seq_gibon_option5.nextVal,'양손 피해'); 	-- 2
	insert into gibon_option5 values(seq_gibon_option5.nextVal,'방어력'); 		-- 3
	insert into gibon_option5 values(seq_gibon_option5.nextVal,'내구도'); 		-- 4
	insert into gibon_option5 values(seq_gibon_option5.nextVal,'필요 힘'); 		-- 5
	insert into gibon_option5 values(seq_gibon_option5.nextVal,'필요 민첩');	-- 6
	insert into gibon_option5 values(seq_gibon_option5.nextVal,'요구 레벨');	-- 7
	insert into gibon_option5 values(seq_gibon_option5.nextVal,'허리띠 크기');	-- 8
	insert into gibon_option5 values(seq_gibon_option5.nextVal,'막기 확률');	-- 9
	insert into gibon_option5 values(seq_gibon_option5.nextVal,'성기사 강타 피해');	-- 10
	insert into gibon_option5 values(seq_gibon_option5.nextVal,'투척 피해');	-- 11
	insert into gibon_option5 values(seq_gibon_option5.nextVal,'수량');			-- 12
	insert into gibon_option5 values(seq_gibon_option5.nextVal,'암살자 전용');	-- 13
	insert into gibon_option5 values(seq_gibon_option5.nextVal,'공격 속도');	-- 14
	
	
	
	
	create table gibon_option6(
		gibon_option6 int,
		gibon_option6_name varchar2(100)
	)
	
	alter table gibon_option6
		add constraint pk_gibon_option6 primary key (gibon_option6)
	
		
	create sequence seq_gibon_option6
	

	select * from gibon_option6
	
	
	insert into gibon_option6 values(seq_gibon_option6.nextVal,'한손 피해'); 	-- 1
	insert into gibon_option6 values(seq_gibon_option6.nextVal,'양손 피해'); 	-- 2
	insert into gibon_option6 values(seq_gibon_option6.nextVal,'방어력'); 		-- 3
	insert into gibon_option6 values(seq_gibon_option6.nextVal,'내구도'); 		-- 4
	insert into gibon_option6 values(seq_gibon_option6.nextVal,'필요 힘'); 		-- 5
	insert into gibon_option6 values(seq_gibon_option6.nextVal,'필요 민첩');	-- 6
	insert into gibon_option6 values(seq_gibon_option6.nextVal,'요구 레벨');	-- 7
	insert into gibon_option6 values(seq_gibon_option6.nextVal,'허리띠 크기');	-- 8
	insert into gibon_option6 values(seq_gibon_option6.nextVal,'막기 확률');	-- 9
	insert into gibon_option6 values(seq_gibon_option6.nextVal,'성기사 강타 피해');	-- 10
	insert into gibon_option6 values(seq_gibon_option6.nextVal,'투척 피해');	-- 11
	insert into gibon_option6 values(seq_gibon_option6.nextVal,'수량');			-- 12
	insert into gibon_option6 values(seq_gibon_option6.nextVal,'암살자 전용');	-- 13
	insert into gibon_option6 values(seq_gibon_option6.nextVal,'공격 속도');	-- 14
	
	
	
	
	create table gibon_option7(
		gibon_option7 int,
		gibon_option7_name varchar2(100)
	)
	
	alter table gibon_option7
		add constraint pk_gibon_option7 primary key (gibon_option7)
	
		
	create sequence seq_gibon_option7
	

	select * from gibon_option7
	
	
	insert into gibon_option7 values(seq_gibon_option7.nextVal,'한손 피해'); 	-- 1
	insert into gibon_option7 values(seq_gibon_option7.nextVal,'양손 피해'); 	-- 2
	insert into gibon_option7 values(seq_gibon_option7.nextVal,'방어력'); 		-- 3
	insert into gibon_option7 values(seq_gibon_option7.nextVal,'내구도'); 		-- 4
	insert into gibon_option7 values(seq_gibon_option7.nextVal,'필요 힘'); 		-- 5
	insert into gibon_option7 values(seq_gibon_option7.nextVal,'필요 민첩');	-- 6
	insert into gibon_option7 values(seq_gibon_option7.nextVal,'요구 레벨');	-- 7
	insert into gibon_option7 values(seq_gibon_option7.nextVal,'허리띠 크기');	-- 8
	insert into gibon_option7 values(seq_gibon_option7.nextVal,'막기 확률');	-- 9
	insert into gibon_option7 values(seq_gibon_option7.nextVal,'성기사 강타 피해');	-- 10
	insert into gibon_option7 values(seq_gibon_option7.nextVal,'투척 피해');	-- 11
	insert into gibon_option7 values(seq_gibon_option7.nextVal,'수량');			-- 12
	insert into gibon_option7 values(seq_gibon_option7.nextVal,'암살자 전용');	-- 13
	insert into gibon_option7 values(seq_gibon_option7.nextVal,'공격 속도');	-- 14