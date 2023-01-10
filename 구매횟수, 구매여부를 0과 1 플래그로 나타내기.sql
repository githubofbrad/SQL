SELECT A.USER_ID
     , A.CARD_NUMBER
     , COUNT(B.user_id) AS 구매횟수
     , CASE WHEN A.CARD_NUMBER IS NOT NULL THEN 1 ELSE 0 END AS 카드보유여부 --카드보유시 1, 반대의 경우 0 출력
     , SIGN(COUNT(B.USER_ID)) AS 구매여부 -- 구매 한 건 이상일 때 1, 한 건도 하지 않았을 경우 0 출력
FROM mst_users A
LEFT 
JOIN purchase B on A.user_id = B.user_id
Group by A.USER_id, A.CARD_NUMBER