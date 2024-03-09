CREATE TABLE IF NOT EXISTS stations(
	編號 INT PRIMARY KEY, 
	名稱 VARCHAR(30) NOT NULL,
	英文名稱 VARCHAR(50),
	地名 VARCHAR(20),
	英文地名 VARCHAR(50),
	地址 VARCHAR(255),
	英文地址 VARCHAR(255),
	電話 VARCHAR(50),
	gps VARCHAR(50),
	youbike BOOL
);

CREATE TABLE IF NOT EXISTS gate_count(
	id SERIAL PRIMARY KEY,
	日期 DATE NOT NULL,
	站點編號 INT,
	進站人數 INT DEFAULT 0,
	出站人數 INT DEFAULT 0,
	FOREIGN KEY(站點編號) REFERENCES stations(編號)
	ON DELETE SET NULL
	ON UPDATE CASCADE
)
SELECT * FROM gate_count;
SELECT * FROM stations;
DROP TABLE IF EXISTS gate_count;
DROP TABLE IF EXISTS stations;


SELECT  DISTINCT 名稱 /*DISTINCT不顯示重複值,選擇欄位*/
FROM gate_count LEFT JOIN stations ON 站點編號=編號
WHERE 地址 LIKE '基隆%';

SELECT  日期,進站人數,出站人數,名稱,地名,地址,youbike /*DISTINCT不顯示重複值,選擇欄位*/
FROM gate_count LEFT JOIN stations ON 站點編號=編號
WHERE 名稱 IN ('基隆','台北') AND (日期 BETWEEN '20220301' AND '20220331')
ORDER BY 日期 ASC;

SELECT  日期,進站人數,出站人數,名稱,地名,地址,youbike,count(*) AS 筆數 /*DISTINCT不顯示重複值,選擇欄位*/
FROM gate_count LEFT JOIN stations ON 站點編號=編號
ORDER BY 進站人數 DESC LIMIT 10;
	
SELECT COUNT(*) AS 筆數
FROM stations;

SELECT COUNT(*) AS 筆數
FROM gate_count;

SELECT  名稱,日期,SUM(進站人數) AS 總和 
FROM gate_count LEFT JOIN stations ON 站點編號=編號
WHERE 日期 BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY 名稱,日期;