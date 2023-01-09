SELECT dt
      , ad_id
      , CASE WHEN impressions > 0 then clicks/impressions * 100 end AS CTR
      , clicks / nullif(impressions,0) * 100 as CTR2 -- CTR이랑 같은 결과 출력
FROM advertising

-- CTR = 클릭 / 노출수
--     = clicks / impressions       