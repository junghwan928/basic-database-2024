-- 전체 고객중 도서를 구매하지 않은 고객의 이름 조회
SELECT [name]
    from Customer
EXCEPT
SELECT [name]
    from Customer
    where custid in (select DISTINCT custid From Orders);