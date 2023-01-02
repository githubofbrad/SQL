SELECT TYPE
	, CASE WHEN price  <= 1000000 THEN '하'
	       WHEN price  <= 2000000 THEN '중'
	       WHEN price  <= 3000000 THEN '상'
	       ELSE '최상' END AS 가격정렬
FROM PRODUCT
