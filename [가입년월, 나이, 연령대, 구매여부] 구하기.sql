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

----*연령대 구분 목록(예시)*----
--C(Child): 4~12세 남성과 여성
--T(Teenager): 13~19세 남성과 여성
--M1(Male): 20~34세의 남성
--M2(Male): 35~49세의 남성
--M3(Male): 50세 이상의 남성
--F1(Female): 20~34세의 여성
--F2(Female): 35~49세의 여성
--F3(Female): 50세 이상의 여성

--위와 같이 연령대를 구분하되, 서비스에 따라 연령대를 새로운 기준으로 정렬
