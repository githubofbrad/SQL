SELECT COUNT(*)
FROM Customer A
LEFT 
OUTER
 JOIN Sales_ B ON A.mem_no = B.mem_no  
WHERE ORDER_NO IS NULL 
