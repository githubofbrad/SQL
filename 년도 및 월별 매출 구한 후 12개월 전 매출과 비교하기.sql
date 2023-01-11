WITH daily_purchase as (
                        SELECT dt
                              , purchase_amount
                              , SUBSTR(DT,1,4) as year
                              , SUBSTR(DT,6,2) as month
                              , SUBSTR(DT,9,2) as day
                              , count(order_id) as orders
                          FROM purchase_log
                         GROUP BY dt, purchase_amount
                        )                                                          -- WITH구문1) 년도,월,날짜 추출
      , monthly_purchase AS (
                             SELECT year
                                  , month
                                  , avg(purchase_amount) as avg_amount
                                  , sum(purchase_amount) as monthly
		                     FROM daily_purchase
		                 GROUP BY year, month    
                             )                                                     -- WITH구문2) 년도 및 월별 금액 평균 및 합계 추출
SELECT year||'-'||month as year_month
     , avg_amount
     , monthly
     , sum(monthly) over (partition by year order by month) as 년도별_누적합계
     , lag(monthly,12) over(order by year, month) as 매출구하기_12개월전
     , monthly / lag(monthly,12) over (order by year, month) * 100 as rate
  FROM monthly_purchase                  
  order by year_month                                                               --3) 년도/월 이어주기, 윈도우 함수 사용하여 년도별 누적합계
                                                                                   --   LAG 사용하여 12개월 전 매출 추출
                                                                                   --   비율 구하여 올해와 12개월 전 매출 비율 비교 가능