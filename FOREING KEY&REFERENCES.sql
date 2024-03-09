
CREATE TABLE IF NOT EXISTS 客戶(
	客戶_id SERIAL PRIMARY KEY,
	客戶名稱 VARCHAR(255) NOT NULL
	)
	
DROP TABLE IF EXISTS 客戶;
DROP TABLE IF EXISTS 聯絡人;
SELECT *FROM 客戶;
SELECT *FROM 聯絡人;

CREATE TABLE IF NOT EXISTS 聯絡人(
	聯絡人id SERIAL PRIMARY KEY,
	客戶id INT,
	聯絡人姓名 VARCHAR(255) NOT NULL,
	電話 VARCHAR(15),
	郵件 VARCHAR(100),
	FOREIGN KEY (客戶id) REFERENCES 客戶(客戶_id)ON DELETE SET NULL); /*FOREIGN KEY 保持資料一至性, REFERENCES 客戶(客戶_id)讀取 客戶中的客戶ID這欄位*/
	                                                              /*ON DELETE SET NULL當我客戶這個欄位被DEL時 欄位會變NULL*/                            

INSERT INTO 客戶(客戶名稱)
VALUES('台灣大哥大'),
      ('遠傳電信');

INSERT INTO 聯絡人(客戶id,聯絡人姓名,電話,郵件)
VALUES (1,'John Doe','(408)-111-1234','john.doe@bluebird.dev'),
	   (1,'Jane Doe','(408)-111-1235','jane.doe@bluebird.dev'),
	   (2,'David Wright','(408)-222-1234','david.wright@dolphin.dev');

DELETE FROM 客戶 /*如果要DEL資料必須要加這行ON DELETE SET NULL*/
WHERE 客戶_id = 1;