

CREATE TABLE lotto (
	"회차" INT PRIMARY KEY UNIQUE,
	"1번째당첨번호" DECIMAL(2,0),
	"2번째당첨번호" DECIMAL(2,0),
	"3번째당첨번호" DECIMAL(2,0),
	"4번째당첨번호" DECIMAL(2,0),
	"5번째당첨번호" DECIMAL(2,0),
	"6번째당첨번호" DECIMAL(2,0),
	"보너스" DECIMAL (2,0),
	"추첨일자" DATE,
	"1등당첨자수" DECIMAL(15,0),
	"1등당첨상금" DECIMAL(15,0),
	"2등당첨자수" DECIMAL(15,0),
	"2등당첨상금" DECIMAL(15,0),
	"3등당첨자수" DECIMAL(15,0),
	"3등당첨상금" DECIMAL(15,0)
);

SELECT * FROM lotto;

DROP TABLE lotto;