-- 책가격이 가장 비싼 책
SELECT MAX(price) 
    FROM BOOK;

-- 35000원인거 찾자
SELECT *
    FROM Book
    WHERE price= 35000;

-- 서브쿼리를 쓰면 한번에 실행가능
-- 서브쿼리 where from select 
SELECT *
    FROM Book
    WHERE price=(SELECT MAX(price)
                    FROM Book);

-- 도서를 구매한 적이 있는 고객리스트 검색
-- 서브 쿼리
SELECT [name] AS '고객이름'
    FROM Customer
    WHERE custid NOT IN (SELECT DISTINCT custid 
                    FROM Orders);


-- 조인으로도 동일함
SELECT DISTINCT c.[name] AS '고객이름'
    FROM Customer AS c, Orders as o
    where c.custid = o.custid

-- 구매한적 없는 고객 외부조인
SELECT DISTINCT c.[name] AS '고객이름'
    FROM Customer AS c LEFT OUTER JOIN Orders as o
    ON c.custid = o.custid
    where o.orderid IS NULL;

-- 서브쿼리 FROM 절

SELECT b.bookid, b.bookname, b.publisher, o.orderdate, o.orderid
    FROM Book as b, Orders as o
    WHERE b.bookid = o.bookid