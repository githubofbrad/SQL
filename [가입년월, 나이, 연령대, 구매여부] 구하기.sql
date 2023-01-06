SELECT 
	  SUBSTRING(join_date ,1,4) AS 가입년월                                  --가입년월 구하기
	, 2022 - SUBSTRING(birthday,1,4) AS 나이                                --나이 구하기
	, CASE WHEN 2022 - SUBSTRING(birthday,1,4) + 1 < 20 THEN '20대 이하'
		  WHEN 2022 - SUBSTRING(birthday,1,4) + 1 < 30 THEN '30대 이하'
		  WHEN 2022 - SUBSTRING(birthday,1,4) + 1 < 40 THEN '40대 이하'
		  WHEN 2022 - SUBSTRING(birthday,1,4) + 1 < 50 THEN '50대 이하'
		  ELSE '그외' END AS 연령대                                          --연령대 구하기
     , CASE WHEN ORDER_NO IS NULL THEN '미구매'
      	  ELSE '구매' END AS 구매여부                                         --구매여부 구하기
FROM Customer A
LEFT 
OUTER
JOIN Sales B ON A.mem_no = B.mem_no 
