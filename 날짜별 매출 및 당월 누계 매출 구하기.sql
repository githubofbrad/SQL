SELECT DT
      , SUBSTR(DT,1,7) AS 년도_월
      , SUM(PURCHASE_AMOUNT) AS 날짜별_매출
      , SUM(SUM(PURCHASE_AMOUNT)) OVER (PARTITION BY SUBSTR(DT,1,7) ORDER BY DT) AS 당월누계매출
FROM PURCHASE_
GROUP BY DT
ORDER BY DT