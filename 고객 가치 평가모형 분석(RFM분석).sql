SELECT A.*, B.구매금액, B.구매빈도
FROM CUSTOMER A
LEFT
JOIN (
	 SELECT A.MEM_NO
	      , SUM(A.SALES_QTY * B.PRICE) AS 구매금액   --M:구매금액
	      , COUNT(A.ORDER_NO) AS 구매빈도            --F:구매빈도
	   FROM SALES A
	   LEFT
	   JOIN PRODUCT B 
	  WHERE SUBSTRING(A.ORDER_DATE,1,4) = '2020'   --R:최근성
	  GROUP
	     BY 1
	 ) B
ON A.MEM_NO = B.MEM_NO