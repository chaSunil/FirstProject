/*
	
	-- 일련번호관리객체
	create sequence seq_sub_photo_idx
	
	drop sequence seq_sub_photo_idx
	
	drop table sub_photo
	
	-- 테이블 생성
	create table sub_photo
	(
		sub_p_idx			int,						-- 일련번호
		sub_p_title			varchar2(200)	not null,	-- 제목
		sub_p_category   	varchar2(200)	not null,	-- 카테고리
		sub_p_min_player	int				default 2,	-- 최소 플레이어
		sub_p_max_player	int				default 2,	-- 최대 플레이어
		sub_p_playtime   	int				not null,	-- 플레이타임
		sub_p_age		   	int				not null,	-- 연령
		sub_p_year			int				not null,	-- 발매년도
		sub_p_publisher		varchar2(100)	not null,	-- 회사
		sub_p_filename		varchar2(100)	not null,	-- 파일명
		sub_p_detail_loc	varchar2(100)	not null	-- 상세페이지 주소
	)
	
	-- 기본키
	alter table sub_photo
		add constraint pk_sub_photo_idx primary key(sub_p_idx);
    
	select * from sub_photo
	
	select * from sub_photo order by sub_p_title
	
	select * from sub_photo order by sub_p_playtime asc
	
	--1~10
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'스플렌더','가족게임',		2,4,30,10,2014,'Brain Games','f-game1','de-f-1');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'스컬킹','가족게임',		2,6,30,8,2013,'Broadway Toys LTD','f-game2','de-f-2');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'윙스팬','가족게임',		1,5,40,10,2019,'999 Games','f-game3','de-f-3');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'스페이스 크루','가족게임',	2,5,20,10,2019,'999 Games','f-game4','de-f-4');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'7 윈더스','가족게임',		2,7,30,10,2010,'ADC Blackfire Entertainment','f-game5','de-f-5');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'에버델','가족게임',		1,4,40,13,2018,'Maldito Games','f-game6','de-f-6');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'티켓 투 라이드 : 유럽','가족게임',2,5,30,8,2005,'Runadrake','f-game7','de-f-7');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'카르카손','가족게임',		2,5,30,7,2000,'999 Games','f-game8','de-f-8');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'크베들린부르크의 돌팔이 약장수','가족게임',2,4,45,10,2018,'999 Games','f-game9','de-f-9');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'카탄의 개척자','가족게임',		3,4,60,10,1995,'999 Games','f-game10','de-f-10');

	--11~20
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'마헤','어린이게임',	2,6,20,6,1974,'Oya','k-game1','de-k-1');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'코코너츠','어린이게임'		,2,4,20,6,2013,'Maldito Games','k-game2','de-k-2');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'피그 파일','어린이게임',		3,6,30,7,2001,'DiceTree Games','k-game3','de-k-3');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'슈퍼 라이노','어린이게임',	2,5,5,5,2011,'Korea Boardames co','k-game4','de-k-4');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'핑고 핑고','어린이게임',		2,5,15,6,2015,'Asterion Press','k-game5','de-k-5');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'생쥐 만세!','어린이게임',	2,4,20,4,2002,'Matagot','k-game6','de-k-6');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'카탄 : 주니어','어린이게임',2,4,30,6,2011,'Mayfair Games','k-game7','de-k-7');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'슈퍼 라이노 : 슈퍼 배틀','어린이게임',2,4,10,5,2017,'Reflexshop','k-game8','de-k-8');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'숨바꼭질 왕국','어린이게임',2,5,25,7,2018,'Matagot','k-game9','de-k-9');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'한밤의 파티','어린이게임',	2,8,30,8,1989,'Discovery Toys','k-game10','de-k-10');

	--21~30
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'황혼의 투쟁',	   '워게임',2,2,120,13,2005,'GMT Games','w-game1','de-w-1');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'반지 전쟁(2판)',    '워게임',2,4,150,13,2011,'Ares Games','w-game2','de-w-2');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'루트',			  '워게임',2,4,60,10,2018,'Matagot','w-game3','de-w-3');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'세키가하라 : 일본의 통일','워게임',2,2,180,14,2011,'GMT Games','w-game4','de-w-4');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'패스 오브 글로리','워게임',2,2,480,14,1999,'GMT Games','w-game5','de-w-5');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'스타워즈 : X-웡 미니어처 게임','워게임',2,2,30,14,2012,'Martinex','w-game6','de-w-6');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'마리아','워게임',		2,3,210,14,2012,'Histongame','w-game7','de-w-7');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'워해머 언더월드 : 나이트 볼트','워게임',2,2,30,12,2018,'Gmaes Workshop Ltd','w-game8','de-w-8');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'메모아 44','워게임',	2,8,30,8,2004,'Edge Entertainment','w-game9','de-w-9');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'커맨드 & 컬러스 : 고대','워게임',2,2,60,12,2006,'GMT Games','w-game10','de-w-10');
	
	--31~40
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'글룸헤이븐',   '전략게임',1,4,60,14,2017,'Albi','s-game1','de-s-1');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'테라포밍 마스', '전략게임',1,5,120,12,2016,'Maldito Games','s-game2','de-s-2');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'메이지 나이트', '전략게임',1,4,60,14,2011,'Intrafin Games','s-game3','de-s-3');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'가이아 프로젝트','전략게임',1,4,60,12,2017,'DiceTree Gmaes','s-game4','de-s-4');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'팬데믹 레거시 : 시즌 1','전략게임',2,4,60,13,2015,'Z-Man Games','s-game5','de-s-5');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'쓰루 디 에이지스 : 문명에 관한 새로운 이야기','전략게임',2,4,120,14,2015,'DiceTree Games','s-game6','de-s-6');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'브라스 : 버밍엄','전략게임',2,4,60,14,2018,'Maldito Games','s-game7','de-s-7');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'7 원더스 대결',  '전략게임',2,2,30,10,2015,'ADC Blackfire Entertainment','s-game8','de-s-8');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'푸에르토 리코',   '전략게임',3,5,90,12,2002,'Albi','s-game9','de-s-9');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'아그리콜라',        '전략게임',1,5,30,12,2007,'Z-Man Games','s-game10','de-s-10');
	
	--41~50
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'마작',			  '추상게임',4,4,120,8,1850,'Unknown','a-game1','de-a-1');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'워 체스트',		  '추상게임',2,4,30,14,2018,'Maldito Games','a-game2','de-a-2');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'캐스캐디아','추상게임',2,4,30,10,2021,'KOSMOS','a-game3','de-a-3');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'아줄','추상게임'		,2,4,30,8,2017,'Broadway Toys LTD','a-game4','de-a-4');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'인쉬','추상게임',		2,2,30,9,2003,'DiceTree Games','a-game5','de-a-5');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'패치워크','추상게임',	2,2,15,8,2014,'Maldito Games','a-game6','de-a-6');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'우봉고 3D 프로','추상게임',2,4,30,10,2009,'Albi','a-game7','de-a-7');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'리코셰 로봇','추상게임'	,1,99,30,10,1999,'Oya','a-game8','de-a-8');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'사그라다','추상게임',	1,4,30,14,2017,'Matagot','a-game9','de-a-9');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'토레스','추상게임',	2,4,60,12,1999,'Tilsit','a-game10','de-a-10');
	
	--51~60
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'아컴 호러 : 카드게임','컬렉터블 게임',1,2,60,14,2016,'Asterion Press','c-game1','de-c-1');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'안드로이드 : 넷러너','컬렉터블 게임',2,2,45,14,2012,'Edge Entertainment','c-game2','de-c-2');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'마블 챔피언스 : 카드게임','컬렉터블 게임',1,4,45,14,2019,'ADC Blackfire Entertainment','c-game3','de-c-3');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'메이즈 워즈 아레나','컬렉터블 게임',2,2,90,13,2012,'Games Factory Publishing','c-game4','de-c-4');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'반지의 제왕 : 카드게임','컬렉터블 게임',1,2,30,13,2011,'ADC Blackfire Entertainment','c-game5','de-c-5');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'왕좌의 게임 : 카드게임 (2판)','컬렉터블 게임',2,4,60,14,2015,'ADC Blackfire Entertainment','c-game6','de-c-6');	
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'안드로이드 : 렛러너 - 데이터와 운명','컬렉터블 게임',2,2,45,14,2015,'Edge Entertainment','c-game7','de-c-7');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'서머너 워즈 (2판) 마스터 세트','컬렉터블 게임',2,2,45,9,2021,'Matagot','c-game8','de-c-8');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'마블 다이스 마스터 : 어벤져스 vs. X-men','컬렉터블 게임',2,2,60,14,2014,'Dervir','c-game9','de-c-9');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'히어로클릭스','컬렉터블 게임',2,2,60,10,2002,'WizKids','c-game10','de-c-10');
	
	--61~70	
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'네메시스','테마게임',		1,5,90,12,2018,'Piotr Foksowicz','t-game1','de-t-1');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'팬데믹 레거시 : 시즌 2','테마게임',2,4,60,14,2017,'Z-Man Games','t-game2','de-t-2');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'글룸헤이븐: 사자의 턱','테마게임',1,2,60,14,2016,'Edge Entertainment','t-game3','de-t-3');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'스타워즈 : 리벨리온','테마게임',2,4,180,14,2016,'ADC Blackfire Entertainment','t-game4','de-t-4');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'광기의 저택 (2판)','테마게임',1,5,120,14,2016,'ADC Blackfire Entertainment','t-game5','de-t-5');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'디센트: 어둠속의 여정 (2판)','테마게임',2,4,150,13,2011,'Zhiyanjia','t-game6','de-t-6');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'엘드리치 호러','테마게임',	1,8,120,14,2013,'ADC Blackfire Entertainment','t-game7','de-t-7');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'로빈슨 크루소 : 저주받은 섬에서의 모험','테마게임',1,4,60,14,2012,'DiceTree Games','t-game8','de-t-8');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'데드 오브 윈터 : 크로스로드 게임','테마게임',2,5,60,13,2014,'Gemenot','t-game9','de-t-9');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'반지의 제왕: 가운데땅 여정','테마게임',	1,5,60,14,2019,'ADC Blackfire Entertainment','t-game10','de-t-10');	
	
	--71~80	
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'레지스탕스 : 아발론','파티게임',5,10,30,13,2012,'Broadway Toys LTD','p-game1','de-p-1');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'라스베가스','파티게임',		2,5,30,8,2012,'Broadway Toys LTD','p-game2','de-p-2');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'텔레스트레이션','파티게임',	4,8,30,12,2009,'Broadway Toys LTD','p-game3','de-p-3');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'코드네임','파티게임',		2,8,15,14,2015,'Brain Games','p-game4','de-p-4');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'디셉션 : 홍콩 살인사건','파티게임',4,12,20,14,2014,'Gem Klub Kft','p-game5','de-p-5');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'딕싯','파티게임',			3,6,30,8,2008,'Paladium Games','p-game6','de-p-6');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'한밤의 늑대인간','파티게임',	3,10,10,8,2014,'Siam Board','p-game7','de-p-7');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'위대한 달무티','파티게임',	4,8,60,8,1995,'999 Games','p-game8','de-p-8');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'디크립토','파티게임',		3,8,45,12,2018,'ADC Blackfire Entertainment','p-game9','de-p-9');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'더 마인드','파티게임',		2,4,20,8,2018,'Brain Games','p-game10','de-p-10');
	
	--베스트게임
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'글룸헤이븐',   '베스트게임',1,4,60,14,2017,'Albi','s-game1','de-s-1');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'테라포밍 마스', '베스트게임',1,5,120,12,2016,'Maldito Games','s-game2','de-s-2');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'메이지 나이트', '베스트게임',1,4,60,14,2011,'Intrafin Games','s-game3','de-s-3');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'가이아 프로젝트','베스트게임',1,4,60,12,2017,'DiceTree Gmaes','s-game4','de-s-4');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'브라스 : 버밍엄','베스트게임',2,4,60,14,2018,'Maldito Games','s-game7','de-s-7');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'7 원더스 대결',  '베스트게임',2,2,30,10,2015,'ADC Blackfire Entertainment','s-game8','de-s-8');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'아그리콜라',        '베스트게임',1,5,30,12,2007,'Z-Man Games','s-game10','de-s-10');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'아컴 호러 : 카드게임','베스트게임',1,2,60,14,2016,'Asterion Press','c-game1','de-c-1');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'루트',			  '베스트게임',2,4,60,10,2018,'Matagot','w-game3','de-w-3');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'팬데믹 레거시 : 시즌 2','베스트게임',2,4,60,14,2017,'Z-Man Games','t-game2','de-t-2');
	
	--추천게임
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'캐스캐디아','추천게임',2,4,30,10,2021,'KOSMOS','a-game3','de-a-3');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'패치워크','추천게임',	2,2,15,8,2014,'Maldito Games','a-game6','de-a-6');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'더 마인드','추천게임',		2,4,20,8,2018,'Brain Games','p-game10','de-p-10');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'윙스팬','추천게임',		1,5,40,10,2019,'999 Games','f-game3','de-f-3');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'스페이스 크루','추천게임',	2,5,20,10,2019,'999 Games','f-game4','de-f-4');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'7 윈더스','추천게임',		2,7,30,10,2010,'ADC Blackfire Entertainment','f-game5','de-f-5');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'카르카손','추천게임',		2,5,30,7,2000,'999 Games','f-game8','de-f-8');
	INSERT INTO sub_photo VALUES(seq_sub_photo_idx.nextVal,'카탄의 개척자','추천게임',		3,4,60,10,1995,'999 Games','f-game10','de-f-10');
	
	update sub_photo set sub_p_filename= sub_p_filename || '.png'
    commit
    
*/