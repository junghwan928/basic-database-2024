-- 집계함수, GROUP BY
-- 고객이 주문한 도서의 총 판매액

SELECT sum(saleprice) AS [총 매출]
	FROM Orders;


-- 김연아 고객이 주문한 도서의 총 판매액
SELECT *
	FROM Customer;

-- 김연아는 CUSTID 2번이다

SELECT sum(saleprice) AS '김연아고객 총 판매액'
	FROM Orders
	WHERE custid = 2;

-- count()는 * 사용할수 있음
-- 나머지는 집계함수는 열 컬럼 하나만 지정해서 사용할것
Select COUNT(saleprice) AS [주문개수], 
	SUM(saleprice) AS [총 판매액], 
	AVG(saleprice) AS [판매액 평균], 
	MIN(saleprice) AS [주문도서 최소금액],
	MIN(saleprice) AS [주문도서 최대금액] 
	from Orders;

-- 도서건수
SELECT COUNT(DISTINCT publisher) as [중복제거] 
	from Book;

-- GROUP BY - 필요조건 그룹핑 해서 결과 통계를 내기 위함
-- GROUP BY절에 들어 있는 컬럼 외에는 SELECT 문에 절대 쓸수 없음
-- 단, SALEPRICE는 집계함수안에 들어있으면 예외
SELECT custid, SUM(saleprice) as '판매액'
	FROM Orders
	GROUP BY custid;
