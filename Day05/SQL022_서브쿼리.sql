-- 서브쿼리 리뷰
-- WHERE 절
-- ALL, ANY, SOME
-- 3번 고객이 주문한 도서의 최고금액보다 더 비싼 도서를 구입한 다른 주문의 주문번호, 금액을 출력
SELECT * FROM Customer

-- 장미란이 주문한 내역
SELECT MAX(saleprice) FROM Orders
WHERE custid = 3

-- 13000원 보다 비싼 도서를 구입한 주문번호, 금액
SELECT o1.orderid,o1.saleprice FROM Orders as o1
WHERE o1.saleprice>(
    SELECT MAX(saleprice) FROM Orders
    WHERE custid = 3);

-- EXITS, NOT EXITS
-- 대한민국 거주 고객에게 판매한 도서의 총 판매액
-- 전체 판매액 118000, 대한민국 고객 판매액 46000
SELECT SUM(saleprice) AS '대한민국 고객 판매액'
FROM Orders as o
WHERE EXISTS (SELECT * FROM Customer AS c
                WHERE c.address LIKE '%대한민국%'
                and c.custid = o.custid)

-- 조인으로도 금액을 찾을 수 있음
SELECT SUM(o.saleprice) as '조인도 가능'
FROM Orders AS o, Customer AS C
WHERE o.custid = c.custid AND c.address LIKE '%대한민국%'

-- SELECT 절 서브쿼리 -> JOIN
-- 고객별 판매액을 보이시오
-- 고객별 판매액 보이시오, GROUP BY 들어가면 SELECT절 반드시 집계함수가 들어가야함

SELECT SUM(o.saleprice) AS '고객별 판매액', o.custid, 
(select [name] from Customer WHERE custid = o.custid) as '고객명'
 FROM Orders as o
 GROUP BY o.custid;

 -- 조인가능


 -- update에서도 사용가능
 -- 사전 준비
 ALTER TABLE Orders ADD bookname VARCHAR(40);


-- 업데이트, 한꺼번에 필요한 필드값을 한테이블에서 다른테이블로 복사할때 아주 유용
UPDATE Orders SET bookname = (select bookname from Book
                                WHERE Book.bookid = Orders.bookid)

-- FROM절 서브쿼리(인라인 뷰 [가상테이블])
-- 고객별 판매액 보이시오(서브쿼리 --> 조인)
-- 고객별 판매액 집계 쿼리가 From절에 들어가면 모든 속성에 이름이 저장 되어야함
SELECT b.total, c.* FROM (SELECT SUM (o.saleprice) as 'total', o.custid FROM Orders as o
GROUP BY o.custid) AS b, Customer as c
WHERE b.custid = c.custid

-- 고객번호가 2이하인 고객의 판매액을 보이시오
-- GROUP BY에 들어갈 속성/컬럼은 최소화.
-- 중복 등의 문제가 있으면 결과가 다 틀어짐!
SELECT SUM(o.saleprice) AS '고객별 판매액'
FROM (SELECT custid, name FROM Customer WHERE custid <=2) AS c, Orders as o
WHERE c.custid = o.custid
GROUP BY c.custid