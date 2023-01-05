SELECT *
	, RANK() OVER (PARTITION BY mem_no ORDER BY order_date) -- 동일한 순위가 나왔을 때 동일한 수만큼 건너뛰고 순위 계산 ex)1224
	, DENSE_RANK() OVER (PARTITION BY mem_no ORDER BY order_date) -- 동일한 순위가 나왔을 때, 바로 그 다음 순위 반환 ex)1223
	, ROW_NUMBER () OVER (PARTITION BY mem_no ORDER BY order_date) -- 고유한 순위 반환 ex)1234
FROM Sales
