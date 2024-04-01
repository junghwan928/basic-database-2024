-- 1. 주문하지 않은 고객이름(서브쿼리 사용)
SELECT [name]
    FROM Customer
    WHERE custid NOT IN (SELECT DISTINCT custid FROM Orders);

-- 2. 주문 금액의 총액과 주문의 평균금액
SELECT SUM(saleprice) 
    AS TotalSales, AVG(saleprice) 
    AS AverageSales
    FROM Orders;

-- 3. 고객의 이름과 고객별 구매액
SELECT C.name, SUM(O.saleprice) AS TotalPurchase
    FROM Customer C
    JOIN Orders O ON C.custid = O.custid
    GROUP BY C.name;

-- 4. 고객의 이름과 고객이 구매한 도서 목록
SELECT C.name, B.bookname
    FROM Customer C
    JOIN Orders O ON C.custid = O.custid
    JOIN Book B ON O.bookid = B.bookid;

-- 5. 도서의 가격 BOOK 테이블 판매가격의 차이가 많은 주문
SELECT O.orderid, B.bookname, MAX(B.price - O.saleprice) AS PriceDifference
    FROM Orders O
    JOIN Book B ON O.bookid = B.bookid
    GROUP BY O.orderid, B.bookname
    ORDER BY PriceDifference DESC;

-- 6. 도서 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름
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
