-- null에 대한 고찰
-- mybook 테이블에서 시작

SELECT bookid, price + 100 FROM mybook;

-- 합계, 전체의 count 는 문제x, 평균에서와 price count는 null 값에 빠짐
SELECT SUM(price), AVG(price), COUNT(*), COUNT(price) FROM mybook;

SELECT (10000 + 20000 + 0) / 3

-- bookid가 없는 데이터로 통계를 낼때는 null 이 나와야함
SELECT SUM(price), AVG(price), COUNT(*), COUNT(price) FROM mybook
WHERE bookid >= 4;

-- NULL 비교
-- NULL은 일반 비교연산자로 비교X
-- IS 와 IS NOT
SELECT * FROM mybook WHERE price IS NOT NULL;

-- ISNULL() 함수
-- 사전작업(CUSTOMER 테이블)
SELECT * FROM Customer
where phone is NULL

UPDATE Customer SET phone = null
WHERE custid = 2;

SELECT custid
[name], [address], ISNULL(phone, '연락처 없음') AS phone
 FROM Customer

 -- TOP n
 SELECT TOP 3 ORDERID, CUSTID, SALEPRICE
 FROM Orders
 ORDER BY saleprice DESC;

 -- LEFT(), RIGHT()
 SELECT LEFT('HELLO WORLD!', 5), RIGHT('HELLO WORLD!', 6), SUBSTRING('HELLO WORLD!', 7,5)

 -- CHARINDEX() 문자 찾기
 SELECT CHARINDEX('sql', 'Microsoft SQL Server 2022')

 -- SUBSTRING() 연계
  SELECT SUBSTRING('Microsoft SQL Server 2022', CHARINDEX('sql', 'Microsoft SQL Server 2022'), LEN('SQL'))