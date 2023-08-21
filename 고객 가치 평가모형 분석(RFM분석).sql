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


--구매금액 기준 점수 부여
with datamart as(    
		 select A.*, B.금액, B.구매빈도
		   from table_customer A
		   left join ( select *
				     , sum(a.sales_count * b.price) as 금액       
			   	     , count(a.order_no) as 구매빈도                
				 from table_sales a
	    		         left join table_product b on a.product_code = b.product_code
				where SUBSTRING(a.order_date,1,4) = '2023'      
				group by a.mem_no
			     ) AS B
			   ON A.mem_no = B.mem_no
		 )
SELECT mem_no
     , case when 금액 >= 2000000 then 5
            when 금액 >= 1500000 then 4
            when 금액 >= 1000000 then 3
            when 금액 >= 500000 then 2
            else 1
            end as 구매금액스코어
  from datamart
  group by mem_no
