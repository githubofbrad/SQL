WITH JANUARY_SALES AS(
                        select CATEGORY                                    --WITH구문1)
                              , SUM(PRICE) AS amount                       --항목별 매출 계산
                        FROM purchase
                        where DT between '2022-01-01' and '2022-01-31'     --2022년 1월 한 달 동안으로 범위 제한     
                        group by CATEGORY
                      )
, JANUARY_SALES_RATIO AS(                                                           --WITH구문2)
                        select category
                             , amount
                             , amount / sum(amount) over() * 100 as 구성비            --구성비:항목별 매출/전체매출 * 100
                             , sum(amount) over(order by amount desc) / sum(amount) over() * 100 as 구성비누계  --구성비누계: 항목별 누계 매출/전체매출 * 100
                          from JANUARY_SALES
                        )
     select *
          , case when 구성비누계 between 0 and 70 then 'A'                             --구성비 누계에 따른 ABC 분석
                 when 구성비누계 between 70 and 90 then 'B'
                 when 구성비누계 between 90 and 100 then 'C'
                 End as rank
       from JANUARY_SALES_RATIO
    order by amount desc