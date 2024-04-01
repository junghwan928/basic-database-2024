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
-- Select로 만든 실행결과(가상의 테이블)를 마치 DB에 있는 테이블 처럼 사용가능
SELECT b.bookid, b.bookname, b.publisher, o.orderdate, o.orderid
    FROM Book as b, Orders as o
    WHERE b.bookid = o.bookid


-- 서브쿼리 SELECT 절
-- 무조건 1건이 1컬럼만 연결
SELECT o.orderid, o.custid, (select name from Customer where custid = o.custid), o.bookid, (select bookname from Book where bookid = o.bookid), o.saleprice, o.orderdate
 FROM Orders as o;

 -- 대한미디어에서 출판한 도서를 구매한 고객의 이름을 조회
 select name from Customer where custid in (
 SELECT * From Orders 
 where bookid in (select bookid from Book
 where publisher = '대한미디어'));


-- 대한미이디어에서 출판한 도서를 구매한 고객의 이름을 조회
SELECT [name] AS '고객명'
  FROM Customer
 WHERE custid IN(SELECT custid
                   FROM Orders
                  WHERE bookid IN (SELECT bookid
                    FROM Book
                   WHERE publisher = '대한미이어'));


-- 계산결과를 서브쿼리 사용
-- 각각의 출판사의 도서평균 가격을 넘은 책들만 조회
 SELECT b1.*
 from Book b1
 where b1.price>(select AVG(b2.price)
                    from Book b2 where b2.publisher = b1.publisher)