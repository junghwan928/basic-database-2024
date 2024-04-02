-- 내장함수
SELECT ABS(-5), ABS(5);

-- 올림함수, 내림, 반올림, N승
SELECT CEILING(4.01), FLOOR(4.4), ROUND(4.5,1), POWER(2, 10); 

-- 고객별 평균 주문 금액
SELECT 
    custid , 
    SUM(saleprice) as '고객별 총 주문금액', 
    AVG(saleprice) as '고객별 주문 평균 금액',
    ROUND(SUM(saleprice) / COUNT(*), 0) AS '계산한 평균금액'
FROM Orders GROUP BY custid;


-- 문자열 함수들
SELECT bookid, REPLACE(bookname, '야구', '농구') As bookname, publisher, FORMAT(price, '#,#') AS price
FROM Book;

SELECT bookname as '제목', LEN(bookname) as [제목별 길이]
from Book;

select LOWER('Hello'), UPPER('hello')

-- 공백제거
SELECT LTRIM('      Hello     '), RTRIM('     Hello     '), TRIM('     Hello     ')