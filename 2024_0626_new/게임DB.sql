CREATE TABLE games(
	game_idx   int,
	name	   VARCHAR2(200) ,
	category   VARCHAR2(100)	NOT NULL,
	min_player int				DEFAULT 2,
	max_player int				DEFAULT 2,
	playtime   int		 		NOT NULL,
	age		   int 				NOT NULL,
	year	   int 				NOT NULL,
	publisher  VARCHAR2(200)  	NOT NULL
)

	ALTER TABLE games
		ADD CONSTRAINT pk_games_game_idx PRIMARY KEY (game_idx)
	
	ALTER TABLE games
		ADD CONSTRAINT unique_games_name UNIQUE (name)	
	
	CREATE SEQUENCE seq_games_game_idx
		
	SELECT * FROM games
	
--1~10
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'스플렌더','가족게임',		2,4,30,10,2014,'Brain Games');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'스컬킹','가족게임',		2,6,30,8,2013,'Broadway Toys LTD');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'윙스팬','가족게임',		1,5,40,10,2019,'999 Games');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'스페이스 크루','가족게임',	2,5,20,10,2019,'999 Games');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'7 윈더스','가족게임',		2,7,30,10,2010,'ADC Blackfire Entertainment');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'에버델','가족게임',		1,4,40,13,2018,'Maldito Games');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'티켓 투 라이드 : 유럽','가족게임',2,5,30,8,2005,'Runadrake');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'카르카손','가족게임',		2,5,30,7,2000,'999 Games');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'크베들린부르크의 돌팔이 약장수','가족게임',2,4,45,10,2018,'999 Games');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'카탄의 개척자','가족게임',		3,4,60,10,1995,'999 Games');

--11~20
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'마헤','어린이게임',	2,6,20,6,1974,'Oya');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'코코너츠','어린이게임'		,2,4,20,6,2013,'Maldito Games');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'피그 파일','어린이게임',		3,6,30,7,2001,'DiceTree Games');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'슈퍼 라이노','어린이게임',	2,5,5,5,2011,'Korea Boardames co');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'핑고 핑고','어린이게임',		2,5,15,6,2015,'Asterion Press');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'생쥐 만세!','어린이게임',	2,4,20,4,2002,'Matagot');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'카탄 : 주니어','어린이게임',2,4,30,6,2011,'Mayfair Games');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'슈퍼 라이노 : 슈퍼 배틀','어린이게임',2,4,10,5,2017,'Reflexshop');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'숨바꼭질 왕국','어린이게임',2,5,25,7,2018,'Matagot');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'한밤의 파티','어린이게임',	2,8,30,8,1989,'Discovery Toys');

--21~30
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'황혼의 투쟁',	   '워게임',2,2,120,13,2005,'GMT Games');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'반지 전쟁(2판)',    '워게임',2,4,150,13,2011,'Ares Games');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'루트',			  '워게임',2,4,60,10,2018,'Matagot');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'세키가하라 : 일본의 통일','워게임',2,2,180,14,2011,'GMT Games');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'패스 오브 글로리','워게임',2,2,480,14,1999,'GMT Games');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'스타워즈 : X-웡 미니어처 게임','워게임',2,2,30,14,2012,'Martinex');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'마리아','워게임',		2,3,210,14,2012,'Histongame');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'워해머 언더월드 : 나이트 볼트','워게임',2,2,30,12,2018,'Gmaes Workshop Ltd');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'메모아 44','워게임',	2,8,30,8,2004,'Edge Entertainment');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'커맨드 & 컬러스 : 고대','워게임',2,2,60,12,2006,'GMT Games');
--31~40
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'글룸헤이븐',   '전략게임',1,4,60,14,2017,'Albi');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'테라포밍 마스', '전략게임',1,5,120,12,2016,'Maldito Games');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'메이지 나이트', '전략게임',1,4,60,14,2011,'Intrafin Games');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'가이아 프로젝트','전략게임',1,4,60,12,2017,'DiceTree Gmaes');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'팬데믹 레거시 : 시즌 1','전략게임',2,4,60,13,2015,'Z-Man Games');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'쓰루 디 에이지스 : 문명에 관한 새로운 이야기','전략게임',2,4,120,14,2015,'DiceTree Games');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'브라스 : 버밍엄','전략게임',2,4,60,14,2018,'Maldito Games');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'7 원더스 대결',  '전략게임',2,2,30,10,2015,'ADC Blackfire Entertainment');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'푸에르토 리코',   '전략게임',3,5,90,12,2002,'Albi');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'아그리콜라',        '전략게임',1,5,30,12,2007,'Z-Man Games');
--41~50
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'마작',			  '추상게임',4,4,120,8,1850,'Unknown');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'워 체스트',		  '추상게임',2,4,30,14,2018,'Maldito Games');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'캐스캐디아','추상게임',2,4,30,10,2021,'KOSMOS');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'아줄','추상게임'		,2,4,30,8,2017,'Broadway Toys LTD');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'인쉬','추상게임',		2,2,30,9,2003,'DiceTree Games');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'패치워크','추상게임',	2,2,15,8,2014,'Maldito Games');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'우봉고 3D 프로','추상게임',2,4,30,10,2009,'Albi');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'리코셰 로봇','추상게임'	,1,99,30,10,1999,'Oya');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'사그라다','추상게임',	1,4,30,14,2017,'Matagot');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'토레스','추상게임',	2,4,60,12,1999,'Tilsit');
--51~60
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'아컴 호러 : 카드게임','컬렉터블 게임',1,2,60,14,2016,'Asterion Press');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'안드로이드 : 넷러너','컬렉터블 게임',2,2,45,14,2012,'Edge Entertainment');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'마블 챔피언스 : 카드게임','컬렉터블 게임',1,4,45,14,2019,'ADC Blackfire Entertainment');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'메이즈 워즈 아레나','컬렉터블 게임',2,2,90,13,2012,'Games Factory Publishing');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'반지의 제왕 : 카드게임','컬렉터블 게임',1,2,30,13,2011,'ADC Blackfire Entertainment');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'왕좌의 게임 : 카드게임 (2판)','컬렉터블 게임',2,4,60,14,2015,'ADC Blackfire Entertainment');	
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'안드로이드 : 렛러너 - 데이터와 운명','컬렉터블 게임',2,2,45,14,2015,'Edge Entertainment');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'서머너 워즈 (2판) 마스터 세트','컬렉터블 게임',2,2,45,9,2021,'Matagot');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'마블 다이스 마스터 : 어벤져스 vs. X-men','컬렉터블 게임',2,2,60,14,2014,'Dervir');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'히어로클릭스','컬렉터블 게임',2,2,60,10,2002,'WizKids');
--61~70	
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'네메시스','테마게임',		1,5,90,12,2018,'Piotr Foksowicz');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'팬데믹 레거시 : 시즌 2','테마게임',2,4,60,14,2017,'Z-Man Games');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'글룸헤이븐: 사자의 턱','테마게임',1,2,60,14,2016,'Edge Entertainment');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'스타워즈 : 리벨리온','테마게임',2,4,180,14,2016,'ADC Blackfire Entertainment');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'광기의 저택 (2판)','테마게임',1,5,120,14,2016,'ADC Blackfire Entertainment');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'디센트: 어둠속의 여정 (2판)','테마게임',2,4,150,13,2011,'Zhiyanjia');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'엘드리치 호러','테마게임',	1,8,120,14,2013,'ADC Blackfire Entertainment');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'로빈슨 크루소 : 저주받은 섬에서의 모험','테마게임',1,4,60,14,2012,'DiceTree Games');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'데드 오브 윈터 : 크로스로드 게임','테마게임',2,5,60,13,2014,'Gemenot');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'반지의 제왕: 가운데땅 여정','테마게임',	1,5,60,14,2019,'ADC Blackfire Entertainment');	
--71~80	
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'레지스탕스 : 아발론','파티게임',5,10,30,13,2012,'Broadway Toys LTD');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'라스베가스','파티게임',		2,5,30,8,2012,'Broadway Toys LTD');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'텔레스트레이션','파티게임',	4,8,30,12,2009,'Broadway Toys LTD');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'코드네임','파티게임',		2,8,15,14,2015,'Brain Games');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'디셉션 : 홍콩 살인사건','파티게임',4,12,20,14,2014,'Gem Klub Kft');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'딕싯','파티게임',			3,6,30,8,2008,'Paladium Games');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'한밤의 늑대인간','파티게임',	3,10,10,8,2014,'Siam Board');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'위대한 달무티','파티게임',	4,8,60,8,1995,'999 Games');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'디크립토','파티게임',		3,8,45,12,2018,'ADC Blackfire Entertainment');
	INSERT INTO games VALUES(seq_games_game_idx.nextVal,'더 마인드','파티게임',		2,4,20,8,2018,'Brain Games');	