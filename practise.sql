SELECT * FROM public.payment
ORDER BY payment_id ASC LIMIT 100

SELECT customer_id ,count(*) AS 筆數
FROM payment
GROUP BY customer_id

SELECT *FROM payment

SELECT customer_id ,SUM(amount) AS 總和 /*SUM(欄位名稱),總和*/
FROM payment
GROUP BY customer_id
ORDER BY 總和 DESC;


SELECT first_name || ' ' || last_name AS full_name,/*|| ' ' ||AS full_name 連結欄位進行更名*/
	   SUM(amount) AS 總合
FROM payment LEFT JOIN customer ON payment.customer_id=customer.customer_id
GROUP BY full_name
ORDER BY 總合 DESC;

SELECT first_name || ' ' || last_name AS full_name,
	   SUM(amount) AS 總合
FROM payment LEFT JOIN customer USING (customer_id) /*on的欄位名稱相同時，就可以用using代替*/
GROUP BY full_name
HAVING SUM(amount) >=200 
ORDER BY 總合 DESC;