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
SELECT '|' + LTRIM('      Hello     ') + '|', RTRIM('     Hello     '), TRIM('     Hello     ')

-- SUBSTRING, DB은 인덱스가 1부터 시작
SELECT SUBSTRING([name], 1, 1) AS '성씨', COUNT(*) AS '성씨별 인원'
FROM Customer
GROUP BY [name]

-- 날짜와 시간 함수
SELECT GETDATE();

SELECT DAY(GETDATE()) -- 일
SELECT MONTH(GETDATE()) -- 월
SELECT YEAR(GETDATE()) -- 년

-- 날짜 포맷을 원하는 형태로 변경 가능
SELECT FORMAT(GETDATE(), 'yyyy-MM-dd')
SELECT FORMAT(GETDATE(), 'HH:mm:ss')

-- 주문 테이블에서 주문 10일후에 각 주문을 확정짓는다. 확정일자 출력
-- dd = 날짜, mm = 달, yy = 년, qq = 분기, wk = 주
SELECT orderid, saleprice, orderdate as '주문일자', DATEADD(dd, 10, orderdate) AS '확정일자'
, DATEADD(mm, 10, orderdate) AS '통계일자'
 from Orders