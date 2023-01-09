SELECT id
     , listagg(id, ',') as ids    --listagg를 통해 여러 개의 열로 된 값을 한 행으로 가져올 수 있음
     , sum(price) as amount
FROM purchase_detail
group by id
