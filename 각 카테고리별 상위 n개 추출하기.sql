select *
from(
        SELECT PRODUCT_ID
             , category
             , SCORE
             , ROW_NUMBER() OVER (PARTITION BY category ORDER BY SCORE) as rank
        FROM PRODUCTS
    ) A   
where rank <= n

--1)윈도우 함수 사용하여 각 카테고리 순위 계산
--2)SELECT 구문에서 윈도우 함수를 사용한 결과를 서브 쿼리로 만든 후 WHERE 구문 작성