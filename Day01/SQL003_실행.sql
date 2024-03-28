-- 책중에서 '축구의 역사'라는 도서의 출판사와 가격을 알고싶어/
-- DBO는 DATABASE OWNER
-- DML(4가지) 중 SELECT(조회)
SELECT publisher, price 
	FROM Book
	WHERE bookname = '축구의 역사';

/*
- SQL에서는 EQUAL 연산자에 == 사용안함
- 무조건 =

- SQL에서는 대소문자 구분없음
- 하지만, 키워드는 대문자 사용할 것

- SQL에서는 문자열에 " <- 사용안함.
- 무조건 ' <- 사용

- SQL에서는 ; <- 필수가 아님.
- 하지만, 중요한 사항에서는 사용할것
*/

-- 김연아 고객의 전화번호를 찾으시요

--- 1
SELECT * /* ALL */
	FROM Customer

--- 2
SELECT * /* ALL */
	FROM Customer
	WHERE [name] = '김연아';

--- 3
SELECT phone /* ALL */
	FROM Customer
	WHERE [name] = '김연아';