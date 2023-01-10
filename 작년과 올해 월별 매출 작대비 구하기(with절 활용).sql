with with_purchase as(
                      select dt
                            , substr(dt,1,4) as 년도
                            , substr(dt,6,2) as 월
                            , substr(dt,9,2) as 날짜
                            , sum(purchase_amount) as 금액합계
                        FROM purchase
                       group by dt
                      )
select 월
      , sum(case 년도 when '2014' then 금액합계 end) as 월별_2014
      , sum(case 년도 when '2015' then 금액합계 end) as 월별_2015
      , ceil(sum(case 년도 when '2015' then 금액합계 end) / sum(case 년도 when '2014' then 금액합계 end) * 100) as rate
from with_purchase
group by 월
order by 월