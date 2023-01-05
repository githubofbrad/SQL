--5) CUSTOMER 및 SALES 테이블을 활용하여, 회원가입만하고 주문이력이 없는 회원수를 구하시오.
SELECT *
FROM Customer부스트 A
LEFT 
OUTER
 JOIN Sales_부스트 B ON A.mem_no = B.mem_no  