SELECT YEAR
     , Q2
     , Q3
     , CASE WHEN Q2 < Q3 THEN '+'
            WHEN Q2 > Q3 THEN '-'
            ELSE ' ' END AS 매출변화_WAY1
     , SIGN(Q3-Q2) AS 매출변화_WAY2        
     , Q3 - Q2 AS 매출액_차이
FROM QUARTERLY_SALES