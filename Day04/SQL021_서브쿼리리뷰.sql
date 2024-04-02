-- WHERE 절
-- ORDER테이블에서 평균 주문금액 이하의 주문에 대해 주문번호, 금액표시
-- 서브쿼리 (소괄호 내의 쿼리) 먼저 작성
SELECT orderid, saleprice from Orders
WHERE saleprice <= (SELECT avg(saleprice) FROM ORDERS);

-- 각 고객의 평균 주문금액보다 큰 금액의 주문 내역 주문번호, 고객번호, 금액 표시
-- 다른 방식으로 쿼리를 작성하기 애매
-- 1번 13000, 2번 7500, 3번 10333, 4번 165000
SELECT o2.custid,AVG(saleprice) FROM Orders as o2
GROUP BY o2.custid


-- 메인쿼리의 컬럼을 서브쿼리의 컬럼과 비교할 때 사용.
-- 난이도 높음
SELECT o1.* FROM Orders as o1 WHERE o1.saleprice > (
SELECT AVG(saleprice) as AVG_saleprice FROM Orders as o2)

-- IN, NOT IN
-- 대한민국에 거주하는 고객에 판매하는 도서의 총 판매액
-- 118000 - 46000 = 72000원
SELECT FORMAT(SUM(saleprice), '#,#') AS '대한민국 고객 총 판매액' FROM Orders 
WHERE custid NOT IN (
SELECT custid FROM Customer
WHERE [address] LIKE '%대한민국%')