-- 1. 주문하지 않은 고객이름(서브쿼리 사용)
SELECT [name]
    FROM Customer
    WHERE custid NOT IN (SELECT DISTINCT custid FROM Orders);

-- 2. 주문 금액의 총액과 주문의 평균금액
SELECT SUM(saleprice) AS '주문 총액', 
    AVG(saleprice) AS '주문 평균금액'
    FROM Orders;

-- 3. 고객의 이름과 고객별 구매액
SELECT C.name, SUM(O.saleprice) AS '주문 총액'
    FROM Customer C, Orders O
    WHERE C.custid = O.custid
    GROUP BY C.name;

-- 4. 고객의 이름과 고객이 구매한 도서 목록
SELECT C.name, B.bookname
    FROM Customer C, Orders O, Book B
    WHERE C.custid = O.custid
    AND O.bookid = B.bookid;

-- 5. 도서의 가격 BOOK 테이블 판매가격의 차이가 많은 주문
SELECT O.orderid, B.bookname, MAX(B.price - O.saleprice) AS PriceDifference
    FROM Orders O
    JOIN Book B ON O.bookid = B.bookid
    GROUP BY O.orderid, B.bookname
    ORDER BY PriceDifference DESC;

-- 5. 도서의 가격 BOOK 테이블 판매가격의 차이가 많은 주문 (최대 값만 출력)
SELECT O.orderid, B.bookname, B.price - O.saleprice AS PriceDiffer
    FROM Orders O
    JOIN Book B ON O.bookid = B.bookid
    WHERE B.price - O.saleprice = (
        SELECT MAX(B2.price - O2.saleprice)
            FROM Orders O2
            JOIN Book B2 ON O2.bookid = B2.bookid)


-- 5. 도서의 가격 BOOK 테이블 판매가격의 차이가 많은 주문 (최대 값만 출력)
SELECT TOP 1 O.orderid,o.saleprice, B.bookname, (B.price - O.saleprice) AS '금액차'
FROM Orders as O, Book as B 
WHERE O.bookid = B.bookid
ORDER BY 4 DESC


-- 6. 도서 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름
-- 전체 도서의 판매 평균은 = 11800원
SELECT C.name
    FROM Customer C
  
JOIN (
    SELECT custid, AVG(saleprice) AS AvgPurchase
    FROM Orders
    GROUP BY custid
    ) AS CustomerPurchase ON C.custid = CustomerPurchase.custid

JOIN (
    SELECT AVG(price) AS AvgBookPrice
    FROM Book
    ) AS BookAvg ON CustomerPurchase.AvgPurchase > BookAvg.AvgBookPrice;

